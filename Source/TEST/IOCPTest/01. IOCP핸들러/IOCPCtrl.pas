{
  IOCPCtrl.pas
  ===============================================

  TIOCPHandler�� ������ ����Ʈ.


  2006. 4. 10.
  ----------------

  GetQueuedCompletionStatus �� �����Ű�� ��ġ�� �ڵ鷯 ���η� ������ ������.
  GetCompletionStatus() �޼ҵ�� �����Ѵ�.


  2006. 4. 11.
  ----------------

  ���� ���������� �̺�Ʈ�� ó���ϴ� �����尡 � ���������� �� �� ���� ������
  �ִ�. TIOCPSession ������ �߰��� �� ������ �ذ�����.


  * TIOCPSession �� ����ϴ� ���..
    ���� �������� IO�� �߻��ϴ� ���� �ƴϰ� PostQueued... �޽����� ������Ǯ��
    �����带 ����� �뵵�θ� ���� ���. �� �������� ������ Ŀ�ؼ��� ���� ��
    ����.
    IOCPSession �� ��ӹ��� ����ڰ�ü�� ����� �� ��ü�� Ÿ���� �ڵ鷯��
    �����ڿ� �μ��� �����ϴ� ������� ���۽�Ų��.
    �ڵ鷯�� OnIOCompletion �̺�Ʈ�� �߻��� �� Sender ���ڿ��� �� ���� ��ü��
    �Ѿ�´�.

  * TIOCPSession �� ������� �ʴ� ���..
    ����, ���ϵ�� ���� ������ �ټ��� Ŀ�ؼ��� ������ ���⿡ �������� IO��
    �Ͼ�� �ִ� ���.
    �������� ������ Ŀ�ؼǺ��� ���� ��� ����.
    �ڵ鷯 ������ SessionClass�� nil�� �ִ� ������� ���۽�Ų��.
    �ڵ鷯�� OnIOCompletion �̺�Ʈ�� Sender ���ڴ� �ڵ鷯 ��ü�� �Ѿ�´�.



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
    fHandler: TIOCPHandler;   // ������ �����ϴ� �ڵ鷯.
    fThread : THandle;        // ������ ��ũ������.

  protected  
    // �� �Լ��� ��ӹ޾� IO�ϷḦ ó��,
    // �ڵ鷯�� �̺�Ʈ�� ���� �޾� ó���ص� ����� ����. 
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
    // TIOCPSession �� ����� ���..
    fSessionList: TList;

    // -------------------------------
    // TIOCPSession �� ������� �ʴ� ���. ������ �� �� �ڵ鷯 ����ÿ��� ���ȴ�.
     
    fThreadCnt: Integer;        // Ǯ���� �������� ����.
    fThreadArr: PWOHandleArray; // Ǯ���� ������ �迭.
    // -------------------------------

    fOnIOCompletion: TIOCPCompletionEvent; // �Ϸ� �̺�Ʈ.
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

// ���ǿ� ���Ե� ������ �Լ�.
// Arg���� IOCPSession �� �Ѿ�´�.
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
      WriteLn('������ ��ũ�����忡�� ����Ű ����');
{$ENDIF}
      Break;
    end else
    begin
      // �ڵ鷯�� �̺�Ʈ ȣ���ϰ�
      if Assigned(fOnIOCompletion) then
        // Sender�� Session �� �־� ȣ��.
        fOnIOCompletion(
          Session, IsSuccess, OutErrCode,
          BytesTransferred, CompletionKey, lpOverlapped
        );
      // ������ü�� �޼ҵ嵵 ȣ��. ��üó���� �����ϰ� �Ѵ�.   
      Session.IOCompletion(IsSuccess, OutErrCode, BytesTransferred, CompletionKey, lpOverlapped);
    end;
  end;

  //Result := 1;
end;

// �ڵ鷯�� ���Ե� ������ �Լ�.
// Arg���� IOCPHandler �� �Ѿ�´�.
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
      WriteLn('�ڵ鷯�� ��ũ�����忡�� ����Ű ����');
{$ENDIF}
      Break;
    end else
    begin
      if Assigned(fOnIOCompletion) then
        // Sender�� Handler �� �־� ȣ��.
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
  CloseHandle(fThread); // ����! ��ü���� �� �����带 ������Ų ������ ��.
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

  // IOCP ����
  fIOCP := CreateIoCompletionPort(INVALID_HANDLE_VALUE, 0, 0, MaxNumOfCurThread);

  if fIOCP = 0 then
  begin
    if Assigned(pOutErrCode) then pOutErrCode^ := GetLastError();
{$IFDEF DEBUG_BLD}
    WriteLn('IOCP ���� ����');
{$ENDIF}
    Exit;
  end;

  //---------------------
  // ���� ��ü�� ����ϴ� ���

  if Assigned(SessionClass) then
  begin
    fThreadCnt := 0;
    fThreadArr := nil;

    fSessionList := TList.Create;
    
    // ������ ���� ����.
    if NumOfPooledThread <= 0 then
    begin
      // ����Ʈ ������ ���� 2 * ���μ����� + 2 �� ������ ����.
      GetSystemInfo(si);
      fSessionList.Count := si.dwNumberOfProcessors*2+2;
    end else
      fSessionList.Count := NumOfPooledThread;
    
    // ������ ����.
    for i:= 0 to fSessionList.Count -1 do
    begin
      fSessionList[i] := SessionClass.Create(Self, aSessionParam);

      // ���� �� ������ ������ �ϳ��� �����ϸ� ���� ������ �ݰ� ����.
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
  // ���� ��ü�� ������� �ʴ� ���..
  begin
    fSessionList := nil;

    // ��ũ������ ���� ����.
    if NumOfPooledThread <= 0 then
    begin
      // ����Ʈ ������ ���� 2 * ���μ����� + 2 �� ������ ����.
      GetSystemInfo(si);
      fThreadCnt := si.dwNumberOfProcessors*2+2;
    end else
      fThreadCnt := NumOfPooledThread;

    // ��ũ������ ����.
    fThreadArr := AllocMem(SizeOf(THandle) * fThreadCnt);
    //FillChar(fThreadArr^, sizeof(THandle) * fThreadCnt, 0);
    for i:= 0 to fThreadCnt -1 do
    begin
      fThreadArr[i] := CreateThread(nil, 0, @IoCompletionInHandler, Self, 0, Dummy);

      // ������ �����ϸ� ���� ������ ������ �ݰ� ����.
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
  // ���Ǹ���Ʈ ���ÿ��� ����Ʈ ������ ���� �����带 �迭�� �ű��.
  // ������Ŷ�� ���� ������ ��ٸ��� �ڵ带 �����ϱ� ���� ���ǻ� �̷��� ����.  
  if Assigned(fSessionList) then
  begin
    fThreadCnt := fSessionList.Count;
    if fThreadCnt > 0 then
    begin
      fThreadArr := AllocMem(SizeOf(THandle) * fThreadCnt);
      for i:= 0 to fSessionList.Count -1 do
        fThreadArr[i] := TIOCPSession(fSessionList[i]).fThread;

      // ��ũ������ ���� ��Ŷ ����.
      for i:= 0 to fThreadCnt-1 do
        PostCompletionStatus(SHUTDOWN_IOCP, 0, nil, nil);

      if WaitForMultipleObjects(fThreadCnt, fThreadArr, TRUE, 15000) = WAIT_TIMEOUT then
      begin
        // ������ ��ٸ��� ����...
{$IFDEF DEBUG_BLD}
        WriteLn('��ũ������ ���� ��ٸ��� ����');
{$ENDIF}
      end;
    end;
  end else
  begin
    if fThreadCnt > 0 then
    begin
      // ��ũ������ ���� ��Ŷ ����.
      for i:= 0 to fThreadCnt-1 do
        PostCompletionStatus(SHUTDOWN_IOCP, 0, nil, nil);

      if WaitForMultipleObjects(fThreadCnt, fThreadArr, TRUE, 15000) = WAIT_TIMEOUT then
      begin
        // ������ ��ٸ��� ����...
{$IFDEF DEBUG_BLD}
        WriteLn('��ũ������ ���� ��ٸ��� ����');
{$ENDIF}
      end;

      // ������ ����.
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

  // ������� �̹� �����Ǿ���. 
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
  
  // IOCP����.
  if (fIOCP <> 0) then CloseHandle(fIOCP);

  inherited;
end;

//-----------------------------------------------------------------------------
// ����̽� �ڵ�� IOCP�� ����.
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
// IOCP�� ����� ���� �Ϸ���Ŷ ������ �Լ�.
function TIOCPHandler.PostCompletionStatus(const CompletionKey, dwBytesTransferred: DWORD;
  lpOverlapped: POverlapped; pOutErrCode: PDWord): Boolean;
begin
  Result := false;
  if fIOCP = 0 then Exit;

  Result := PostQueuedCompletionStatus(fIOCP, dwBytesTransferred, CompletionKey, lpOverlapped);

  if (not Result) and Assigned(pOutErrCode) then pOutErrCode^ := GetLastError();

end;

end.


