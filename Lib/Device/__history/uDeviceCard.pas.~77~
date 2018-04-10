unit uDeviceCard;

interface

uses
  System.SysUtils, System.Classes,
  uDeviceVariable,uNode,uDevice;

type
  TDeviceCard = Class(TComponent)
  private
    L_cDoorPermit: Array [0..8] of char;     //출입문 권한
    L_cArmAreaPermit: Array [0..8] of char;     //방범구역 권한
    L_cTimeCode: Array [0..4] of char;     //타임코드
    L_stTimeCodeUse : string;
    L_stTimeGroup : string;
    L_stWeekCode : string;
    { Private declarations }
    procedure CardPermitCheck;
  private
    FCARDNO: string;
    FRCVACK: string;
    FPermitChange: Boolean;
    FPositionNum: string;
    FEMSEQ: string;
    FEMNAME: string;
    FCOMPANYCODE: string;
    FACUSE: string;
    FATUSE: string;
    FFDUSE: string;
    FCARDPERMIT: Boolean;
    FENDDATE: string;
    FREGDATE: string;
    FOnCardPermitChange: TCardPermitPacket;
    FDevice: TDevice;
    FOnCardRcvAckChange: TCardRcvPacket;
    FEMSTATE: string;
    procedure SetRCVACK(const Value: string);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    { Public declarations }
    procedure InitArmAreaPermit(aArmAreaNo:integer;aPermit:string); //초기에 DB에서 데이터 불러와서 설정 하는 부분
    procedure InitCardPermit(aPermit:string);       //초기에 DB에서 데이터 불러와서 설정 하는 부분
    procedure InitDoorPermit(aDoorNo:integer;aPermit:string);       //초기에 DB에서 데이터 불러와서 설정 하는 부분
    procedure InitRCVACK(aRcvAck:string);       //초기에 DB에서 데이터 불러와서 설정 하는 부분
    procedure InitTimeCode(aSeq:integer;aTimeCode:string);       //초기에 DB에서 데이터 불러와서 설정 하는 부분
    procedure InitTimeCodeUse(aTimeCodeUse:string);       //초기에 DB에서 데이터 불러와서 설정 하는 부분
    procedure InitTimeGroup(aTimeGroup:string);       //초기에 DB에서 데이터 불러와서 설정 하는 부분
    procedure InitWeekCode(aWeekCode:string);       //초기에 DB에서 데이터 불러와서 설정 하는 부분

    procedure PermitSetting(aRcvAck:string);                                        //권한 작업 완료 후 작업 완료 이벤트 발생 하기 위해서

    procedure SetArmAreaPermit(aArmAreaNo:integer;aPermit:string);
    procedure SetDoorPermit(aDoorNo:integer;aPermit:string);
    procedure SetTimeCode(aSeq:integer;aTimeCode:string);
    procedure SetTimeCodeUse(aTimeCodeUse:string);
    procedure SetTimeGroup(aTimeGroup:string);
    procedure SetWeekCode(aWeekCode:string);
  public
    function CheckArmAreaPermit(aArmAreaNo : string):Boolean;
    function CheckDoorPermit(aDoorNo : string):Boolean;
    function CheckValidDate(aDate : string) : Boolean;

    function GetArmAreaPermit : string;
    function GetDoorPermit(aMaxDoorCount:integer) : string;
    function GetTimeCode : string;
    function GetTimeCodeUse : string;
    function GetTimeGroup : string;
    function GetWeekCode : string;
  published
    property Device : TDevice read FDevice write FDevice;
    property CARDNO : string read FCARDNO write FCARDNO;
    property PermitChange : Boolean  read FPermitChange write FPermitChange;
    property RCVACK : string read FRCVACK write SetRCVACK;    //수신상태

    property CARDPERMIT : Boolean read FCARDPERMIT write FCARDPERMIT;   //권한 상태
    property PositionNum : string read FPositionNum write FPositionNum;
    property REGDATE : string read FREGDATE write FREGDATE;
    property ENDDATE : string read FENDDATE write FENDDATE;
    property EMSTATE : string read FEMSTATE write FEMSTATE;
  published
    property OnCardPermitChange : TCardPermitPacket read FOnCardPermitChange write FOnCardPermitChange;
    property OnCardRcvAckChange : TCardRcvPacket read FOnCardRcvAckChange write FOnCardRcvAckChange;
  end;

  TdmDeviceCard = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDeviceCard: TdmDeviceCard;

implementation
{%CLASSGROUP 'System.Classes.TPersistent'}
uses
  uCommonFunction;

{$R *.dfm}

{ TDeviceCard }

