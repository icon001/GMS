{
  IOCPCtrl.pas
  ===============================================

  TIOCPHandler를 구현한 유니트.


  2006. 4. 10.
  ----------------

  GetQueuedCompletionStatus 를 실행시키는 위치를 핸들러 내부로 가지고 들어오자.
  GetCompletionStatus() 메소드는 제거한다.


  2006. 4. 11.
  ----------------

  현재 구조에서는 이벤트를 처리하는 쓰레드가 어떤 쓰레드인지 알 수 없는 문제가
  있다. TIOCPSession 개념을 추가해 이 문제를 해결하자.


  * TIOCPSession 을 사용하는 경우..
    실제 오버랩드 IO가 발생하는 것이 아니고 PostQueued... 메시지로 쓰레드풀의
    쓰레드를 깨우는 용도로만 쓰일 경우. 즉 쓰레드의 갯수와 커넥션이 같을 때
    적용.
    IOCPSession 을 상속받은 사용자객체를 만들고 이 객체의 타입을 핸들러의
    생성자에 인수로 전달하는 방식으로 동작시킨다.
    핸들러의 OnIOCompletion 이벤트가 발생할 때 Sender 인자에는 각 세션 객체가
    넘어온다.

  * TIOCPSession 을 사용하지 않는 경우..
    소켓, 파일등과 같이 실제로 다수의 커넥션이 있으며 여기에 오버랩드 IO가
    일어나고 있는 경우.
    쓰레드의 갯수가 커넥션보다 적을 경우 적용.
    핸들러 생성시 SessionClass에 nil을 주는 방식으로 동작시킨다.
    핸들러의 OnIOCompletion 이벤트의 Sender 인자는 핸들러 자체가 넘어온다.



}

{$DEFINE DEBUG_BLD}

unit IOCPCtrl;

interface

uses
  Windows, Messages, Classes, SysUtils;

type
  TIOCPCompletionEvent = procedure (Sender: TObject; IsSuccess: BOOL;
    OutErrCode, BytesTransferred, CompletionKey : DWORD;
    lpOverlapped: POverlapped) of Object;

  TIOCPHandler = class;

  TIOCPSession = class
  private
    fHandler: TIOCPHandler;   // 세션을 조작하는 핸들러.
    fThread : THandle;        // 세션의 워크쓰레드.

  protected  
    // 이 함수를 상속받아 IO완료를 처리,
    // 핸들러의 이벤트를 직접 받아 처리해도 결과는 같다. 
    procedure IOCompletion(IsSuccess: BOOL;
      OutErrCode, BytesTransferred, CompletionKey : DWORD;
      lpOverlapped: POverlapped); virtual;
  public
    constructor Create(aHandler: TIOCPHandler; aSessionParam: Pointer); virtual;
    destructor Destroy; override;
  end;

  TIOCPSessionClass = class of TIOCPSession;

  TIOCPHandler = class
  private
    fIOCP: THandle;

    // -------------------------------
    // TIOCPSession 을 사용할 경우..
    fSessionList: TList;

    // -------------------------------
    // TIOCPSession 을 사용하지 않는 경우. 세션을 쓸 때 핸들러 종료시에도 사용된다.
     
    fThreadCnt: Integer;        // 풀링될 쓰레드의 갯수.
    fThreadArr: PWOHandleArray; // 풀링될 쓰레드 배열.
    // -------------------------------

    fOnIOCompletion: TIOCPCompletionEvent; // 완료 이벤트.
  public
    constructor Create(SessionClass: TIOCPSessionClass; aSessionParam: Pointer;
      const MaxNumOfCurThread, NumOfPooledThread: Integer; pOutErrCode: PDWord);
    destructor Destroy; override;

    function Associate(const aDevHandle: THandle; const CompletionKey: DWORD;
      pOutErrCode: PDWord): Boolean;
    function PostCompletionStatus(const CompletionKey, dwBytesTransferred: DWORD;
      lpOverlapped: POverlapped; pOutErrCode: PDWord): Boolean;
  public
    property OnIOCompletion: TIOCPCompletionEvent read fOnIOCompletion write fOnIOCompletion;
  end;


implementation

const
  SHUTDOWN_IOCP : DWORD = DWORD(-1); // IOCP Stop Key

// 세션에 포함된 쓰레드 함수.
// Arg에는 IOCPSession 이 넘어온다.
function IoCompletionInSession(Arg: Pointer): Longint; stdcall;
var
  Session: TIOCPSession;
  Handler: TIOCPHandler;
  IsSuccess: BOOL;
  OutErrCode,
  BytesTransferred,
  CompletionKey : DWORD;
  lpOverlapped: POVERLAPPED;
