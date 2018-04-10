{ *********************************************************************** }
{                                                                         }
{ Author : qiusonglin                                                     }
{ Date   : 2003-07-06                                                     }
{ EMail  : qiusonglin@hotmail.com                                         }
{                                                                         }
{ *********************************************************************** }

unit IOCPComp;

interface

uses
  Windows, Messages, WinSock2, Classes, SysUtils;

const
  MAX_BUFSIZE = 4096;
  WM_CLIENTSOCKET = WM_USER + $2000;

type
  TCMSocketMessage = packed record
    Msg: Cardinal;
    Socket: TSocket;
    SelectEvent: Word;
    SelectError: Word;
    Result: Longint;
  end;

  TSocketEvent = (seInitIOPort, seInitSocket,  seConnect, seDisconnect, seListen, seAccept, seWrite, seRead);
  TErrorEvent = (eeGeneral, eeSend, eeReceive, eeConnect, eeDisconnect, eeAccept);

  PPerHandleData = ^TPerHandleData;
  TPerHandleData = packed record
    Overlapped: OVERLAPPED;
    wsaBuffer: WSABUF;
    Event: TSocketEvent;
    IsUse: Boolean;
    Buffer: array [0..MAX_BUFSIZE - 1] of Char;
  end;

  PBlock = ^TBlock;
  TBlock = packed record
    Data: TPerHandleData;
    IsUse: Boolean;
  end;

  EMemoryBuffer = class(Exception);
  ESocketError = class(Exception);

  TCustomSocket = class;
  TServerClientSocket = class;

  TOnDataEvent = function(Socket: TCustomSocket; Data: Pointer; Count: Integer): Integer of object;
  TSocketErrorEvent = procedure(Socket: TCustomSocket; ErrorEvent: TErrorEvent; var ErrCode: Integer) of object;
  TSocketEventEvent = procedure(Socket: TCustomSocket; SocketEvent: TSocketEvent) of object;


  TMemoryBuffer = class
  private
    FList: TList;
    FSocket: TCustomSocket;
    function GetCount: Integer;
    function GetBlock(const Index: Integer): PBlock;
  protected
    property Count: Integer read GetCount;
    property Blocks[const Index: Integer]: PBlock read GetBlock;
  public
    constructor Create(ASocket: TCustomSocket); overload;
    constructor Create(ASocket: TCustomSocket; BlockCount: Integer); overload;
    destructor Destroy; override;
    function AllocBlock: PBlock;
    procedure RemoveBlock(Block: PBlock);
  end;

  TCustomSocket = class
  private
    FData: Pointer;
    FSocket: TSocket;
    FActive: Boolean;
    FInitLock: Boolean;
    FLock: TRTLCriticalSection;
    FOnRead: TOnDataEvent;
    FOnErrorEvent: TSocketErrorEvent;
    FOnEventEvent: TSocketEventEvent;
    function GetRemoteAddress: string;
    function GetRemoteHost: string;
    procedure DoRead(Data: Pointer; Count: Integer);
  protected
    procedure SetActive(Value: Boolean); virtual; abstract;
    procedure Event(SocketEvent: TSocketEvent); virtual;
    procedure Error(ErrorEvent: TErrorEvent; var ErrCode: Integer); virtual;
    property OnRead: TOnDataEvent read FOnRead write FOnRead;
    property OnErrorEvent: TSocketErrorEvent read FOnErrorEvent write FOnErrorEvent;
    property OnEventEvent: TSocketEventEvent read FOnEventEvent write FOnEventEvent;
  public
    constructor Create(ASocket: TSocket);
    destructor Destroy; override;
    procedure Close;
    procedure Open;
    procedure Lock;
    procedure UnLock;
    function Read(var Buf; Count: Integer): Integer; virtual;
    function Write(var Buf; Count: Integer): Integer; virtual;
    property SocketHandle: TSocket read FSocket;
    property Data: Pointer read FData write FData;
    property Active: Boolean read FActive write SetActive;
    property RemoteHost: string read GetRemoteHost;
    property RemoteAddress: string read GetRemoteAddress;
  end;

  TCustomerServerSocket = class(TCustomSocket)
  private
    FOnClientRead: TOnDataEvent;
    FOnClientError: TSocketErrorEvent;
    FOnClientEvent: TSocketEventEvent;
  protected
    function DoClientRead(ASocket: TCustomSocket; AData: Pointer; ACount: Integer): Integer;
    procedure ClientSocketError(ASocket: TCustomSocket;
      ErrorEvent: TErrorEvent; var ErrCode: Integer);
    procedure ClientSocketEvent(ASocket: TCustomSocket; SocketEvent: TSocketEvent);
  public
    property OnClientRead: TOnDataEvent read FOnClientRead write FOnClientRead;
    property OnClientError: TSocketErrorEvent read FOnClientError write FOnClientError;
    property OnClientEvent: TSocketEventEvent read FOnClientEvent write FOnClientEvent;
    property OnErrorEvent;
    property OnEventEvent;
  end;

  TGetSocketEvent = procedure(Socket: TSocket; var ClientSocket: TServerClientSocket) of object;
  TServerSocket = class(TCustomerServerSocket)
  private
    FPort: Integer;
    FAddr: TSockAddr;
    FAcceptThread: TThread;
    FCompletionPort: THandle;
    FClients: TList;
    FThreads: TList;
    FHandle: THandle;
    FBuffer: TMemoryBuffer;
    FOnGetSocket: TGetSocketEvent;
    procedure SetPort(Value: Integer);
    procedure RegisterClient(ASocket: TCustomSocket);
    procedure RemoveClient(ASocket: TCustomSocket);
    procedure WMClientClose(var Message: TCMSocketMessage); message WM_CLIENTSOCKET;
    procedure WndProc(var Message: TMessage);
    function FindClientSocket(ASocket: TSocket): TCustomSocket;
    function GetClientCount: Integer;
    function GetClients(const Index: Integer): TServerClientSocket;
  protected
    procedure InternalOpen;
    procedure InternalClose;
    procedure SetActive(Value: Boolean); override;
    property CompletionPort: THandle read FCompletionPort;
    function IsAccept(Socket: TSocket): Boolean; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Accept(ASocket: TSocket; ACompletionPort: THandle);
    property Handle: THandle read FHandle;
    property Port: Integer read FPort write SetPort;
    property ClientCount: Integer read GetClientCount;
    property Clients[const Index: Integer]: TServerClientSocket read GetClients;
    property OnGetSocket: TGetSocketEvent read FOnGetSocket write FOnGetSocket;
  end;

  TServerClientSocket = class(TCustomSocket)
  private
    FBlock: TList;
    FBuffer: TMemoryBuffer;
    FServerSocket: TServerSocket;
    function AllocBlock: PBlock;
    function PrepareRecv(Block: PBlock = nil): Boolean;
    function WorkBlock(var Block: PBlock; Transfered: DWORD): DWORD;
  protected
    procedure SetActive(Value: Boolean); override;
  public
    constructor Create(AServerSocket: TServerSocket; ASocket: TSocket);
    destructor Destroy; override;
    function Read(var Buf; Count: Integer): Integer; override;
    function Write(var Buf; Count: Integer): Integer; override;
  end;

  TSocketThread = class(TThread)
  private
    FServer: TServerSocket;
  public
    constructor Create(AServer: TServerSocket);
  end;

  TAcceptThread = class(TSocketThread)
  protected
    procedure Execute; override;
  end;

  TWorkerThread = class(TSocketThread)
  protected
    procedure Execute; override;
  end;

