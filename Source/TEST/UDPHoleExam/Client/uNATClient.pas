unit uNATClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  uP2PCommon, IdStack, IdGlobal, IdUDPClient, IdUDPBase, IdUDPServer, ExtCtrls,
  IdSocketHandle;

type
  TTCPReadEvent = procedure (Sender : TObject; Socket: TIdTCPConnection;
                             Header: TP2PTCPHeader; Data: TMemoryStream) of object;

  TPeerClient = record
    PeerIP : String;
    Port   : Integer;
  end;

  TListenThread = class(TThread)
  private
    FTCPReadEvent : TTCPReadEvent;

    RecvData      : TMemoryStream;
    RecvHeader    : TP2PTCPHeader;
  protected
    procedure Execute; override;
    procedure DoOnTCPRead;
  public
    constructor Create; virtual;
    destructor  Destroy; override;
    property OnTCPRead : TTCPReadEvent read FTCPReadEvent  write FTCPReadEvent;
  end;

  TFrmP2PClient = class(TForm)
    TCPClient: TIdTCPClient;
    chkTCPActive: TCheckBox;
    edTCPHost: TEdit;
    mmoTCPMsg: TMemo;
    BtnRecvMsgDel: TButton;
    UDPServer: TIdUDPServer;
    mmoUDPMsg: TMemo;
    BtnSendAllMsg: TButton;
    edUserID: TEdit;
    lbUsers: TListBox;
    edMsg: TEdit;
    BtnSendMsg: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnRecvMsgDelClick(Sender: TObject);
    procedure chkTCPActiveClick(Sender: TObject);
    procedure TCPClientConnected(Sender: TObject);
    procedure TCPClientStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure UDPServerUDPRead(Sender: TObject; AData: TBytes;
      ABinding: TIdSocketHandle);
    procedure BtnSendAllMsgClick(Sender: TObject);
    procedure BtnSendMsgClick(Sender: TObject);
  private
    ReadThread  : TListenThread;
    MyLocalIP   : String;
    MyID        : String;
    PeerClients : array [0..9] of TPeerClient;

    procedure TCPClientRead(Sender : TObject; Socket: TIdTCPConnection;
      Header: TP2PTCPHeader; Data: TMemoryStream);
    procedure SendUDPFirstData;
    procedure GetConnectInfoSet(aData : TMemoryStream);
    // Disconn Add
  public

  end;

var
  FrmP2PClient: TFrmP2PClient;

implementation

{$R *.dfm}

{ TListenThread }

constructor TListenThread.Create;
begin
  inherited Create(True);
  RecvData := TMemoryStream.Create;
  FreeOnTerminate := True;
end;

destructor TListenThread.Destroy;
begin
  RecvData.Free;
  inherited;
end;

procedure TListenThread.Execute;
var
  aBuf : TIdBytes;
begin
  while not Terminated do
  try
    if not FrmP2PClient.TCPClient.Connected then Terminate
    else
    begin
      SetLength(aBuf, 0);
      FrmP2PClient.TCPClient.Socket.ReadBytes(aBuf, SizeOf(TP2PTCPHeader));
      BytesToRaw(aBuf, RecvHeader, SizeOf(TP2PTCPHeader));

      RecvData.Clear;
      FrmP2PClient.TCPClient.Socket.ReadStream(RecvData, RecvHeader.DataSize);
      RecvData.Position := 0;
      Synchronize(DoOnTCPRead);
    end;
  except
  end;
end;

procedure TListenThread.DoOnTCPRead;
begin
  if Assigned(FTCPReadEvent) then
    FTCPReadEvent(FrmP2PClient, FrmP2PClient.TCPClient, RecvHeader, RecvData);
end;

{ TFrmP2PClient }

procedure TFrmP2PClient.FormCreate(Sender: TObject);
begin
  try
    edTCPHost.Text := GStack.LocalAddresses[0];
    MyLocalIP := GStack.LocalAddresses[0];
  except
    edTCPHost.Text := '';
  end;
end;

procedure TFrmP2PClient.BtnRecvMsgDelClick(Sender: TObject);
begin
  mmoTCPMsg.Lines.Clear;
  mmoTCPMsg.Clear;
  mmoUDPMsg.Lines.Clear;
  mmoUDPMsg.Clear;
end;

procedure TFrmP2PClient.chkTCPActiveClick(Sender: TObject);
var
  i : Integer;
