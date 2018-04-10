{
  SvrPipeCtrl. ���� ������ ��Ʈ�� ����Ʈ.

  IOCP�� ����� �񵿱� ������ ����� ����� ������ TSvrPipeHandler�� �����Ѵ�.
  ���᰹����ŭ �̸� �����ϴ� ����� �ƴ�, �ʿ��� �� �����Ǵ� ������� ������.

  ������ �ν��Ͻ��� �������� �ʰ� �޸𸮿� ��� ���� ��Ȱ��ȴ�.


}

unit SvrPipeCtrl;

interface

uses
  Windows, Messages, SysUtils, Classes, IOCPCtrl;

const
  BUFFERSIZE = 1024;

type
  TSvrPipeOperation = (spConnect, spRead, spWrite);

  // ������������ �������� ����ü
  PSvrPipeOverlapped = ^TSvrPipeOverlapped;
  TSvrPipeOverlapped = record
    Overlapped: TOverlapped;
    Operation : TSvrPipeOperation;
  end;

  // �� ������ ���۰� �߰��� ����.
  PSvrPipeBufferOverlapped = ^TSvrPipeBufferOverlapped ;
  TSvrPipeBufferOverlapped = record
    Overlapped: TOverlapped;
    Operation : TSvrPipeOperation;
    IsPedding : BOOL;
    NumberOfBytes : DWORD;              // �б� �Ǵ� ���� ��û�� ũ��.
    Buffer : array[0..BUFFERSIZE-1] of Byte; // �б� �Ǵ� ���� ����.
  end;

  TSvrPipeHandler = class;

  // ���� ������ �ν��Ͻ��� �����ϴ� ��ü
  TSvrPipeInstance = class
  private
    fCTS: TRTLCriticalSection;   // ũ��Ƽ�ü���.

    // �������� �ڵ�
    fHandle: THandle;

    fConnOL: TSvrPipeOverlapped;  // ����� ������.
    fReadOL, fWriteOL : TSvrPipeBufferOverlapped; // �б�, ����� ������.

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

  // ���� ������ �ڵ鷯
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

  // IOCP�� �������� ����. �Ϸ�Ű�� �� ��ü �ڽ��� �ش�.
  aSvrPipeHandler.fIOCPHandler.Associate(fHandle, DWORD(Self), nil);

  // ������. �������� ��û�̹Ƿ� �ٷ� ���ϵȴ�.
  //if not ConnectNamedPipe(fHandle, @fConnOL) then WriteLn('������');
  if not ConnectNamedPipe(fHandle, @fConnOL) then
    if GetLastError() <> ERROR_IO_PENDING then
    begin
      WriteLn('���������');
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
        WriteLn('���������');
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

  // IOCP�ڵ鷯�� ����. ���ǰ�ü ������� ����.
  fIOCPHandler:= TIOCPHandler.Create(nil, nil, 0, 0, nil);
  fIOCPHandler.OnIOCompletion := IOCompletion;

  // ������������ �� �ν��Ͻ��� �ϳ� �����Ѵ�.
  // �� �ν��Ͻ� ���ο��� Ŭ���̾�Ʈ�� ������ ��ٸ��� �ȴ�.
  BaseInstance:= fInstanceClass.Create(Self, fInstanceParam);
  fInstanceList.Add(BaseInstance);
end;

destructor TSvrPipeHandler.Destroy;
var
  i: Integer;
begin
  // IOCP �ڵ鷯�� ����.
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
  myStr: String = '�μ��� ���� ����';

procedure TSvrPipeHandler.IOCompletion(Sender: TObject; IsSuccess: BOOL;
  OutErrCode, BytesTransferred, CompletionKey: DWORD; lpOverlapped: POverlapped);
var
  NewPipeInstance: TSvrPipeInstance;
begin
  // CompletionKey���� TSvrPipeInstance�� �Ѿ�´�.
  with TSvrPipeInstance(CompletionKey) do
  begin
    EnterCriticalSection(fCTS);
    try
      case PSvrPipeOverlapped(lpOverlapped).Operation of
        spConnect:
        begin
          fIsConnected := True;

          WriteLn('����Ǿ��� ', BytesTransferred);
          // �б� ��û�� �ɾ�д�.
          FillChar(fReadOL.Overlapped, SizeOf(TOverlapped), $00);
          fReadOL.IsPedding := ReadFile(fHandle, fReadOL.Buffer, BUFFERSIZE, fReadOL.NumberOfBytes, @fReadOL);

          with fInstanceList.LockList do
          try
            // ���ο� �ν��Ͻ� ����.
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

          // �������� ������ �����..
          if BytesTransferred = 0 then
          begin
            WriteLn('�дٰ� ������ ����');
            //DisconnectAndClose;
            TryReset; // �� �� ������ ������ �ν��Ͻ��� �������� �ʰ� �����Ѵ�.
          end else
          begin
            WriteLn('�б�ó���� ', BytesTransferred, ', ', NumberOfBytes);
            WriteLn('  : ', PChar(@Buffer[0]));

            // �ٽ� �б� ��û�� �ɾ�д�.
            FillChar(fReadOL.Overlapped, SizeOf(TOverlapped), $00);
            IsPedding :=  ReadFile(fHandle, fReadOL.Buffer, BUFFERSIZE, fReadOL.NumberOfBytes, @fReadOL);

            // ���⵵ �ɾ��ش�.
            WriteFile(fHandle, PChar(myStr)^, Length(myStr), fWriteOL.NumberOfBytes, @fWriteOL);
            // �������� ���� ��ŷ���� �׽�Ʈ.
            //WriteFile(fHandle, PChar(myStr)^, Length(myStr), fWriteOL.NumberOfBytes, nil);
          end;
        end;

        spWrite :
        with PSvrPipeBufferOverlapped(lpOverlapped)^ do
        begin
          if BytesTransferred <> NumberOfBytes then
          begin
            WriteLn('���ٰ� ������ ����');
            //DisconnectAndClose;
            TryReset;
          end else
            WriteLn('����ó���� ', BytesTransferred);
        end;
      end;
    finally
      LeaveCriticalSection(fCTS);
    end;
  end;
end;

end.
