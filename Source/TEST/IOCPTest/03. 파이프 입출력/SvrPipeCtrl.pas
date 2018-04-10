{
  SvrPipeCtrl. 서버 파이프 컨트롤 유니트.

  IOCP를 사용해 비동기 파이프 입출력 기능을 가지는 TSvrPipeHandler를 정의한다.
  연결갯수만큼 미리 생성하는 방식이 아닌, 필요할 때 생성되는 방식으로 만들어본다.

  생성된 인스턴스는 해제되지 않고 메모리에 계속 남아 재활용된다.


}

unit SvrPipeCtrl;

interface

uses
  Windows, Messages, SysUtils, Classes, IOCPCtrl;

const
  BUFFERSIZE = 1024;

type
  TSvrPipeOperation = (spConnect, spRead, spWrite);

  // 서버파이프용 오버랩드 구조체
  PSvrPipeOverlapped = ^TSvrPipeOverlapped;
  TSvrPipeOverlapped = record
    Overlapped: TOverlapped;
    Operation : TSvrPipeOperation;
  end;

  // 위 구조에 버퍼가 추가된 구조.
  PSvrPipeBufferOverlapped = ^TSvrPipeBufferOverlapped ;
  TSvrPipeBufferOverlapped = record
    Overlapped: TOverlapped;
    Operation : TSvrPipeOperation;
    IsPedding : BOOL;
    NumberOfBytes : DWORD;              // 읽기 또는 쓰기 요청한 크기.
    Buffer : array[0..BUFFERSIZE-1] of Byte; // 읽기 또는 쓰기 버퍼.
  end;

  TSvrPipeHandler = class;

  // 서버 파이프 인스턴스를 관리하는 객체
  TSvrPipeInstance = class
  private
    fCTS: TRTLCriticalSection;   // 크리티컬섹션.

    // 파이프의 핸들
    fHandle: THandle;

    fConnOL: TSvrPipeOverlapped;  // 연결용 오버랩.
    fReadOL, fWriteOL : TSvrPipeBufferOverlapped; // 읽기, 쓰기용 오버랩.

    fIsConnected: Boolean;

    function GetPCTS : PRTLCriticalSection;

    procedure DisconnectAndClose;
    procedure TryReset;
  public
    constructor Create(aSvrPipeHandler: TSvrPipeHandler; const Param: DWORD); virtual;
    destructor Destroy; override;

    property Handle : THandle read fHandle;
    property IsConnected : Boolean read fIsConnected;

    property PCTS : PRTLCriticalSection read GetPCTS;
  end;

  TSvrPipeInstanceClass = class of TSvrPipeInstance;

  // 서버 파이프 핸들러
  TSvrPipeHandler = class
  private
    fPipeName: String;
    fMaxInstance: Integer;
    fInstanceClass: TSvrPipeInstanceClass;
    fInstanceParam: DWORD;
    fInstanceList: TThreadList;
    fIOCPHandler : TIOCPHandler;
    procedure IOCompletion(Sender: TObject; IsSuccess: BOOL;
      OutErrCode, BytesTransferred, CompletionKey : DWORD; lpOverlapped: POverlapped);
  public
    constructor Create(const aPipeName: String; const aMaxInstance: Integer;
      const aInstanceParam: DWORD; aInstanceClass: TSvrPipeInstanceClass);
    destructor Destroy; override;


  end;

implementation

{ TSvrPipeInstance }

constructor TSvrPipeInstance.Create(aSvrPipeHandler: TSvrPipeHandler; const Param: DWORD);
begin
  InitializeCriticalSection(fCTS);

  //fHandle := INVALID_HANDLE_VALUE;
  fConnOL.Operation := spConnect;
  fReadOL.Operation := spRead;
  fWriteOL.Operation := spWrite;

  fReadOL.IsPedding := false;
  fWriteOL.IsPedding := false;

  fIsConnected := false;

  fHandle := CreateNamedPipe(
      PAnsiChar(aSvrPipeHandler.fPipeName), // pipe name
      PIPE_ACCESS_DUPLEX or                 // read/write access
      FILE_FLAG_OVERLAPPED,                 // overlapped mode
      PIPE_TYPE_MESSAGE or                  // message-type pipe
      PIPE_READMODE_MESSAGE or              // message read mode
      PIPE_WAIT,                            // blocking mode
      PIPE_UNLIMITED_INSTANCES,             // unlimited instances
      BUFFERSIZE, BUFFERSIZE,               // output, input buffer size
      INFINITE,                             // Infinite
      nil                                   // no security attributes
  );

  if (fHandle = INVALID_HANDLE_VALUE) then Exit;

  // IOCP와 파이프의 연결. 완료키는 이 객체 자신을 준다.
  aSvrPipeHandler.fIOCPHandler.Associate(fHandle, DWORD(Self), nil);

  // 연결대기. 오버랩드 요청이므로 바로 리턴된다.
  //if not ConnectNamedPipe(fHandle, @fConnOL) then WriteLn('연결대기');
  if not ConnectNamedPipe(fHandle, @fConnOL) then
    if GetLastError() <> ERROR_IO_PENDING then
    begin
      WriteLn('연결대기실패');
      DisconnectAndClose;
    end;
end;

destructor TSvrPipeInstance.Destroy;
begin
  DisconnectAndClose;

  DeleteCriticalSection(fCTS);
  inherited;
end;

function TSvrPipeInstance.GetPCTS: PRTLCriticalSection;
begin
  Result := @fCTS;
end;

