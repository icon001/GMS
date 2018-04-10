unit uDecoderServer;

interface

uses
  System.SysUtils, System.Classes,Vcl.ExtCtrls,Vcl.Forms,
  Winapi.Windows,
  uWinSockClient,
  uCommonVariable;

type
  TDecoderToServer = class(TComponent)
  private
    SendPacketTimer: TTimer;
    SocketCheckTimer: TTimer;
    NodePacketList : TStringList;
    WinSocket : TdmWinSockClient;
    L_bDestroy : Boolean;
    L_bPacketSending : Boolean;
    L_bServerSending : Boolean;
    L_stComBuffer : RawByteString;
    procedure DecoderFromServerProcess(aPacketData:string);
    procedure DecoderFromServerReadingProcessing;
    function DecoderToServerSendPacket(aPacket:string):Boolean;
    procedure SendPacketTimerTimer(Sender: TObject);
    procedure SocketCheckTimerTimer(Sender: TObject);
    procedure WinSocketConnected(Sender: TObject;aValue:Boolean);
    procedure WinSocketRead(Sender: TObject;aPacketData:RawByteString;aLen:integer);
  private
    FServerPort: integer;
    FServerIP: string;
    FServerConnected: Boolean;
    FSocketOpen: Boolean;
    FSocketCheck: Boolean;
    FServerReceiveTime: TDateTime;
    FOnDecoderPacket: TMonitorPacket;
    procedure SetServerConnected(const Value: Boolean);
    procedure SetServerIP(const Value: string);
    procedure SetServerPort(const Value: integer);
    procedure SetSocketOpen(const Value: Boolean);
    procedure SetSocketCheck(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure NodePacket(aPacketData:string;aDirect:integer=1);
  published
    property ServerConnected : Boolean read FServerConnected write SetServerConnected;
    property ServerIP : string read FServerIP write SetServerIP ;
    property ServerPort : integer read FServerPort write SetServerPort ;
    property ServerReceiveTime : TDateTime read FServerReceiveTime write FServerReceiveTime;
    property SocketCheck : Boolean read FSocketCheck write SetSocketCheck;
    property SocketOpen : Boolean read FSocketOpen write SetSocketOpen;
  published
    property OnDecoderPacket : TMonitorPacket read FOnDecoderPacket write FOnDecoderPacket;
  end;
  TdmDecoderServer = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDecoderServer: TdmDecoderServer;

implementation
uses
  uCommonFunction;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDecoderToServer }

constructor TDecoderToServer.Create(AOwner: TComponent);
begin
  inherited;
  NodePacketList := TStringList.Create;
  WinSocket := TdmWinSockClient.Create(nil);
  WinSocket.OnConnected := WinSocketConnected;
  WinSocket.OnSocketRead := WinSocketRead;

  SocketCheckTimer:= TTimer.Create(nil);
  SocketCheckTimer.Interval := 5000;
  SocketCheckTimer.OnTimer := SocketCheckTimerTimer;

  SendPacketTimer:= TTimer.Create(nil);
  SendPacketTimer.Interval := 20;
  SendPacketTimer.OnTimer := SendPacketTimerTimer;

  L_bDestroy := False;
  L_bPacketSending := False;

end;

procedure TDecoderToServer.DecoderFromServerProcess(aPacketData: string);
var
  nIndex : integer;
begin
  if Assigned(FOnDecoderPacket) then
  begin
    OnDecoderPacket(Self,'RX',ServerIP,aPacketData);
  end;

  if aPacketData = 'ALIVE' then Exit; //������ ��� �ִٴ� ��ȣ

  //stSendPacket := con_DecoderTCP + FillZeroNumber(G_nDecoderNo,G_nDecoderNoLength) + aPacket;
  Delete(aPacketData,1,1); //con_DecoderTCP Type ����
  Delete(aPacketData,1,G_nDecoderNoLength); //���ڴ� ��ȣ ����
  nIndex := NodePacketList.IndexOf(aPacketData);
  if nIndex > -1 then
  begin
    NodePacketList.Delete(nIndex);
    L_bServerSending := False;
  end;
end;

procedure TDecoderToServer.DecoderFromServerReadingProcessing;
var
  nFormat : integer;
  bLoop : Boolean;
  stLeavePacketData : string;
  stData : string;
begin
  Try
    bLoop := False;
    repeat
      if Trim(L_stComBuffer) = '' then Exit;
      nFormat := DecoderFromServerPacketFormatCheck(L_stComBuffer,stLeavePacketData,stData);
      if nFormat < 0 then
      begin
        if L_stComBuffer = '' then break;
        if nFormat = -1 then  //������ ���� �ΰ��
        begin
           Delete(L_stComBuffer,1,1);
           continue;
        end else break;   //���� ���̰� �۰� ���� ���
      end;
      L_stComBuffer:= stLeavePacketData;
      if stData <> '' then
      begin
        DecoderFromServerProcess(stData);
      end;

      if pos(EOH,L_stComBuffer) = 0 then bLoop := True
      else bLoop := False;
      Application.ProcessMessages;
    until bLoop;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeDataReadingProcessing');
  End;
