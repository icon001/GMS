unit uFormDeviceState;

interface

uses
  System.SysUtils, System.Classes,Vcl.Forms,Winapi.Windows,
  uServerClientVariable,uPCClient;

const MAXDEVICERCVCOUNT = 100;

type
  TMonitoringNode = Class(TComponent)
  private
    L_bDeviceConnectRCV : Boolean;
    L_nCurrentCheckDeviceSeq : integer;
    DeviceList : TStringList;
    procedure ArmAreaCurrentAlarmStateChange(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure DeviceChangeEvent(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);  //��Ʈ�ѷ� ���� �̺�Ʈ
    procedure DoorChangeEvent(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
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
    FPCClientSocket: TdmPCClient;
    FDecoderNo: integer;
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
    procedure SendPacket(aCMD,aDeviceType,aSubCmd,aNodeNo,aEcuID,aData:string);
  Public
    procedure RcvNodeToArmAreaModeChangeProcess(aEcuID,aData:string);
    procedure RcvNodeToArmAreaStateProcess(aEcuID:string;aArmAreaCount,aArmAreaFormatLength:integer;aArmAreaStateData:string);
    procedure RcvNodeToAlarmEventProcess(aEcuID,aExtendID, aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,aAlarmStateCodeName,
              aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor:string;aServer:Boolean=False);
    procedure RcvNodeToDeviceNetworkStateSearchProcess(aData:string);
    procedure RcvNodeToDoorStateChangeProcess(aEcuID,aData:string);
    procedure RcvNodeToDoorStateProcess(aEcuID:string;aDoorCount,aDoorFormatLength:integer;aDoorStateData:string);
    procedure RcvNodeToEcuNetworkStateChangeProcess(aEcuID,aValue:string);
    procedure RcvKTDoorStateBinary(aDoorBinData:string);
    procedure RcvOnlyMainDoorStateBinary(aDoorIndex:integer;aDoorBinData:string);
  public
    function GetDeviceConnect(aEcuID : string):string;
    function GetDeviceIndexConnect(aIndex:integer):string;
    function GetDeviceIndexDoorCount(aIndex:integer) : integer;
    function GetDeviceIndexDoorIndexDSState(aDeviceIndex,aDoorIndex:integer):string;
    function GetDeviceCount : integer;
    function GetDeviceIndexDoorID(aDeviceIndex,aDoorIndex:integer):String;
    function GetDeviceIndexEcuID(aIndex: integer) : string;
    function GetDeviceIndexName(aIndex:integer; var aEcuID,aEcuName:string):Boolean;
    function GetDeviceToArmAreaName(aEcuID,aArmArea:string):string;
    function GetNodeDeviceToArmAreaCount(aEcuID:string):integer;
    function GetNodeDeviceToArmAreaIndexInfo(aEcuID:string;aArmAreaIndex:integer;var aArmAreaNo:string;var aArmAreaName:string):Boolean;
    function GetNodeDeviceToDoorCount(aEcuID:string):integer;
    function GetNodeDeviceToDoorIndexInfo(aEcuID:string;aDoorIndex:integer;var aDoorNo:string;var aDoorName:string):Boolean;
    function GetDeviceToDoorName(aEcuID,aDoorNo:string):string;
  public
    function GetArmAreaState(aCmd:integer;aECUID,aArmArea:string):string;
    function GetDoorCurrentDSState(aECUID,aDoorNo:string):string;
  published
    property DecoderNo : integer read FDecoderNo write FDecoderNo;
    property NodeNo : integer read FNodeNo write FNodeNo;
    property NodeIP : String read FNodeIP write FNodeIP;
    property NodeName : String read FNodeName write FNodeName;
    property PCClientSocket : TdmPCClient read FPCClientSocket write FPCClientSocket;
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
    procedure Door_CloseStateChange(aDoorID:string);
    procedure Door_NonStateChange(aDoorID:string);
    procedure Door_LongTimeOpenStateChange(aDoorID:string);
    procedure Door_OpenStateChange(aDoorID:string);
  private
    DeviceList : TStringList;
    DoorList : TStringList;
    ArmAreaList : TStringList;
    DoorOpenList : TStringList;
    DoorLongOpenList : TStringList;
    NetWorkFailList : TStringList;
    FBuildingCode: string;
    FBuildingBuildingName: string;
    FBuildingSecurityMode: integer;
    FOnBuildingSecurityModeChange: TBuildingSecurityModeChange;
    FBuildingAlarmState: integer;
    FOnBuildingAlarmStateChange: TBuildingSecurityModeChange;
    FDoorCount: integer;
    FNetWorkFailCount: integer;
    FDoorOpenCount: integer;
    FDoorLongOpenCount: integer;
    FOnBuildingDoorStateCountChange: TBuildingDoorStateCountChange;
    { Private declarations }
    procedure ArmAreaCurrentAlarmStateChange(Sender: TObject; aDecoderNo:integer; aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(Sender: TObject; aDecoderNo:integer; aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure SetBuildingSecurityMode(const Value: integer);
    procedure SetBuildingAlarmState(const Value: integer);
    procedure SetDoorCount(const Value: integer);
    procedure SetNetWorkFailCount(const Value: integer);
    procedure SetDoorLongOpenCount(const Value: integer);
    procedure SetDoorOpenCount(const Value: integer);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure DoorChangeEvent(aDecoderNo:integer;aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);
  public
    procedure SetArmArea_Add(aDecoderNo:integer;aNodeNo,aEcuID,aArmAreaNo,aArmAreaName:string);
    procedure SetArmArea_BuildingCode(aDecoderNo:integer;aNodeNo,aEcuID,aArmAreaNo,aBuildingCode:string);
    procedure SetDoor_Add(aDecoderNo:integer;aNodeNo,aEcuID,aDoorNo,aDoorName:string);
    procedure SetDoor_BuildingCode(aDecoderNo:integer;aNodeNo,aEcuID,aDoorNo,aBuildingCode:string);
    procedure SetDoor_LockTypeSetting(aDecoderNo:integer;aNodeNo,aEcuID,aDoorNo,aLockType:string);

    procedure SetArmAreaAlarmStateChange(aDecoderNo:integer;aNodeNo,aEcuID,aArmAreaNo,aAlarmState:string);
    procedure SetArmAreaSecurityModeChange(aDecoderNo:integer;aNodeNo,aEcuID,aArmAreaNo,aMode:string);
  public
    function GetArmAreaCount : integer;
    function GetArmAreaDeviceArmAreaState(aDecoderNo:integer;aNodeNo,aEcuID,aArmArea:string):integer;
    function GetArmAreaDeviceSecurityMode(aDecoderNo:integer;aNodeNo,aEcuID,aArmArea:string):String;
    function GetArmAreaIndexArmAreaState(aArmAreaIndex:integer):integer;
    function GetArmAreaIndexDevieInfo(aArmAreaIndex:integer;var aDecoderNo:integer;var aNodeNo,aEcuID,aArmAreaNo,aArmAreaName:string):Boolean;
    function GetArmAreaIndexSecurityMode(aArmAreaIndex:integer):String;
    function GetDoorCount : integer;
    function GetDoorCurrentState(aDecoderNo:integer;aNodeNo,aEcuID,aDoorNo:string; var aDoorCardMode,aDoorManageMode,aDoorDSState,aDoorLSState,aDoorFireEvent:string):Boolean;
    function GetDoorIndexCurrentState(aDoorIndex:integer;var aDoorCardMode,aDoorManageMode,aDoorDSState,aDoorLSState,aDoorFireEvent:string):Boolean;
    function GetDoorIndexDevieInfo(aDoorIndex:integer;var aDecoderNo:integer;var aNodeNo,aEcuID,aDoorNo,aDoorName:string):Boolean;
    function GetDoorIndexLockType(aDoorIndex:integer):string;
    function GetDoorIndexFullBuildingCode(aDoorIndex:integer):string;
    function GetDoorName(aDecoderNo:integer;aNodeNo,aEcuID,aDoorNo:string):string;
  published
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property BuildingName : string read FBuildingBuildingName write FBuildingBuildingName;
    property BuildingAlarmState : integer read FBuildingAlarmState write SetBuildingAlarmState; // 0.Event Clear,1.Event,2.View Event,3.View + Sound
    property BuildingSecurityMode : integer read FBuildingSecurityMode write SetBuildingSecurityMode; // 1.��ü����,2.�κа��,3.��ü���
    property DoorCount : integer read FDoorCount write SetDoorCount;
    property DoorOpenCount : integer read FDoorOpenCount write SetDoorOpenCount;
    property DoorLongOpenCount : integer read FDoorLongOpenCount write SetDoorLongOpenCount;
    property NetWorkFailCount : integer read FNetWorkFailCount write SetNetWorkFailCount;
  published
    property OnBuildingAlarmStateChange : TBuildingSecurityModeChange read FOnBuildingAlarmStateChange write FOnBuildingAlarmStateChange;
    property OnBuildingSecurityModeChange : TBuildingSecurityModeChange read FOnBuildingSecurityModeChange write FOnBuildingSecurityModeChange;
    property OnBuildingDoorStateCountChange : TBuildingDoorStateCountChange read FOnBuildingDoorStateCountChange write FOnBuildingDoorStateCountChange;
  End;

  TMonitoringDevice = Class(TComponent)
  private
    ArmAreaList : TStringList;
    DoorList : TStringList;
    procedure ArmAreaCurrentAlarmStateChange(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure DoorChangeEvent(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
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
    FDecoderNo: integer;
    procedure SetDeviceConnected(const Value: string);
    procedure SetServerRcv(const Value: string);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure DeviceStateCheck;
    procedure DeviceStateReSend;
    procedure NodeToArmAreaEventAllClear;

    function GetDeviceToArmAreaName(aArmArea:string):string;
    function GetNodeDeviceToArmAreaIndexInfo(aArmAreaIndex:integer;var aArmAreaNo: string;var aArmAreaName:string):Boolean;
    function GetNodeDeviceToDoorIndexInfo(aDoorIndex:integer;var aDoorNo : string; var aDoorName:string):Boolean;
    function GetDeviceToDoorName(aDoorNo:string):string;
    function GetNodeDeviceToArmAreaCount : integer;
    function GetNodeDeviceToDoorCount : integer;
    function GetArmAreaState(aCmd:integer;aArmArea:string):string;
    function GetDoorState(aDoorNo:integer):string;
    function GetDoorIndexDSState(aDoorIndex:integer):string;
    function GetDoorIndexDoorID(aDoorIndex:integer):string;
    function GetDoorCount : integer;
  public
    procedure SetArmArea_Add(aArmAreaNo,aArmAreaName:string);
    procedure SetArmArea_BuildingSetting(aArmAreaNo, aBuildingCode:string);
    procedure SetDoor_Add(aDoorNo,aDoorName:string);
    procedure SetDoor_BuildingSetting(aDoorNo,aBuildingCode:string);
    procedure SetDoor_LockTypeSetting(aDoorNo, aLockType:string);
  public
    procedure RcvNodeToArmAreaModeChangeProcess(aArmAreaNo,aArmAreaMode:string);
    procedure RcvNodeToAlarmEventProcess(aExtendID,aCmd, aMsgNo,aTime, aSubCLass, aSubAddr,
              aArmAreaNo, aMode, aAlarmStateCode, aLoop,aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
              aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor:string;aServer:Boolean = False);
    procedure RcvNodeToArmAreaStateProcess(aArmAreaNo,aArmAreaFormatLength:integer;aArmAreaStateData:string);
    procedure RcvNodeToDoorStateChangeProcess(aDoorNo,aCardMode,aDoorMode,aDoorState,aLockState,aDoorFire:string);
    procedure RcvNodeToDoorStateProcess(aDoorNo,aDoorFormatLength:integer;aDoorStateData:string);
  published
    property Node : TMonitoringNode read FNode write FNode;
    property DecoderNo : integer read FDecoderNo write FDecoderNo;
    property NodeNo : string read FNodeNo write FNodeNo;
    property ECUID : string read FEcuID write FEcuID;
    property ECUNAME : string read FEcuName write FEcuName;
  published
    //������
    property DeviceConnected : string read FDeviceConnected write SetDeviceConnected; //'1' �������,'0' ��������
    property ServerRcv : string read FServerRcv write SetServerRcv;
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
    FDecoderNo: integer;
    FFullBuildingCode: string;
    FServerRcv: string;
    procedure SetArmAreaCurrentSecurityMode(const Value: string);
    procedure SetArmAreaCurrentAlarmState(const Value: string);
    procedure SetServerRcv(const Value: string);
  public
  published
    property Device : TMonitoringDevice read FDevice write FDevice;
    property DecoderNo:integer read FDecoderNo write FDecoderNo;
    property NodeNo : string read FNodeNo write FNodeNo;
    property EcuID : string read FEcuID write FEcuID;
    property ArmAreaNo : string read FArmAreaNo write FArmAreaNo;
    property ArmAreaName : string read FArmAreaName write FArmAreaName;
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property FullBuildingCode : string read FFullBuildingCode write FFullBuildingCode;
    property ServerRcv : string read FServerRcv write SetServerRcv;
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
    FDecoderNo: integer;
    FFullBuildingCode: string;
    FServerRcv: string;
    FNFState: string;
    procedure SetCARDMODE(const Value: string);
    procedure SetDOORMODE(const Value: string);
    procedure SetDoorCurrentDSState(const Value: string);
    procedure SetDoorCurrentLSState(const Value: string);
    procedure SetDoorFireEvent(const Value: string);
    procedure SetServerRcv(const Value: string);
    procedure SetNFState(const Value: string);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
  published
    property Device : TMonitoringDevice read FDevice write FDevice;
    property NodeNo : string read FNodeNo write FNodeNo;
    property EcuID : string read FEcuID write FEcuID;
    property DecoderNo : integer read FDecoderNo write FDecoderNo;
    property DoorNo : string read FDoorNo write FDoorNo;
    property DoorName : string read FDoorName write FDoorName;
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property FullBuildingCode : string read FFullBuildingCode write FFullBuildingCode;
    property LOCKTYPE : string read FLOCKTYPE write FLOCKTYPE;
  published
    //���Թ� ����
    property CARDMODE : string read FCARDMODE write SetCARDMODE;   //'0'.Posi,'1'.Nega
    property DOORMODE : string read FDOORMODE write SetDOORMODE;   //'0'.����,'1'.������,'2'.�����
    property DoorCurrentDSState : string read FDoorCurrentDSState write SetDoorCurrentDSState; //���� ���Թ� ����(O),����(C) ����
    property DoorCurrentLSState : string read FDoorCurrentLSState write SetDoorCurrentLSState; //���� ���Թ� ���/���� ���� - �̻��
    property DoorFireEvent : string read FDoorFireEvent write SetDoorFireEvent; //���Թ� ȭ�� �߻� ����
    property NFState : string read FNFState write SetNFState;
    property ServerRcv : string read FServerRcv write SetServerRcv;
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
  uFormVariable;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TMonitoringNode }

procedure TMonitoringNode.ArmAreaCurrentAlarmStateChange(Sender: TObject;
  aDecoderNo:integer;aNodeNo, aEcuID, aArmAreaNo, aAlarmState, aBuildingCode: string);
begin
  if Assigned(FOnArmAreaCurrentAlarmStateChange) then
  begin
    OnArmAreaCurrentAlarmStateChange(Self,aDecoderNo, aNodeNo,aEcuID,aArmAreaNo, aAlarmState,aBuildingCode);
  end;

end;

procedure TMonitoringNode.ArmAreaSecurityModeChange(Sender: TObject;aDecoderNo:integer; aNodeNo,
  aEcuID, aArmAreaNo, aMode,aBuildingCode: string);
begin
  if Assigned(FOnArmAreaSecurityModeChange) then
  begin
    OnArmAreaSecurityModeChange(Self,aDecoderNo,aNodeNo,aEcuID,aArmAreaNo, aMode,aBuildingCode);
  end;
end;

constructor TMonitoringNode.Create(AOwner: TComponent);
begin
  inherited;
  DeviceList := TStringList.Create;
  NodeConnected := '-1';
  if G_nMonitoringType = 1 then ServerRcv := 'Y'
  else ServerRcv := 'N';
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

procedure TMonitoringNode.DoorChangeEvent(Sender: TObject;aDecoderNo:integer; aNodeNo, aEcuID,
  aType, aNo, aCmd, aData,aBuildingCode: string);
begin
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode);
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
  result := ' ';
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[nIndex]).DeviceConnected;
end;

function TMonitoringNode.GetDeviceCount: integer;
begin
  result := DeviceList.Count;
end;

function TMonitoringNode.GetDeviceIndexConnect(aIndex: integer): string;
var
  nIndex : integer;
begin
  result := '';
  if aIndex > DeviceList.Count - 1 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[aIndex]).DeviceConnected;
end;

function TMonitoringNode.GetDeviceIndexDoorCount(aIndex: integer): integer;
begin
  result := 0;
  if aIndex > DeviceList.Count - 1 then Exit;
  if aIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[aIndex]).GetDoorCount;
end;

function TMonitoringNode.GetDeviceIndexDoorID(aDeviceIndex,
  aDoorIndex: integer): String;
begin
  result := '0';
  if aDeviceIndex > DeviceList.Count - 1 then Exit;
  if aDeviceIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[aDeviceIndex]).GetDoorIndexDoorID(aDoorIndex);