implementation

uses RTLConsts;

const
  SHUTDOWN_FLAG = $FFFFFFFF;
  BlockSize: Word = SizeOf(TBlock);

var
  WSData: TWSAData;

{ TMemoryBuffer }

constructor TMemoryBuffer.Create(ASocket: TCustomSocket);
begin
  Create(ASocket, 200);
end;

constructor TMemoryBuffer.Create(ASocket: TCustomSocket; BlockCount: Integer);
var
  I: Integer;
  P: PBlock;
begin
  inherited Create;
  FSocket := ASocket;
  FList := TList.Create;
  for I := 0 to BlockCount - 1 do
  begin
    New(P);
    FillChar(P^, BlockSize, 0);
    FList.Add(P);
  end;
end;

destructor TMemoryBuffer.Destroy;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    FreeMem(FList[I]);
  FList.Free;
  inherited Destroy;
end;

function TMemoryBuffer.AllocBlock: PBlock;
var
  I: Integer;
begin
  FSocket.Lock;
  try
    Result := nil;
    for I := 0 to FList.Count - 1 do
    begin
      Result := FList[I];
      if not Result.IsUse then
        break;
    end;
    if not Assigned(Result) or Result.IsUse then
    begin
      New(Result);
      FList.Add(Result);
    end;
    FillChar(Result^.Data, SizeOf(Result^.Data), 0);
    Result^.IsUse := True;
  finally
    FSocket.UnLock;
  end;
