unit uDevice;

interface

uses
  System.SysUtils, System.Classes,Web.Win.Sockets,Vcl.ExtCtrls,System.SyncObjs,
  uDeviceVariable;

type
  TNode = Class(TTcpClient)
  private
    FTCSDeviceSender : TCriticalSection;
    FNo: Integer;
    FLanPort: integer;
    FLanIP: string;
    FSocketOpen: Boolean;
    FNodeConnected: Boolean;
    FDeviceID: string;
    FNodeName: string;
    FKTTSYSTEMID: string;
    FDVRUSE: string;
    FKTTCDMAUSE: string;
    FKTTCDMASKILL: Boolean;
    FKTTCDMARSSI: string;
    FKTTCDMAMIN: string;
    FFIREGUBUNCODE: string;
    FKTTREMOTEARMRINGCOUNT: integer;
    FDVRPORT: string;
    FKTTCDMAPORT: string;
    FKTTCDMACHECKTIME: string;
    FKTTCDMAUMUX: string;
    FKTTREMOTEDISARMRINGCOUNT: integer;
    FKTTTELNUMBER2: string;
    FKTTTELNUMBER1: string;
    FDVRIP: string;
    FKTTCDMAIP: string;
    FDVRSKILL: Boolean;

    procedure SetNo(const Value: Integer);
    procedure SetLanIP(const Value: string);
    procedure SetLanPort(const Value: integer);
    procedure SetSocketOpen(const Value: Boolean);
    procedure SetNodeConnected(const Value: Boolean);
    procedure SetDeviceID(const Value: string);
    procedure SetNodeName(const Value: string);
    procedure SetKTTSYSTEMID(const Value: string);
    procedure SetDVRIP(const Value: string);
    procedure SetDVRPORT(const Value: string);
    procedure SetDVRUSE(const Value: string);
    procedure SetFIREGUBUNCODE(const Value: string);
    procedure SetKTTCDMACHECKTIME(const Value: string);
    procedure SetKTTCDMAIP(const Value: string);
    procedure SetKTTCDMAMIN(const Value: string);
    procedure SetKTTCDMAPORT(const Value: string);
    procedure SetKTTCDMARSSI(const Value: string);
    procedure SetKTTCDMASKILL(const Value: Boolean);
    procedure SetKTTCDMAUMUX(const Value: string);
    procedure SetKTTCDMAUSE(const Value: string);
    procedure SetKTTREMOTEARMRINGCOUNT(const Value: integer);
    procedure SetKTTREMOTEDISARMRINGCOUNT(const Value: integer);
    procedure SetKTTTELNUMBER1(const Value: string);
    procedure SetKTTTELNUMBER2(const Value: string);
    procedure SetDVRSKILL(const Value: Boolean);
  private
    L_nSendMsgNo : integer;
    L_stComBuffer : string;
    SocketReceiveTimer: TTimer;
    NodeDeviceList : TStringList;
    FOnDeviceConnected: TDeviceConnect;
    FOnRcvInvalidDevice: TNotifyReceive;
    FOnSendData: TNotifyReceive;
    FOnRcvData: TNotifyReceive;
    { Private declarations }
  private
    procedure TcpClientReceive(Sender: TObject; Buf: PAnsiChar;
      var DataLen: Integer);
    procedure TcpClientConnect(Sender: TObject);
    procedure TcpClientDisconnect(Sender: TObject);
    procedure TcpClientError(Sender: TObject; SocketError: Integer);
    procedure TcpClientSend(Sender: TObject; Buf: PAnsiChar;
      var DataLen: Integer);

    procedure NodeDataReadingProcessing;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SocketReceiveTimerTimer(Sender:TObject);
  public
    function  GetSendMsgNo:char;
  public
    { Public declarations }
    Procedure  SendPacket(aEcuId: String;aCmd:Char;aMsgNo:char;aDeviceVer, aData: String;aPriority:integer=0);
    function PutString(aData:string):Boolean;
  published
    property SocketOpen : Boolean read FSocketOpen write SetSocketOpen;
    property NodeConnected : Boolean read FNodeConnected write SetNodeConnected;
  published
    Property No: Integer Read FNo write SetNo;
    Property DeviceID:string Read FDeviceID write SetDeviceID;   //��� ���̵� 7�ڸ�
    Property NodeName:string Read FNodeName write SetNodeName;   //��� ��
    property LANIP : string read FLanIP write SetLanIP;
    property LANPort : integer read FLanPort write SetLanPort;
    property KTTSYSTEMID : string read FKTTSYSTEMID write SetKTTSYSTEMID;  //���� �ý��� ���̵�
    property KTTTELNUMBER1 : string read FKTTTELNUMBER1 write SetKTTTELNUMBER1;  //���� ���ڴ� ��ȭ��ȣ1
    property KTTTELNUMBER2 : string read FKTTTELNUMBER2 write SetKTTTELNUMBER2;  //���� ���ڴ� ��ȭ��ȣ2
    property KTTREMOTEARMRINGCOUNT : integer read FKTTREMOTEARMRINGCOUNT write SetKTTREMOTEARMRINGCOUNT;  //���ݰ��� ��Ƚ��
    property KTTREMOTEDISARMRINGCOUNT : integer read FKTTREMOTEDISARMRINGCOUNT write SetKTTREMOTEDISARMRINGCOUNT;  //���������� ��Ƚ��
    property KTTCDMASKILL : Boolean read FKTTCDMASKILL write SetKTTCDMASKILL;   //CDMA ��� ����
    property KTTCDMAUSE : string read FKTTCDMAUSE write SetKTTCDMAUSE; //CDMA ��� ���� 0.�̻��,1.���
    property KTTCDMAIP : string read FKTTCDMAIP write SetKTTCDMAIP;     //CDMA IP
    property KTTCDMAPORT : string read FKTTCDMAPORT write SetKTTCDMAPORT; //CDMA Port
    property KTTCDMACHECKTIME : string read FKTTCDMACHECKTIME write SetKTTCDMACHECKTIME; //CDMA check time
    property KTTCDMARSSI : string read FKTTCDMARSSI write SetKTTCDMARSSI; //CDMA rssi
    property KTTCDMAMIN : string read FKTTCDMAMIN write SetKTTCDMAMIN;
    property KTTCDMAUMUX : string read FKTTCDMAUMUX write SetKTTCDMAUMUX;
    property DVRSKILL : Boolean read FDVRSKILL write SetDVRSKILL;   //DVR ��� ����
    property DVRUSE : string read FDVRUSE write SetDVRUSE; //DVR ��� ���� 0.�̻��,1.���
    property DVRIP : string read FDVRIP write SetDVRIP; //DVR IP
    property DVRPORT : string read FDVRPORT write SetDVRPORT; //DVR Port
    property FIREGUBUNCODE : string read FFIREGUBUNCODE write SetFIREGUBUNCODE; //ȭ��׷��ڵ�
  published
    //��� �̺�Ʈ
    ProPerty OnDeviceConnected : TDeviceConnect read FOnDeviceConnected Write FOnDeviceConnected;
    ProPerty OnRcvData : TNotifyReceive read FOnRcvData write FOnRcvData;
    ProPerty OnRcvInvalidDevice: TNotifyReceive read FOnRcvInvalidDevice write FOnRcvInvalidDevice;
    ProPerty OnSendData : TNotifyReceive read FOnSendData write FOnSendData;
  end;

  TDevice = Class(TComponent)
  private
    FDeviceID: string;
    FDeviceUse: Boolean;
    FFireGroupCode: string;
    DeviceDoorList : TStringList;
    DeviceArmAreaList : TStringList;
    FDeviceNode: TNode;
    FDeviceConnected: Boolean;
    procedure SetDeviceNode(const Value: TNode);
    procedure SetDeviceConnected(const Value: Boolean);
  private
    L_stDeviceVer : string;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DeviceConnected : Boolean read FDeviceConnected write SetDeviceConnected;
    Property DeviceNode: TNode Read FDeviceNode write SetDeviceNode;
    property DeviceID : string read FDeviceID write FDeviceID;
    property DeviceUse : Boolean read FDeviceUse write FDeviceUse; //���������
    property FireGroupCode : string read FFireGroupCode write FFireGroupCode;  //ȭ�� �߻��� ���� �׷� �ڵ�
  public
    { Public declarations }

  End;

  TDeviceDoor = Class(TComponent)
  private
    FDoorNo: integer;
    FDoorUse: Boolean;
    { Private declarations }
  published
    property DoorNo : integer read FDoorNo write FDoorNo;
    property DoorUse : Boolean read FDoorUse write FDoorUse; //���Թ��������
  public
    { Public declarations }
  end;

  TDeviceArmArea = Class(TComponent)
  private
    FArmAreaNo: integer;
    FArmAreaUse: Boolean;
    { Private declarations }
  published
    property ArmAreaNo : integer read FArmAreaNo write FArmAreaNo;
    property ArmAreaUse : Boolean read FArmAreaUse write FArmAreaUse; //���Թ��������
  public
    { Public declarations }
  end;

  TdmDevice = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDevice: TdmDevice;
  NodeList : TStringList;