end;

function TMonitoringNode.GetDeviceIndexDoorIndexDSState(aDeviceIndex,
  aDoorIndex: integer): string;
begin
  result := '';
  if aDeviceIndex > DeviceList.Count - 1 then Exit;
  if aDeviceIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[aDeviceIndex]).GetDoorIndexDSState(aDoorIndex);
end;

function TMonitoringNode.GetDeviceIndexEcuID(aIndex: integer): string;
begin
  result := '';
  if aIndex > DeviceList.Count - 1 then Exit;
  if aIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[aIndex]).ECUID;
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

function TMonitoringNode.GetDeviceToArmAreaName(aEcuID,
  aArmArea: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[nIndex]).GetDeviceToArmAreaName(aArmArea);

end;

function TMonitoringNode.GetDeviceToDoorName(aEcuID, aDoorNo: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DeviceList.IndexOf(aEcuID);
  if Not isDigit(aDoorNo) then aDoorNo := '1';

  if nIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[nIndex]).GetDeviceToDoorName(aDoorNo);

end;

function TMonitoringNode.GetDoorCurrentDSState(aECUID, aDoorNo: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[nIndex]).GetDoorState(strtoint(aDoorNo));
end;

function TMonitoringNode.GetNodeDeviceToArmAreaCount(aEcuID: string): integer;
var
  nIndex : integer;