procedure TDeviceCard.CardPermitCheck;
var
  i : integer;
  bPermit : Boolean;
begin
  bPermit := False;
  for i := Low(L_cDoorPermit) to High(L_cDoorPermit) do
  begin
    if L_cDoorPermit[i] = '1' then
    begin
      bPermit := True;
      break;
    end;
  end;
  if Not bPermit then
  begin
    for i := Low(L_cArmAreaPermit) to High(L_cArmAreaPermit) do
    begin
      if L_cArmAreaPermit[i] = '1' then
      begin
        bPermit := True;
        break;
      end;
    end;
  end;
  CARDPERMIT := bPermit;
end;

function TDeviceCard.CheckArmAreaPermit(aArmAreaNo: string): Boolean;
var
  nArmAreaNo :integer;
begin
  result := False;
  if Not isDigit(aArmAreaNo) then Exit;

  nArmAreaNo := strtoint(aArmAreaNo);
  if nArmAreaNo > High(L_cArmAreaPermit)  then Exit;

  if L_cArmAreaPermit[nArmAreaNo] = '1' then result := True;
end;

function TDeviceCard.CheckDoorPermit(aDoorNo: string): Boolean;
var
  nDoorNo :integer;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;

  nDoorNo := strtoint(aDoorNo);
  if nDoorNo > High(L_cDoorPermit)  then Exit;

  if L_cDoorPermit[nDoorNo] = '1' then result := True;
end;

function TDeviceCard.CheckValidDate(aDate: string): Boolean;
begin
  result := False;
  if copy(aDate,3,6) <= copy(ENDDATE,3,6) then result := True;
end;

constructor TDeviceCard.Create(AOwner: TComponent);
var
  i : integer;
begin
  inherited;
  for i := Low(L_cDoorPermit) to High(L_cDoorPermit) do
  begin
    L_cDoorPermit[i] := '0';
  end;
  for i := Low(L_cArmAreaPermit) to High(L_cArmAreaPermit) do
  begin
    L_cArmAreaPermit[i] := '0';
  end;
  for i := Low(L_cTimeCode) to High(L_cTimeCode) do
  begin
    L_cTimeCode[i] := '0';
  end;
  CARDPERMIT := False;
  PermitChange := False;
end;

destructor TDeviceCard.Destroy;
begin

  inherited;
end;


function TDeviceCard.GetArmAreaPermit: string;
var
  i : integer;
  stArmAreaPermit : string;
begin
  stArmAreaPermit := '';
  for i := High(L_cArmAreaPermit) downto 0 do
  begin
    if L_cArmAreaPermit[i] = '' then L_cArmAreaPermit[i] := '0';
    stArmAreaPermit := stArmAreaPermit + L_cArmAreaPermit[i];
  end;
  result := stArmAreaPermit;
end;

function TDeviceCard.GetDoorPermit(aMaxDoorCount:integer): string;
var
  i : integer;
  stDoorPermit : string;
begin
  stDoorPermit := '';
  for i := High(L_cDoorPermit) downto 1 do
  begin
    if L_cDoorPermit[i] = '' then L_cDoorPermit[i] := '0';
    if i > aMaxDoorCount then stDoorPermit := stDoorPermit + '0'
    else stDoorPermit := stDoorPermit + L_cDoorPermit[i];
  end;
  result := stDoorPermit;
end;

function TDeviceCard.GetTimeCode: string;
var
  i : integer;
  stTimeCode : string;
begin
  stTimeCode := '';
  for i := High(L_cTimeCode) downto 1 do
  begin
    if L_cTimeCode[i] = '' then L_cTimeCode[i] := '0';
    stTimeCode := stTimeCode + L_cTimeCode[i];
  end;
  result := stTimeCode;
end;

function TDeviceCard.GetTimeCodeUse: string;
begin
  if L_stTimeCodeUse = '' then L_stTimeCodeUse := '0';
  result := L_stTimeCodeUse;
end;

function TDeviceCard.GetTimeGroup: string;
begin
  if L_stTimeGroup = '' then L_stTimeGroup := '0';
  result := L_stTimeGroup;
end;

function TDeviceCard.GetWeekCode: string;
begin
  L_stWeekCode := FillCharString(L_stWeekCode,'0',7,False);
  result := L_stWeekCode;
end;

procedure TDeviceCard.InitArmAreaPermit(aArmAreaNo: integer; aPermit: string);
begin
  L_cArmAreaPermit[aArmAreaNo] := aPermit[1];
end;

procedure TDeviceCard.InitCardPermit(aPermit: string);
begin
  if aPermit = '0' then CARDPERMIT := False
  else CARDPERMIT := True;