begin
  if chkTCPActive.Checked then
  try
    MyID := Trim(edUserID.Text);
    if MyID = EmptyStr then
    begin
      chkTCPActive.Checked := False;
      Exit;
    end;
    TCPClient.Host := Trim(edTCPHost.Text);
    TCPClient.Connect;

    ReadThread := TListenThread.Create;
    ReadThread.OnTCPRead := TCPClientRead;
    ReadThread.Resume;
  except
    on E : Exception do
    begin
      mmoTCPMsg.Lines.Add('Error while connecting : '+ E.Message);
      chkTCPActive.checked := False;
    end;
  end
  else
  begin
    if Assigned(ReadThread) or (ReadThread <> nil) then
    begin
      ReadThread.Terminate;
      ReadThread := nil;
    end;
    TCPClient.Disconnect;
    lbUsers.Clear;
    for i := 0 to 9 do
    begin
      PeerClients[i].PeerIP := '';
      PeerClients[i].Port := 0;
    end;      
  end;
end;

procedure TFrmP2PClient.TCPClientConnected(Sender: TObject);
var
  aHeader : TP2PTCPHeader;
  aBuf    : TIdBytes;
begin
  aHeader.Command  := $00;
  aHeader.UserID   := MyID;
  aHeader.DataSize := Length(MyLocalIP);
  aBuf := RawToBytes(aHeader, SizeOf(TP2PTCPHeader));
  TCPClient.IOHandler.Write(aBuf);

  SetLength(aBuf, 0);
  aBuf := RawToBytes(PChar(MyLocalIP)^, aHeader.DataSize);
  TCPClient.IOHandler.Write(aBuf);
end;

procedure TFrmP2PClient.TCPClientStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
  case AStatus of
    hsResolving     : ;
    hsConnecting    : ;
    hsConnected     : ;
    hsDisconnecting : ;
    hsDisconnected  : begin
      if not chkTCPActive.Checked then
        chkTCPActive.Checked := False;
    end;
    hsStatusText    : ;
  end;
  mmoTCPMsg.Lines.Add(AStatusText);
end;

procedure TFrmP2PClient.TCPClientRead(Sender: TObject; Socket: TIdTCPConnection;
  Header: TP2PTCPHeader; Data: TMemoryStream);
begin
  case Header.Command of
    $10 : SendUDPFirstData;
    $11 : GetConnectInfoSet(Data);
    $12 : ;
  end;
end;

procedure TFrmP2PClient.SendUDPFirstData;
begin
  try
    UDPServer.Active := True;
  except
    UDPServer.Bindings.Clear;  
    UDPServer.DefaultPort := UDPServer.DefaultPort + 1;
    SendUDPFirstData;
    Exit;
  end;
  UDPServer.Send(edTCPHost.Text, 22015, '$20,' + MyID);
end;

procedure TFrmP2PClient.GetConnectInfoSet(aData: TMemoryStream);
var
  i : Integer;
  aStrList : TStringList;
  aIdx : Integer;
begin
  lbUsers.Clear;
  for i := 0 to 9 do
  begin
    PeerClients[i].PeerIP := '';
    PeerClients[i].Port := 0;
  end;
  
  aStrList := TStringList.Create;
  try
    aData.Position := 0;
    aStrList.LoadFromStream(aData);
    mmoTCPMsg.Lines.Add('GetConnInfoSet : ' + Trim(aStrList.Text));

    for i := 0 to (aStrList.Count div 3) - 1 do
    begin
      if aStrList[i*3] = MyID then Continue;
      aIdx := lbUsers.Items.Add(aStrList[i*3]);
      PeerClients[aIdx].PeerIP := aStrList[(i*3)+1];
      PeerClients[aIdx].Port   := StrToInt(aStrList[(i*3)+2]);
      UDPServer.Send(PeerClients[aIdx].PeerIP, PeerClients[aIdx].Port, MyID + ' : Noop Message');
    end;
  finally
    aStrList.Free;
  end;
end;

procedure TFrmP2PClient.UDPServerUDPRead(Sender: TObject; AData: TBytes;
  ABinding: TIdSocketHandle);
begin
  mmoUDPMsg.Lines.Add(BytesToString(AData));
end;

procedure TFrmP2PClient.BtnSendAllMsgClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to 9 do
    if PeerClients[i].PeerIP <> EmptyStr then
      UDPServer.Send(PeerClients[i].PeerIP,
                     PeerClients[i].Port,
                     MyID + 'Send Message : ' + edMsg.Text);
end;

procedure TFrmP2PClient.BtnSendMsgClick(Sender: TObject);
begin
  if lbUsers.ItemIndex < 0 then begin
    MessageBox(Handle, 'Select User !!', 'Select User', MB_OK or MB_ICONWARNING);
    Exit;
  end;
  UDPServer.Send(PeerClients[lbUsers.ItemIndex].PeerIP,
                 PeerClients[lbUsers.ItemIndex].Port,
                 MyID + ' Send Message : ' + edMsg.Text);  
end;

end.