procedure TSvrPipeInstance.DisconnectAndClose;
begin
  if fHandle <> INVALID_HANDLE_VALUE then
  begin
    FlushFileBuffers(fHandle);
    DisconnectNamedPipe(fHandle);
    CloseHandle(fHandle);
    fHandle := INVALID_HANDLE_VALUE;

    fReadOL.IsPedding := false;
    fWriteOL.IsPedding := false;

    fIsConnected := false;
  end;
end;

procedure TSvrPipeInstance.TryReset;
begin
  if fHandle <> INVALID_HANDLE_VALUE then
  begin
    FlushFileBuffers(fHandle);
    DisconnectNamedPipe(fHandle);

    fReadOL.IsPedding := false;
    fWriteOL.IsPedding := false;

    fIsConnected := false;

    if not ConnectNamedPipe(fHandle, @fConnOL) then
      if GetLastError() <> ERROR_IO_PENDING then
      begin
        WriteLn('연결대기실패');
        DisconnectAndClose;
      end;
  end;
end;

{ TSvrPipeHandler }

constructor TSvrPipeHandler.Create(const aPipeName: String;
  const aMaxInstance: Integer; const aInstanceParam: DWORD;
  aInstanceClass: TSvrPipeInstanceClass);
var
  BaseInstance: TSvrPipeInstance;
begin
  fPipeName := '\\.\PIPE\' + aPipeName;
  fMaxInstance := aMaxInstance;

  fInstanceClass := aInstanceClass;
  fInstanceParam := aInstanceParam;
  fInstanceList := TThreadList.Create;

  // IOCP핸들러의 생성. 세션객체 사용하지 않음.
  fIOCPHandler:= TIOCPHandler.Create(nil, nil, 0, 0, nil);
  fIOCPHandler.OnIOCompletion := IOCompletion;

  // 기저파이프가 될 인스턴스를 하나 생성한다.
  // 이 인스턴스 내부에서 클라이언트의 접속을 기다리게 된다.
  BaseInstance:= fInstanceClass.Create(Self, fInstanceParam);
  fInstanceList.Add(BaseInstance);
end;

destructor TSvrPipeHandler.Destroy;
var
  i: Integer;
begin
  // IOCP 핸들러의 해제.
  FreeAndNil(fIOCPHandler);

  with fInstanceList.LockList do
  try
    for i:= Count-1 downto 0 do
    begin
      TObject(Items[i]).Free;
      Items[i] := nil;
    end;
  finally
    fInstanceList.UnlockList;
  end;

  FreeAndNil(fInstanceList);

  inherited;
end;

var
  myStr: String = '민성기 만세 만세';

procedure TSvrPipeHandler.IOCompletion(Sender: TObject; IsSuccess: BOOL;
  OutErrCode, BytesTransferred, CompletionKey: DWORD; lpOverlapped: POverlapped);
var
  NewPipeInstance: TSvrPipeInstance;
begin
  // CompletionKey에는 TSvrPipeInstance가 넘어온다.
  with TSvrPipeInstance(CompletionKey) do
  begin
    EnterCriticalSection(fCTS);
    try
      case PSvrPipeOverlapped(lpOverlapped).Operation of
        spConnect:
        begin
          fIsConnected := True;

          WriteLn('연결되었음 ', BytesTransferred);
          // 읽기 요청을 걸어둔다.
          FillChar(fReadOL.Overlapped, SizeOf(TOverlapped), $00);
          fReadOL.IsPedding := ReadFile(fHandle, fReadOL.Buffer, BUFFERSIZE, fReadOL.NumberOfBytes, @fReadOL);

          with fInstanceList.LockList do
          try
            // 새로운 인스턴스 생성.
            if (fMaxInstance <= 0) or (fMaxInstance > Count) then
            begin
              NewPipeInstance := fInstanceClass.Create(Self, fInstanceParam);
              Add(NewPipeInstance);
            end;
          finally
            fInstanceList.UnlockList;
          end;
        end;

        spRead  :
        with PSvrPipeBufferOverlapped(lpOverlapped)^ do
        begin
          IsPedding := false;

          // 파이프가 끊어진 경우임..
          if BytesTransferred = 0 then
          begin
            WriteLn('읽다가 파이프 끊김');
            //DisconnectAndClose;
            TryReset; // 한 번 생성된 파이프 인스턴스는 해제하지 않고 재사용한다.
          end else
          begin
            WriteLn('읽기처리됨 ', BytesTransferred, ', ', NumberOfBytes);
            WriteLn('  : ', PChar(@Buffer[0]));

            // 다시 읽기 요청을 걸어둔다.
            FillChar(fReadOL.Overlapped, SizeOf(TOverlapped), $00);
            IsPedding :=  ReadFile(fHandle, fReadOL.Buffer, BUFFERSIZE, fReadOL.NumberOfBytes, @fReadOL);

            // 쓰기도 걸어준다.
            WriteFile(fHandle, PChar(myStr)^, Length(myStr), fWriteOL.NumberOfBytes, @fWriteOL);
            // 오버랩드 없이 블러킹으로 테스트.
            //WriteFile(fHandle, PChar(myStr)^, Length(myStr), fWriteOL.NumberOfBytes, nil);
          end;
        end;

        spWrite :
        with PSvrPipeBufferOverlapped(lpOverlapped)^ do
        begin
          if BytesTransferred <> NumberOfBytes then
          begin
            WriteLn('쓰다가 파이프 끊김');
            //DisconnectAndClose;
            TryReset;
          end else
            WriteLn('쓰기처리됨 ', BytesTransferred);
        end;
      end;
    finally
      LeaveCriticalSection(fCTS);
    end;
  end;
end;

end.