begin
  result := -1;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;

  result := TMonitoringDevice(DeviceList.Objects[nIndex]).GetNodeDeviceToArmAreaCount;

end;

function TMonitoringNode.GetNodeDeviceToArmAreaIndexInfo(aEcuID: string;
  aArmAreaIndex: integer; var aArmAreaNo, aArmAreaName: string): Boolean;
var
  nIndex : integer;
begin
  result := False;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[nIndex]).GetNodeDeviceToArmAreaIndexInfo(aArmAreaIndex, aArmAreaNo, aArmAreaName);

end;

function TMonitoringNode.GetNodeDeviceToDoorCount(aEcuID: string): integer;
var
  nIndex : integer;
begin
  result := -1;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;

  result := TMonitoringDevice(DeviceList.Objects[nIndex]).GetNodeDeviceToDoorCount;
end;

function TMonitoringNode.GetNodeDeviceToDoorIndexInfo(aEcuID: string;
  aDoorIndex: integer; var aDoorNo, aDoorName: string): Boolean;
var
  nIndex : integer;
begin
  result := False;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TMonitoringDevice(DeviceList.Objects[nIndex]).GetNodeDeviceToDoorIndexInfo(aDoorIndex, aDoorNo, aDoorName);

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
  if G_bApplicationTerminate then Exit;
  nDelayTime := 1000;
  if Not L_bDeviceConnectRCV then
  begin
    if PCClientSocket.Connected then
    begin
      PCClientSocket.SendPacket('S',SCECU,'N',inttostr(NodeNo),'00','');
      FirstTickCount := GetTickCount + nDelayTime;
      while Not L_bDeviceConnectRCV do
      begin
        if G_bApplicationTerminate then Exit;
        Application.ProcessMessages;
        if GetTickCount > FirstTickCount then Break;
      end;
    end;
  end else
  begin
    if NodeConnected = '0' then
    begin
      //L_bDeviceConnectRCV := False; //�ٽ� ��� üũ ����
      Exit; //��Ʈ�ѷ��� ���� �����̸� üũ ���� ����... ���� ���̱� ���ؼ�...
    end;

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
    Try
      TMonitoringDevice(DeviceList.Objects[i]).NodeToArmAreaEventAllClear;
    Except
      continue;
    End;
  end;

