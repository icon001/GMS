unit uAntiPassLib;

interface

uses
  System.SysUtils, System.Classes,Vcl.ExtCtrls,Vcl.Forms;

const
  con_AntiStartCheckTime = 10; //�̺�Ʈ ��ȣ �ö�� �� üũ �ð�

type
  TAntiPassInOutInitiailize = procedure(Sender: TObject;  aCardNo: string;aInOutState:integer ) of object;

  TAntiPassGroup = class(TComponent)
  private
    L_bAntiPassDestroy : Boolean;
    //AntiCardFreeTimer : TTimer;
    L_dtLastEventTime : TDateTime;
    //AntiStartCheckTimer : TTimer;
    AntiDeviceList : TStringList;
    AntiCardList : TStringList;
    FAntiPassNo: integer;
    FAntiPassGroup: string;
    FAllDeviceConnected: Boolean;
    FAntiStart: Boolean;
    procedure AntiStartCheckTimerTimer(Sender: TObject);
    procedure AntiCardFreeTimerTimer(Sender: TObject);
    procedure SetAllDeviceConnected(const Value: Boolean);
    procedure SetAntiStart(const Value: Boolean);
    procedure AntiPassInOutInitiailize(Sender: TObject;  aCardNo: string;aInOutState:integer );
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    function AntiPassCardCheck(aCardNo:string; aAntiInOut:integer):integer;
    procedure CardEvent(aCardNo,aAccessTime,aReaderNo,aAccessResult:string);
    procedure DeviceAdd(aDeviceID:string);
    procedure DeviceConnected(aDeviceID:string;aConnected:Boolean);
    procedure ReceiveAntiCardInOutSetting(aDeviceID:string;aInGroup,aOutGroup:integer;aCardNo:string);
    procedure ReceiveAntiCardStartBit(aDeviceID:string;aCardStartBit:integer;aCardNo:string);
    procedure ReceiveAntiGlobalStart(aDeviceID:string);
    procedure ReceiveAntiGlobalStop(aDeviceID:string);
  public
    property AntiPassGroup : string Read FAntiPassGroup write FAntiPassGroup; //��Ƽ�н� �׷��ȣ
    property AntiPassNo : integer Read FAntiPassNo write FAntiPassNo; //��Ƽ�н���ȣ
    property AntiStart : Boolean read FAntiStart write SetAntiStart;
    property AllDeviceConnected:Boolean Read FAllDeviceConnected Write SetAllDeviceConnected;  //�׷쳻 ��ü ��Ʈ�ѷ� ���� �Ϸ� �Ǿ����� üũ
  end;

  TAntiPassCard = class(TComponent)
  private
    FInOutState: integer;
    FSendComplete: integer;
    FLastAccessTime: TDateTime;
    FCardNo: string;
    FSendFreeState: Boolean;
    FLastAuthTime: TDateTime;
    FOnAntiPassInOutInitiailize: TAntiPassInOutInitiailize;
    procedure SetInOutState(const Value: integer);
    procedure SetSendComplete(const Value: integer);
    procedure SetSendFreeState(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property CardNo : string read FCardNo write FCardNo;
    property InOutState : integer Read FInOutState Write SetInOutState;
    property SendComplete : integer Read FSendComplete Write SetSendComplete;
    property SendFreeState : Boolean Read FSendFreeState Write SetSendFreeState;
    property LastAccessTime : TDateTime read FLastAccessTime write FLastAccessTime; //���� �±׽ð�
    property LastAuthTime : TDateTime read FLastAuthTime write FLastAuthTime;    //���� �����ð�
  published
    property OnAntiPassInOutInitiailize : TAntiPassInOutInitiailize read FOnAntiPassInOutInitiailize write FOnAntiPassInOutInitiailize;               //������ ����
  end;

  TAntiPassDevice = class(TComponent)
  private
//    AntiPassTimeSyncSendTimer : TTimer;
//    AntiPassCardSendTimer : TTimer;
//    AntiPassCardInitializeSendTimer : TTimer;
//    AntiPassSettingSendTimer : TTimer;
    DeviceAntiCardList : TStringList;
    L_bComponentDestroy : Boolean;
    L_nSendCardSeq : integer;
    L_nSendCardInitSeq : integer;
    L_nAntiPassInitSendCount : integer;
    L_bAntiPassInitSending : Boolean;  //ī���ʱ�ȭ �������̸�...
    L_nAntiPassSendCount : integer;
    L_bAntiPassSending : Boolean;
    FDeviceConnected: Boolean;
    FDeviceID: string;
    FAntiGroup: TAntiPassGroup;
    FAntiStart: Boolean;
    FRCVAntiPassCardStopBit: string;
    FRCVAntiStart: string;
    FAntiPassCardClear: Boolean;
    procedure AntiPassCardSendTimerTimer(Sender: TObject);
    procedure AntiPassCardInitializeSendTimerTimer(Sender:TObject);
    procedure AntiPassSettingSendTimerTimer(Sender:TObject);
    procedure AntiPassTimeSyncSendTimerTimer(Sender:TObject);
    procedure SetDeviceConnected(const Value: Boolean);
    procedure Send_AntiPassStartAndStop;
    procedure Send_AntiPassCardStopBit;
    procedure Send_AntiPassCard(aCardNo:string;aInOutState:integer);
    procedure Send_AntiPassCardInitialize(aCardNo:string);
    procedure Send_AntiTimeSync;
    procedure SetAntiStart(const Value: Boolean);
    procedure SetRCVAntiPassCardStopBit(const Value: string);
    procedure SetRCVAntiStart(const Value: string);
    procedure SetAntiPassCardClear(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure AntiCard_Add(aCardNo:string;aInOutState:integer);
    procedure CardInOutTimeInitialize(aCardNo:string);
    procedure ReceiveAntiCardInSetting(aCardNo:string);
    procedure ReceiveAntiCardOutSetting(aCardNo:string);
    procedure ReceiveAntiCardSetting(aCardNo:string);
    procedure ReceiveAntiCardInitialize(aCardNo:string;aCardStartBit:integer);
  published
    property AntiGroup : TAntiPassGroup Read FAntiGroup write FAntiGroup;
    property AntiStart : Boolean read FAntiStart write SetAntiStart;                    //��Ʈ�ѷ� �۷ι� ��Ƽ�н� ���� ����
    property AntiPassCardClear : Boolean read FAntiPassCardClear write SetAntiPassCardClear;
    property DeviceConnected : Boolean Read FDeviceConnected Write SetDeviceConnected;
    property DeviceID : string read FDeviceID write FDeviceID;
    property RCVAntiPassCardStopBit : string read FRCVAntiPassCardStopBit write SetRCVAntiPassCardStopBit; //��Ƽī�� Start ��������
    property RCVAntiStart : string read FRCVAntiStart write SetRCVAntiStart; //��Ƽ�н� ���� ��������
  end;


  TdmAntiPassGroup = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAntiPassGroup: TdmAntiPassGroup;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDeviceVariable,
  uNodeServer,
  uNode;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TAntiPassGroup }

procedure TAntiPassGroup.AntiCardFreeTimerTimer(Sender: TObject);
var
  dtFreeTime: TDatetime;
  nAntiFreeTime : integer;
  i : integer;
begin
(*  if Not isDigit(G_stAntiFreeTime) then Exit;
  nAntiFreeTime := strtoint(G_stAntiFreeTime);
  if nAntiFreeTime = 0 then Exit;
  if AntiCardList = nil then Exit;
  if AntiCardList.Count = 0 then Exit;

  Try
    AntiCardFreeTimer.Enabled := False;
    for i := 0 to AntiCardList.Count - 1 do
    begin
      if L_bAntiPassDestroy then Exit;
      dtFreeTime:= IncTime(TAntiPassCard(AntiCardList.Objects[i]).LastAuthTime,0,nAntiFreeTime,0,0);
      if dtFreeTime < now then
      begin
        TAntiPassCard(AntiCardList.Objects[i]).InOutState := -1;
      end;
      Application.ProcessMessages;
    end;
  Finally
    AntiCardFreeTimer.Enabled := Not L_bAntiPassDestroy;
  End;
*)
end;

function TAntiPassGroup.AntiPassCardCheck(aCardNo: string;
  aAntiInOut: integer): integer;
var
  nIndex : integer;
  oAntiGroupCardList : TAntiPassCard;
  dtCheckTime : TDateTime;
  stNowTime : string;
begin
  result := con_NOTRESULTED; //�ʱ� ���°�
  nIndex := AntiCardList.IndexOf(aCardNo);
  if nIndex < 0 then
  begin
    oAntiGroupCardList := TAntiPassCard.Create(nil);
    oAntiGroupCardList.InOutState := aAntiInOut;
    oAntiGroupCardList.LastAccessTime := Now;
    AntiCardList.AddObject(aCardNo,oAntiGroupCardList);
    Exit;
  end;

  if Not AllDeviceConnected then Exit; //Anti�׷쳻 ��� ��Ʈ�ѷ��� Connect ���� �϶��� ��Ƽ�н� üũ ����.

  if TAntiPassCard(AntiCardList.Objects[nIndex]).InOutState = aAntiInOut then
  begin
    if G_nAntiFreeTimeUse = 0 then    //��Ƽ �ʱ�ȭ ������� ������ ��Ƽ�н� ���� ����
    begin
      result := con_NOTAUTH ;
    end else                            //��Ƽ �ʱ�ȭ ����ϸ� �ð� üũ
    begin
      if G_stGlobalAntiInitStartTime < G_stGlobalAntiInitEndTime then
      begin
        stNowTime := FormatDateTime('hhnn',now);
        if (G_stGlobalAntiInitStartTime < stNowTime ) and ( stNowTime < G_stGlobalAntiInitEndTime) then     //��Ƽ �ʱ�ȭ �ð��̸� �ð�üũ
        begin
          dtCheckTime := IncTime(TAntiPassCard(AntiCardList.Objects[nIndex]).LastAccessTime,0,strtoint(G_stAntiFreeTime),0,0);
          if dtCheckTime < now then
          begin
            result := con_NOTRESULTED;
            TAntiPassCard(AntiCardList.Objects[nIndex]).LastAccessTime := Now;
          end else
          begin
            result := con_NOTAUTH;
          end;
        end else
        begin
          result := con_NOTAUTH;
        end;
      end else
      begin
        stNowTime := FormatDateTime('hhnn',now);
        if (G_stGlobalAntiInitStartTime < stNowTime ) or ( stNowTime < G_stGlobalAntiInitEndTime) then
        begin
          dtCheckTime := IncTime(TAntiPassCard(AntiCardList.Objects[nIndex]).LastAccessTime,0,strtoint(G_stAntiFreeTime),0,0);
          if dtCheckTime < now then
          begin
            result := con_NOTRESULTED;
            TAntiPassCard(AntiCardList.Objects[nIndex]).LastAccessTime := Now;
          end else
          begin
            result := con_NOTAUTH;
          end;
        end else
        begin
          result := con_NOTAUTH;
        end;
      end;
    end;
  end else
  begin
    TAntiPassCard(AntiCardList.Objects[nIndex]).InOutState := aAntiInOut;
    TAntiPassCard(AntiCardList.Objects[nIndex]).LastAccessTime := Now;
    result := con_AUTH;
  end;

end;

procedure TAntiPassGroup.AntiPassInOutInitiailize(Sender: TObject;
  aCardNo: string; aInOutState: integer);
var
  i : integer;
begin
  if AntiDeviceList = nil then Exit;

  if AntiDeviceList.Count < 1 then Exit;

  if aInOutState = -1 then  //Ÿ�� �ʱ�ȭ �ð��̴�... ���⼭ ī�嵥���� �ʱ�ȭ ���� ����...
  begin
    if G_nAntiLog = 1 then LogSave(G_stLogDirectory + '\AntiLog' + FormatDateTime('yyyymmdd',now) + '.log','AntiPassInOutInitiailize,' + aCardNo);
    for i := 0 to AntiDeviceList.Count - 1 do
    begin
      TAntiPassDevice(AntiDeviceList.Objects[i]).CardInOutTimeInitialize(aCardNo);
    end;
  end;
end;

procedure TAntiPassGroup.AntiStartCheckTimerTimer(Sender: TObject);
var
  dtTimeOut: TDatetime;
begin
(*  Try
    AntiStartCheckTimer.Enabled := False;
    dtTimeOut:= IncTime(L_dtLastEventTime,0,0,con_AntiStartCheckTime,0);
    if Now > dtTimeOut then
    begin
      AntiStart := True;
    end else
    begin
      AntiStartCheckTimer.Enabled := True;
    end;
  Finally

  End;
*)
end;

procedure TAntiPassGroup.CardEvent(aCardNo, aAccessTime, aReaderNo,aAccessResult: string);
var
  nIndex : integer;
  oAntiCard : TAntiPassCard;
  nReaderNo : integer;
  nInOut : integer;
  bDeviceSetting : Boolean;
  i : integer;
  dtAccessTime : TDateTime;
begin
  if Not isDigit(aReaderNo) then Exit;
  L_dtLastEventTime := Now;
  if Not isDigit(aAccessResult) then Exit; //�̽����� ���� ���� ������...

//DEBUG
//    LogSave(G_stLogDirectory + '\AntiDebug.log','CARDEVENT:' + aCardNo);
  bDeviceSetting := False;
  nReaderNo := strtoint(aReaderNo);
  nInOut := nReaderNo mod 2;

  dtAccessTime := strtodate(copy(aAccessTime,1,4) + '-' + copy(aAccessTime,5,2) + '-' + copy(aAccessTime,7,2) + ' ' + copy(aAccessTime,9,2) + ':' + copy(aAccessTime,11,2) + ':' + copy(aAccessTime,13,2));

  nIndex := AntiCardList.IndexOf(aCardNo);
  if nIndex < 0 then
  begin
    oAntiCard := TAntiPassCard.Create(nil);
    oAntiCard.OnAntiPassInOutInitiailize := AntiPassInOutInitiailize;
    oAntiCard.CardNo := aCardNo;
    oAntiCard.LastAccessTime := dtAccessTime;
    oAntiCard.LastAuthTime := Now;
    oAntiCard.InOutState := nInOut;

    AntiCardList.AddObject(aCardNo,oAntiCard);
    bDeviceSetting := True;
  end else
  begin
    if TAntiPassCard(AntiCardList.Objects[nIndex]).LastAccessTime <= dtAccessTime then    //��Ʈ�ѷ� �ð����� ó������ //PC�� ��� ���� ������� ó������.
    begin
      TAntiPassCard(AntiCardList.Objects[nIndex]).LastAccessTime := dtAccessTime;
      TAntiPassCard(AntiCardList.Objects[nIndex]).LastAuthTime := Now;
      if TAntiPassCard(AntiCardList.Objects[nIndex]).InOutState <> nInOut then
      begin
        TAntiPassCard(AntiCardList.Objects[nIndex]).InOutState := nInOut;
        bDeviceSetting := True;
      end;
    end;
  end;

  if Not bDeviceSetting then Exit;

  if AntiDeviceList.Count < 1 then Exit;


  for i := 0 to AntiDeviceList.Count - 1 do
  begin
    TAntiPassDevice(AntiDeviceList.Objects[i]).AntiCard_Add(aCardNo, nInOut);
  end;

end;

constructor TAntiPassGroup.Create(AOwner: TComponent);
begin
  inherited;
  L_bAntiPassDestroy := False;
  AntiDeviceList := TStringList.Create;
  AntiCardList := TStringList.Create;
//  AntiStartCheckTimer := TTimer.Create(nil);
//  AntiStartCheckTimer.OnTimer := AntiStartCheckTimerTimer;
//  AntiStartCheckTimer.Interval := 1000;
//  AntiStartCheckTimer.Enabled := False;

//  AntiCardFreeTimer := TTimer.Create(nil);
//  AntiCardFreeTimer.Interval := 1000;
//  AntiCardFreeTimer.OnTimer := AntiCardFreeTimerTimer;
//  AntiCardFreeTimer.Enabled := True;
end;

destructor TAntiPassGroup.Destroy;
begin
  L_bAntiPassDestroy := True;
//  AntiStartCheckTimer.Enabled := False;
//  AntiStartCheckTimer.Free;
  AntiDeviceList.Free;

//  AntiCardFreeTimer.Enabled := False;
//  AntiCardFreeTimer.Free;
  inherited;
end;

procedure TAntiPassGroup.DeviceAdd(aDeviceID: string);
var
  nIndex : integer;
  oAntiDevice : TAntiPassDevice;
  i : integer;
begin
  nIndex := AntiDeviceList.IndexOf(aDeviceID);
  if nIndex > -1 then Exit;
  oAntiDevice := TAntiPassDevice.Create(nil);
  oAntiDevice.DeviceID := aDeviceID;
  oAntiDevice.AntiGroup := Self;

  if AntiCardList.Count > 0 then
  begin
    for i := 0 to AntiCardList.Count - 1 do oAntiDevice.AntiCard_Add(TAntiPassCard(AntiCardList.Objects[i]).CardNo,TAntiPassCard(AntiCardList.Objects[i]).InOutState);  //�׷� ī�带 ��ü ��� ����...
  end;
  AntiDeviceList.AddObject(aDeviceID,oAntiDevice);
end;

procedure TAntiPassGroup.DeviceConnected(aDeviceID: string;
  aConnected: Boolean);
var
  nIndex : integer;
  i : integer;
  bAllConnected : Boolean;
begin
  nIndex := AntiDeviceList.IndexOf(aDeviceID);
  if nIndex < 0 then
  begin
    DeviceAdd(aDeviceID);
    nIndex := AntiDeviceList.IndexOf(aDeviceID);
  end;
  if nIndex < 0 then Exit;
  TAntiPassDevice(AntiDeviceList.Objects[nIndex]).DeviceConnected := aConnected;
  if AntiDeviceList.Count < 1 then Exit;
  bAllConnected := True;
  for i := 0 to AntiDeviceList.Count - 1 do
  begin
    if Not TAntiPassDevice(AntiDeviceList.Objects[i]).DeviceConnected then
    begin
      bAllConnected := False;
      Break;
    end;
  end;
  AllDeviceConnected := bAllConnected;
end;

procedure TAntiPassGroup.ReceiveAntiCardInOutSetting(aDeviceID:string;aInGroup,
  aOutGroup: integer; aCardNo: string);
var
  nIndex : integer;
begin
  nIndex := AntiDeviceList.IndexOf(aDeviceID);
  if nIndex < 0 then Exit;
  //TAntiPassDevice(AntiDeviceList.Objects[nIndex]).ReceiveAntiCardSetting(aCardNo);

  if aInGroup = AntiPassNo then   //�ԽǱ׷��� ���� �׷�� �����ϸ�
  begin
    TAntiPassDevice(AntiDeviceList.Objects[nIndex]).ReceiveAntiCardInSetting(aCardNo);
  end;
  if aOutGroup = AntiPassNo then  //��Ǳ׷��� ���� �׷�� �����ϸ�
  begin
    TAntiPassDevice(AntiDeviceList.Objects[nIndex]).ReceiveAntiCardOutSetting(aCardNo);
  end;
end;

procedure TAntiPassGroup.ReceiveAntiCardStartBit(aDeviceID: string;
  aCardStartBit: integer;aCardNo:string);
var
  nIndex : integer;
begin
  nIndex := AntiDeviceList.IndexOf(aDeviceID);
  if nIndex < 0 then Exit;
  if aCardNo = '' then
  begin
    if aCardStartBit = 1 then  //����1ȸ ��Ƽ�н� ����
    begin
      if TAntiPassDevice(AntiDeviceList.Objects[nIndex]).AntiPassCardClear then TAntiPassDevice(AntiDeviceList.Objects[nIndex]).RCVAntiPassCardStopBit := 'Y';
    end else                   //��Ƽ�н� ���� ����
    begin
      if Not TAntiPassDevice(AntiDeviceList.Objects[nIndex]).AntiPassCardClear then TAntiPassDevice(AntiDeviceList.Objects[nIndex]).RCVAntiPassCardStopBit := 'Y';
    end;
  end else
  begin
    TAntiPassDevice(AntiDeviceList.Objects[nIndex]).ReceiveAntiCardInitialize(aCardNo,aCardStartBit);
  end;
end;

procedure TAntiPassGroup.ReceiveAntiGlobalStart(aDeviceID: string);
var
  nIndex : integer;
begin
  nIndex := AntiDeviceList.IndexOf(aDeviceID);
  if nIndex < 0 then Exit;
  if TAntiPassDevice(AntiDeviceList.Objects[nIndex]).AntiStart then TAntiPassDevice(AntiDeviceList.Objects[nIndex]).RCVAntiStart := 'Y';
end;

procedure TAntiPassGroup.ReceiveAntiGlobalStop(aDeviceID: string);
var
  nIndex : integer;
begin
  nIndex := AntiDeviceList.IndexOf(aDeviceID);
  if nIndex < 0 then Exit;
  if Not TAntiPassDevice(AntiDeviceList.Objects[nIndex]).AntiStart then TAntiPassDevice(AntiDeviceList.Objects[nIndex]).RCVAntiStart := 'Y';
end;

procedure TAntiPassGroup.SetAllDeviceConnected(const Value: Boolean);
begin
  if FAllDeviceConnected = Value then Exit;

  FAllDeviceConnected := Value;

  if Value then  //��ü ���� �Ϸ� �Ǹ�
  begin
    L_dtLastEventTime := Now;
    //10�� ¥�� Ÿ�̸� ������ 10�� ���� ������ ��� ���°� ������ ��Ƽ�н� ���� �ϵ��� ����
//    AntiStartCheckTimer.Enabled := True;
//DEBUG
//    LogSave(G_stLogDirectory + '\AntiDebug.log','AllDeviceConnected');
  end else       //�ϳ��� ��Ⱑ ���� ����
  begin
    //��ü ��⿡ ��Ƽ�н� ���� ���� �ʵ��� ���� ����
    AntiStart := False;
//DEBUG
//    LogSave(G_stLogDirectory + '\AntiDebug.log','AllDeviceDisConnected');
  end;
end;

procedure TAntiPassGroup.SetAntiStart(const Value: Boolean);
var
  i : integer;
begin
  if FAntiStart = Value then Exit;
  FAntiStart := Value;
  //���⼭ �� ��Ʈ�ѷ��� AntiStart ������ ���� ����...
  Try
    if AntiDeviceList = nil then Exit;

    if AntiDeviceList.Count < 1 then Exit;
    for i := 0 to AntiDeviceList.Count - 1 do
    begin
      TAntiPassDevice(AntiDeviceList.Objects[i]).AntiStart := Value;
    end;
  Except
    Exit;
  End;
end;

{ TAntiPassCard }

constructor TAntiPassCard.Create(AOwner: TComponent);
begin
  inherited;
  InOutState := -1;
  SendFreeState := True;
  LastAuthTime := Now;
end;

destructor TAntiPassCard.Destroy;
begin
  inherited;
end;

procedure TAntiPassCard.SetInOutState(const Value: integer);
begin
  if FInOutState = Value then Exit;

  if G_nAntiLog = 1 then LogSave(G_stLogDirectory + '\AntiLog' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(Value) + ',' + CardNo);
  FInOutState := Value;
  if Assigned(FOnAntiPassInOutInitiailize) then
  begin
    OnAntiPassInOutInitiailize(Self,CardNo,Value);
  end;

  if Value <> -1 then SendComplete := 0;
end;

procedure TAntiPassCard.SetSendComplete(const Value: integer);
begin
  if FSendComplete = Value then Exit;

  FSendComplete := Value;
  if Value = 0 then SendFreeState := True; //�����ؾ� �� ī���̸� �ʱ�ȭ�� �������� ����.

end;

procedure TAntiPassCard.SetSendFreeState(const Value: Boolean);
begin
  FSendFreeState := Value;
end;

{ TAntiPassDevice }

procedure TAntiPassDevice.AntiCard_Add(aCardNo: string; aInOutState: integer);
var
  nIndex : integer;
  oAntiCard : TAntiPassCard;
begin
  nIndex := DeviceAntiCardList.IndexOf(aCardNo);
  if nIndex < 0 then
  begin
    oAntiCard := TAntiPassCard.Create(nil);
    oAntiCard.CardNo := aCardNo;
    oAntiCard.InOutState := aInOutState;
    oAntiCard.SendComplete := 0;
    DeviceAntiCardList.AddObject(aCardNo,oAntiCard);
  end else
  begin
    TAntiPassCard(DeviceAntiCardList.Objects[nIndex]).InOutState := aInOutState;
    TAntiPassCard(DeviceAntiCardList.Objects[nIndex]).SendComplete := 0;
  end;
end;

procedure TAntiPassDevice.AntiPassCardInitializeSendTimerTimer(Sender: TObject);
var
  i : integer;
begin
(*  if DeviceAntiCardList.Count < 1 then Exit;
  Try
    AntiPassCardInitializeSendTimer.Enabled := False;
    if L_bAntiPassInitSending then
    begin
      L_nAntiPassInitSendCount := L_nAntiPassInitSendCount + 1;
      if L_nAntiPassInitSendCount > 10 then    //5�� ���� ������ ��ٸ���.
      begin
        L_nAntiPassInitSendCount := 0;
        L_bAntiPassInitSending := False;
      end;
      Exit;
    end;
    if (DeviceAntiCardList.Count - 1) < L_nSendCardInitSeq then L_nSendCardInitSeq := 0;
    for i := L_nSendCardInitSeq to DeviceAntiCardList.Count - 1 do
    begin
      L_nSendCardInitSeq := i + 1;
      if Not TAntiPassCard(DeviceAntiCardList.Objects[i]).SendFreeState then
      begin
        L_bAntiPassInitSending := True;
        Send_AntiPassCardInitialize(TAntiPassCard(DeviceAntiCardList.Objects[i]).CardNo);
        break;
      end;
      Application.ProcessMessages;
    end;
  Finally
    AntiPassCardInitializeSendTimer.Enabled := Not L_bComponentDestroy;
  End;
*)
end;

procedure TAntiPassDevice.AntiPassCardSendTimerTimer(Sender: TObject);
var
  i : integer;
  nSendComplete : integer;
begin
  if DeviceAntiCardList.Count < 1 then Exit;
  if L_bAntiPassSending then
  begin
    L_nAntiPassSendCount := L_nAntiPassSendCount + 1;
    if L_nAntiPassSendCount > 10 then
    begin
      L_nAntiPassSendCount := 0;
      L_bAntiPassSending := False;
    end;
    Exit;
  end;

  Try
    L_bAntiPassSending := True;
    if (DeviceAntiCardList.Count - 1) < L_nSendCardSeq then L_nSendCardSeq := 0;
    //for i := L_nSendCardSeq to DeviceAntiCardList.Count - 1 do    //20151223 ��Ƽ�н��� ������ ó�� �ϱ� ���� ��� ����
    for i := 0 to DeviceAntiCardList.Count - 1 do
    begin
      L_nSendCardSeq := i + 1;
      nSendComplete := TAntiPassCard(DeviceAntiCardList.Objects[i]).SendComplete;
      if nSendComplete = 0 then
      begin
        Send_AntiPassCard(TAntiPassCard(DeviceAntiCardList.Objects[i]).CardNo,TAntiPassCard(DeviceAntiCardList.Objects[i]).InOutState);
        TAntiPassCard(DeviceAntiCardList.Objects[i]).SendComplete := -10;
        //break; //20151223 ��Ƽ�н��� ������ ó�� �ϱ� ���� ��� ����
      end else if nSendComplete < 0 then
      begin
        TAntiPassCard(DeviceAntiCardList.Objects[i]).SendComplete := nSendComplete + 1; //2�� ���� �ȳ������� ������
      end;
      Application.ProcessMessages;
    end;
  Finally
    L_bAntiPassSending := False;
  End;

end;

procedure TAntiPassDevice.AntiPassSettingSendTimerTimer(Sender: TObject);
begin
(*  //��Ƽ�н�ī�� ������ �������� ���� ��� ��������.
  if RCVAntiPassCardStopBit <> 'Y' then
     Send_AntiPassCardStopBit;
  //�������� ���� ���� ��� ������ ���� ����.
  if RCVAntiStart <> 'Y' then
     Send_AntiPassStartAndStop;

  if (RCVAntiPassCardStopBit = 'Y') and (RCVAntiStart = 'Y') then AntiPassSettingSendTimer.Enabled := False; //�ΰ� ��� ���� �Ϸ� ���¸� Ÿ�̸� ����
*)
end;

procedure TAntiPassDevice.AntiPassTimeSyncSendTimerTimer(Sender: TObject);
begin
  Send_AntiTimeSync;
end;

procedure TAntiPassDevice.CardInOutTimeInitialize(aCardNo: string);
var
  nIndex : integer;
begin
  nIndex := DeviceAntiCardList.IndexOf(aCardNo);
  if nIndex > -1 then
  begin
    TAntiPassCard(DeviceAntiCardList.Objects[nIndex]).InOutState := -1;
    TAntiPassCard(DeviceAntiCardList.Objects[nIndex]).SendFreeState := False;
  end;
end;

constructor TAntiPassDevice.Create(AOwner: TComponent);
begin
  inherited;
  L_bComponentDestroy := False;
  DeviceAntiCardList := TStringList.Create;
(*  AntiPassCardSendTimer := TTimer.Create(nil);
  AntiPassCardSendTimer.Interval := 200;
  AntiPassCardSendTimer.OnTimer := AntiPassCardSendTimerTimer;
  AntiPassCardSendTimer.Enabled := False;

  AntiPassCardInitializeSendTimer := TTimer.Create(nil);
  AntiPassCardInitializeSendTimer.Interval := 500;
  AntiPassCardInitializeSendTimer.OnTimer := AntiPassCardInitializeSendTimerTimer;
  AntiPassCardInitializeSendTimer.Enabled := False;

  AntiPassSettingSendTimer := TTimer.Create(nil);
  AntiPassSettingSendTimer.Interval := 3000;
  AntiPassSettingSendTimer.OnTimer := AntiPassSettingSendTimerTimer;
  AntiPassSettingSendTimer.Enabled := False;


  AntiPassTimeSyncSendTimer := TTimer.Create(nil);
  AntiPassTimeSyncSendTimer.Interval := 1000 * 60 * 30; //30�п� �ѹ��� �ð� ����ȭ ����.
  AntiPassTimeSyncSendTimer.OnTimer := AntiPassTimeSyncSendTimerTimer;
  AntiPassTimeSyncSendTimer.Enabled := True;
*)
  AntiGroup := nil;

  DeviceConnected := False;
end;

destructor TAntiPassDevice.Destroy;
var
  i : integer;
begin
  L_bComponentDestroy := True;
(*  AntiPassCardSendTimer.Enabled := False;
  AntiPassCardSendTimer.Free;
  AntiPassCardInitializeSendTimer.Enabled := False;
  AntiPassCardInitializeSendTimer.Free;
  AntiPassSettingSendTimer.Enabled := False;
  AntiPassSettingSendTimer.Free;
  AntiPassTimeSyncSendTimer.Enabled := False;
  AntiPassTimeSyncSendTimer.Free;
*)
  if DeviceAntiCardList.Count > 0 then
  begin
    for i := DeviceAntiCardList.Count - 1 downto 0 do TAntiPassCard(DeviceAntiCardList.Objects[i]).Free;
  end;
  DeviceAntiCardList.Clear;
  DeviceAntiCardList.Free;
  inherited;
end;

procedure TAntiPassDevice.ReceiveAntiCardInitialize(aCardNo: string;
  aCardStartBit: integer);
var
  nIndex : integer;
begin
  if aCardStartBit <> 1 then Exit; //��Ƽ�н� ���� ���� �� ���� ���� ������...
  nIndex := DeviceAntiCardList.IndexOf(aCardNo);
  if nIndex < 0 then Exit;
  TAntiPassCard(DeviceAntiCardList.Objects[nIndex]).SendFreeState := True;

end;

procedure TAntiPassDevice.ReceiveAntiCardInSetting(aCardNo: string);
var
  nIndex : integer;
begin
  nIndex := DeviceAntiCardList.IndexOf(aCardNo);
  if nIndex < 0 then Exit;
  if (TAntiPassCard(DeviceAntiCardList.Objects[nIndex]).InOutState = -1) or (TAntiPassCard(DeviceAntiCardList.Objects[nIndex]).InOutState = 1) then  //���� ���°� In �����̸�
  begin
    //L_bAntiPassSending := False; //20151223
    TAntiPassCard(DeviceAntiCardList.Objects[nIndex]).SendComplete := 1;
  end;
end;

procedure TAntiPassDevice.ReceiveAntiCardOutSetting(aCardNo: string);
var
  nIndex : integer;
begin
  nIndex := DeviceAntiCardList.IndexOf(aCardNo);
  if nIndex < 0 then Exit;
  if (TAntiPassCard(DeviceAntiCardList.Objects[nIndex]).InOutState = -1) or (TAntiPassCard(DeviceAntiCardList.Objects[nIndex]).InOutState = 0) then  //���� ���°� Out �����̸�
  begin
    //L_bAntiPassSending := False;  //20151223
    TAntiPassCard(DeviceAntiCardList.Objects[nIndex]).SendComplete := 1;
  end;
end;

procedure TAntiPassDevice.ReceiveAntiCardSetting(aCardNo: string);
var
  nIndex : integer;
begin
  nIndex := DeviceAntiCardList.IndexOf(aCardNo);
  if nIndex < 0 then Exit;
  //L_bAntiPassSending := False; //20151223
  TAntiPassCard(DeviceAntiCardList.Objects[nIndex]).SendComplete := 1;
end;

procedure TAntiPassDevice.Send_AntiPassCard(aCardNo: string;
  aInOutState: integer);
var
  stNodeNo : string;
  stEcuID : string;
  nIndex : integer;
  stData : string;
begin
  if Not DeviceConnected then Exit;
  if AntiGroup = nil then Exit;
  if aInOutState = -1 then Exit;

  stData := 'AP11 1 ' ;
  if aInOutState = 1 then stData := stData + FillZeroNumber(AntiGroup.AntiPassNo,2) + ' 00'    //1�̸� �Խ�,0�̸� ���
  else if aInOutState = 0 then stData := stData + '00 ' + FillZeroNumber(AntiGroup.AntiPassNo,2);
  stData := stData + ' ' + aCardNo;

  stNodeNo := copy(DeviceID,1,G_nNodeCodeLength);
  stEcuID := copy(DeviceID,1 + G_nNodeCodeLength,2);
  nIndex := NodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SendPacket(stEcuID,'R',TNode(NodeList.Objects[nIndex]).GetSendMsgNo,TNode(NodeList.Objects[nIndex]).GetDeviceVer,stData,0); //�ְ��������� ������
  end else
  begin
    nIndex := ServerNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      dmNodeServer.DeviceNodeServer_SendPacket(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID ,'R',stData,2);
    end;
  end;
  if G_nAntiLog = 1 then LogSave(G_stLogDirectory + '\AntiLog' + FormatDateTime('yyyymmdd',now) + '.log','[TX]' + DeviceID + ',' + stData);
end;

procedure TAntiPassDevice.Send_AntiPassCardInitialize(aCardNo: string);
var
  stNodeNo : string;
  stEcuID : string;
  nIndex : integer;
  stData : string;
begin
  if Not DeviceConnected then Exit;

  stData := 'AP15 1 01 00 ' + aCardNo;

  stNodeNo := copy(DeviceID,1,G_nNodeCodeLength);
  stEcuID := copy(DeviceID,1 + G_nNodeCodeLength,2);
  nIndex := NodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    if TNode(NodeList.Objects[nIndex]).NodeConnected = csConnected then
      TNode(NodeList.Objects[nIndex]).SendPacket(stEcuID,'R',TNode(NodeList.Objects[nIndex]).GetSendMsgNo,TNode(NodeList.Objects[nIndex]).GetDeviceVer,stData,1);
  end else
  begin
    nIndex := ServerNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      dmNodeServer.DeviceNodeServer_SendPacket(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID ,'R',stData,1);
    end;
  end;
  if G_nAntiLog = 1 then LogSave(G_stLogDirectory + '\AntiLog' + FormatDateTime('yyyymmdd',now) + '.log','[TX]' + DeviceID + ',' + stData);
end;

procedure TAntiPassDevice.Send_AntiPassCardStopBit;
var
  stNodeNo : string;
  stEcuID : string;
  nIndex : integer;
  stData : string;
begin
  if Not DeviceConnected then Exit;
  if Not AntiPassCardClear then Exit; //AntiPassCard Set �� ��쿡�� ���� ���� �� �ʿ䰡 ����.

  stData := 'AP15 a ';
  if AntiPassCardClear then stData := stData + '01'
  else stData := stData + '00';

  stNodeNo := copy(DeviceID,1,G_nNodeCodeLength);
  stEcuID := copy(DeviceID,1 + G_nNodeCodeLength,2);
  nIndex := NodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    if TNode(NodeList.Objects[nIndex]).NodeConnected = csConnected then
      TNode(NodeList.Objects[nIndex]).SendPacket(stEcuID,'R',TNode(NodeList.Objects[nIndex]).GetSendMsgNo,TNode(NodeList.Objects[nIndex]).GetDeviceVer,stData,1);
  end else
  begin
    nIndex := ServerNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      dmNodeServer.DeviceNodeServer_SendPacket(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID ,'R',stData,1);
    end;
  end;
  if G_nAntiLog = 1 then LogSave(G_stLogDirectory + '\AntiLog' + FormatDateTime('yyyymmdd',now) + '.log','[TX]' + DeviceID + ',' + stData);
end;

procedure TAntiPassDevice.Send_AntiPassStartAndStop;
var
  stNodeNo : string;
  stEcuID : string;
  nIndex : integer;
  stData : string;
begin
  Try
    if Not DeviceConnected then Exit;
    stData := 'AP16';
    if AntiStart then stData := stData + 'FF'
    else stData := stData + '00';

    stNodeNo := copy(DeviceID,1,G_nNodeCodeLength);
    stEcuID := copy(DeviceID,1 + G_nNodeCodeLength,2);
    nIndex := NodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      if TNode(NodeList.Objects[nIndex]).NodeConnected = csConnected then
        TNode(NodeList.Objects[nIndex]).SendPacket(stEcuID,'R',TNode(NodeList.Objects[nIndex]).GetSendMsgNo,TNode(NodeList.Objects[nIndex]).GetDeviceVer,stData,1);
    end else
    begin
      nIndex := ServerNodeList.IndexOf(stNodeNo);
      if nIndex > -1 then
      begin
        dmNodeServer.DeviceNodeServer_SendPacket(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID ,'R',stData,1);
      end;
    end;
    if G_nAntiLog = 1 then LogSave(G_stLogDirectory + '\AntiLog' + FormatDateTime('yyyymmdd',now) + '.log','[TX]' + DeviceID + ',' + stData);
  Except
    Exit;
  End;
end;



procedure TAntiPassDevice.Send_AntiTimeSync;
var
  stNodeNo : string;
  nIndex : integer;
begin
  if Not DeviceConnected then Exit;
  stNodeNo := copy(DeviceID,1,G_nNodeCodeLength);
  nIndex := NodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    if TNode(NodeList.Objects[nIndex]).NodeConnected = csConnected then
      TNode(NodeList.Objects[nIndex]).ControlNodeToDeviceTimeSync;
  end else
  begin
    nIndex := ServerNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      dmNodeServer.DeviceNodeServer_ControlNodeToDeviceTimeSync(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket);
    end;
  end;
end;

procedure TAntiPassDevice.SetAntiPassCardClear(const Value: Boolean);
var
  i : integer;
begin
  if FAntiPassCardClear = Value then Exit;

  FAntiPassCardClear := Value;

  if Value then
  begin
    RCVAntiPassCardStopBit := 'N';
    if DeviceAntiCardList = nil then Exit;

    if DeviceAntiCardList.Count > 0 then
    begin
      TAntiPassCard(DeviceAntiCardList.Objects[i]).SendFreeState := True; //AntiPassCardStop ���� �ÿ��� ������ ī�� �ʱ�ȭ ������ ���� �ʿ䰡 ����.
    end;
  end;
end;

procedure TAntiPassDevice.SetAntiStart(const Value: Boolean);
begin
  if FAntiStart = Value then Exit;

  FAntiStart := Value;
  RCVAntiStart := 'N';

  //if Not Value then          //Anti ���� �� Clear �ѹ� ���� ������
  AntiPassCardClear := Value;  //AntiStart �ϴٰ� Stop �ϸ� AntiPassCardStopStart Clear

  Send_AntiPassStartAndStop;
end;

procedure TAntiPassDevice.SetDeviceConnected(const Value: Boolean);
begin
  if FDeviceConnected = Value then Exit;

  FDeviceConnected := Value;
  //1.��� ī�� ������ ���� ���� ���� ���� �ְ�...
  //AntiPassCardClear := Value;    //Anti ���۽� ���� ������
  //2.���� AntiCard ��ü ���� �� �ְ�
(*  AntiPassCardSendTimer.enabled := Value;
  AntiPassCardInitializeSendTimer.Enabled := Value; //�ʱ�ȭ
*)
end;

procedure TAntiPassDevice.SetRCVAntiPassCardStopBit(const Value: string);
begin
  if FRCVAntiPassCardStopBit = Value then Exit;
  FRCVAntiPassCardStopBit := Value;
//  if Value <> 'Y' then AntiPassSettingSendTimer.Enabled := True;
end;

procedure TAntiPassDevice.SetRCVAntiStart(const Value: string);
begin
  if FRCVAntiStart = Value then Exit;

  FRCVAntiStart := Value;
//  if Value <> 'Y' then AntiPassSettingSendTimer.Enabled := True;
end;

end.