end;

procedure TMemoryBuffer.RemoveBlock(Block: PBlock);
begin
  FSocket.Lock;
  try
    Block.IsUse := False;
  finally
    FSocket.UnLock;
  end;
end;

function TMemoryBuffer.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TMemoryBuffer.GetBlock(const Index: Integer): PBlock;
begin
  if (Index >= Count) or (Index <= -1) then
    raise EMemoryBuffer.CreateFmt(SListIndexError, [Index])
  else
    Result := FList[Index];
end;

procedure CheckError(ResultCode: Integer; const OP: string);
var
  ErrCode: Integer;
begin
  if ResultCode <> 0 then
  begin
    ErrCode := WSAGetLastError;
    if (ErrCode <> WSAEWOULDBLOCK) or (ErrCode <> ERROR_IO_PENDING) then
      raise ESocketError.CreateFmt(SWindowsSocketError,
        [SysErrorMessage(ErrCode), ErrCode, Op]);
  end;
end;

{ TCustomSocket }

constructor TCustomSocket.Create(ASocket: TSocket);
begin
  inherited Create;
  FInitLock := False;
  if WSAStartup($0202, WSData) <> 0 then
    raise ESocketError.Create(SysErrorMessage(GetLastError));
  FSocket := ASocket;
  FActive := FSocket <> INVALID_SOCKET;
end;

destructor TCustomSocket.Destroy;
begin
  SetActive(False);
  WSACleanup;
  if FInitLock then
    DeleteCriticalSection(FLock);
  inherited Destroy;
end;

procedure TCustomSocket.Lock;
begin
  if not FInitLock then
  begin
    InitializeCriticalSection(FLock);
    FInitLock := True;
  end;
  EnterCriticalSection(FLock);
end;

procedure TCustomSocket.UnLock;
begin
  if FInitLock then
    LeaveCriticalSection(FLock);
end;

procedure TCustomSocket.Close;
begin
  SetActive(False);
end;

procedure TCustomSocket.Open;
begin
  SetActive(True);
end;

procedure TCustomSocket.DoRead(Data: Pointer; Count: Integer);
begin
  if Assigned(FOnRead) then
    FOnRead(Self, Data, Count);
end;

procedure TCustomSocket.Error(ErrorEvent: TErrorEvent; var ErrCode:
Integer);
begin
  if Assigned(FOnErrorEvent) then
    FOnErrorEvent(Self, ErrorEvent, ErrCode);
end;

procedure TCustomSocket.Event(SocketEvent: TSocketEvent);
begin
  if Assigned(FOnEventEvent) then
    FOnEventEvent(Self, SocketEvent);