end;

procedure TMonitoringNode.DeviceChangeEvent(Sender: TObject; aDecoderNo:integer;aNodeNo, aEcuID,
  aType, aNo, aCmd, aData: string);
begin
  if Assigned(FOnDeviceChangeEvent) then
  begin
    OnDeviceChangeEvent(Self,aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData);
  end;
  if (aType = SCECU) and (aCmd = SCCMDCONNECTED) then
  begin
    NodeConnectedCheck;
  end;
end;

procedure TMonitoringNode.RcvKTDoorStateBinary(aDoorBinData: string);
var
  stExtendID : string;
  stDoorNo : string;
  stCardMode : string;
  stDoorMode : string;
  stDoorState : string;
  stLockState : string;
  stDoorFire : string;
  stNodeConnected : string;
  stDoorEvent : string;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf('00');
  if nIndex < 0 then Exit;
  if Length(aDoorBinData) < 8 then Exit;
  stExtendID := '0';
  stDoorNo := '01';
  stNodeConnected := aDoorBinData[1];
  if (stNodeConnected = '1') then
  begin
    NodeConnected := '2';
    TMonitoringDevice(DeviceList.Objects[nIndex]).DeviceConnected := '1';
    if aDoorBinData[2] = '1' then
    begin
      stCardMode := aDoorBinData[3];
      stDoorMode := Copy(aDoorBinData,4,2);
      if stDoorMode = '00' then stDoorMode := '0'
      else if stDoorMode = '01' then stDoorMode := '1'
      else if stDoorMode = '10' then stDoorMode := '2'
      else if stDoorMode = '11' then stDoorMode := '3';

      stDoorState := aDoorBinData[6];
      if stDoorState = '1' then stDoorState := 'C'
      else stDoorState := 'O';

      stDoorEvent := Copy(aDoorBinData,7,2);
      stDoorFire := '0';
      if stDoorEvent = '01' then stDoorFire := '1'
      else if stDoorEvent = '10' then stDoorState := 'T'; //��ð� ����

      TMonitoringDevice(DeviceList.Objects[nIndex]).RcvNodeToDoorStateChangeProcess(stDoorNo,stCardMode,stDoorMode,stDoorState,stLockState,stDoorFire);
    end;
  end else
  begin
    NodeConnected := '0';
    //TMonitoringDevice(DeviceList.Objects[nIndex]).DeviceConnected := '0';
  end;

end;

procedure TMonitoringNode.RcvNodeToAlarmEventProcess(aEcuID,aExtendID, aCmd, aMsgNo,
  aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor: string;aServer:Boolean=False);
var
  nIndex : integer;
  stArmAreaData : string;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TMonitoringDevice(DeviceList.Objects[nIndex]).RcvNodeToAlarmEventProcess(aExtendID,aCmd, aMsgNo,aTime, aSubCLass, aSubAddr,
    aArmArea, aMode, aAlarmStateCode, aLoop,aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
    aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor,aServer);
end;

procedure TMonitoringNode.RcvNodeToArmAreaModeChangeProcess(aEcuID,
  aData: string);
var
  stExtendID : string;
  stArmAreaNo : string;
  stArmAreaMode : string;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  if Length(aData) < 4 then Exit;
  stExtendID := aData[1];
  stArmAreaNo := copy(aData,2,2);
  stArmAreaNo := inttostr(strtoint(stArmAreaNo));
  stArmAreaMode := aData[4];
  TMonitoringDevice(DeviceList.Objects[nIndex]).RcvNodeToArmAreaModeChangeProcess(stArmAreaNo,stArmAreaMode);

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
  TMonitoringDevice(DeviceList.Objects[nIndex]).ServerRcv := 'Y';

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
  bReceive : Boolean;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  bReceive := True;
  for i := 0 to aDoorCount - 1 do
  begin
    stDoorData := copy(aDoorStateData,1 + (i * aDoorFormatLength),aDoorFormatLength);
    TMonitoringDevice(DeviceList.Objects[nIndex]).RcvNodeToDoorStateProcess(i+1,aDoorFormatLength,stDoorData);
    TMonitoringDevice(DeviceList.Objects[nIndex]).ServerRcv := 'Y';
    //if TMonitoringDevice(DeviceList.Objects[nIndex]).GetDoorState(i+1) = '*' then bReceive := False;  //20150818 ����ǥ��� �ص� ���� ������ ��� �޾� ������ ����.
  end;
  if bReceive then
    TMonitoringDevice(DeviceList.Objects[nIndex]).ServerRcv := 'Y';


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

procedure TMonitoringNode.RcvOnlyMainDoorStateBinary(aDoorIndex: integer;
  aDoorBinData: string);
var
  stExtendID : string;
  stDoorNo : string;
  stCardMode : string;
  stDoorMode : string;
  stDoorState : string;
  stLockState : string;
  stDoorFire : string;
  stNodeConnected : string;
  stDoorEvent : string;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf('00');
  if nIndex < 0 then Exit;
  if Length(aDoorBinData) < 8 then Exit;
  stExtendID := '0';
  stDoorNo := FillZeroNumber(aDoorIndex,2);
  stNodeConnected := aDoorBinData[1];
  if (stNodeConnected = '1') then
  begin
    NodeConnected := '2';
    TMonitoringDevice(DeviceList.Objects[nIndex]).DeviceConnected := '1';
    if aDoorBinData[2] = '1' then
    begin
      stCardMode := aDoorBinData[3];
      stDoorMode := Copy(aDoorBinData,4,2);
      if stDoorMode = '00' then stDoorMode := '0'
      else if stDoorMode = '01' then stDoorMode := '1'
      else if stDoorMode = '10' then stDoorMode := '2'
      else if stDoorMode = '11' then stDoorMode := '3';

      stDoorState := aDoorBinData[6];
      if stDoorState = '1' then stDoorState := 'C'
      else stDoorState := 'O';

      stDoorEvent := Copy(aDoorBinData,7,2);
      stDoorFire := '0';
      if stDoorEvent = '01' then stDoorFire := '1'
      else if stDoorEvent = '10' then stDoorState := 'T'; //��ð� ����

      TMonitoringDevice(DeviceList.Objects[nIndex]).RcvNodeToDoorStateChangeProcess(stDoorNo,stCardMode,stDoorMode,stDoorState,stLockState,stDoorFire);
    end;
  end else
  begin
    if aDoorIndex = 1 then
    begin
      NodeConnected := '0';
    end else
    begin
      if aDoorBinData[2] = '1' then
      begin
        stCardMode := aDoorBinData[3];
        stDoorMode := Copy(aDoorBinData,4,2);
        if stDoorMode = '00' then stDoorMode := '0'
        else if stDoorMode = '01' then stDoorMode := '1'
        else if stDoorMode = '10' then stDoorMode := '2'
        else if stDoorMode = '11' then stDoorMode := '3';

        stDoorState := aDoorBinData[6];
        if stDoorState = '1' then stDoorState := 'C'
        else stDoorState := 'O';

        stDoorEvent := Copy(aDoorBinData,7,2);
        stDoorFire := '0';
        if stDoorEvent = '01' then stDoorFire := '1'
        else if stDoorEvent = '10' then stDoorState := 'T'; //��ð� ����

        TMonitoringDevice(DeviceList.Objects[nIndex]).RcvNodeToDoorStateChangeProcess(stDoorNo,stCardMode,stDoorMode,stDoorState,stLockState,stDoorFire);
      end;
    end;
    //TMonitoringDevice(DeviceList.Objects[nIndex]).DeviceConnected := '0';
  end;

