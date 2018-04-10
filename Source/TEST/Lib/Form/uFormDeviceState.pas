unit uFormDeviceState;

interface

uses
  System.SysUtils, System.Classes,Vcl.Forms,Winapi.Windows,
  uServerClientVariable;

const MAXDEVICERCVCOUNT = 100;

type
  TMonitoringNode = Class(TComponent)
  private
    L_bDeviceConnectRCV : Boolean;
    L_nCurrentCheckDeviceSeq : integer;
    DeviceList : TStringList;
    procedure ArmAreaCurrentAlarmStateChange(Sender: TObject;  aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(Sender: TObject;  aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure DeviceChangeEvent(Sender: TObject;  aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);  //��Ʈ�ѷ� ���� �̺�Ʈ
    procedure DoorChangeEvent(Sender: TObject;  aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
    procedure NodeConnectedCheck;
  private
    FNodeNo: integer;
    FNodeName: String;
    FNodeIP: String;
    FNodeConnected: string;
    FServerRcv: string;
    FOnDeviceChangeEvent: TDeviceChangeEvent;
    FOnNodeChangeEvent: TDeviceChangeEvent;
    FOnDoorChangeEvent: TDoorChangeEvent;
    FOnArmAreaSecurityModeChange: TArmAreaSecurityModeChange;
    FOnArmAreaCurrentAlarmStateChange: TArmAreaSecurityModeChange;
    procedure SetNodeConnected(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure SetArmArea_Add(aEcuID,aArmAreaNo,aArmAreaName:string);
    procedure SetArmArea_BuildingSetting(aEcuID,aArmAreaNo,aBuildingCode:string);
    procedure SetDevice_Add(aEcuID,aEcuName:string);
    procedure SetDoor_Add(aEcuID,aDoorNo,aDoorName:string);
    procedure SetDoor_BuildingSetting(aEcuID,aDoorNo,aBuildingCode:string);
    procedure SetDoor_LockTypeSetting(aEcuID,aDoorNo,aLockType:string);
    procedure DeviceSort;
    procedure DeviceStateReSend;
    procedure NodeStateCheck;
    procedure NodeToArmAreaEventAllClear;
    procedure NodeToAlarmEventSetting(aEcuID,aExtendID, aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,aAlarmStateCodeName,
              aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor:string);
  Public
    procedure RcvNodeToArmAreaStateProcess(aEcuID:string;aArmAreaCount,aArmAreaFormatLength:integer;aArmAreaStateData:string);
    procedure RcvNodeToAlarmEventProcess(aEcuID,aExtendID, aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,aAlarmStateCodeName,
              aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor:string);
    procedure RcvNodeToDeviceNetworkStateSearchProcess(aData:string);
    procedure RcvNodeToDoorStateChangeProcess(aEcuID,aData:string);
    procedure RcvNodeToDoorStateProcess(aEcuID:string;aDoorCount,aDoorFormatLength:integer;aDoorStateData:string);
    procedure RcvNodeToEcuNetworkStateChangeProcess(aEcuID,aValue:string);
  public
    function GetDeviceConnect(aEcuID : string):string;
    function GetDeviceCount : integer;
    function GetDeviceIndexName(aIndex:integer; var aEcuID,aEcuName:string):Boolean;
    function GetDeviceToDoorName(aEcuID,aDoorNo:string):string;
  public
    function GetArmAreaState(aCmd:integer;aECUID,aArmArea:string):string;
  published
    property NodeNo : integer read FNodeNo write FNodeNo;
    property NodeIP : String read FNodeIP write FNodeIP;
    property NodeName : String read FNodeName write FNodeName;
  published
    //��� ����
    property NodeConnected : string read FNodeConnected write SetNodeConnected;   //2 : Ȯ��� ��ü Connected ����,1 : Node �������, 0 : Node �������
    property ServerRcv : string read FServerRcv write FServerRcv;
  published
    property OnArmAreaCurrentAlarmStateChange : TArmAreaSecurityModeChange read FOnArmAreaCurrentAlarmStateChange write FOnArmAreaCurrentAlarmStateChange;
    property OnArmAreaSecurityModeChange : TArmAreaSecurityModeChange read FOnArmAreaSecurityModeChange write FOnArmAreaSecurityModeChange;
    property OnDeviceChangeEvent : TDeviceChangeEvent read FOnDeviceChangeEvent write FOnDeviceChangeEvent;
    property OnDoorChangeEvent : TDoorChangeEvent read FOnDoorChangeEvent write FOnDoorChangeEvent;
    property OnNodeChangeEvent : TDeviceChangeEvent read FOnNodeChangeEvent write FOnNodeChangeEvent;
  End;

  TMonitoringBuildingState = Class(TComponent)
  private
    DeviceList : TStringList;
    DoorList : TStringList;
    ArmAreaList : TStringList;
    FBuildingCode: string;
    FBuildingBuildingName: string;
    FBuildingSecurityMode: integer;
    FOnBuildingSecurityModeChange: TBuildingSecurityModeChange;
    FBuildingAlarmState: integer;
    FOnBuildingAlarmStateChange: TBuildingSecurityModeChange;
    { Private declarations }
    procedure ArmAreaCurrentAlarmStateChange(Sender: TObject;  aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(Sender: TObject;  aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure SetBuildingSecurityMode(const Value: integer);
    procedure SetBuildingAlarmState(const Value: integer);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure DoorChangeEvent(aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);
  public
    procedure SetArmArea_Add(aNodeNo,aEcuID,aArmAreaNo,aArmAreaName:string);
    procedure SetDoor_Add(aNodeNo,aEcuID,aDoorNo,aDoorName:string);
    procedure SetDoor_LockTypeSetting(aNodeNo,aEcuID,aDoorNo,aLockType:string);

    procedure SetArmAreaAlarmStateChange(aNodeNo,aEcuID,aArmAreaNo,aAlarmState:string);
    procedure SetArmAreaSecurityModeChange(aNodeNo,aEcuID,aArmAreaNo,aMode:string);
  public
    function GetArmAreaCount : integer;
    function GetArmAreaDeviceArmAreaState(aNodeNo,aEcuID,aArmArea:string):integer;
    function GetArmAreaDeviceSecurityMode(aNodeNo,aEcuID,aArmArea:string):String;
    function GetArmAreaIndexArmAreaState(aArmAreaIndex:integer):integer;
    function GetArmAreaIndexDevieInfo(aArmAreaIndex:integer;var aNodeNo,aEcuID,aArmAreaNo,aArmAreaName:string):Boolean;
    function GetArmAreaIndexSecurityMode(aArmAreaIndex:integer):String;
    function GetDoorCount : integer;
    function GetDoorCurrentState(aNodeNo,aEcuID,aDoorNo:string; var aDoorCardMode,aDoorManageMode,aDoorDSState,aDoorLSState,aDoorFireEvent:string):Boolean;
    function GetDoorIndexCurrentState(aDoorIndex:integer;var aDoorCardMode,aDoorManageMode,aDoorDSState,aDoorLSState,aDoorFireEvent:string):Boolean;
    function GetDoorIndexDevieInfo(aDoorIndex:integer;var aNodeNo,aEcuID,aDoorNo,aDoorName:string):Boolean;
    function GetDoorIndexLockType(aDoorIndex:integer):string;
    function GetDoorName(aNodeNo,aEcuID,aDoorNo:string):string;
  published
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property BuildingName : string read FBuildingBuildingName write FBuildingBuildingName;
    property BuildingAlarmState : integer read FBuildingAlarmState write SetBuildingAlarmState; // 0.Event Clear,1.Event,2.View Event,3.View + Sound
    property BuildingSecurityMode : integer read FBuildingSecurityMode write SetBuildingSecurityMode; // 1.��ü����,2.�κа��,3.��ü���
  published
    property OnBuildingAlarmStateChange : TBuildingSecurityModeChange read FOnBuildingAlarmStateChange write FOnBuildingAlarmStateChange;
    property OnBuildingSecurityModeChange : TBuildingSecurityModeChange read FOnBuildingSecurityModeChange write FOnBuildingSecurityModeChange;
  End;

  TMonitoringDevice = Class(TComponent)
  private
    ArmAreaList : TStringList;
    DoorList : TStringList;
    procedure ArmAreaCurrentAlarmStateChange(Sender: TObject;  aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(Sender: TObject;  aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure DoorChangeEvent(Sender: TObject;  aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
  private
    FEcuID: string;
    FEcuName: string;
    FNode: TMonitoringNode;
    FDeviceConnected: string;
    FServerRcv: string;
    FNodeNo: string;
    FOnDeviceChangeEvent: TDeviceChangeEvent;
    FOnDoorChangeEvent: TDoorChangeEvent;
    FOnArmAreaSecurityModeChange: TArmAreaSecurityModeChange;
    FOnArmAreaCurrentAlarmStateChange: TArmAreaSecurityModeChange;
    procedure SetDeviceConnected(const Value: string);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure DeviceStateCheck;
    procedure DeviceStateReSend;
    procedure NodeToArmAreaEventAllClear;

    function GetDeviceToDoorName(aDoorNo:string):string;
    function GetArmAreaState(aCmd:integer;aArmArea:string):string;
  public
    procedure SetArmArea_Add(aArmAreaNo,aArmAreaName:string);
    procedure SetArmArea_BuildingSetting(aArmAreaNo, aBuildingCode:string);
    procedure SetDoor_Add(aDoorNo,aDoorName:string);
    procedure SetDoor_BuildingSetting(aDoorNo,aBuildingCode:string);
    procedure SetDoor_LockTypeSetting(aDoorNo, aLockType:string);
  public
    procedure RcvNodeToAlarmEventProcess(aExtendID,aCmd, aMsgNo,aTime, aSubCLass, aSubAddr,
              aArmAreaNo, aMode, aAlarmStateCode, aLoop,aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
              aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor:string;aServer:Boolean = False);
    procedure RcvNodeToArmAreaStateProcess(aArmAreaNo,aArmAreaFormatLength:integer;aArmAreaStateData:string);
    procedure RcvNodeToDoorStateChangeProcess(aDoorNo,aCardMode,aDoorMode,aDoorState,aLockState,aDoorFire:string);
    procedure RcvNodeToDoorStateProcess(aDoorNo,aDoorFormatLength:integer;aDoorStateData:string);
  published
    property Node : TMonitoringNode read FNode write FNode;
    property NodeNo : string read FNodeNo write FNodeNo;
    property ECUID : string read FEcuID write FEcuID;
    property ECUNAME : string read FEcuName write FEcuName;
  published
    //������
    property DeviceConnected : string read FDeviceConnected write SetDeviceConnected; //'1' �������,'0' ��������
    property ServerRcv : string read FServerRcv write FServerRcv;
  published
    property OnArmAreaCurrentAlarmStateChange : TArmAreaSecurityModeChange read FOnArmAreaCurrentAlarmStateChange write FOnArmAreaCurrentAlarmStateChange;
    property OnArmAreaSecurityModeChange : TArmAreaSecurityModeChange read FOnArmAreaSecurityModeChange write FOnArmAreaSecurityModeChange;
    property OnDeviceChangeEvent : TDeviceChangeEvent read FOnDeviceChangeEvent write FOnDeviceChangeEvent;
    property OnDoorChangeEvent : TDoorChangeEvent read FOnDoorChangeEvent write FOnDoorChangeEvent;
  End;

  TMonitoringArmArea = Class(TComponent)
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    FDevice: TMonitoringDevice;
    FArmAreaName: string;
    FArmAreaNo: string;
    FEcuID: string;
    FNodeNo: string;
    FBuildingCode: string;
    FArmAreaCurrentSecurityMode: string;
    FArmAreaCurrentAlarmState: string;
    FOnArmAreaSecurityModeChange: TArmAreaSecurityModeChange;
    FOnArmAreaCurrentAlarmStateChange: TArmAreaSecurityModeChange;
    procedure SetArmAreaCurrentSecurityMode(const Value: string);
    procedure SetArmAreaCurrentAlarmState(const Value: string);
  public
  published
    property Device : TMonitoringDevice read FDevice write FDevice;
    property NodeNo : string read FNodeNo write FNodeNo;
    property EcuID : string read FEcuID write FEcuID;
    property ArmAreaNo : string read FArmAreaNo write FArmAreaNo;
    property ArmAreaName : string read FArmAreaName write FArmAreaName;
    property BuildingCode : string read FBuildingCode write FBuildingCode;
  published
    //������� ���°�
    property ArmAreaCurrentAlarmState : string read FArmAreaCurrentAlarmState write SetArmAreaCurrentAlarmState;          //�˶��߻����� '0'.Clear,'1'.�̺�Ʈ �߻�,'2'.View �̺�Ʈ �߻�,'3'.Sound Event �߻�
    property ArmAreaCurrentSecurityMode : string read FArmAreaCurrentSecurityMode write SetArmAreaCurrentSecurityMode; //��豸�� ���Ȼ���
  published  //�̺�Ʈ �߻�
    property OnArmAreaCurrentAlarmStateChange : TArmAreaSecurityModeChange read FOnArmAreaCurrentAlarmStateChange write FOnArmAreaCurrentAlarmStateChange;
    property OnArmAreaSecurityModeChange : TArmAreaSecurityModeChange read FOnArmAreaSecurityModeChange write FOnArmAreaSecurityModeChange;
  End;

  TMonitoringDoor = Class(TComponent)
  private
    FDoorName: string;
    FDoorNo: string;
    FDevice: TMonitoringDevice;
    FEcuID: string;
    FNodeNo: string;
    FBuildingCode: string;
    FLOCKTYPE: string;
    FCARDMODE: string;
    FDOORMODE: string;
    FDoorCurrentDSState: string;
    FDoorCurrentLSState: string;
    FDoorFireEvent: string;
    FOnDoorChangeEvent: TDoorChangeEvent;
    procedure SetCARDMODE(const Value: string);
    procedure SetDOORMODE(const Value: string);
    procedure SetDoorCurrentDSState(const Value: string);
    procedure SetDoorCurrentLSState(const Value: string);
    procedure SetDoorFireEvent(const Value: string);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
  published
    property Device : TMonitoringDevice read FDevice write FDevice;
    property NodeNo : string read FNodeNo write FNodeNo;
    property EcuID : string read FEcuID write FEcuID;
    property DoorNo : string read FDoorNo write FDoorNo;
    property DoorName : string read FDoorName write FDoorName;
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property LOCKTYPE : string read FLOCKTYPE write FLOCKTYPE;
  published
    //���Թ� ����
    property CARDMODE : string read FCARDMODE write SetCARDMODE;   //'0'.Posi,'1'.Nega
    property DOORMODE : string read FDOORMODE write SetDOORMODE;   //'0'.����,'1'.������,'2'.�����
    property DoorCurrentDSState : string read FDoorCurrentDSState write SetDoorCurrentDSState; //���� ���Թ� ����(O),����(C) ����
    property DoorCurrentLSState : string read FDoorCurrentLSState write SetDoorCurrentLSState; //���� ���Թ� ���/���� ���� - �̻��
    property DoorFireEvent : string read FDoorFireEvent write SetDoorFireEvent; //���Թ� ȭ�� �߻� ����
  published
    property OnDoorChangeEvent : TDoorChangeEvent read FOnDoorChangeEvent write FOnDoorChangeEvent;
  End;

  TDataModule2 = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation
uses
  uCommonVariable,
  uCommonFunction,
  uFormVariable,
  uPCClient;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TMonitoringNode }

procedure TMonitoringNode.ArmAreaCurrentAlarmStateChange(Sender: TObject;
  aNodeNo, aEcuID, aArmAreaNo, aAlarmState, aBuildingCode: string);
begin
  if Assigned(FOnArmAreaCurrentAlarmStateChange) then
  begin
    OnArmAreaCurrentAlarmStateChange(Self,aNodeNo,aEcuID,aArmAreaNo, aAlarmState,aBuildingCode);
  end;

end;

procedure TMonitoringNode.ArmAreaSecurityModeChange(Sender: TObject; aNodeNo,
  aEcuID, aArmAreaNo, aMode,aBuildingCode: string);
begin
  if Assigned(FOnArmAreaSecurityModeChange) then
  begin
    OnArmAreaSecurityModeChange(Self,aNodeNo,aEcuID,aArmAreaNo, aMode,aBuildingCode);
  end;
end;

constructor TMonitoringNode.Create(AOwner: TComponent);
begin
  inherited;
  DeviceList := TStringList.Create;
  NodeConnected := '0';
  ServerRcv := 'N';
end;

destructor TMonitoringNode.Destroy;
var
  i : integer;
begin
  for i := DeviceList.Count - 1 downto 0 do
  begin
    TMonitoringDevice(DeviceList.Objects[i]).Free;
  end;
  DeviceList.Free;
  inherited;
end;

procedure TMonitoringNode.DeviceSort;
begin
  DeviceList.Sort;
end;

procedure TMonitoringNode.DeviceStateReSend;
var
  i : integer;
begin
  ServerRcv := 'N';
  L_bDeviceConnectRCV := False;
  for i := DeviceList.Count - 1 downto 0 do
  begin
    TMonitoringDevice(DeviceList.Objects[i]).DeviceStateReSend;
  end;

end;

procedure TMonitoringNode.DoorChangeEvent(Sender: TObject; aNodeNo, aEcuID,
  aType, aNo, aCmd, aData,aBuildingCode: string);
begin
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode);
  end;
end;

function TMonitoringNode.GetArmAreaState(aCmd: integer; aECUID,
  aArmArea: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[nIndex]).GetArmAreaState(aCmd,aArmArea);
end;

function TMonitoringNode.GetDeviceConnect(aEcuID: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[nIndex]).DeviceConnected;
end;

function TMonitoringNode.GetDeviceCount: integer;
begin
  result := DeviceList.Count;
end;

function TMonitoringNode.GetDeviceIndexName(aIndex: integer; var aEcuID,
  aEcuName: string): Boolean;
begin
  result := False;
  if aIndex > DeviceList.Count - 1 then Exit;
  if aIndex < 0 then Exit;
  aEcuID := TMonitoringDevice(DeviceList.Objects[aIndex]).ECUID;
  aEcuName := TMonitoringDevice(DeviceList.Objects[aIndex]).ECUNAME;
  result := True;
end;

function TMonitoringNode.GetDeviceToDoorName(aEcuID, aDoorNo: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[nIndex]).GetDeviceToDoorName(aDoorNo);

end;

procedure TMonitoringNode.NodeConnectedCheck;
var
  i : integer;
  nConnectedCount : integer;
  nDisConnectedCount : integer;
begin
  //��Ʈ�ѷ� ������¸� Ȯ�� �Ͽ� ����� ������¸� ��������.

  nConnectedCount := 0;
  nDisConnectedCount := 0;
  for i := 0 to DeviceList.Count - 1 do
  begin
    if TMonitoringDevice(DeviceList.Objects[i]).DeviceConnected = '1' then nConnectedCount := nConnectedCount + 1
    else nDisConnectedCount := nDisConnectedCount + 1;
  end;
  if nDisConnectedCount = 0 then
  begin
    NodeConnected := '2';
  end else
  begin
    if nConnectedCount > 0 then NodeConnected := '1'
    else NodeConnected := '0';
  end;
end;

procedure TMonitoringNode.NodeStateCheck;
var
  FirstTickCount : double;
  nDelayTime : integer;
  i : integer;
  bCheck : Boolean;
begin
  nDelayTime := 1000;
  if Not L_bDeviceConnectRCV then
  begin
    dmPCClient.SendPacket('S',SCECU,'N',inttostr(NodeNo),'00','');
    FirstTickCount := GetTickCount + nDelayTime;
    while Not L_bDeviceConnectRCV do
    begin
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;
    end;
  end else
  begin
    if L_nCurrentCheckDeviceSeq < 0 then L_nCurrentCheckDeviceSeq := 0;
    if L_nCurrentCheckDeviceSeq > DeviceList.Count - 1 then L_nCurrentCheckDeviceSeq := 0;
    if TMonitoringDevice(DeviceList.Objects[L_nCurrentCheckDeviceSeq]).ServerRcv <> 'Y' then
    begin
      TMonitoringDevice(DeviceList.Objects[L_nCurrentCheckDeviceSeq]).DeviceStateCheck;
    end;
    if L_nCurrentCheckDeviceSeq = DeviceList.Count - 1 then
    begin
      L_nCurrentCheckDeviceSeq := 0;
      bCheck := True;
      for i := 0 to DeviceList.Count - 1 do
        if TMonitoringDevice(DeviceList.Objects[L_nCurrentCheckDeviceSeq]).ServerRcv <> 'Y' then bCheck := False;

      if bCheck then ServerRcv := 'Y';   //Ȯ����� ��� ���¸� �������� ���� ����
    end else
    begin
      L_nCurrentCheckDeviceSeq := L_nCurrentCheckDeviceSeq + 1;
    end;
  end;
end;

procedure TMonitoringNode.NodeToAlarmEventSetting(aEcuID,aExtendID, aCmd, aMsgNo, aTime,
  aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop, aZoneState,
  aOper, aAlarmStateCodeName, aAlarmStatePCCode, aAlarmStatePCCodeName,
  aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor: string);
var
  nIndex : integer;
  stArmAreaData : string;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TMonitoringDevice(DeviceList.Objects[nIndex]).RcvNodeToAlarmEventProcess(aExtendID,aCmd, aMsgNo,aTime, aSubCLass, aSubAddr,
    aArmArea, aMode, aAlarmStateCode, aLoop,aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
    aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor,True);
end;

procedure TMonitoringNode.NodeToArmAreaEventAllClear;
var
  i : integer;
begin
  if DeviceList.Count < 1 then Exit;

  for i := 0 to DeviceList.Count - 1 do
  begin
    TMonitoringDevice(DeviceList.Objects[i]).NodeToArmAreaEventAllClear;
  end;

end;

procedure TMonitoringNode.DeviceChangeEvent(Sender: TObject; aNodeNo, aEcuID,
  aType, aNo, aCmd, aData: string);
begin
  if Assigned(FOnDeviceChangeEvent) then
  begin
    OnDeviceChangeEvent(Self,aNodeNo,aEcuID,aType,aNo,aCmd,aData);
  end;
  if (aType = SCECU) and (aCmd = SCCMDCONNECTED) then
  begin
    NodeConnectedCheck;
  end;
end;

procedure TMonitoringNode.RcvNodeToAlarmEventProcess(aEcuID,aExtendID, aCmd, aMsgNo,
  aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor: string);
var
  nIndex : integer;
  stArmAreaData : string;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TMonitoringDevice(DeviceList.Objects[nIndex]).RcvNodeToAlarmEventProcess(aExtendID,aCmd, aMsgNo,aTime, aSubCLass, aSubAddr,
    aArmArea, aMode, aAlarmStateCode, aLoop,aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
    aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor);
end;

procedure TMonitoringNode.RcvNodeToArmAreaStateProcess(aEcuID: string;
  aArmAreaCount, aArmAreaFormatLength: integer; aArmAreaStateData: string);
var
  i : integer;
  nIndex : integer;
  stArmAreaData : string;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  for i := 0 to aArmAreaCount - 1 do
  begin
    stArmAreaData := copy(aArmAreaStateData,1 + (i * aArmAreaFormatLength),aArmAreaFormatLength);
    TMonitoringDevice(DeviceList.Objects[nIndex]).RcvNodeToArmAreaStateProcess(i,aArmAreaFormatLength,stArmAreaData);
  end;

end;

procedure TMonitoringNode.RcvNodeToDeviceNetworkStateSearchProcess(aData: string);
var
  i : integer;
  nIndex : integer;
begin
  L_bDeviceConnectRCV := True;
  for i := 1 to Length(aData) do
  begin
    nIndex := DeviceList.IndexOf(FillZeroNumber(i - 1,2));
    if nIndex > -1 then
    begin
      TMonitoringDevice(DeviceList.Objects[nIndex]).DeviceConnected := aData[i];
    end;
  end;
end;

procedure TMonitoringNode.RcvNodeToDoorStateChangeProcess(aEcuID,
  aData: string);
var
  stExtendID : string;
  stDoorNo : string;
  stCardMode : string;
  stDoorMode : string;
  stDoorState : string;
  stLockState : string;
  stDoorFire : string;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  if Length(aData) < 8 then Exit;
  stExtendID := aData[1];
  stDoorNo := copy(aData,2,2);
  stCardMode := aData[4];
  stDoorMode := aData[5];
  stDoorState := aData[6];
  stLockState := aData[7];
  stDoorFire := aData[8];
  TMonitoringDevice(DeviceList.Objects[nIndex]).RcvNodeToDoorStateChangeProcess(stDoorNo,stCardMode,stDoorMode,stDoorState,stLockState,stDoorFire);
end;

procedure TMonitoringNode.RcvNodeToDoorStateProcess(aEcuID: string; aDoorCount,
  aDoorFormatLength: integer; aDoorStateData: string);
var
  i : integer;
  nIndex : integer;
  stDoorData : string;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TMonitoringDevice(DeviceList.Objects[nIndex]).ServerRcv := 'Y';
  for i := 0 to aDoorCount - 1 do
  begin
    stDoorData := copy(aDoorStateData,1 + (i * aDoorFormatLength),aDoorFormatLength);
    TMonitoringDevice(DeviceList.Objects[nIndex]).RcvNodeToDoorStateProcess(i+1,aDoorFormatLength,stDoorData);
  end;


end;

procedure TMonitoringNode.RcvNodeToEcuNetworkStateChangeProcess(aEcuID,
  aValue: string);
var
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TMonitoringDevice(DeviceList.Objects[nIndex]).DeviceConnected := aValue;
end;

procedure TMonitoringNode.SetArmArea_Add(aEcuID, aArmAreaNo,aArmAreaName: string);
var
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TMonitoringDevice(DeviceList.Objects[nIndex]).SetArmArea_Add(aArmAreaNo, aArmAreaName);

end;

procedure TMonitoringNode.SetArmArea_BuildingSetting(aEcuID, aArmAreaNo,
  aBuildingCode: string);
var
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TMonitoringDevice(DeviceList.Objects[nIndex]).SetArmArea_BuildingSetting(aArmAreaNo, aBuildingCode);
end;

procedure TMonitoringNode.SetDevice_Add(aEcuID, aEcuName: string);
var
  nIndex : integer;
  oDevice : TMonitoringDevice;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex > -1 then Exit;
  oDevice := TMonitoringDevice.Create(nil);
  oDevice.Node := Self;
  oDevice.NodeNo := inttostr(NodeNo);
  oDevice.ECUID := aEcuID;
  oDevice.ECUNAME := aEcuName;
  oDevice.OnDeviceChangeEvent := DeviceChangeEvent;
  oDevice.OnDoorChangeEvent := DoorChangeEvent;
  oDevice.OnArmAreaCurrentAlarmStateChange := ArmAreaCurrentAlarmStateChange;
  oDevice.OnArmAreaSecurityModeChange := ArmAreaSecurityModeChange;
  DeviceList.AddObject(aEcuID,oDevice);
end;

procedure TMonitoringNode.SetDoor_Add(aEcuID, aDoorNo, aDoorName: string);
var
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TMonitoringDevice(DeviceList.Objects[nIndex]).SetDoor_Add(aDoorNo, aDoorName);
end;

procedure TMonitoringNode.SetDoor_BuildingSetting(aEcuID, aDoorNo,
  aBuildingCode: string);
var
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TMonitoringDevice(DeviceList.Objects[nIndex]).SetDoor_BuildingSetting(aDoorNo, aBuildingCode);
end;

procedure TMonitoringNode.SetDoor_LockTypeSetting(aEcuID, aDoorNo,
  aLockType: string);
var
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TMonitoringDevice(DeviceList.Objects[nIndex]).SetDoor_LockTypeSetting(aDoorNo, aLockType);
end;

procedure TMonitoringNode.SetNodeConnected(const Value: string);
var
  i : integer;
begin
  if FNodeConnected = Value then Exit;
  FNodeConnected := Value;
  if Assigned(FOnNodeChangeEvent) then
  begin
    OnNodeChangeEvent(Self,inttostr(NodeNo),'00',SCNODE,'0',SCCMDCONNECTED,Value);
  end;
  if Value = '0' then
  begin
    for i := DeviceList.Count - 1 downto 0 do
    begin
      TMonitoringDevice(DeviceList.Objects[i]).DeviceConnected := '0';
    end;
    ServerRcv := 'N';
    L_bDeviceConnectRCV := False;
  end;
end;

{ TMonitoringDevice }

procedure TMonitoringDevice.ArmAreaCurrentAlarmStateChange(Sender: TObject;
  aNodeNo, aEcuID, aArmAreaNo, aAlarmState, aBuildingCode: string);
begin
  if Assigned(FOnArmAreaCurrentAlarmStateChange) then
  begin
    OnArmAreaCurrentAlarmStateChange(Self,aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode);
  end;
end;

procedure TMonitoringDevice.ArmAreaSecurityModeChange(Sender: TObject; aNodeNo,
  aEcuID, aArmAreaNo, aMode,aBuildingCode: string);
begin
  if Assigned(FOnArmAreaSecurityModeChange) then
  begin
    OnArmAreaSecurityModeChange(Self,aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode);
  end;
end;

constructor TMonitoringDevice.Create(AOwner: TComponent);
begin
  inherited;
  ArmAreaList := TStringList.Create;
  DoorList := TStringList.Create;
  DeviceConnected := '0';
end;

destructor TMonitoringDevice.Destroy;
var
  i : integer;
begin
  for I := ArmAreaList.Count - 1 downto 0 do
  begin
    TMonitoringArmArea(ArmAreaList.Objects[i]).Free;
  end;
  ArmAreaList.Free;

  for I := DoorList.Count - 1 downto 0 do
  begin
    TMonitoringDoor(DoorList.Objects[i]).Free;
  end;
  DoorList.Free;
  inherited;
end;

procedure TMonitoringDevice.DeviceStateCheck;
var
  FirstTickCount : double;
  nDelayTime : integer;
  i : integer;
  bCheck : Boolean;
begin
  nDelayTime := 1000;
  dmPCClient.SendPacket('S',SCECU,'s',NodeNo,ECUID,'');
  FirstTickCount := GetTickCount + nDelayTime;
  while ServerRcv <> 'Y' do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;
  end;
end;

procedure TMonitoringDevice.DeviceStateReSend;
begin
  ServerRcv := 'N';
end;

procedure TMonitoringDevice.DoorChangeEvent(Sender: TObject; aNodeNo, aEcuID,
  aType, aNo, aCmd, aData,aBuildingCode: string);
begin
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode);
  end;
end;

function TMonitoringDevice.GetArmAreaState(aCmd: integer;
  aArmArea: string): string;
var
  nIndex : integer;
begin
  result := '';
  aArmArea := inttostr(strtoint(aArmArea));
  nIndex := ArmAreaList.IndexOf(aArmArea);
  if nIndex < 0 then Exit;
  case aCmd of
    con_CMDArmAreaArmMode : begin
      result := TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentSecurityMode;
    end;
    con_CMDArmAreaName : begin
      result := TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaName;
    end;
    con_CMDArmAreaUsed : begin  //��ϵǾ� ������ ��� �ϴ� ����
      result := '1';
    end;
  end;

end;

function TMonitoringDevice.GetDeviceToDoorName(aDoorNo: string): string;
var
  nIndex : integer;
begin
  result := '';
  aDoorNo := inttostr(strtoint(aDoorNo));
  nIndex := DoorList.IndexOf(aDoorNo);
  if nIndex < 0 then Exit;
  result := TMonitoringDoor(DoorList.Objects[nIndex]).DoorName;
end;

procedure TMonitoringDevice.NodeToArmAreaEventAllClear;
var
  i : integer;
begin
  if ArmAreaList.Count < 1 then Exit;

  for i := 0 to ArmAreaList.Count - 1 do
  begin
    TMonitoringArmArea(ArmAreaList.Objects[i]).ArmAreaCurrentAlarmState := '0';
  end;

end;

procedure TMonitoringDevice.RcvNodeToAlarmEventProcess(aExtendID,aCmd, aMsgNo, aTime,
  aSubCLass, aSubAddr, aArmAreaNo, aMode, aAlarmStateCode, aLoop, aZoneState,
  aOper, aAlarmStateCodeName, aAlarmStatePCCode, aAlarmStatePCCodeName,aArmModeChange,
  aAlarmView, aAlarmSound, aAlarmColor: string;aServer:Boolean = False);
var
  nIndex : integer;
begin
  if Not isDigit(aArmAreaNo) then Exit;

  nIndex := ArmAreaList.IndexOf(inttostr(strtoint(aArmAreaNo)));
  if nIndex < 0 then Exit;
  if Not aServer then TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentSecurityMode := aMode[1];

  if aCmd <> 'A' then Exit;  //�̺�Ʈ�� �ƴϸ� ó�� ���� ����.
  if aArmModeChange = '1' then Exit; //��庯�� ������ �̸� �̺�Ʈ �߻� ��Ű�� ����.


  if (aAlarmView = '1') and (aAlarmSound = '1') then
  begin
    TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentAlarmState := '3'
  end else if aAlarmView = '1' then
  begin
    if TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentAlarmState <> '3' then
       TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentAlarmState := '2';
  end else
  begin
    if (TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentAlarmState <> '3') and (TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentAlarmState <> '2')  then
        TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentAlarmState := '1';
  end;

end;

procedure TMonitoringDevice.RcvNodeToArmAreaStateProcess(aArmAreaNo,
  aArmAreaFormatLength: integer; aArmAreaStateData: string);
var
  nIndex : integer;
begin
  nIndex := ArmAreaList.IndexOf(inttostr(aArmAreaNo));
  if nIndex < 0 then Exit;
  if Length(aArmAreaStateData) < aArmAreaFormatLength  then Exit;
  if aArmAreaFormatLength < 1 then Exit;
  TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentSecurityMode := aArmAreaStateData[1];

end;

procedure TMonitoringDevice.RcvNodeToDoorStateChangeProcess(aDoorNo, aCardMode,
  aDoorMode, aDoorState, aLockState, aDoorFire: string);
var
  nIndex : integer;
begin
  aDoorNo := inttostr(strtoint(aDoorNo));
  nIndex := DoorList.IndexOf(aDoorNO);
  if nIndex < 0 then Exit;
  TMonitoringDoor(DoorList.Objects[nIndex]).CARDMODE := aCardMode;
  TMonitoringDoor(DoorList.Objects[nIndex]).DOORMODE := aDoorMode;
  TMonitoringDoor(DoorList.Objects[nIndex]).DoorCurrentDSState := aDoorState;
  TMonitoringDoor(DoorList.Objects[nIndex]).DoorCurrentLSState := aLockState;
  TMonitoringDoor(DoorList.Objects[nIndex]).DoorFireEvent := aDoorFire;

end;

procedure TMonitoringDevice.RcvNodeToDoorStateProcess(aDoorNo,aDoorFormatLength: integer;
  aDoorStateData: string);
var
  nIndex : integer;
begin
  nIndex := DoorList.IndexOf(inttostr(aDoorNO));
  if nIndex < 0 then Exit;
  if Length(aDoorStateData) < aDoorFormatLength  then Exit;
  TMonitoringDoor(DoorList.Objects[nIndex]).CARDMODE := aDoorStateData[1];
  if aDoorFormatLength < 2 then Exit;
  TMonitoringDoor(DoorList.Objects[nIndex]).DOORMODE := aDoorStateData[2];
  if aDoorFormatLength < 3 then Exit;
  TMonitoringDoor(DoorList.Objects[nIndex]).DoorCurrentDSState := aDoorStateData[3];
  if aDoorFormatLength < 4 then Exit;
  TMonitoringDoor(DoorList.Objects[nIndex]).DoorCurrentLSState := aDoorStateData[4];
  if aDoorFormatLength < 5 then Exit;
  TMonitoringDoor(DoorList.Objects[nIndex]).DoorFireEvent := aDoorStateData[5];
end;

procedure TMonitoringDevice.SetArmArea_Add(aArmAreaNo, aArmAreaName: string);
var
  nIndex : integer;
  oArmArea : TMonitoringArmArea;
begin
  nIndex := ArmAreaList.IndexOf(aArmAreaNo);
  if nIndex > -1 then Exit;
  oArmArea := TMonitoringArmArea.Create(nil);
  oArmArea.Device := Self;
  oArmArea.NodeNo := inttostr(Node.NodeNo);
  oArmArea.EcuID := EcuID;
  oArmArea.ArmAreaNo := aArmAreaNo;
  oArmArea.ArmAreaName := aArmAreaName;
  oArmArea.OnArmAreaCurrentAlarmStateChange := ArmAreaCurrentAlarmStateChange;
  oArmArea.OnArmAreaSecurityModeChange := ArmAreaSecurityModeChange;

  ArmAreaList.AddObject(aArmAreaNo,oArmArea);
end;

procedure TMonitoringDevice.SetArmArea_BuildingSetting(aArmAreaNo,
  aBuildingCode: string);
var
  nIndex : integer;
begin
  nIndex := ArmAreaList.IndexOf(aArmAreaNo);
  if nIndex < 0 then Exit;
  TMonitoringArmArea(ArmAreaList.Objects[nIndex]).BuildingCode := aBuildingCode;
end;

procedure TMonitoringDevice.SetDeviceConnected(const Value: string);
var
  i : integer;
begin
  if FDeviceConnected = Value then Exit;
  FDeviceConnected := Value;
  if Assigned(FOnDeviceChangeEvent) then
  begin
    OnDeviceChangeEvent(Self,NodeNo,ECUID,SCECU,'0',SCCMDCONNECTED,Value);
  end;
  if Value = '1' then Exit;
  ServerRcv := 'N';

  for i := ArmAreaList.Count - 1 downto 0 do
  begin
    TMonitoringArmArea(ArmAreaList.Objects[i]).ArmAreaCurrentAlarmState := '*';
    TMonitoringArmArea(ArmAreaList.Objects[i]).ArmAreaCurrentSecurityMode := '*';
  end;

  for i := DoorList.Count - 1 downto 0 do
  begin
    TMonitoringDoor(DoorList.Objects[i]).CARDMODE := '*';
    TMonitoringDoor(DoorList.Objects[i]).DOORMODE := '*';
    TMonitoringDoor(DoorList.Objects[i]).DoorCurrentDSState := '*';
    TMonitoringDoor(DoorList.Objects[i]).DoorCurrentLSState := '*';
    TMonitoringDoor(DoorList.Objects[i]).DoorFireEvent := '*';
  end;

end;

procedure TMonitoringDevice.SetDoor_Add(aDoorNo, aDoorName: string);
var
  nIndex : integer;
  oDoor : TMonitoringDoor;
begin
  nIndex := DoorList.IndexOf(aDoorNo);
  if nIndex > -1 then Exit;
  oDoor := TMonitoringDoor.Create(nil);
  oDoor.Device := Self;
  oDoor.NodeNo := FillZeroNumber(TMonitoringNode(Node).NodeNo,G_nNodeCodeLength);
  oDoor.EcuID := EcuID;
  oDoor.DoorNo := aDoorNo;
  oDoor.DoorName := aDoorName;
  oDoor.OnDoorChangeEvent := DoorChangeEvent;
  DoorList.AddObject(aDoorNo,oDoor);
end;

procedure TMonitoringDevice.SetDoor_BuildingSetting(aDoorNo, aBuildingCode: string);
var
  nIndex : integer;
  oDoor : TMonitoringDoor;
begin
  nIndex := DoorList.IndexOf(aDoorNo);
  if nIndex < 0 then Exit;
  TMonitoringDoor(DoorList.Objects[nIndex]).BuildingCode := aBuildingCode;
end;

procedure TMonitoringDevice.SetDoor_LockTypeSetting(aDoorNo, aLockType: string);
var
  nIndex : integer;
  oDoor : TMonitoringDoor;
begin
  nIndex := DoorList.IndexOf(aDoorNo);
  if nIndex < 0 then Exit;
  TMonitoringDoor(DoorList.Objects[nIndex]).LOCKTYPE := aLockType;
end;

{ TMonitoringArmArea }

constructor TMonitoringArmArea.Create(AOwner: TComponent);
begin
  inherited;
  Device := nil;
  ArmAreaCurrentSecurityMode := '';
end;

destructor TMonitoringArmArea.Destroy;
begin

  inherited;
end;

procedure TMonitoringArmArea.SetArmAreaCurrentAlarmState(const Value: string);
begin
  if FArmAreaCurrentAlarmState = Value then Exit;
  (*if isDigit(FArmAreaCurrentAlarmState) and isDigit(Value) then //�˶� Ȯ�� �� �̺�Ʈ �� ���
  begin
    if strtoint(Value) < strtoint(FArmAreaCurrentAlarmState) then Exit;
  end;*)

  FArmAreaCurrentAlarmState := Value;
  if Assigned(FOnArmAreaCurrentAlarmStateChange) then
  begin
    OnArmAreaCurrentAlarmStateChange(Self,NodeNo,ECUID,ArmAreaNo,Value,BuildingCode);
  end;
end;

procedure TMonitoringArmArea.SetArmAreaCurrentSecurityMode(
  const Value: string);
begin
  if FArmAreaCurrentSecurityMode = Value then Exit;

  FArmAreaCurrentSecurityMode := Value;
  if Assigned(FOnArmAreaSecurityModeChange) then
  begin
    OnArmAreaSecurityModeChange(Self,NodeNo,ECUID,ArmAreaNo,Value,BuildingCode);
  end;

end;

{ TMonitoringDoor }

constructor TMonitoringDoor.Create(AOwner: TComponent);
begin
  inherited;
  Device := nil;
  CARDMODE := '';
  DOORMODE := '';
  DoorCurrentDSState := '';
  DoorCurrentLSState := '';
  DoorFireEvent := '';
end;

destructor TMonitoringDoor.Destroy;
begin

  inherited;
end;


procedure TMonitoringDoor.SetCARDMODE(const Value: string);
begin
  if FCARDMODE = Value then Exit;   //'0'.Posi,'1'.Nega
  FCARDMODE := Value;
  //�̺�Ʈ �߻� ��Ŵ
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,NodeNo,EcuID,SCDOOR,DoorNo,SCCMDDOORCARDMODE,Value,BuildingCode);
  end;
end;

procedure TMonitoringDoor.SetDoorCurrentLSState(const Value: string);
begin
  if FDoorCurrentLSState = Value then Exit;

  FDoorCurrentLSState := Value;
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,NodeNo,EcuID,SCDOOR,DoorNo,SCCMDDOORLSSTATE,Value,BuildingCode);
  end;
end;

procedure TMonitoringDoor.SetDoorFireEvent(const Value: string);
begin
  if FDoorFireEvent = Value then Exit;

  FDoorFireEvent := Value;
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,NodeNo,EcuID,SCDOOR,DoorNo,SCCMDDOORFIREEVENT,Value,BuildingCode);
  end;
end;

procedure TMonitoringDoor.SetDoorCurrentDSState(const Value: string);
begin
  if FDoorCurrentDSState = Value then Exit;
  FDoorCurrentDSState := Value;
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,NodeNo,EcuID,SCDOOR,DoorNo,SCCMDDOORDSSTATE,Value,BuildingCode);
  end;
end;

procedure TMonitoringDoor.SetDOORMODE(const Value: string);
begin
  if FDOORMODE = Value then Exit;  //'0'.����,'1'.������,'2'.�����
  FDOORMODE := Value;
  //�̺�Ʈ �߻� ��Ŵ
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,NodeNo,EcuID,SCDOOR,DoorNo,SCCMDDOORMANAGEMODE,Value,BuildingCode);
  end;
end;

{ TMonitoringBuildingState }

procedure TMonitoringBuildingState.ArmAreaCurrentAlarmStateChange(
  Sender: TObject; aNodeNo, aEcuID, aArmAreaNo, aAlarmState,
  aBuildingCode: string);
var
  i : integer;
  nArmState : integer;
begin
  nArmState := 0;
  for i := 0 to ArmAreaList.Count - 1 do
  begin
    if TMonitoringArmArea(ArmAreaList.Objects[i]).ArmAreaCurrentAlarmState <> '' then
    begin
      case TMonitoringArmArea(ArmAreaList.Objects[i]).ArmAreaCurrentAlarmState[1] of
        '1' : begin
          if nArmState < 1 then  nArmState := 1;
        end;
        '2' : begin
          if nArmState < 2 then  nArmState := 2;
        end;
        '3' : begin
          if nArmState < 3 then  nArmState := 3;
        end;
      end;
    end;
  end;
  BuildingAlarmState := nArmState;
end;

procedure TMonitoringBuildingState.ArmAreaSecurityModeChange(Sender: TObject;
  aNodeNo, aEcuID, aArmAreaNo, aMode, aBuildingCode: string);
var
  i : integer;
  nArmCount : integer;
  nDisArmCount : integer;
begin
  nArmCount := 0;
  nDisArmCount := 0;
  for i := 0 to ArmAreaList.Count - 1 do
  begin
    if TMonitoringArmArea(ArmAreaList.Objects[i]).ArmAreaCurrentSecurityMode = 'A' then nArmCount := nArmCount + 1
    else nDisArmCount := nDisArmCount + 1;
  end;
  if nArmCount = 0 then BuildingSecurityMode := 1         //��ü ����
  else if nDisArmCount > 0 then BuildingSecurityMode := 2 //�κ� ���
  else BuildingSecurityMode := 3;                         //��ü ���

end;

constructor TMonitoringBuildingState.Create(AOwner: TComponent);
begin
  inherited;
  DeviceList := TStringList.Create;
  DoorList := TStringList.Create;
  ArmAreaList := TStringList.Create;

end;

destructor TMonitoringBuildingState.Destroy;
var
  i : integer;
begin
  DeviceList.Free;
  for i := DoorList.Count - 1 downto 0 do
  begin
    TMonitoringDoor(DoorList.Objects[i]).Free;
  end;
  DoorList.Free;
  for i := ArmAreaList.Count - 1 downto 0 do
  begin
    TMonitoringArmArea(ArmAreaList.Objects[i]).Free;
  end;
  ArmAreaList.Free;
  inherited;
  inherited;
end;

procedure TMonitoringBuildingState.DoorChangeEvent(aNodeNo, aEcuID, aType, aNo,
  aCmd, aData: string);
var
  nIndex : integer;
  stDoorID : string;
begin
  stDoorID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aNo;
  nIndex := DoorList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  if aType <> SCDOOR then Exit;  //Door Type�� �ƴϸ� ó�� ���� ����... �ٵ� �̷��� ������ �ȵ�
  case aCmd[1] of
    SCCMDDOORCARDMODE : TMonitoringDoor(DoorList.Objects[nIndex]).CARDMODE := aData;
    SCCMDDOORMANAGEMODE : TMonitoringDoor(DoorList.Objects[nIndex]).DOORMODE := aData;
    SCCMDDOORDSSTATE : TMonitoringDoor(DoorList.Objects[nIndex]).DoorCurrentDSState := aData;
    SCCMDDOORLSSTATE : TMonitoringDoor(DoorList.Objects[nIndex]).DoorCurrentLSState := aData;
    SCCMDDOORFIREEVENT : TMonitoringDoor(DoorList.Objects[nIndex]).DoorFireEvent := aData;
  end;
end;

function TMonitoringBuildingState.GetArmAreaCount: integer;
begin
  result := ArmAreaList.Count;
end;

function TMonitoringBuildingState.GetArmAreaDeviceArmAreaState(aNodeNo, aEcuID,
  aArmArea: string): integer;
var
  stArmAreaID : string;
  nIndex : integer;
begin
  result := 0;
  stArmAreaID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmArea;
  nIndex := ArmAreaList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;

  Try
    if isDigit( TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentAlarmState ) then
      result := strtoint(TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentAlarmState);
  Except
    Exit;
  End;
end;

function TMonitoringBuildingState.GetArmAreaDeviceSecurityMode(aNodeNo, aEcuID,
  aArmArea: string): String;
var
  stArmAreaID : string;
  nIndex : integer;
begin
  result := '';
  stArmAreaID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmArea;
  nIndex := ArmAreaList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  Try
    result := TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentSecurityMode;
  Except
    Exit;
  End;
end;

function TMonitoringBuildingState.GetArmAreaIndexArmAreaState(
  aArmAreaIndex: integer): integer;
begin
  result := 0;
  if aArmAreaIndex > ArmAreaList.Count - 1 then  Exit;
  Try
    if isDigit( TMonitoringArmArea(ArmAreaList.Objects[aArmAreaIndex]).ArmAreaCurrentAlarmState ) then
      result := strtoint(TMonitoringArmArea(ArmAreaList.Objects[aArmAreaIndex]).ArmAreaCurrentAlarmState);
  Except
    Exit;
  End;
end;

function TMonitoringBuildingState.GetArmAreaIndexDevieInfo(
  aArmAreaIndex: integer;var aNodeNo, aEcuID,aArmAreaNo,
  aArmAreaName: string): Boolean;
begin
  result := False;
  if aArmAreaIndex > ArmAreaList.Count - 1 then  Exit;
  aNodeNo := TMonitoringArmArea(ArmAreaList.Objects[aArmAreaIndex]).NodeNo;
  aEcuID := TMonitoringArmArea(ArmAreaList.Objects[aArmAreaIndex]).EcuID;
  aArmAreaNo := TMonitoringArmArea(ArmAreaList.Objects[aArmAreaIndex]).ArmAreaNo;
  aArmAreaName := TMonitoringArmArea(ArmAreaList.Objects[aArmAreaIndex]).ArmAreaName;
  result := True;
end;

function TMonitoringBuildingState.GetArmAreaIndexSecurityMode(
  aArmAreaIndex: integer): String;
begin
  result := '';
  if aArmAreaIndex > ArmAreaList.Count - 1 then  Exit;
  result := TMonitoringArmArea(ArmAreaList.Objects[aArmAreaIndex]).ArmAreaCurrentSecurityMode;
end;

function TMonitoringBuildingState.GetDoorCount: integer;
begin
  result := DoorList.Count;
end;

function TMonitoringBuildingState.GetDoorCurrentState(aNodeNo, aEcuID, aDoorNo:string;
  var aDoorCardMode, aDoorManageMode, aDoorDSState, aDoorLSState,
  aDoorFireEvent: string): Boolean;
var
  nIndex : integer;
  stDoorID : string;
begin
  result := False;
  stDoorID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aDoorNo;
  nIndex := DoorList.IndexOf(stDoorID);
  if nIndex < 0 then  Exit;
  aDoorCardMode := TMonitoringDoor(DoorList.Objects[nIndex]).CARDMODE;
  aDoorManageMode := TMonitoringDoor(DoorList.Objects[nIndex]).DOORMODE;
  aDoorDSState := TMonitoringDoor(DoorList.Objects[nIndex]).DoorCurrentDSState;
  aDoorLSState := TMonitoringDoor(DoorList.Objects[nIndex]).DoorCurrentLSState;
  aDoorFireEvent := TMonitoringDoor(DoorList.Objects[nIndex]).DoorFireEvent;
  result := True;
end;

function TMonitoringBuildingState.GetDoorIndexCurrentState(aDoorIndex: integer;
  var aDoorCardMode, aDoorManageMode, aDoorDSState, aDoorLSState,
  aDoorFireEvent: string): Boolean;
begin
  result := False;
  if aDoorIndex > DoorList.Count - 1 then  Exit;
  aDoorCardMode := TMonitoringDoor(DoorList.Objects[aDoorIndex]).CARDMODE;
  aDoorManageMode := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DOORMODE;
  aDoorDSState := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DoorCurrentDSState;
  aDoorLSState := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DoorCurrentLSState;
  aDoorFireEvent := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DoorFireEvent;
  result := True;
end;

function TMonitoringBuildingState.GetDoorIndexDevieInfo(aDoorIndex: integer;
  var aNodeNo, aEcuID, aDoorNo, aDoorName: string): Boolean;
begin
  result := False;
  if aDoorIndex > DoorList.Count - 1 then  Exit;
  aNodeNo := TMonitoringDoor(DoorList.Objects[aDoorIndex]).NodeNo;
  aEcuID := TMonitoringDoor(DoorList.Objects[aDoorIndex]).EcuID;
  aDoorNo := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DoorNo;
  aDoorName := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DoorName;
  result := True;
end;

function TMonitoringBuildingState.GetDoorIndexLockType(aDoorIndex: integer): string;
begin
  result := '';
  if aDoorIndex > DoorList.Count - 1 then  Exit;
  result := TMonitoringDoor(DoorList.Objects[aDoorIndex]).LOCKTYPE;
end;

function TMonitoringBuildingState.GetDoorName(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  nIndex : integer;
  stDoorID : string;
begin
  result := '';
  stDoorID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + inttostr(strtoint(aDoorNo));
  nIndex := DoorList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  result := TMonitoringDoor(DoorList.Objects[nIndex]).DoorName;
end;

procedure TMonitoringBuildingState.SetArmAreaAlarmStateChange(aNodeNo, aEcuID,
  aArmAreaNo, aAlarmState: string);
var
  stArmAreaID : string;
  nIndex : integer;
begin
  stArmAreaID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := ArmAreaList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentAlarmState := aAlarmState;
end;

procedure TMonitoringBuildingState.SetArmAreaSecurityModeChange(aNodeNo, aEcuID,
  aArmAreaNo, aMode: string);
var
  stArmAreaID : string;
  nIndex : integer;
begin
  stArmAreaID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := ArmAreaList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentSecurityMode := aMode;
end;

procedure TMonitoringBuildingState.SetArmArea_Add(aNodeNo, aEcuID, aArmAreaNo,
  aArmAreaName: string);
var
  nIndex : integer;
  oArmArea : TMonitoringArmArea;
  stArmAreaID : string;
begin
  stArmAreaID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := ArmAreaList.IndexOf(stArmAreaID);
  if nIndex > -1 then Exit;
  oArmArea := TMonitoringArmArea.Create(nil);
  oArmArea.NodeNo := aNodeNo;
  oArmArea.EcuID := aEcuID;
  oArmArea.ArmAreaNo := aArmAreaNo;
  oArmArea.ArmAreaName := aArmAreaName;
  oArmArea.BuildingCode := BuildingCode;

  oArmArea.OnArmAreaCurrentAlarmStateChange := ArmAreaCurrentAlarmStateChange;
  oArmArea.OnArmAreaSecurityModeChange := ArmAreaSecurityModeChange;
  ArmAreaList.AddObject(stArmAreaID,oArmArea);
end;

procedure TMonitoringBuildingState.SetBuildingAlarmState(const Value: integer);
begin
  if FBuildingAlarmState = Value then Exit;
  FBuildingAlarmState := Value;
  if Assigned(FOnBuildingAlarmStateChange) then
  begin
    OnBuildingAlarmStateChange(Self,BuildingCode,Value);
  end;

end;

procedure TMonitoringBuildingState.SetBuildingSecurityMode(
  const Value: integer);
begin
  if FBuildingSecurityMode = Value then Exit;
  FBuildingSecurityMode := Value;
  if Assigned(FOnBuildingSecurityModeChange) then
  begin
    OnBuildingSecurityModeChange(Self,BuildingCode,Value);
  end;

end;

procedure TMonitoringBuildingState.SetDoor_Add(aNodeNo, aEcuID, aDoorNo,
  aDoorName: string);
var
  nIndex : integer;
  oDoor : TMonitoringDoor;
  stDoorID : string;
begin
  stDoorID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aDoorNo;
  nIndex := DoorList.IndexOf(stDoorID);
  if nIndex > -1 then Exit;
  oDoor := TMonitoringDoor.Create(nil);
  oDoor.NodeNo := aNodeNo;
  oDoor.EcuID := aEcuID;
  oDoor.DoorNo := aDoorNo;
  oDoor.DoorNAME := aDoorName;
  DoorList.AddObject(stDoorID,oDoor);
end;

procedure TMonitoringBuildingState.SetDoor_LockTypeSetting(aNodeNo, aEcuID,
  aDoorNo, aLockType: string);
var
  nIndex : integer;
  stDoorID : string;
begin
  stDoorID := aNodeNo + aEcuID + aDoorNo;
  nIndex := DoorList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  TMonitoringDoor(DoorList.Objects[nIndex]).LOCKTYPE := aLockType;
end;

end.