end;

function TCustomSocket.GetRemoteAddress: string;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Result := '';
  if not FActive then Exit;
  Size := SizeOf(SockAddrIn);
  CheckError(getpeername(FSocket, SockAddrIn, Size), 'getpeername');
  Result := inet_ntoa(SockAddrIn.sin_addr);
end;

function TCustomSocket.GetRemoteHost: string;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
  HostEnt: PHostEnt;
begin
  Result := '';
  if not FActive then Exit;
  Size := SizeOf(SockAddrIn);
  CheckError(getpeername(FSocket, SockAddrIn, Size), 'getpeername');
  HostEnt := gethostbyaddr(@SockAddrIn.sin_addr.s_addr, 4, PF_INET);
  if HostEnt <> nil then Result := HostEnt.h_name;
end;

function TCustomSocket.Read(var Buf; Count: Integer): Integer;
begin
  raise ESocketError.Create('Error');
end;

function TCustomSocket.Write(var Buf; Count: Integer): Integer;
begin
  raise ESocketError.Create('Error');
end;

{ TCustomerServerSocket }

function TCustomerServerSocket.DoClientRead(ASocket: TCustomSocket;
  AData: Pointer; ACount: Integer): Integer;
begin
  if not Assigned(FOnClientRead) then
    Result := 0 else
    Result := FOnClientRead(ASocket, AData, ACount);
end;

procedure TCustomerServerSocket.ClientSocketError(ASocket: TCustomSocket;
  ErrorEvent: TErrorEvent; var ErrCode: Integer);
begin
  if Assigned(FOnClientError) then
    FOnClientError(ASocket, ErrorEvent, ErrCode);
end;

procedure TCustomerServerSocket.ClientSocketEvent(ASocket: TCustomSocket;
  SocketEvent: TSocketEvent);
begin
  if Assigned(FOnClientEvent) then
    FOnClientEvent(ASocket, SocketEvent);
end;

{ TServerSocket }

procedure TServerSocket.Accept(ASocket: TSocket; ACompletionPort: THandle);
var
  Addr: TSockAddrIn;
  AddrLen, Ret, ErrCode: Integer;
  ClientWinSocket: TSocket;
  ClientSocket: TServerClientSocket;
begin
  AddrLen := SizeOf(Addr);
  ClientWinSocket := WinSock2.accept(ASocket, Addr, AddrLen);
  if ClientWinSocket <> INVALID_SOCKET then
  begin
    if not Active and not IsAccept(ClientWinSocket) then
    begin
      closesocket(ClientWinSocket);
      Exit;
    end;
    try
      Event(seAccept);
      ClientSocket := nil;
      if Assigned(FOnGetSocket) then
        FOnGetSocket(ClientWinSocket, ClientSocket);
      if not Assigned(ClientSocket) then
        ClientSocket := TServerClientSocket.Create(Self, ClientWinSocket);
    except
      closesocket(ClientWinSocket);
      ErrCode := GetLastError;
      Error(eeAccept, ErrCode);
      Exit;
    end;
    Ret := CreateIoCompletionPort(ClientWinSocket, ACompletionPort, DWORD(ClientSocket), 0);
    if Ret = 0 then
      ClientSocket.Free;
  end;
end;

constructor TServerSocket.Create;
begin
  inherited Create(INVALID_SOCKET);
  FBuffer := TMemoryBuffer.Create(Self);
  FClients := TList.Create;
  FThreads := TList.Create;

  FPort := 211;
  FAcceptThread := nil;
  FCompletionPort := 0;
  IsMultiThread := True;
  FHandle := Classes.AllocateHWnd(WndProc);
end;

destructor TServerSocket.Destroy;
begin
  SetActive(False);
  FThreads.Free;
  FClients.Free;
  Classes.DeallocateHWnd(FHandle);
  FBuffer.Free;
  inherited Destroy;
end;