end;

procedure TMonitoringNode.SendPacket(aCMD, aDeviceType, aSubCmd, aNodeNo,
  aEcuID, aData: string);
begin
  if PCClientSocket = nil then Exit;
  if PCClientSocket.Connected then
  begin
    PCClientSocket.SendPacket(aCMD,aDeviceType,aSubCmd,aNodeNo,aEcuID,aData);
  end;
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
  oDevice.DecoderNo := DecoderNo;
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
    OnNodeChangeEvent(Self,DecoderNo, inttostr(NodeNo),'00',SCNODE,'0',SCCMDCONNECTED,Value);
  end;
  if Value = '0' then
  begin
    for i := DeviceList.Count - 1 downto 0 do
    begin
      TMonitoringDevice(DeviceList.Objects[i]).DeviceConnected := '0';
    end;
    //ServerRcv := 'N';
    if G_nMonitoringType <> 1 then ServerRcv := 'N';   //�бⱹ��� ��� ����ٰ� Ÿ�̸� ������ ���� - ���߿� �����ؼ� �ٸ� ��� �ʿ� ������ ����
    L_bDeviceConnectRCV := False;
  end;
end;

{ TMonitoringDevice }

procedure TMonitoringDevice.ArmAreaCurrentAlarmStateChange(Sender: TObject;
  aDecoderNo:integer;aNodeNo, aEcuID, aArmAreaNo, aAlarmState, aBuildingCode: string);
begin
  if Assigned(FOnArmAreaCurrentAlarmStateChange) then
  begin
    OnArmAreaCurrentAlarmStateChange(Self,aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode);
  end;
end;

procedure TMonitoringDevice.ArmAreaSecurityModeChange(Sender: TObject;aDecoderNo:integer; aNodeNo,
  aEcuID, aArmAreaNo, aMode,aBuildingCode: string);
begin
  if Assigned(FOnArmAreaSecurityModeChange) then
  begin
    OnArmAreaSecurityModeChange(Self,aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode);
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
  if G_bApplicationTerminate then Exit;
  nDelayTime := 1000;
  Node.SendPacket('S',SCECU,'s',NodeNo,ECUID,'');
  FirstTickCount := GetTickCount + nDelayTime;
  while ServerRcv <> 'Y' do
  begin
    if G_bApplicationTerminate then Exit;
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;
  end;
end;

procedure TMonitoringDevice.DeviceStateReSend;
begin
  ServerRcv := 'N';
end;

procedure TMonitoringDevice.DoorChangeEvent(Sender: TObject;aDecoderNo:integer; aNodeNo, aEcuID,
  aType, aNo, aCmd, aData,aBuildingCode: string);
begin
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode);
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

function TMonitoringDevice.GetDeviceToArmAreaName(aArmArea: string): string;
var
  nIndex : integer;
begin
  result := '';
  aArmArea := inttostr(strtoint(aArmArea));
  nIndex := ArmAreaList.IndexOf(aArmArea);
  if nIndex < 0 then Exit;
  result := TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaName;
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

function TMonitoringDevice.GetDoorCount: integer;
begin
  result := DoorList.Count;
end;

function TMonitoringDevice.GetDoorIndexDoorID(aDoorIndex: integer): string;
begin
  result := '0';
  if aDoorIndex > DoorList.Count - 1 then Exit;
  result := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DoorNo;
end;

function TMonitoringDevice.GetDoorIndexDSState(aDoorIndex: integer): string;
begin
  result := '';
  if aDoorIndex > DoorList.Count - 1 then Exit;
  result := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DoorCurrentDSState;
end;

function TMonitoringDevice.GetDoorState(aDoorNo: integer): string;
var
  nIndex : integer;
begin
  nIndex := DoorList.IndexOf(inttostr(aDoorNo));
  if nIndex < 0 then Exit;
  result := TMonitoringDoor(DoorList.Objects[nIndex]).DoorCurrentDSState;
end;

function TMonitoringDevice.GetNodeDeviceToArmAreaCount: integer;
begin
  result := ArmAreaList.Count;
end;

function TMonitoringDevice.GetNodeDeviceToArmAreaIndexInfo(
  aArmAreaIndex: integer; var aArmAreaNo: string;
  var aArmAreaName: string): Boolean;
begin
  result := False;
  if aArmAreaIndex > ArmAreaList.Count - 1 then Exit;
  aArmAreaNo := TMonitoringArmArea(ArmAreaList.Objects[aArmAreaIndex]).ArmAreaNo;
  aArmAreaName := TMonitoringArmArea(ArmAreaList.Objects[aArmAreaIndex]).ArmAreaName;
  result := True;

end;

function TMonitoringDevice.GetNodeDeviceToDoorCount: integer;
begin
  result := DoorList.Count;
end;

function TMonitoringDevice.GetNodeDeviceToDoorIndexInfo(aDoorIndex: integer;
  var aDoorNo, aDoorName: string): Boolean;
begin
  result := False;
  if aDoorIndex > DoorList.Count - 1 then Exit;
  aDoorNo := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DoorNo;
  aDoorName := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DoorName;
  result := True;
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
  i : integer;
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

  if (aAlarmStateCode <> 'NF') and (aAlarmStateCode <> 'NR') then Exit; //��� �ܺ��� �ƴϸ� ���� ������.

  if DoorList.Count > 0 then
  begin
    for i := 0 to DoorList.Count - 1 do TMonitoringDoor(DoorList.Objects[i]).NFState := aAlarmStateCode;
  end;

end;

procedure TMonitoringDevice.RcvNodeToArmAreaModeChangeProcess(aArmAreaNo,
  aArmAreaMode: string);
var
  nIndex : integer;