begin
  Result := 1;

  Session := TIOCPSession(Arg);
  if not Assigned(Session) then Exit;

  Handler := Session.fHandler;
  if not Assigned(Handler) then Exit;

  with Handler do
  while (TRUE) do
  begin
    IsSuccess := GetQueuedCompletionStatus(fIOCP, BytesTransferred, CompletionKey, lpOverlapped, INFINITE);
    if IsSuccess then OutErrCode := 0 else OutErrCode := GetLastError();

    if (CompletionKey = SHUTDOWN_IOCP) and (lpOverlapped = nil) then
    begin
{$IFDEF DEBUG_BLD}
      WriteLn('세션의 워크쓰레드에서 종료키 만남');
{$ENDIF}
      Break;
    end else
    begin
      // 핸들러의 이벤트 호출하고
      if Assigned(fOnIOCompletion) then
        // Sender에 Session 을 넣어 호출.
        fOnIOCompletion(
          Session, IsSuccess, OutErrCode,
          BytesTransferred, CompletionKey, lpOverlapped
        );
      // 세션자체의 메소드도 호출. 자체처리도 가능하게 한다.   
      Session.IOCompletion(IsSuccess, OutErrCode, BytesTransferred, CompletionKey, lpOverlapped);
    end;
  end;

  //Result := 1;
end;

// 핸들러에 포함된 쓰레드 함수.
// Arg에는 IOCPHandler 가 넘어온다.
function IoCompletionInHandler(Arg: Pointer): Longint; stdcall;
var
  IsSuccess: BOOL;
  OutErrCode,
  BytesTransferred,
  CompletionKey : DWORD;
  lpOverlapped: POVERLAPPED;
begin
  with TIOCPHandler(Arg) do
  while (TRUE) do
  begin
    IsSuccess := GetQueuedCompletionStatus(fIOCP, BytesTransferred, CompletionKey, lpOverlapped, INFINITE);
    if IsSuccess then OutErrCode := 0 else OutErrCode := GetLastError();

    if (CompletionKey = SHUTDOWN_IOCP) and (lpOverlapped = nil) then
    begin
{$IFDEF DEBUG_BLD}
      WriteLn('핸들러의 워크쓰레드에서 종료키 만남');
{$ENDIF}
      Break;
    end else
    begin
      if Assigned(fOnIOCompletion) then
        // Sender에 Handler 를 넣어 호출.
        fOnIOCompletion(
          TIOCPHandler(Arg), IsSuccess, OutErrCode,
          BytesTransferred, CompletionKey, lpOverlapped
        );
    end;
  end;

  Result := 1;
end;


{ TIOCPSession }

constructor TIOCPSession.Create(aHandler: TIOCPHandler; aSessionParam: Pointer);
var
  Dummy: DWORD;
begin
  fHandler:= aHandler;
  fThread := CreateThread(nil, 0, @IoCompletionInSession, Self, 0, Dummy);
end;

destructor TIOCPSession.Destroy;
begin
  CloseHandle(fThread); // 주의! 모체에서 이 쓰레드를 정지시킨 상태일 것.
  inherited;
end;

procedure TIOCPSession.IOCompletion(IsSuccess: BOOL; OutErrCode,
  BytesTransferred, CompletionKey: DWORD; lpOverlapped: POverlapped);
begin

end;

{ TIOCPHandler }

constructor TIOCPHandler.Create(SessionClass: TIOCPSessionClass;
  aSessionParam: Pointer; const MaxNumOfCurThread, NumOfPooledThread: Integer;
  pOutErrCode: PDWord);
var
  si: TSystemInfo;
  i, j: Integer;
  Dummy: DWORD;
begin
  fThreadCnt := 0;

  IsMultiThread := TRUE;

  // IOCP 생성
  fIOCP := CreateIoCompletionPort(INVALID_HANDLE_VALUE, 0, 0, MaxNumOfCurThread);

  if fIOCP = 0 then
  begin
    if Assigned(pOutErrCode) then pOutErrCode^ := GetLastError();
{$IFDEF DEBUG_BLD}
    WriteLn('IOCP 생성 오류');
{$ENDIF}
    Exit;
  end;

  //---------------------
  // 세션 객체를 사용하는 경우

  if Assigned(SessionClass) then
  begin
    fThreadCnt := 0;
    fThreadArr := nil;

    fSessionList := TList.Create;
    
    // 세션의 갯수 결정.
    if NumOfPooledThread <= 0 then
    begin
      // 디폴트 쓰레드 수로 2 * 프로세서수 + 2 의 공식을 따름.
      GetSystemInfo(si);
      fSessionList.Count := si.dwNumberOfProcessors*2+2;
    end else
      fSessionList.Count := NumOfPooledThread;
    
    // 세션의 생성.
    for i:= 0 to fSessionList.Count -1 do
    begin
      fSessionList[i] := SessionClass.Create(Self, aSessionParam);

      // 세션 내 쓰레드 생성이 하나라도 실패하면 기존 쓰레드 닫고 종료.
      if TIOCPSession(fSessionList[i]).fThread = 0 then
      begin
        for j:= 0 to i do TObject(fSessionList[j]).Free;
        fSessionList.Free;
        fSessionList := nil;
        if Assigned(pOutErrCode) then pOutErrCode^ := GetLastError();
        Exit;
      end;
    end;
  end else
  //---------------------
  // 세션 객체를 사용하지 않는 경우..
  begin
    fSessionList := nil;

    // 워크쓰레드 갯수 결정.
    if NumOfPooledThread <= 0 then
    begin
      // 디폴트 쓰레드 수로 2 * 프로세서수 + 2 의 공식을 따름.
      GetSystemInfo(si);
      fThreadCnt := si.dwNumberOfProcessors*2+2;
    end else
      fThreadCnt := NumOfPooledThread;

    // 워크쓰레드 생성.
    fThreadArr := AllocMem(SizeOf(THandle) * fThreadCnt);
    //FillChar(fThreadArr^, sizeof(THandle) * fThreadCnt, 0);
    for i:= 0 to fThreadCnt -1 do
    begin
      fThreadArr[i] := CreateThread(nil, 0, @IoCompletionInHandler, Self, 0, Dummy);

      // 생성이 실패하면 기존 생성된 쓰레드 닫고 종료.
      if (fThreadArr[i] = 0) then
      begin
        for j:= 0 to i-1 do CloseHandle(fThreadArr[j]);
        FreeMem(fThreadArr);
        fThreadArr := nil;
        if Assigned(pOutErrCode) then pOutErrCode^ := GetLastError();
        Exit;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------------------