end;

procedure TDeviceCard.InitDoorPermit(aDoorNo: integer; aPermit: string);
begin
  L_cDoorPermit[aDoorNo] := aPermit[1];
end;

procedure TDeviceCard.InitRCVACK(aRcvAck: string);
begin
  RCVACK := aRcvAck;
  if (RCVACK = 'N') OR (RCVACK = 'R') OR (RCVACK = 'S') then
  begin
    //TNode(Device.DeviceNode).CardDownLoadStart := True;
  end;
end;

procedure TDeviceCard.InitTimeCode(aSeq: integer; aTimeCode: string);
begin
  L_cTimeCode[aSeq] := aTimeCode[1];
end;

procedure TDeviceCard.InitTimeCodeUse(aTimeCodeUse: string);
begin
  L_stTimeCodeUse := aTimeCodeUse;
end;

procedure TDeviceCard.InitTimeGroup(aTimeGroup: string);
begin
  L_stTimeGroup := aTimeGroup;
end;

procedure TDeviceCard.InitWeekCode(aWeekCode: string);
begin
  L_stWeekCode := aWeekCode;
end;

procedure TDeviceCard.PermitSetting(aRcvAck:string);
var
  stPermit : string;
  stDoorPermit : string;
  stArmPermit : string;
  stTimeCode : string;
  i : integer;
begin
  if PermitChange then
  begin
    //여기에서 권한 체크 모든 출입문과 방범 권한이 없으면 Permit 을 False로 처리 하자.
    CardPermitCheck;
    //여기에서 변경 이벤트 발생
    if Assigned(FOnCardPermitChange) then
    begin
      if CARDPERMIT then stPermit := '1'
      else stPermit := '0';
      stDoorPermit := '';
      for i := 1 to High(L_cDoorPermit) do
      begin
        stDoorPermit := stDoorPermit + L_cDoorPermit[i];
      end;
      stArmPermit := '';
      for i := 0 to High(L_cArmAreaPermit) do
      begin
        stArmPermit := stArmPermit + L_cArmAreaPermit[i];
      end;
      stTimeCode := '';
      for i := 1 to High(L_cTimeCode) do
      begin
        stTimeCode := stTimeCode + L_cTimeCode[i];
      end;
      OnCardPermitChange(Self,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,CARDNO,stPermit,stDoorPermit,stArmPermit,L_stTimeCodeUse,L_stTimeGroup,stTimeCode,L_stWeekCode);
    end;
    if aRcvAck = '' then aRcvAck := 'Y';  //전송 성공한 자료

    RCVACK := aRcvAck;
  end;
  PermitChange := False;
end;

procedure TDeviceCard.SetArmAreaPermit(aArmAreaNo: integer; aPermit: string);
begin
  if L_cArmAreaPermit[aArmAreaNo] = aPermit[1] then Exit;
  L_cArmAreaPermit[aArmAreaNo] := aPermit[1];
  PermitChange := True;
end;

procedure TDeviceCard.SetDoorPermit(aDoorNo: integer; aPermit: string);
begin
  if L_cDoorPermit[aDoorNo] = aPermit[1] then Exit;
  L_cDoorPermit[aDoorNo] := aPermit[1];
  PermitChange := True;
end;

procedure TDeviceCard.SetRCVACK(const Value: string);
begin
  if FRCVACK = Value then Exit;
  FRCVACK := Value;
  if (Value = 'N') OR (Value = 'R') then
  begin
    //여기에서 노드의 카드데이터 다운로드 타이머 돌리자.
    Device.CardDownloadRCV := False;
    //TNode(Device.DeviceNode).CardDownLoadStart := True;
  end;
  //여기서 RCVACK 상태 변경 이벤트 처리하자.
  if Assigned(FOnCardRcvAckChange) then
  begin
    OnCardRcvAckChange(Self,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,CARDNO,Value,CARDPERMIT);
  end;
end;

procedure TDeviceCard.SetTimeCode(aSeq: integer; aTimeCode: string);
begin
  L_cTimeCode[aSeq] := aTimeCode[1];
end;

procedure TDeviceCard.SetTimeCodeUse(aTimeCodeUse: string);
begin
  L_stTimeCodeUse := aTimeCodeUse;
end;

procedure TDeviceCard.SetTimeGroup(aTimeGroup: string);
begin
  L_stTimeGroup := aTimeGroup;
end;

procedure TDeviceCard.SetWeekCode(aWeekCode: string);
begin
  L_stWeekCode := aWeekCode;
end;

end.