begin
  nIndex := ArmAreaList.IndexOf(aArmAreaNo);
  if nIndex < 0 then Exit;
  TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentSecurityMode := aArmAreaMode[1];
  TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ServerRcv := 'Y';
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
  TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ServerRcv := 'Y';

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
  TMonitoringDoor(DoorList.Objects[nIndex]).ServerRcv := 'Y';
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
  oArmArea.DecoderNo := DecoderNo;
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
    OnDeviceChangeEvent(Self,DecoderNo,NodeNo,ECUID,SCECU,'0',SCCMDCONNECTED,Value);
  end;
  if Value = '1' then
  begin
    FNode.NodeConnectedCheck;
    Exit;
  end;
  //ServerRcv := 'N';
  if G_nMonitoringType <> 1 then ServerRcv := 'N' ;   //�бⱹ��� ���� ���������� ����.

  for i := ArmAreaList.Count - 1 downto 0 do
  begin
    TMonitoringArmArea(ArmAreaList.Objects[i]).ArmAreaCurrentAlarmState := '*';
    TMonitoringArmArea(ArmAreaList.Objects[i]).ArmAreaCurrentSecurityMode := '*';
    if G_nMonitoringType <> 1 then TMonitoringArmArea(ArmAreaList.Objects[i]).ServerRcv := 'N';  //�бⱹ��� ���� ���������� ����
  end;

  for i := DoorList.Count - 1 downto 0 do
  begin
    TMonitoringDoor(DoorList.Objects[i]).CARDMODE := '*';
    TMonitoringDoor(DoorList.Objects[i]).DOORMODE := '*';
    TMonitoringDoor(DoorList.Objects[i]).DoorCurrentDSState := '*';
    TMonitoringDoor(DoorList.Objects[i]).DoorCurrentLSState := '*';
    TMonitoringDoor(DoorList.Objects[i]).DoorFireEvent := '*';
    if G_nMonitoringType <> 1 then TMonitoringDoor(DoorList.Objects[i]).ServerRcv := 'N';
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
  oDoor.DecoderNo := DecoderNo;
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

procedure TMonitoringDevice.SetServerRcv(const Value: string);
begin
  if FServerRcv = Value then Exit;

  FServerRcv := Value;
end;

{ TMonitoringArmArea }

constructor TMonitoringArmArea.Create(AOwner: TComponent);
begin
  inherited;
  Device := nil;
  if G_nMonitoringType = 1 then ServerRcv := 'Y'
  else ServerRcv := 'N';
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
    OnArmAreaCurrentAlarmStateChange(Self,DecoderNo,NodeNo,ECUID,ArmAreaNo,Value,BuildingCode);
  end;
end;

procedure TMonitoringArmArea.SetArmAreaCurrentSecurityMode(
  const Value: string);
begin
  if FArmAreaCurrentSecurityMode = Value then Exit;

  FArmAreaCurrentSecurityMode := Value;
  if Assigned(FOnArmAreaSecurityModeChange) then
  begin
    OnArmAreaSecurityModeChange(Self,DecoderNo,NodeNo,ECUID,ArmAreaNo,Value,BuildingCode);
  end;

end;

procedure TMonitoringArmArea.SetServerRcv(const Value: string);
begin
  if FServerRcv = Value then Exit;

  FServerRcv := Value;
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
  if G_nMonitoringType = 1 then ServerRcv := 'Y'
  else ServerRcv := 'N';
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
    OnDoorChangeEvent(Self,DecoderNo,NodeNo,EcuID,SCDOOR,DoorNo,SCCMDDOORCARDMODE,Value,BuildingCode);
  end;
end;

procedure TMonitoringDoor.SetDoorCurrentLSState(const Value: string);
begin
  if FDoorCurrentLSState = Value then Exit;

  FDoorCurrentLSState := Value;
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,DecoderNo,NodeNo,EcuID,SCDOOR,DoorNo,SCCMDDOORLSSTATE,Value,BuildingCode);
  end;
end;

procedure TMonitoringDoor.SetDoorFireEvent(const Value: string);
begin
  if FDoorFireEvent = Value then Exit;

  FDoorFireEvent := Value;
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,DecoderNo,NodeNo,EcuID,SCDOOR,DoorNo,SCCMDDOORFIREEVENT,Value,BuildingCode);
  end;
end;

procedure TMonitoringDoor.SetDoorCurrentDSState(const Value: string);
begin
  if FDoorCurrentDSState = Value then Exit;
  FDoorCurrentDSState := Value;
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,DecoderNo, NodeNo,EcuID,SCDOOR,DoorNo,SCCMDDOORDSSTATE,Value,BuildingCode);
  end;
end;

procedure TMonitoringDoor.SetDOORMODE(const Value: string);
begin
  if FDOORMODE = Value then Exit;  //'0'.����,'1'.������,'2'.�����
  FDOORMODE := Value;
  //�̺�Ʈ �߻� ��Ŵ
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,DecoderNo,NodeNo,EcuID,SCDOOR,DoorNo,SCCMDDOORMANAGEMODE,Value,BuildingCode);
  end;
end;

procedure TMonitoringDoor.SetNFState(const Value: string);
begin
  FNFState := Value;
end;

procedure TMonitoringDoor.SetServerRcv(const Value: string);
begin
  if FServerRcv = Value then Exit;

  FServerRcv := Value;
end;

{ TMonitoringBuildingState }

procedure TMonitoringBuildingState.ArmAreaCurrentAlarmStateChange(
  Sender: TObject; aDecoderNo:integer;aNodeNo, aEcuID, aArmAreaNo, aAlarmState,
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
  aDecoderNo:integer;aNodeNo, aEcuID, aArmAreaNo, aMode, aBuildingCode: string);
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
  DoorOpenList := TStringList.Create;
  DoorLongOpenList := TStringList.Create;
  NetWorkFailList := TStringList.Create;
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
  DoorOpenList.Free;
  DoorLongOpenList.Free;
  NetWorkFailList.Free;
  inherited;
  inherited;
end;

procedure TMonitoringBuildingState.DoorChangeEvent(aDecoderNo:integer;aNodeNo, aEcuID, aType, aNo,
  aCmd, aData: string);
var
  nIndex : integer;
  stDoorID : string;
begin
  stDoorID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aNo;
  nIndex := DoorList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  if aType <> SCDOOR then Exit;  //Door Type�� �ƴϸ� ó�� ���� ����... �ٵ� �̷��� ������ �ȵ�
  case aCmd[1] of
    SCCMDDOORCARDMODE : TMonitoringDoor(DoorList.Objects[nIndex]).CARDMODE := aData;
    SCCMDDOORMANAGEMODE : TMonitoringDoor(DoorList.Objects[nIndex]).DOORMODE := aData;
    SCCMDDOORDSSTATE : begin
      TMonitoringDoor(DoorList.Objects[nIndex]).DoorCurrentDSState := aData;
      if aData = 'C' then Door_CloseStateChange(stDoorID) //��ð�����,���Թ��������� ���� ����
      else if aData = 'O' then Door_OpenStateChange(stDoorID) //���Թ�����
      else if (aData = 'T') OR (aData = 'D') then Door_LongTimeOpenStateChange(stDoorID) //��ð����� ���� ó��
      else Door_NonStateChange(stDoorID); //��Ʈ�� ���� �߻� ó�� ����.
    end;
    SCCMDDOORLSSTATE : TMonitoringDoor(DoorList.Objects[nIndex]).DoorCurrentLSState := aData;
    SCCMDDOORFIREEVENT : TMonitoringDoor(DoorList.Objects[nIndex]).DoorFireEvent := aData;
  end;