destructor TIOCPHandler.Destroy;
var
  i: Integer;
begin
  // 세션리스트 사용시에는 리스트 아이템 내의 쓰레드를 배열로 옮긴다.
  // 종료패킷을 받은 쓰레드 기다리기 코드를 공유하기 위해 편의상 이렇게 하자.  
  if Assigned(fSessionList) then
  begin
    fThreadCnt := fSessionList.Count;
    if fThreadCnt > 0 then
    begin
      fThreadArr := AllocMem(SizeOf(THandle) * fThreadCnt);
      for i:= 0 to fSessionList.Count -1 do
        fThreadArr[i] := TIOCPSession(fSessionList[i]).fThread;

      // 워크쓰레드 종료 패킷 전송.
      for i:= 0 to fThreadCnt-1 do
        PostCompletionStatus(SHUTDOWN_IOCP, 0, nil, nil);

      if WaitForMultipleObjects(fThreadCnt, fThreadArr, TRUE, 15000) = WAIT_TIMEOUT then
      begin
        // 쓰레드 기다리기 실패...
{$IFDEF DEBUG_BLD}
        WriteLn('워크쓰레드 종료 기다리기 실패');
{$ENDIF}
      end;
    end;
  end else
  begin
    if fThreadCnt > 0 then
    begin
      // 워크쓰레드 종료 패킷 전송.
      for i:= 0 to fThreadCnt-1 do
        PostCompletionStatus(SHUTDOWN_IOCP, 0, nil, nil);

      if WaitForMultipleObjects(fThreadCnt, fThreadArr, TRUE, 15000) = WAIT_TIMEOUT then
      begin
        // 쓰레드 기다리기 실패...
{$IFDEF DEBUG_BLD}
        WriteLn('워크쓰레드 종료 기다리기 실패');
{$ENDIF}
      end;

      // 쓰레드 해제.
      for i := 0 to fThreadCnt-1 do
      if fThreadArr[i] <> 0 then
      begin
        CloseHandle(fThreadArr[i]);
        fThreadArr[i] := 0;
      end;
    end;
  end;

  FreeMem(fThreadArr);
  fThreadArr := nil;

  // 쓰레드는 이미 정지되었음. 
  if Assigned(fSessionList) then
  begin
    for i:= 0 to fSessionList.Count -1 do
    begin
      TObject(fSessionList[i]).Free;
      fSessionList[i] := nil;
    end;

    fSessionList.Free;
    fSessionList := nil;
  end;
  
  // IOCP정리.
  if (fIOCP <> 0) then CloseHandle(fIOCP);

  inherited;
end;

//-----------------------------------------------------------------------------
// 디바이스 핸들과 IOCP의 연결.
function TIOCPHandler.Associate(const aDevHandle: THandle;
  const CompletionKey: DWORD; pOutErrCode: PDWord): Boolean;
begin
  Result := false;
  if fIOCP = 0 then Exit;
  if aDevHandle = INVALID_HANDLE_VALUE then Exit;
  if CompletionKey = 0 then Exit;

  Result := CreateIoCompletionPort(aDevHandle, fIOCP, CompletionKey, 0) = fIOCP;

  if (not Result) and Assigned(pOutErrCode) then pOutErrCode^ := GetLastError();
end;

//-----------------------------------------------------------------------------
// IOCP에 사용자 정의 완료패킷 보내기 함수.
function TIOCPHandler.PostCompletionStatus(const CompletionKey, dwBytesTransferred: DWORD;
  lpOverlapped: POverlapped; pOutErrCode: PDWord): Boolean;
begin
  Result := false;
  if fIOCP = 0 then Exit;

  Result := PostQueuedCompletionStatus(fIOCP, dwBytesTransferred, CompletionKey, lpOverlapped);

  if (not Result) and Assigned(pOutErrCode) then pOutErrCode^ := GetLastError();

end;

end.