function TServerSocket.FindClientSocket(ASocket: TSocket): TCustomSocket;
var
  I: Integer;
begin
  Lock;
  try
    for I := 0 to FClients.Count - 1 do
    begin
      Result := FClients[I];
      if ASocket = Result.SocketHandle then Exit;
    end;
    Result := nil;
  finally
    UnLock;
  end;
end;

function TServerSocket.GetClientCount: Integer;
begin
  Result := FClients.Count;
end;

function TServerSocket.GetClients(const Index: Integer):
TServerClientSocket;
begin
  Result := FClients[Index];
end;

procedure TServerSocket.InternalClose;

  procedure CloseObject(var Handle: THandle);
  begin
    if Handle <> 0 then
    begin
      CloseHandle(Handle);
      Handle := 0;
    end;
  end;

var
  I: Integer;
  Thread: TThread;
begin
  Lock;
  try
    while FClients.Count > 0 do
      TObject(FClients.Last).Free;
    FClients.Clear;

    for I := FThreads.Count - 1 downto 0 do
    begin
      Thread := FThreads[I];
      PostQueuedCompletionStatus(FCompletionPort, 0, 0, Pointer(SHUTDOWN_FLAG));
      Thread.Terminate;
    end;
    FThreads.Clear;

    if FSocket <> INVALID_SOCKET then
    begin
      Event(seDisconnect);
      closesocket(FSocket);
      FSocket := INVALID_SOCKET;
    end;
    FAcceptThread.Terminate;
    CloseObject(FCompletionPort);
  finally
    UnLock;
  end;
end;

procedure TServerSocket.InternalOpen;
var
  I: Integer;
  Thread: TThread;
  SystemInfo: TSystemInfo;
begin
  Lock;
  try
    try
      FCompletionPort := CreateIoCompletionPort(INVALID_HANDLE_VALUE, 0, 0, 0);
      if FCompletionPort = 0 then
        raise ESocketError.Create(SysErrorMessage(GetLastError));

      Event(seInitIOPort);
      GetSystemInfo(SystemInfo);
      for I := 0 to SystemInfo.dwNumberOfProcessors * 2 - 1 do
      begin
        Thread := TWorkerThread.Create(Self);
        FThreads.Add(Thread);
      end;

      FSocket := WSASocket(PF_INET, SOCK_STREAM, 0, nil, 0, WSA_FLAG_OVERLAPPED);
      if FSocket = INVALID_SOCKET then
        raise ESocketError.Create(SysErrorMessage(GetLastError));
      Event(seInitSocket);

      FillChar(FAddr, SizeOf(FAddr), 0);
      FAddr.sin_family := AF_INET;
      FAddr.sin_port := htons(FPort);
      FAddr.sin_addr.S_addr := INADDR_ANY;
      CheckError(bind(FSocket, @FAddr, SizeOf(FAddr)), 'bind');

      Event(seListen);
      CheckError(listen(FSocket, SOMAXCONN), 'listen');
      FAcceptThread := TAcceptThread.Create(Self);
    except
      InternalClose;
      raise;
    end;
  finally
    UnLock;
  end;
end;

function TServerSocket.IsAccept(Socket: TSocket): Boolean;
begin
  Result := True;
end;

procedure TServerSocket.RegisterClient(ASocket: TCustomSocket);
begin
  Lock;
  try
    if FClients.IndexOf(ASocket) = -1 then
    begin
      FClients.Add(ASocket);
      WSAAsyncSelect(ASocket.SocketHandle, FHandle, WM_CLIENTSOCKET, FD_CLOSE);
    end;
  finally
    UnLock;
  end;
end;

procedure TServerSocket.RemoveClient(ASocket: TCustomSocket);
var
  Index: Integer;
begin
  Lock;
  try
    Index := FClients.IndexOf(ASOcket);
    if Index <> -1 then
      FClients.Delete(Index);
  finally
    UnLock;
  end;