end;


procedure TMonitoringBuildingState.Door_CloseStateChange(aDoorID: string);
var
  nIndex : integer;
begin
  if G_nDoorStateUse <> 1 then Exit; //�ӵ� ���� ��Ű��.
  nIndex := NetWorkFailList.IndexOf(copy(aDoorID,1,G_nDecoderCodeLength + G_nNodeCodeLength + 2));
  if nIndex > -1 then
  begin
    NetWorkFailList.Delete(nIndex);
    NetWorkFailCount := NetWorkFailCount - 1;
  end;
  nIndex := DoorOpenList.IndexOf(aDoorID);
  if nIndex > -1 then
  begin
    DoorOpenList.Delete(nIndex);
    DoorOpenCount := DoorOpenCount - 1;
  end;
  nIndex := DoorLongOpenList.IndexOf(aDoorID);
  if nIndex > -1 then
  begin
    DoorLongOpenList.Delete(nIndex);
    DoorLongOpenCount := DoorLongOpenCount - 1;
  end;
end;

procedure TMonitoringBuildingState.Door_LongTimeOpenStateChange(
  aDoorID: string);
var
  nIndex : integer;
begin
  if G_nDoorStateUse <> 1 then Exit;  //�ӵ� ���� ��Ű��.
  nIndex := NetWorkFailList.IndexOf(copy(aDoorID,1,G_nDecoderCodeLength + G_nNodeCodeLength + 2));
  if nIndex > -1 then
  begin
    NetWorkFailList.Delete(nIndex);
    NetWorkFailCount := NetWorkFailCount - 1;
  end;
  nIndex := DoorOpenList.IndexOf(aDoorID);
  if nIndex > -1 then
  begin
    DoorOpenList.Delete(nIndex);
    DoorOpenCount := DoorOpenCount - 1;
  end;
  nIndex := DoorLongOpenList.IndexOf(aDoorID);
  if nIndex < 0 then
  begin
    DoorLongOpenList.Add(aDoorID);
    DoorLongOpenCount := DoorLongOpenCount + 1;
  end;
end;

procedure TMonitoringBuildingState.Door_NonStateChange(aDoorID: string);
var
  nIndex : integer;
begin
  if G_nDoorStateUse <> 1 then Exit;  //�ӵ� ���� ��Ű��.

  nIndex := NetWorkFailList.IndexOf(copy(aDoorID,1,G_nDecoderCodeLength + G_nNodeCodeLength + 2));
  if nIndex < 0 then
  begin
    NetWorkFailList.Add(copy(aDoorID,1,G_nDecoderCodeLength + G_nNodeCodeLength + 2));
    NetWorkFailCount := NetWorkFailCount + 1;
  end;
  nIndex := DoorOpenList.IndexOf(aDoorID);
  if nIndex > -1 then
  begin
    DoorOpenList.Delete(nIndex);
    DoorOpenCount := DoorOpenCount - 1;
  end;
  nIndex := DoorLongOpenList.IndexOf(aDoorID);
  if nIndex > -1 then
  begin
    DoorLongOpenList.Delete(nIndex);
    DoorLongOpenCount := DoorLongOpenCount - 1;
  end;
end;

procedure TMonitoringBuildingState.Door_OpenStateChange(aDoorID: string);
var
  nIndex : integer;
begin
  if G_nDoorStateUse <> 1 then Exit; //�ӵ� ���� ��Ű��.
  nIndex := NetWorkFailList.IndexOf(copy(aDoorID,1,G_nDecoderCodeLength + G_nNodeCodeLength + 2));
  if nIndex > -1 then
  begin
    NetWorkFailList.Delete(nIndex);
    NetWorkFailCount := NetWorkFailCount - 1;
  end;
  nIndex := DoorOpenList.IndexOf(aDoorID);
  if nIndex < 0 then
  begin
    DoorOpenList.Add(aDoorID);
    DoorOpenCount := DoorOpenCount + 1;
  end;
  nIndex := DoorLongOpenList.IndexOf(aDoorID);
  if nIndex > -1 then
  begin
    DoorLongOpenList.Delete(nIndex);
    DoorLongOpenCount := DoorLongOpenCount - 1;
  end;
end;

function TMonitoringBuildingState.GetArmAreaCount: integer;
begin
  result := ArmAreaList.Count;
end;

function TMonitoringBuildingState.GetArmAreaDeviceArmAreaState(aDecoderNo:integer;aNodeNo, aEcuID,
  aArmArea: string): integer;
var
  stArmAreaID : string;
  nIndex : integer;
begin
  result := 0;
  stArmAreaID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmArea;
  nIndex := ArmAreaList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;

  Try
    if isDigit( TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentAlarmState ) then
      result := strtoint(TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentAlarmState);
  Except
    Exit;
  End;
end;

function TMonitoringBuildingState.GetArmAreaDeviceSecurityMode(aDecoderNo:integer;aNodeNo, aEcuID,
  aArmArea: string): String;
var
  stArmAreaID : string;
  nIndex : integer;
begin
  result := '';
  stArmAreaID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmArea;
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
  aArmAreaIndex: integer;var aDecoderNo:integer;var aNodeNo, aEcuID,aArmAreaNo,
  aArmAreaName: string): Boolean;
begin
  result := False;
  if aArmAreaIndex > ArmAreaList.Count - 1 then  Exit;
  aDecoderNo := TMonitoringArmArea(ArmAreaList.Objects[aArmAreaIndex]).DecoderNo;
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

function TMonitoringBuildingState.GetDoorCurrentState(aDecoderNo:integer;aNodeNo, aEcuID, aDoorNo:string;
  var aDoorCardMode, aDoorManageMode, aDoorDSState, aDoorLSState,
  aDoorFireEvent: string): Boolean;
var
  nIndex : integer;
  stDoorID : string;
begin
  result := False;
  stDoorID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aDoorNo;
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
  var aDecoderNo:integer;var aNodeNo, aEcuID, aDoorNo, aDoorName: string): Boolean;
begin
  result := False;
  if aDoorIndex > DoorList.Count - 1 then  Exit;
  aDecoderNo := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DecoderNo;
  aNodeNo := TMonitoringDoor(DoorList.Objects[aDoorIndex]).NodeNo;
  aEcuID := TMonitoringDoor(DoorList.Objects[aDoorIndex]).EcuID;
  aDoorNo := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DoorNo;
  aDoorName := TMonitoringDoor(DoorList.Objects[aDoorIndex]).DoorName;
  result := True;
end;

function TMonitoringBuildingState.GetDoorIndexFullBuildingCode(
  aDoorIndex: integer): string;