end;

function TDecoderToServer.DecoderToServerSendPacket(aPacket: string):Boolean;
var
  stSendPacket : string;
begin
  result := False;
  stSendPacket := con_DecoderTCP + FillZeroNumber(G_nDecoderNo,G_nDecoderNoLength) + aPacket;
  stSendPacket := SOH + FillZeroNumber(Length(stSendPacket),G_nDecoderPacketLength) + stSendPacket + EOH;
  if Not WinSocket.SocketConnected then Exit;
  WinSocket.PutString(stSendPacket);

  if Assigned(FOnDecoderPacket) then
  begin
    OnDecoderPacket(Self,'TX',ServerIP,aPacket);
  end;
end;

destructor TDecoderToServer.Destroy;
begin
  L_bDestroy := True;
  if SocketOpen then SocketOpen := False;


  SendPacketTimer.Enabled := False;
  SendPacketTimer.Free;

  SocketCheckTimer.Enabled := False;
  SocketCheckTimer.Free;

  NodePacketList.Free;
  WinSocket.Free;
  inherited;
end;

procedure TDecoderToServer.NodePacket(aPacketData: string;aDirect:integer=1);
var
  nIndex : integer;
begin
  if aDirect = 1 then
  begin
    nIndex := NodePacketList.IndexOf(aPacketData);
    if nIndex < 0 then NodePacketList.Add(aPacketData);
    SendPacketTimer.Enabled := True;
  end else
  begin
    DecoderToServerSendPacket(aPacketData);
  end;
end;


procedure TDecoderToServer.SendPacketTimerTimer(Sender: TObject);
var
  stSendPacket : string;
  FirstTickCount : double;
begin
  if NodePacketList.Count < 1 then Exit;
  if L_bPacketSending then Exit;
  if L_bDestroy then Exit;

  Try
    SendPacketTimer.Enabled := False;
    L_bPacketSending := True;
    stSendPacket := NodePacketList.Strings[0];
    L_bServerSending := True;

    FirstTickCount := GetTickCount + con_DecorderReceivePacketDelayTime;
    if DecoderToServerSendPacket(stSendPacket) then     //���������� ������ ��쿡�� ��ٸ���...
    begin
      while L_bServerSending do
      begin
        if L_bDestroy then Exit;
        sleep(1);
        Application.ProcessMessages;
        if GetTickCount > FirstTickCount then Break;   //3�� ���� Packet�� ���� ������ ������ �ٽ� �ѹ� ������.
      end;
    end;
  Finally
    SendPacketTimer.Enabled := Not L_bDestroy;
    L_bPacketSending := False;
  End;
end;

procedure TDecoderToServer.SetServerConnected(const Value: Boolean);
begin
  if FServerConnected = Value then Exit;

  FServerConnected := Value;
  if Assigned(FOnDecoderPacket) then
  begin
    if Value then
      OnDecoderPacket(Self,'RX',ServerIP,'Socket Connected')
    else OnDecoderPacket(Self,'RX',ServerIP,'Socket DisConnected');
  end;
end;

procedure TDecoderToServer.SetServerIP(const Value: string);
begin
  if FServerIP = Value then Exit;

  FServerIP := Value;
  WinSocket.ServerIP := Value;
end;

procedure TDecoderToServer.SetServerPort(const Value: integer);
begin
  if FServerPort = Value then Exit;
  FServerPort := Value;
  WinSocket.ServerPort := Value;
end;

procedure TDecoderToServer.SetSocketCheck(const Value: Boolean);
begin
  if FSocketCheck = Value then Exit;

  FSocketCheck := Value;
  if SocketCheckTimer <> nil then SocketCheckTimer.Enabled := Value;
end;

procedure TDecoderToServer.SetSocketOpen(const Value: Boolean);
begin
  if FSocketOpen = Value then Exit;

  FSocketOpen := Value;
  WinSocket.SocketOpen := Value;

  if Value then ServerReceiveTime := Now;
end;

procedure TDecoderToServer.SocketCheckTimerTimer(Sender: TObject);
var
  dtTimeOut: TDatetime;
begin
  if L_bDestroy then Exit;

  dtTimeOut:= IncTime(ServerReceiveTime,0,0,con_DecorderReceiveENQDelayTime,0);
  if Now > dtTimeOut then
  begin
    WinSocket.SocketOpen := False;
  end;

  if Not WinSocket.SocketOpen then WinSocket.SocketOpen := True;
end;

procedure TDecoderToServer.WinSocketConnected(Sender: TObject; aValue: Boolean);
begin
  ServerConnected := aValue;
end;

procedure TDecoderToServer.WinSocketRead(Sender: TObject;
  aPacketData: RawByteString; aLen: integer);
begin
  ServerReceiveTime := Now;
  L_stComBuffer := L_stComBuffer + aPacketData;
  DecoderFromServerReadingProcessing;
end;

end.