end;

procedure TServerSocket.SetActive(Value: Boolean);
begin
  if FActive = Value then Exit;
  if Value then
    InternalOpen
  else
    InternalClose;
  FActive := Value;
end;

procedure TServerSocket.SetPort(Value: Integer);
begin
  if Active then
    raise ESocketError.Create('Cann''t change port');
  FPort := Value;
end;

procedure TServerSocket.WMClientClose(var Message: TCMSocketMessage);
var
  ClientSocket: TCustomSocket;
begin
  ClientSocket := FindClientSocket(Message.Socket);
  if Assigned(ClientSocket) then
    ClientSocket.Free;
end;

procedure TServerSocket.WndProc(var Message: TMessage);
begin
  try
    Dispatch(Message);
  except
    if Assigned(ApplicationHandleException) then
      ApplicationHandleException(Self);
  end;
end;

{ TServerClientSocket }

constructor TServerClientSocket.Create(AServerSocket: TServerSocket;
  ASocket: TSocket);
begin
  inherited Create(ASocket);
  FServerSocket := AServerSocket;
  FBuffer := FServerSocket.FBuffer;
  FBlock := TList.Create;
  FServerSocket.RegisterClient(Self);
  FOnRead := FServerSocket.OnClientRead;
  OnErrorEvent := FServerSocket.ClientSocketError;
  OnEventEvent := FServerSocket.ClientSocketEvent;
  PrepareRecv;
  Event(seConnect);
end;

destructor TServerClientSocket.Destroy;
var
  I: Integer;
begin
  FServerSocket.RemoveClient(Self);
  for I := FBlock.Count - 1 downto 0 do
    FBuffer.RemoveBlock(FBlock[I]);
  FBlock.Free;
  inherited Destroy;
end;

procedure TServerClientSocket.SetActive(Value: Boolean);
var
  Linger: TLinger;
begin
  if FActive = Value then Exit;
  if not Value then
  begin
    if FSocket <> INVALID_SOCKET then
    begin
      Event(seDisconnect);
      FillChar(Linger, SizeOf(Linger), 0);
      setsockopt(FSocket, SOL_SOCKET, SO_LINGER, @Linger, Sizeof(Linger));
      closesocket(FSocket);
      FSocket := INVALID_SOCKET;
    end;
  end else
    raise ESocketError.Create('not support connect.');
  FActive := Value;
end;

function TServerClientSocket.AllocBlock: PBlock;
var
  I: Integer;
begin
  for I := 0 to FBlock.Count - 1 do
  begin
    Result := FBlock[I];
    if not Result.Data.IsUse then
    begin
      Result.Data.IsUse := True;
      Exit;
    end;
  end;
  Result := FBuffer.AllocBlock;
  FBlock.Add(Result);
  Result.Data.IsUse := True;
end;

function TServerClientSocket.Read(var Buf; Count: Integer): Integer;
begin
  { In OnRead }
  raise ESocketError.Create('Read error.');
end;

function TServerClientSocket.Write(var Buf; Count: Integer): Integer;
var
  Block: PBlock;
  ErrCode: Integer;
  Flags, BytesSend: Cardinal;
begin
  Result := Count;
  if Result = 0 then Exit;
  Block := AllocBlock;
  with Block^.Data do
  begin
    Flags := 0;
    Event := seWrite;
    wsaBuffer.buf := @Buf;
    wsaBuffer.len := Result;
    if SOCKET_ERROR = WSASend(FSocket, @wsaBuffer, 1, BytesSend, Flags, @Overlapped, nil) then
    begin
      ErrCode := WSAGetLastError;
      if ErrCode <> ERROR_IO_PENDING then
      begin
        Result := SOCKET_ERROR;
        Error(eeSend, ErrCode);
      end;
    end;
  end;
end;

function TServerClientSocket.PrepareRecv(Block: PBlock = nil): Boolean;
var
  ErrCode: Integer;
  Flags, Transfer: Cardinal;