begin
  result := '';
  if aDoorIndex > DoorList.Count - 1 then  Exit;
  result := TMonitoringDoor(DoorList.Objects[aDoorIndex]).FullBuildingCode;
end;

function TMonitoringBuildingState.GetDoorIndexLockType(aDoorIndex: integer): string;
begin
  result := '';
  if aDoorIndex > DoorList.Count - 1 then  Exit;
  result := TMonitoringDoor(DoorList.Objects[aDoorIndex]).LOCKTYPE;
end;

function TMonitoringBuildingState.GetDoorName(aDecoderNo:integer;aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  nIndex : integer;
  stDoorID : string;
begin
  result := '';
  stDoorID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + inttostr(strtoint(aDoorNo));
  nIndex := DoorList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  result := TMonitoringDoor(DoorList.Objects[nIndex]).DoorName;
end;

procedure TMonitoringBuildingState.SetArmAreaAlarmStateChange(aDecoderNo:integer;aNodeNo, aEcuID,
  aArmAreaNo, aAlarmState: string);
var
  stArmAreaID : string;
  nIndex : integer;
begin
  stArmAreaID := FillZeronumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := ArmAreaList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentAlarmState := aAlarmState;
end;

procedure TMonitoringBuildingState.SetArmAreaSecurityModeChange(aDecoderNo:integer;aNodeNo, aEcuID,
  aArmAreaNo, aMode: string);
var
  stArmAreaID : string;
  nIndex : integer;
begin
  stArmAreaID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := ArmAreaList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  TMonitoringArmArea(ArmAreaList.Objects[nIndex]).ArmAreaCurrentSecurityMode := aMode;
end;

procedure TMonitoringBuildingState.SetArmArea_Add(aDecoderNo:integer;aNodeNo, aEcuID, aArmAreaNo,
  aArmAreaName: string);
var
  nIndex : integer;
  oArmArea : TMonitoringArmArea;
  stArmAreaID : string;
begin
  stArmAreaID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := ArmAreaList.IndexOf(stArmAreaID);
  if nIndex > -1 then Exit;
  oArmArea := TMonitoringArmArea.Create(nil);
  oArmArea.DecoderNo := aDecoderNo;
  oArmArea.NodeNo := aNodeNo;
  oArmArea.EcuID := aEcuID;
  oArmArea.ArmAreaNo := aArmAreaNo;
  oArmArea.ArmAreaName := aArmAreaName;
  oArmArea.BuildingCode := BuildingCode;

  oArmArea.OnArmAreaCurrentAlarmStateChange := ArmAreaCurrentAlarmStateChange;
  oArmArea.OnArmAreaSecurityModeChange := ArmAreaSecurityModeChange;
  ArmAreaList.AddObject(stArmAreaID,oArmArea);
end;

procedure TMonitoringBuildingState.SetArmArea_BuildingCode(aDecoderNo: integer;
  aNodeNo, aEcuID, aArmAreaNo, aBuildingCode: string);
var
  nIndex : integer;
  stArmAreaID : string;
begin
  stArmAreaID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := ArmAreaList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  TMonitoringArmArea(ArmAreaList.Objects[nIndex]).FullBuildingCode := aBuildingCode;

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

procedure TMonitoringBuildingState.SetDoorCount(const Value: integer);
begin
  if FDoorCount = Value then Exit;
  FDoorCount := Value;
  if Assigned(FOnBuildingDoorStateCountChange) then
  begin
    OnBuildingDoorStateCountChange(Self,BuildingCode,0,Value);
  end;
end;

procedure TMonitoringBuildingState.SetDoorLongOpenCount(const Value: integer);
begin
  if FDoorLongOpenCount = Value then Exit;
  FDoorLongOpenCount := Value;
  if Assigned(FOnBuildingDoorStateCountChange) then
  begin
    OnBuildingDoorStateCountChange(Self,BuildingCode,2,Value);
  end;
end;

procedure TMonitoringBuildingState.SetDoorOpenCount(const Value: integer);
begin
  if FDoorOpenCount = Value then Exit;

  FDoorOpenCount := Value;
  if Assigned(FOnBuildingDoorStateCountChange) then
  begin
    OnBuildingDoorStateCountChange(Self,BuildingCode,1,Value);
  end;

end;

procedure TMonitoringBuildingState.SetDoor_Add(aDecoderNo:integer;aNodeNo, aEcuID, aDoorNo,
  aDoorName: string);
var
  nIndex : integer;
  oDoor : TMonitoringDoor;
  stDoorID : string;
begin
  stDoorID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aDoorNo;
  nIndex := DoorList.IndexOf(stDoorID);
  if nIndex > -1 then Exit;
  oDoor := TMonitoringDoor.Create(nil);
  oDoor.DecoderNo := aDecoderNo;
  oDoor.NodeNo := aNodeNo;
  oDoor.EcuID := aEcuID;
  oDoor.DoorNo := aDoorNo;
  oDoor.DoorNAME := aDoorName;
  DoorList.AddObject(stDoorID,oDoor);

  if G_nDoorStateUse <> 1 then Exit; //�ӵ� ���� ��Ű��.

  //ó�� ���Թ� �߰� �Ҷ� ��Ʈ�� �ܼ��� �߰� �� ����.
  nIndex := NetWorkFailList.IndexOf(copy(stDoorID,1,G_nDecoderCodeLength + G_nNodeCodeLength + 2));
  if nIndex < 0 then
  begin
    NetWorkFailList.Add(copy(stDoorID,1,G_nDecoderCodeLength + G_nNodeCodeLength + 2));
    NetWorkFailCount := NetWorkFailCount + 1;
  end;
end;

procedure TMonitoringBuildingState.SetDoor_BuildingCode(aDecoderNo: integer;
  aNodeNo, aEcuID, aDoorNo, aBuildingCode: string);
var
  nIndex : integer;
  stDoorID : string;
begin
  stDoorID := FillZeronumber(aDecoderNo,G_nDecoderCodeLength) + aNodeNo + aEcuID + aDoorNo;
  nIndex := DoorList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  TMonitoringDoor(DoorList.Objects[nIndex]).FullBuildingCode := aBuildingCode;

end;

procedure TMonitoringBuildingState.SetDoor_LockTypeSetting(aDecoderNo:integer;aNodeNo, aEcuID,
  aDoorNo, aLockType: string);
var
  nIndex : integer;
  stDoorID : string;
begin
  stDoorID := FillZeronumber(aDecoderNo,G_nDecoderCodeLength) + aNodeNo + aEcuID + aDoorNo;
  nIndex := DoorList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  TMonitoringDoor(DoorList.Objects[nIndex]).LOCKTYPE := aLockType;
end;

procedure TMonitoringBuildingState.SetNetWorkFailCount(const Value: integer);
begin
  if FNetWorkFailCount = Value then Exit;

  FNetWorkFailCount := Value;
  if Assigned(FOnBuildingDoorStateCountChange) then
  begin
    OnBuildingDoorStateCountChange(Self,BuildingCode,3,Value);
  end;
end;

end.