implementation

uses
  uCommonFunction,
  uCommonVariable,
  uDeviceFunction;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TNode }

constructor TNode.Create(AOwner: TComponent);
var
  i : integer;
  oDevice : TDevice;
begin
  inherited;
  L_nSendMsgNo := 0;

  FTCSDeviceSender := TCriticalSection.Create;

  BlockMode := bmNonBlocking;
  OnReceive := TcpClientReceive;
  OnConnect := TcpClientConnect;
  OnDisconnect := TcpClientDisconnect;
  OnError := TcpClientError;
  OnSend := TcpClientSend;
  //BlockMode := bmBlocking;
  NodeDeviceList := TStringList.Create;
  for i := 0 to G_nMaxECUCount do
  begin
    oDevice := TDevice.Create(nil);
    oDevice.DeviceID := FillZeroNumber(i,2);
    if i = 0 then oDevice.DeviceUse := True
    else oDevice.DeviceUse := False;
    oDevice.DeviceNode := self;
    NodeDeviceList.AddObject(FillZeroNumber(i,2),oDevice);
  end;

  SocketReceiveTimer:= TTimer.Create(nil);
  SocketReceiveTimer.OnTimer := SocketReceiveTimerTimer;
  SocketReceiveTimer.Interval := G_nSocketReciveTime;
  SocketReceiveTimer.Enabled := False;
