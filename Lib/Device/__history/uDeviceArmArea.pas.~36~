unit uDeviceArmArea;

interface

uses
  System.SysUtils, System.Classes,
  uDevice,uDeviceVariable,uNode;

type
  TDeviceArmArea = Class(TComponent)
  private
    FArmAreaNo: integer;
    FArmAreaUse: Boolean;
    FDevice: TDevice;
    FArmAreaName: string;
    FCurrentArmAreaStateCheckRCV: string;
    FArmAreaCurrentSecurityMode: string;
    FInfoInitialize: Boolean;
    FArmAreaView: string;
    FOnArmAreaPacket: TArmAreaPacket;
    procedure SetArmAreaName(const Value: string);
    procedure SetArmAreaUse(const Value: Boolean);
    procedure SetArmAreaCurrentSecurityMode(const Value: string);
    procedure SetArmAreaView(const Value: string);
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Device : TDevice read FDevice write FDevice;
    property ArmAreaUse : Boolean read FArmAreaUse write SetArmAreaUse;   //방범구역 사용유무
    property ArmAreaNo : integer read FArmAreaNo write FArmAreaNo;
    property ArmAreaName : string read FArmAreaName write SetArmAreaName;
    property ArmAreaView : string read FArmAreaView write SetArmAreaView;
    property InfoInitialize : Boolean Read FInfoInitialize write FInfoInitialize;
  published
    //방범구역 상태값
    property ArmAreaCurrentSecurityMode : string read FArmAreaCurrentSecurityMode write SetArmAreaCurrentSecurityMode; //경해상태'A'경계,'D'해제

    property CurrentArmAreaStateCheckRCV :string read FCurrentArmAreaStateCheckRCV write FCurrentArmAreaStateCheckRCV;
  published
    //이벤트 발생
    property OnArmAreaPacket : TArmAreaPacket read FOnArmAreaPacket write FOnArmAreaPacket;
  public
    { Public declarations }
  end;

  TdmDeviceArmArea = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDeviceArmArea: TdmDeviceArmArea;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDeviceArmArea }

constructor TDeviceArmArea.Create(AOwner: TComponent);
begin
  inherited;
  ArmAreaCurrentSecurityMode := '*';
end;

destructor TDeviceArmArea.Destroy;
begin

  inherited;
end;

procedure TDeviceArmArea.SetArmAreaCurrentSecurityMode(const Value: string);
begin
  if FArmAreaCurrentSecurityMode = Value then Exit;

  FArmAreaCurrentSecurityMode := Value;
  if (Value <> '') and (Value <> '*') then
  begin
    //이벤트 발생시키자.
    if Assigned(FOnArmAreaPacket) then
    begin
      OnArmAreaPacket(Self,con_ArmAreaCmdModeChange,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(ArmAreaNo),Value);
    end;
  end;
end;

procedure TDeviceArmArea.SetArmAreaName(const Value: string);
begin
  FArmAreaName := Value;
end;

procedure TDeviceArmArea.SetArmAreaUse(const Value: Boolean);
var
  stValue : string;
begin
  if FArmAreaUse = Value then Exit;
  FArmAreaUse := Value;
  if Value then stValue := '1'
  else stValue := '0';

  if InfoInitialize then Exit;

  if Assigned(FOnArmAreaPacket) then
  begin
    OnArmAreaPacket(Self,con_ArmAreaCmdUse,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(ArmAreaNo),stValue);
  end;

end;

procedure TDeviceArmArea.SetArmAreaView(const Value: string);
begin
  if FArmAreaView = Value then Exit;
  FArmAreaView := Value;
  if InfoInitialize then Exit;

  if Assigned(FOnArmAreaPacket) then
  begin
    OnArmAreaPacket(Self,con_ArmAreaCmdView,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(ArmAreaNo),Value);
  end;
end;

end.
