///////////////////////////////////////////////////////////////////////////
//ClientMainUnit.pas
// ftp://delphi-jedi.org/api/Winsock2.zip
unit ClientMainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CommonUnit, SyncObjs, ExtCtrls;

type
  TClientMainForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    StartButton: TButton;
    HostEdit: TEdit;
    ThreadCountEdit: TEdit;
    StopButton: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    CountText: TStaticText;
    Label4: TLabel;
    RightCountText: TStaticText;
    Label5: TLabel;
    ErrorCountText: TStaticText;
    Label6: TLabel;
    ConnectionCountText: TStaticText;
    Timer1: TTimer;
    Label7: TLabel;
    PortEdit: TEdit;
    Label8: TLabel;
    TimeoutEdit: TEdit;
    procedure StartButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FThreads: TList;
    FRightCount: Integer;
    FErrorCount: Integer;
    FLock: TCriticalSection;
    procedure AddMsg(RightCount, ErrorCount: Integer);
    procedure ThreadTerminate(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  ClientMainForm: TClientMainForm;

implementation

uses WinSock2, ScktComp;

{$R *.dfm}
type
  TAddEvent = procedure(RightCount, ErrorCount: Integer) of object;
  TClient = class(TThread)
  private
    FPort: Integer;
    FTimeout: Integer;
    FHost: string;
    FAddMsg: TAddEvent;
    FSocket: TClientWinSocket;
  protected
    procedure Execute; override;
  public
    constructor Create(AHost: string; APort, ATimeout: Integer; AAddMsg:
TAddEvent);
    destructor Destroy; override;
  end;

{ TClient }

constructor TClient.Create;
begin
  inherited Create(False);
  FHost := AHost;
  FPort := APort;
  FTimeout := ATimeout;
  FAddMsg := AAddMsg;
  FSocket := TClientWinSocket.Create(Integer(not(0)));
  FSocket.ClientType := ctBlocking;
  FreeOnTerminate := True;
end;

destructor TClient.Destroy;
begin
  FSocket.Free;
  inherited Destroy;
end;

procedure TClient.Execute;
const
  SizeInt = SizeOf(Integer);
  SizeBlock = SizeOf(TDataBlock);
  Data: TDataBlock = (len: 22; Content: 'hellohellohellohello22');

  function IsClose(socket, event: Cardinal): Boolean;
  var
    Network: TWSANetworkEvents;
    //Network:LPWSANETWORKEVENTS ;
  begin
    Result := True;
    FillChar(Network, SizeOf(Network), 0);
    if WSAEnumNetworkEvents(FSocket.SocketHandle, Event, @Network) = -1 then
      Exit;
    { Close msg }
    Result := ((Network.lNetworkEvents and FD_CLOSE) = FD_CLOSE) and
       (Network.iErrorCode[FD_CLOSE_BIT] <> 0);
  end;

var
  msg: TMsg;
  P: Pointer;
  D: TDataBlock;
  TimeOut, RetLen: Integer;
  Event: THandle;
begin
  try
    FSocket.Open(FHost, FHost, '', FPort);
    Timeout := 2000;
    setsockopt(FSocket.SocketHandle, SOL_SOCKET, SO_RCVTIMEO, @Timeout, SizeOf(Timeout));
  except
    SetWindowText(ClientMainForm.Handle, PChar(SysErrorMessage(GetLastError)));
    Exit;
  end;
  PeekMessage(msg, 0, 0, 0, PM_NOREMOVE);
  Event := WSACreateEvent;
  try
    WSAEventSelect(FSocket.SocketHandle, Event, FD_READ or FD_CLOSE);
    while not Terminated do
      case MsgWaitForMultipleObjects(1, Event, False, FTimeout, QS_ALLINPUT) of
        WAIT_OBJECT_0:
        begin
          if IsClose(FSocket.SocketHandle, Event) then
          begin
            { server close ; }
            break;
          end;
          FillChar(D, SizeBlock, 0);
          RetLen := FSocket.ReceiveBuf(D.Len, SizeInt);
          if RetLen = 0 then
            break;
          if RetLen <> SizeInt then
          begin
            FAddMsg(0, 1);
            Continue;
          end;
          RetLen := FSocket.ReceiveBuf(D.Content, D.Len);
          if RetLen <> D.Len then
          begin
            FAddMsg(0, 1);
            Continue;
          end;
          FAddMsg(1, 0);
          WSAResetEvent(Event);
        end;
        WAIT_OBJECT_0 + 1:
          while PeekMessage(msg, 0, 0, 0, PM_REMOVE) do
            case msg.message of
              WM_USER:
              begin
                RetLen := PDataBlock(msg.lParam)^.Len + SizeInt;
                FSocket.SendBuf(Pointer(msg.lParam)^, RetLen);
              end;
              WM_CLOSE:
              begin
                FSocket.Close;
                break;
              end;
            end;
        WAIT_TIMEOUT:
        begin
          P := @Data;
          FSocket.SendBuf(P^, 26);
        end;
      end;
  finally
    WSACloseEvent(Event);
    FSocket.Close;
  end;
end;

{ TClientMainForm }

procedure TClientMainForm.AddMsg(RightCount, ErrorCount: Integer);
begin
  FLock.Enter;
  try
    Inc(FRightCount, RightCount);
    Inc(FErrorCount, ErrorCount);
  finally
    FLock.Leave;
  end;
end;

constructor TClientMainForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLock := TCriticalSection.Create;
  FThreads := TList.Create;
end;

destructor TClientMainForm.Destroy;
begin
  while FThreads.Count > 0 do
    with TThread(FThreads.Last) do
    begin
      Terminate;
      PostThreadMessage(ThreadID, WM_CLOSE, 0, 0);
      Sleep(10);
    end;
  FThreads.Free;
  FLock.Free;
  inherited Destroy;
end;

procedure TClientMainForm.ThreadTerminate(Sender: TObject);
begin
  FLock.Enter;
  try
    FThreads.Remove(Sender);
  finally
    FLock.Leave;
  end;
end;

procedure TClientMainForm.StartButtonClick(Sender: TObject);
var
  Host: string;
  Thread: TThread;
  I, ThreadCount, Port, Timeout: Integer;
begin
  Port := StrToInt(PortEdit.Text);
  Timeout := StrToInt(TimeoutEdit.Text);
  ThreadCount := StrToInt(ThreadCountEdit.Text);
  FLock.Enter;
  try
    Host := HostEdit.Text;
    for I := 0 to ThreadCount - 1 do
    begin
      Thread := TClient.Create(Host, Port, Timeout, AddMsg);
      Thread.OnTerminate := ThreadTerminate;
      FThreads.Add(Thread);
    end;
    ConnectionCountText.Caption := IntToStr(FThreads.Count);
  finally
    FLock.Leave;
  end;
end;

procedure TClientMainForm.StopButtonClick(Sender: TObject);
var
  I: Integer;
  Thread: TThread;
begin
  FLock.Enter;
  try
    for I := FThreads.Count - 1 downto 0 do
    begin
      Thread := FThreads[I];
      if Assigned(Thread) then
        PostThreadMessage(Thread.ThreadID, WM_CLOSE, 0, 0);
    end;
  finally
    FLock.Leave;
  end;
end;

procedure TClientMainForm.Timer1Timer(Sender: TObject);
begin
  ConnectionCountText.Caption := IntToStr(FThreads.Count);
  RightCountText.Caption := IntToStr(FRightCount);
  ErrorCountText.Caption := IntToStr(FErrorCount);
  CountText.Caption := IntToStr(FRightCount + FErrorCount);
end;

end.