end;

destructor TNode.Destroy;
var
  i : integer;
begin
  for i := NodeDeviceList.Count - 1 downto 0 do
  begin
    TDevice(NodeDeviceList.Objects[i]).Free;
  end;
  NodeDeviceList.Clear;
  NodeDeviceList.Free;
  FTCSDeviceSender.Free;
  inherited;
end;

function TNode.GetSendMsgNo: char;
begin
  result := inttostr(L_nSendMsgNo)[1];
  L_nSendMsgNo := L_nSendMsgNo + 1;
  if L_nSendMsgNo > 9 then L_nSendMsgNo := 0;
end;

procedure TNode.NodeDataReadingProcessing;
begin

end;

function TNode.PutString(aData: string): Boolean;
begin
  Try
    FTCSDeviceSender.Enter;
    result := False;
    if Not NodeConnected then Exit;

    Try
      Sendln(aData,''); //TcpClient.SendBuf(aData,Length(aData));
    Except
      Exit;
    End;
    result := True;
  Finally
    FTCSDeviceSender.Leave;
  End;
end;

procedure TNode.SendPacket(aEcuId: String;aCmd: Char;aMsgNo:char;aDeviceVer,aData: String; aPriority: integer);
var
  stDeviceID : string;
  nDataLength : integer;
  stLen : string;
  stPacket : string;
begin
  if Not NodeConnected then Exit;
  stDeviceID := FillZeroNumber(0,G_nIDLength) + aEcuID;
  nDataLength := (G_nIDLength + 14) + Length(aData);
  stLen := FillZeroNumber(nDataLength, 3);
  if aCmd = 'a' then {���� ó��}
     stPacket := dmDeviceFunction.PacketCreate(G_nProgramType,stLen,aDeviceVer,stDeviceID,aCmd,aData,aMsgNo)
  else {���� or ��� }
  begin
    stPacket := dmDeviceFunction.PacketCreate(G_nProgramType,stLen,aDeviceVer,stDeviceID,aCmd,aData,aMsgNo);
  end;
  if aPriority = 0 then
  begin
    PutString(stPacket); //���Ͽ� �ٷ� ���� --ack ������
  end;

end;

procedure TNode.SetDeviceID(const Value: string);
begin
  FDeviceID := Value;
end;

procedure TNode.SetDVRIP(const Value: string);
begin
  FDVRIP := Value;
end;

procedure TNode.SetDVRPORT(const Value: string);
begin
  FDVRPORT := Value;
end;


procedure TNode.SetDVRSKILL(const Value: Boolean);
begin
  FDVRSKILL := Value;
end;

procedure TNode.SetDVRUSE(const Value: string);
begin
  FDVRUSE := Value;
end;

procedure TNode.SetFIREGUBUNCODE(const Value: string);
begin
  FFIREGUBUNCODE := Value;
end;

procedure TNode.SetKTTCDMACHECKTIME(const Value: string);
begin
  FKTTCDMACHECKTIME := Value;
end;

procedure TNode.SetKTTCDMAIP(const Value: string);
begin
  FKTTCDMAIP := Value;
end;

procedure TNode.SetKTTCDMAMIN(const Value: string);
begin
  FKTTCDMAMIN := Value;
end;

procedure TNode.SetKTTCDMAPORT(const Value: string);
begin
  FKTTCDMAPORT := Value;
end;