begin
  if not Assigned(Block) then
    Block := AllocBlock;
  with Block^.Data do
  begin
    Flags := 0;
    Event := seRead;
    FillChar(Buffer, SizeOf(Buffer), 0);
    FillChar(Overlapped, SizeOf(Overlapped), 0);
    wsaBuffer.buf := Buffer;
    wsaBuffer.len := MAX_BUFSIZE;
    Result := SOCKET_ERROR <> WSARecv(FSocket, @wsaBuffer, 1, Transfer, Flags, @Overlapped, nil);
    if not Result then
    begin
      ErrCode := WSAGetLastError;
      Result := ErrCode = ERROR_IO_PENDING;
      if not Result then
      begin
        Block.Data.IsUse := False;
        Error(eeReceive, ErrCode);
      end;
    end;
  end;
end;

const
  RESPONSE_UNKNOWN = $0001;
  RESPONSE_SUCCESS = $0002;
  RESPONSE_FAIL = $FFFF;

function TServerClientSocket.WorkBlock(var Block: PBlock; Transfered: DWORD): DWORD;
var
  ErrCode: Integer;
  Flag, BytesSend: Cardinal;
begin
  Result := RESPONSE_SUCCESS;
  with Block^.Data do
  try
    case Block^.Data.Event of
      seRead:
      begin
        Self.Event(seRead);
        DoRead(@Buffer, Transfered);
        if not PrepareRecv(Block) then
          Result := RESPONSE_FAIL;
      end;
      seWrite:
      begin
        Self.Event(seWrite);
        Dec(wsaBuffer.len, Transfered);
        if wsaBuffer.len <= 0 then
        begin
          { send over, Block return buffer }
          Block.Data.IsUse := False;
          Block := nil;
        end else
        begin
          { goon send }
          Flag := 0;
          Inc(wsaBuffer.buf, Transfered);
          FillChar(Overlapped, SizeOf(Overlapped), 0);
          if SOCKET_ERROR = WSASend(FSocket, @wsaBuffer, 1, BytesSend, Flag, @Overlapped, nil) then
          begin
            ErrCode := WSAGetLastError;
            if ErrCode <> ERROR_IO_PENDING then
              Error(eeSend, ErrCode);
          end;
        end;
      end;
    end;
  except
    Result := RESPONSE_FAIL;
  end;
end;

{ TSocketThread }

constructor TSocketThread.Create(AServer: TServerSocket);
begin
  FServer := AServer;
  inherited Create(False);
  FreeOnTerminate := True;
end;

{ TAcceptThread }

procedure TAcceptThread.Execute;
begin
  with FServer do
    while not Terminated and Active do
      Accept(SocketHandle, CompletionPort);
end;

{ TWorkerThread }

procedure TWorkerThread.Execute;
var
  Block: PBlock;
  Transfered: DWORD;
  ClientSocket: TServerClientSocket;
begin
  while FServer.Active do
  begin
    Block := nil;
    Transfered := 0;
    ClientSocket := nil;
    if not GetQueuedCompletionStatus(FServer.CompletionPort, Transfered, DWORD(ClientSocket), POverlapped(Block), INFINITE) then
    begin
      if Assigned(ClientSocket) then
        FreeAndNil(ClientSocket);
      Continue;
    end;

    { client disconnect or I/O fail }
    if Transfered = 0 then
    begin
      FreeAndNil(ClientSocket);
      Continue;
    end;
    { Notify showdown }
    if Cardinal(Block) = SHUTDOWN_FLAG then
      break;
    if not FServer.Active then break;

    case ClientSocket.WorkBlock(Block, Transfered) of
      RESPONSE_UNKNOWN:
        { reserve }
        FreeAndNil(ClientSocket);
      RESPONSE_FAIL:
        FreeAndNil(ClientSocket);
    end;
  end;
end;

end.
