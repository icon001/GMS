unit uFoodReader;

interface

uses
  System.SysUtils, System.Classes,DateUtils;

type
  TFoodEvent = procedure(Sender: TObject;aFoodDate,aAccessTime,aCardno,aCompanyCode, aCompanyName,aEmSeq,aEmCode,aEmName,aAccessResult,aAccessPermitName,aFoodType,aFoodTypeName,
                                                  aFoodCode,aFoodCodeName,aFoodAmt:string) of object;

  TFoodCode = Class(TComponent)
  private
    FStartTime: string;
    FFoodCode: string;
    FFoodCodeName: string;
    FEndTime: string;
    FFoodAmt: string;
    FInitTime: string;
  published
    property FoodCode :string read FFoodCode write FFoodCode;
    property FoodCodeName : string read FFoodCodeName write FFoodCodeName;
    property StartTime : string read FStartTime write FStartTime;
    property EndTime : string read FEndTime write FEndTime;
    property FoodAmt : string read FFoodAmt write FFoodAmt;
    property InitTime : string read FInitTime write FInitTime;
  End;

  TFoodReaderType = Class(TComponent)
  private
    FoodCodeList : TStringList;
    FEcuID: string;
    FReaderNo: string;
    FNodeNo: integer;
    FFoodType: string;
    FYesterDayTime: string;
    FFoodTypeName: string;
    FOnFoodEvent: TFoodEvent;
    function GetFoodCode(aTime:string;var aFoodCode,aFoodName,aFoodAmt:string):Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure AddFoodCode(aFoodCode,aFoodCodeName,aStartTime,aEndTime,aFoodAmt,aInitTime:string);
    procedure DeviceCardAccessEvent(aDecoderNo:integer;aTime,aNodeNo, aEcuID,aDoorNo, aReaderNo, aInOut,stInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,aAccessPermitName,
                          aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName:string);
  published
    property NodeNo : integer read FNodeNo write FNodeNo;
    property EcuID : string read FEcuID write FEcuID;
    property ReaderNo : string read FReaderNo write FReaderNo;
    property FoodType : string read FFoodType write FFoodType;
    property FoodTypeName : string read FFoodTypeName write FFoodTypeName;
    property YesterDayTime : string read FYesterDayTime write FYesterDayTime;
  published
    property OnFoodEvent : TFoodEvent read FOnFoodEvent write FOnFoodEvent;
  End;

  TdmFoodReader = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFoodReader: TdmFoodReader;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TFoodReaderType }

procedure TFoodReaderType.AddFoodCode(aFoodCode, aFoodCodeName, aStartTime,
  aEndTime, aFoodAmt, aInitTime: string);
var
  nIndex : integer;
  oFoodCode : TFoodCode;
begin
  nIndex := FoodCodeList.IndexOf(aFoodCode);
  if nIndex < 0 then
  begin
    oFoodCode := TFoodCode.Create(nil);
    oFoodCode.FoodCode := aFoodCode;
    oFoodCode.FoodCodeName := aFoodCodeName;
    oFoodCode.StartTime := aStartTime;
    oFoodCode.EndTime := aEndTime;
    oFoodCode.FoodAmt := aFoodAmt;
    oFoodCode.InitTime := aInitTime;

    FoodCodeList.AddObject(aFoodCode,oFoodCode);
  end else
  begin
    TFoodCode(FoodCodeList.Objects[nIndex]).FoodCode := aFoodCode;
    TFoodCode(FoodCodeList.Objects[nIndex]).FoodCodeName := aFoodCodeName;
    TFoodCode(FoodCodeList.Objects[nIndex]).StartTime := aStartTime;
    TFoodCode(FoodCodeList.Objects[nIndex]).EndTime := aEndTime;
    TFoodCode(FoodCodeList.Objects[nIndex]).FoodAmt := aFoodAmt;
    TFoodCode(FoodCodeList.Objects[nIndex]).InitTime := aInitTime;
  end;
end;

constructor TFoodReaderType.Create(AOwner: TComponent);
begin
  inherited;
  FoodCodeList := TStringList.Create;
end;

destructor TFoodReaderType.Destroy;
var
  i : integer;
begin

  if FoodCodeList.Count > 0 then
  begin
    for i := FoodCodeList.Count - 1 downto 0 do
    begin
      TFoodCode(FoodCodeList.Objects[i]).Free;
    end;      
  end;

  FoodCodeList.Free;
  inherited;
end;

procedure TFoodReaderType.DeviceCardAccessEvent(aDecoderNo:integer;aTime, aNodeNo, aEcuID, aDoorNo,
  aReaderNo, aInOut, stInOutName, aCardMode, aDoorMode, aChangeState,
  aAccessResult, aAccessPermitName, aDoorState, aATButton, aType, aArmAreaNo,
  aCardno, aCompanyCode, aCompanyName, aEmSeq, aEmCode, aEmName, aPosiCode,
  aPosiName: string);
var
  stFoodDate : string;
  stFoodTime : string;
  dtYesterDay : TDatetime;
  dtPresent :  TDatetime;
  stFoodCode,stFoodCodeName,stFoodAmt : string;
begin
  stFoodDate := copy(aTime,1,8);
  stFoodTime := copy(aTime,9,4);
  dtPresent:= EncodeDatetime(strtoint(copy(aTime,1,4)), strtoint(copy(aTime,5,2)), strtoint(copy(aTime,7,2)), 00, 00, 00,00);
  dtYesterDay := dtPresent - 1;
  if stFoodTime < YesterDayTime  then
  begin
    stFoodDate := formatDateTime('yyyymmdd',dtYesterDay);
  end;
  GetFoodCode(stFoodTime,stFoodCode,stFoodCodeName,stFoodAmt); 
  if Assigned(FOnFoodEvent) then
  begin
    OnFoodEvent(self, stFoodDate,aTime,aCardno,aCompanyCode, aCompanyName,aEmSeq,aEmCode,aEmName,aAccessResult,aAccessPermitName,FoodType,FoodTypeName,
                                                  stFoodCode,stFoodCodeName,stFoodAmt);
  end;
end;

function TFoodReaderType.GetFoodCode(aTime: string; var aFoodCode,aFoodName,
  aFoodAmt: string): Boolean;
var
  i : integer;
begin
  result := False;
  aFoodCode := '1';
  for I := 0 to FoodCodeList.Count - 1 do
  begin
    if TFoodCode(FoodCodeList.Objects[i]).StartTime < TFoodCode(FoodCodeList.Objects[i]).EndTime  then
    begin
      if (TFoodCode(FoodCodeList.Objects[i]).StartTime <= aTime) and
         (TFoodCode(FoodCodeList.Objects[i]).EndTime >= aTime)
        then
      begin
        aFoodCode := FoodCodeList.Strings[i];
        aFoodName := TFoodCode(FoodCodeList.Objects[i]).FoodCodeName; 
        aFoodAmt :=  TFoodCode(FoodCodeList.Objects[i]).FoodAmt;
        result := True;
        break;
      end;
    end else
    begin
      if (TFoodCode(FoodCodeList.Objects[i]).StartTime <= aTime) or
         (TFoodCode(FoodCodeList.Objects[i]).EndTime >= aTime)
        then
      begin
        aFoodCode := FoodCodeList.Strings[i];
        aFoodName := TFoodCode(FoodCodeList.Objects[i]).FoodCodeName; 
        aFoodAmt :=  TFoodCode(FoodCodeList.Objects[i]).FoodAmt;
        result := True;
        break;
      end;
    end;

  end;

end;

end.