procedure TNode.SetKTTCDMARSSI(const Value: string);
begin
  FKTTCDMARSSI := Value;
end;

procedure TNode.SetKTTCDMASKILL(const Value: Boolean);
begin
  FKTTCDMASKILL := Value;
end;

procedure TNode.SetKTTCDMAUMUX(const Value: string);
begin
  FKTTCDMAUMUX := Value;
end;

procedure TNode.SetKTTCDMAUSE(const Value: string);
begin
  FKTTCDMAUSE := Value;
end;

procedure TNode.SetKTTREMOTEARMRINGCOUNT(const Value: integer);
begin
  FKTTREMOTEARMRINGCOUNT := Value;
end;

procedure TNode.SetKTTREMOTEDISARMRINGCOUNT(const Value: integer);
begin
  FKTTREMOTEDISARMRINGCOUNT := Value;
end;

procedure TNode.SetKTTSYSTEMID(const Value: string);
begin
  FKTTSYSTEMID := Value;
end;

procedure TNode.SetKTTTELNUMBER1(const Value: string);
begin
  FKTTTELNUMBER1 := Value;
end;

procedure TNode.SetKTTTELNUMBER2(const Value: string);
begin
  FKTTTELNUMBER2 := Value;
end;

procedure TNode.SetLanIP(const Value: string);
begin
  FLanIP := Value;
  RemoteHost := Value;
end;

procedure TNode.SetLanPort(const Value: integer);
begin
  FLanPort := Value;
  RemotePort := inttostr(Value);
end;

procedure TNode.SetNo(const Value: Integer);
begin
  FNo := Value;
end;

procedure TNode.SetNodeConnected(const Value: Boolean);
var
  i : integer;
  nIndex : integer;
begin
  if FNodeConnected = Value then Exit;
  FNodeConnected := Value;

  SocketReceiveTimer.Enabled := Value;
  if Value then
  begin
    nIndex := NodeDeviceList.IndexOf('00');
    if nIndex > -1 then
      TDevice(NodeDeviceList.Objects[0]).DeviceConnected := True;
    //�ð� ����ȭ ������.
    //��Ʈ�ѷ� ��Ż��� Ȯ�� ���� ������.
  end;
  if Not Value then
  begin
    for i := 0 to NodeDeviceList.Count - 1 do
    begin
      TDevice(NodeDeviceList.Objects[i]).DeviceConnected := False;
    end;
  end;
end;

procedure TNode.SetNodeName(const Value: string);
begin
  FNodeName := Value;
end;

procedure TNode.SetSocketOpen(const Value: Boolean);
begin
  if FSocketOpen = Value then Exit;
  FSocketOpen := Value;
  if Value then
  begin
    RemoteHost := LanIP;
    RemotePort := inttostr(LanPort);
    BlockMode := bmNonBlocking;
    Tag := 0;
    NodeConnected := Connect;
    if (not NodeConnected) and (Tag = 0) then
    begin
      Select(nil, @Connected, nil, 1000);
      if not NodeConnected then
        Disconnect;
    end;
  end else
  begin
    Disconnect;
  end;
end;

procedure TNode.SocketReceiveTimerTimer(Sender: TObject);
var
  stBuff : string;
begin
  SocketReceiveTimer.Enabled := False;
  Try
    stBuff := Receiveln(ETX);
  Finally
    SocketReceiveTimer.Enabled := NodeConnected;
  End;
end;

procedure TNode.TcpClientConnect(Sender: TObject);
begin
  NodeConnected := True;
end;

procedure TNode.TcpClientDisconnect(Sender: TObject);
begin
  NodeConnected := False;
end;

procedure TNode.TcpClientError(Sender: TObject; SocketError: Integer);
begin
  if SocketError = WSAEWOULDBLOCK then Tag := 0
  else begin
    NodeConnected := False;
    Tag := SocketError;
  end;

end;

procedure TNode.TcpClientReceive(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
begin
  L_stComBuffer := L_stComBuffer + Buf;
  NodeDataReadingProcessing;

end;

procedure TNode.TcpClientSend(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
begin

end;

{ TDevice }

constructor TDevice.Create(AOwner: TComponent);
begin
  inherited;
  L_stDeviceVer := 'K1';  //��Ʈ�ѷ��� ����Ʈ ���� ����
  DeviceDoorList := TStringList.Create;
  DeviceArmAreaList := TStringList.Create;
end;

destructor TDevice.Destroy;
begin

  inherited;
end;

procedure TDevice.SetDeviceConnected(const Value: Boolean);
begin
  FDeviceConnected := Value;
end;

procedure TDevice.SetDeviceNode(const Value: TNode);
begin
  FDeviceNode := Value;
end;

end.