unit uMIAMSDataBase;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB,Vcl.Forms,Winapi.Windows,Vcl.Dialogs,ActiveX,
  uCommonVariable;

const
  con_RANDMAXCARDNO = 2147483646;

type
  TdmGMSDataBase = class(TDataModule)
    ADOConnection: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FDBConnected: Boolean;
    FCancel: Boolean;
    FOnAdoConnected: TAdoConnectedEvent;
    procedure SetDBConnected(const Value: Boolean);
    procedure SetCancel(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Function DataBaseConnect(aDBType:integer;aDBHost,aDBPort,aDBUserID,aDBUserPw,aDBName:string;aMessage: Boolean):Boolean;
    Function DataBaseDisConnect:Boolean;
    Function ProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
  public
    Function CheckTB_BUILDINGCODE_Code(aCode,aDeepSeq:string):integer;
    Function CheckTB_CARD(aCardNo:string;var nEmSeq:integer):integer;
    function CheckTB_CARDPERMITEMPLOYEECODE_Value(aNodeNo,aEcuID,aExtendID,aDoorNo,aEmSeq:string;aType:string ='1'):integer;
    function CheckTB_CARDPERMIT_DeviceCardNo(aNodeNo,aEcuID,aExtendID,aCardNo:string):integer;
    Function CheckTB_CARDPERMIT_Value(aNodeNo,aEcuID,aExtendID,aCardNo:string):integer;
    Function CheckTB_CARDPRINTLIST(aPrintNo:string):integer;
    Function CheckTB_COMPANYCODE_Code(aCode,aDeepSeq:string):integer;
    function CheckTB_DOORSCHEDULE_DayCode(aNodeNo,aEcuID,aDoorNo,aDayCode:string):integer;
    function CheckTB_EMPLOYEEFINGER_Value(aEmSeq,aFingerSeq:string):integer;
    Function CheckTB_NODE_DeviceID(aDeviceID:string):integer;
    Function CheckTB_NODE_NodeNo(aNodeNo:string):integer;
    Function CheckTB_NODE_NodeIP(aNodeIP:string):integer;
    Function ConvertCardnoDigitTo16Byte(aCardNo:string):string;
    function copyHoliDayToDevice(aNodeNo,aEcuID:string):Boolean;
  public
    function GetNextTB_CARD_RelayID : string;
    Function GetTB_ArmArea_NextViewSeq:integer;
    Function GetTB_BUILDING_NextSeq(aCode,aDeepSeq:string;var aViewSeq:integer):integer;
    Function GetTB_CARD_NextPositionNum:integer;
    Function GetTB_CARD_EmSeqFromCardNo(aCardNo:string):string;
    function GetTB_CARD_FingerCardNo(aPositionNum:string=''):string;
    Function GetTB_COMPANY_NextSeq(aCode,aDeepSeq:string;var aViewSeq:integer):integer;
    Function GetTB_DOOR_NextViewSeq : integer;
    function GetTB_EMPLOYEE_NextEmCode:string;
    function GetTB_EMPLOYEE_NextEmSeq:integer;
    function GetTB_NODE_DeviceIDNodeNo(aDeviceID,aServerNo:string):integer;
    function GetTB_NODE_NextNodeNo : integer;
  public
    function CopyHolidayToAllDevice(aDate,aType:string):Boolean;
    Function DeleteTB_HOLIDAYDEVICE_DayAll(aDate:string):Boolean;

    Function InsertIntoGMSTB_ARMAREA_DeviceARMAREAInit(aNodeNo,aEcuID,aArmAreaNo,aArmAreaName,aBuildingCode,aViewSeq:string;aArmAreaUse:string='0';aArmAreaView:string='0' ):Boolean;
    Function InsertIntoGMSTB_BUILDINGCODE_Value(aCode,aName,aDeepSeq,aUse,aViewSeq:string):Boolean;
    Function InsertIntoGMSTB_CARDGUBUN_Value(aCardGubun,aName:string):Boolean;
    Function InsertIntoGMSTB_CARD_Value(aCardNo,aCardState,aCardGubun,aPositionNum,aRelayID,aGradeUse,aEmSeq,aCardPrintNo:string):Boolean;
    Function InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(aEmSeq,aNodeNo,aEcuID,aExtendID,aType,aNumber,aPermit,aApply:string):Boolean;
    Function InsertIntoGMSTB_CARDPERMIT_VALUE(aNodeNo,aEcuID,aExtendID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
               aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8:string;aPassword:string='';aCardType:string='1'):Boolean;
    Function InsertIntoGMSTB_CARDPRINTLIST(aPrintNo,aCardNo:string):Boolean;
    Function InsertIntoGMSTB_COMPANYCODE_Value(aCode,aName,aDeepSeq,aUse,aViewSeq:string):Boolean;
    Function InsertIntoGMSTB_DEVICERCV_DeviceInit(aNodeNo,aEcuID,aExtendNo:string ):Boolean;
    Function InsertIntoGMSTB_DEVICE_DeviceInit(aNodeNo,aEcuID,aExtendNo,aDeviceName,aBuildingCode:string;aUse:string='0' ):Boolean;
    Function InsertIntoGMSTB_DOOR_DeviceDoorInit(aNodeNo,aEcuID,aDoorNo,aDoorName,aBuildingCode,aDoorViewSeq:string;aDoorUse:string='0';aDoorView:string='0' ):Boolean;
    Function InsertIntoGMSTB_DOORRCV_DeviceDoorInit(aNodeNo,aEcuID,aDoorNo:string ):Boolean;
    function InsertIntoGMSTB_DOORSCHEDULE_All(aNodeNo,aECUID,aDOORNO,aDayCode,a1Time,a2Time,a3Time,a4Time,a5Time,a1Mode,a2Mode,a3Mode,a4Mode,a5Mode,aRcvAck:string):Boolean;
    Function InsertIntoGMSTB_EMPLOYEE_Value(aEmSeq,aEmCode,aEmName,aCompanyCode,aPosiCode,aGubunCode,aCompanyPhone,aHomePhone,ahandPhone,aEmninfo,
             aRegDate,aEndDate,aACType,aATType,aFdType,aEmGroupCode,aGradeType,aFingerUse,aEmStateCode,aAWCode:string):Boolean;
    Function InsertIntoGMSTB_EMPLOYEEFINGER_Template(aEmSeq,aFingerSeq,aFingerTemplate1_1,aFingerTemplate1_2,aFingerTemplate2_1,aFingerTemplate2_2,aFingerTemplate3_1,aFingerTemplate3_2:string):Boolean;
    Function InsertIntoGMSTB_HOLIDAY_Value(aDay,aName,aAcUse,aAtUse,aHoType:string):Boolean;
    Function InsertIntoGMSTB_NODE_Value(aNodeNo,aSockType,aDeviceID,aNodeIP,aNodeName,aNodeDeviceType,aServerNo:string;aBuildingCode:string='0';aTelNumber:string='';aAddr:string='';aAddDate:string=''):Boolean;
    Function InsertIntoGMSTB_NODERCV_NodeNo(aNodeNo:string):Boolean;
    Function InsertIntoGMSTB_POSICODE_Value(aPosiCode,aName,aCompanyCode,aViewSeq:string ):Boolean;
    Function InsertIntoGMSTB_READERRCV_ReaderInit(aNodeNo,aEcuID,aReaderNo:string ):Boolean;
    Function InsertIntoGMSTB_READER_ReaderInit(aNodeNo,aEcuID,aReaderNo:string ):Boolean;
    Function InsertIntoGMSTB_READER_TELNO(aNodeNo,aNO,aTELNumber:string):Boolean;
    Function InsertIntoGMSTB_TIMECODEDEVICE_TimeCodeToDevice(aNodeNo,aEcuID,aBuildingCode:string):Boolean;
    Function InsertIntoGMSTB_ZONEEXTENTION_ZoneInit(aNodeNo,aEcuID,aExtNo,aName,aType:string):Boolean;
    Function InsertIntoGMSTB_ZONERCV_ZoneInit(aNodeNo,aEcuID,aExtNo,aZoneNo:string):Boolean;
    Function InsertIntoGMSTB_ZONE_ZoneInit(aNodeNo,aEcuID,aExtNo,aZoneNo,aZoneName:string;aBuildingCode:string='0'):Boolean;

    Function UpdateGMSTB_ALARMEVENTSTATEPCCODE_Sound(aCode,aSound:string):Boolean;
    Function UpdateGMSTB_ARMAREA_Field_IntValue(aNodeNo,aEcuID,aExtendID,aArmAreaNo,aFieldName,aData:string):Boolean;
    Function UpdateGMSTB_ARMAREA_Field_StringValue(aNodeNo,aEcuID,aExtendID,aArmAreaNo,aFieldName,aData:string):Boolean;
    Function UpdateGMSTB_CARDPERMIT_VALUE(aNodeNo,aEcuID,aExtendID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
               aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8:string;aPassword:string='';aCardType:string=''):Boolean;
    Function UpdateGMSTB_CARDGUBUN_Value(aCardType,aName:string):Boolean;
    Function UpdateGMSTB_COMPANYCODE_Name(aCompanyCode,aCompanyName:string):Boolean;
    Function UpdateGMSTB_CONFIG_Value(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aCONFIGDETAIL:string=''):Boolean;
    Function UpdateGMSTB_DOOR_Field_IntValue(aNodeNo,aEcuID,aExtendID,aNo,aFieldName,aData:string):Boolean;
    Function UpdateGMSTB_DOOR_Field_StringValue(aNodeNo,aEcuID,aExtendID,aNo,aFieldName,aData:string):Boolean;
    Function UpdateGMSTB_EMPLOYEE_Field_IntValue(aEmSeq,aFieldName,aValue:string):Boolean;
    Function UpdateGMSTB_EMPLOYEE_Field_StringValue(aEmSeq,aFieldName,aValue:string):Boolean;
    Function UpdateGMSTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(aEM_SEQ,aFingerApply:string):Boolean;
    Function UpdateGMSTB_FORMNAME_Name(aPROGRAMGUBUN,aNAMECODE,aName:string):Boolean;
    Function UpdateGMSTB_ZONE_Field_StringValue(aNodeNo,aEcuID,aExtendID,aZoneNo,aFieldName,aData:string):Boolean;
  public
    Property Cancel:Boolean read FCancel write SetCancel;
    Property DBConnected : Boolean read FDBConnected write SetDBConnected;
  Published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;
function SQLConfigDataSource(hwndParent : HWND; fRequest : WORD; lpszDriver : LPCSTR; lpszAttributes : LPCSTR) : Boolean; stdcall; external 'ODBCCP32.DLL';

var
  dmGMSDataBase: TdmGMSDataBase;

implementation

uses
  uCommonFunction ;


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmGMSDataBase }

function TdmGMSDataBase.CheckTB_BUILDINGCODE_Code(aCode,
  aDeepSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_BUILDINGCODE ';
  stSql := stSql + ' where BC_BUILDINGCODE = ''' + aCode + '''';
  stSql := stSql + ' AND BC_DEEPSEQ = ' + aDeepSeq + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.CheckTB_CARD(aCardNo: string;var nEmSeq:integer): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARD where CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else
      begin
        result := 1;
        nEmSeq := FindField('EM_SEQ').AsInteger;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_Value(aNodeNo, aEcuID,
  aExtendID, aDoorNo, aEmSeq: string;aType:string ='1'): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' ';
  stSql := stSql + ' AND CP_NUMBER = ' + aDoorNo + ' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.CheckTB_CARDPERMIT_DeviceCardNo(aNodeNo, aEcuID,
  aExtendID, aCardNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMIT ';
  stSql := stSql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.CheckTB_CARDPERMIT_Value(aNodeNo, aEcuID, aExtendID,
  aCardNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMIT ';
  stSql := stSql + ' where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.CheckTB_CARDPRINTLIST(aPrintNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPRINTLIST where CA_PRINTNO = ''' + aPrintNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.CheckTB_COMPANYCODE_Code(aCode,
  aDeepSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_COMPANYCODE ';
  stSql := stSql + ' where CO_COMPANYCODE = ''' + aCode + '''';
  stSql := stSql + ' AND CO_DEEPSEQ = ' + aDeepSeq + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


function TdmGMSDataBase.CheckTB_DOORSCHEDULE_DayCode(aNodeNo, aEcuID, aDoorNo,
  aDayCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;

  stSql := 'select * from TB_DOORSCHEDULE ';
  stSql := stSql + ' Where  GROUP_CODE = ''1234567890'' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  stSql := stSql + ' AND DS_DAYCODE = ''' + aDayCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.CheckTB_EMPLOYEEFINGER_Value(aEmSeq,
  aFingerSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEEFINGER ';
  stSql := stSql + ' Where  EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND EF_SEQ = ' + aFingerSeq + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.CheckTB_NODE_DeviceID(aDeviceID: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_NODE ';
  stSql := stSql + ' where ND_DEVICEID = ''' + aDeviceID + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.CheckTB_NODE_NodeIP(aNodeIP: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_NODE ';
  stSql := stSql + ' where ND_NODEIP = ''' + aNodeIP + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.CheckTB_NODE_NodeNo(aNodeNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_NODE ';
  stSql := stSql + ' where ND_NODENO = ' + aNodeNo + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.ConvertCardnoDigitTo16Byte(aCardNo: string): string;
var
  stCardNo : string;
begin
  result :='';
  if Not isDigit(aCardNo) then Exit;

  stCardNo := Dec2Hex(StrToInt64(aCardNo),8);
  stCardNo := FillCharString(stCardNo,'*',16);
  result := stCardNo;
end;

function TdmGMSDataBase.CopyHolidayToAllDevice(aDate, aType: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_HOLIDAYDEVICE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'HO_DAY,';
  stSql := stSql + 'HD_USE,';
  stSql := stSql + 'HO_TYPE,';
  stSql := stSql + 'HD_SEND) ';
  stSql := stSql + 'select GROUP_CODE,' ;
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''1'',';
  stSql := stSql + '' + aType + ',';
  stSql := stSql + '''N'' ';
  stSql := stSql + ' From TB_DEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''1234567890'' ';
  stSql := stSql + ' and DE_EXTENDID = 0 ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.copyHoliDayToDevice(aNodeNo, aEcuID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_HOLIDAYDEVICE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'HO_DAY,';
  stSql := stSql + 'HD_USE,';
  stSql := stSql + 'HD_SEND) ';
  stSql := stSql + 'select GROUP_CODE,' ;
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + 'HO_DAY,';
  stSql := stSql + 'HO_ACUSE,';
  stSql := stSql + '''N'' ';
  stSql := stSql + ' From TB_HOLIDAY ';
  stSql := stSql + ' Where GROUP_CODE = ''1234567890'' ';
  stSql := stSql + ' AND HO_ACUSE = ''1'' ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.DataBaseConnect(aDBType:integer;aDBHost,aDBPort,aDBUserID,aDBUserPw,aDBName:string;aMessage: Boolean): Boolean;
var
  stConnectString : string;
  stDBType : string;
begin
  if DBConnected then Exit;
  result := False;
  CanCel := False;
  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  if aDBType = MSSQL then
  begin
    stConnectString := stConnectString + 'Provider=SQLOLEDB.1;';
    stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'User ID=' + aDBUserID + ';';
    stConnectString := stConnectString + 'Initial Catalog=' + aDBName + ';';
    stConnectString := stConnectString + 'Data Source=' + aDBHost  + ',' + aDBPort;

    //stConnectString := 'PROVIDER=SQLOLEDB.1;SERVER=localhost;DATABASE=' + aDBName + ';TRUSTED_CONNECTION=YES';
  end else if aDBType = POSTGRESQL then
  begin
    stConnectString := 'Provider=PostgreSQL OLE DB Provider;';
    stConnectString := stConnectString + 'Data Source=' + aDBHost + ';'   ;
    stConnectString := stConnectString + 'location=' + aDBName + ';';
    stConnectString := stConnectString + 'User Id='+ aDBUserID + ';';
    stConnectString := stConnectString + 'password=' + aDBUserPw;
  end else if aDBType = FIREBIRD then
  begin
    stConnectString := 'Provider=ZStyle IBOLE Provider;';
    stConnectString := stConnectString + 'Data Source=' + aDBHost + ':' + aDBName + ';';
    stConnectString := stConnectString + 'UID='+ aDBUserID + ';';
    stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
    stConnectString := stConnectString + 'DIALECT=3;';
  end else //����Ʈ�� MDB�� �ν�����
  begin
    if Not FileExists(G_stExeFolder + '\..\db\SAC.mdb') then
    begin
      ChDir(G_stExeFolder + '\..\db');
      SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=SAC.mdb General'));
    end;

    stConnectString := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    stConnectString := stConnectString + 'Data Source=' + G_stExeFolder + '\..\db\SAC.mdb' + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'Jet OLEDB:Database ';
  end;

  with ADOConnection do
  begin
    Connected := False;
    Try
      ConnectionString := stConnectString;
      LoginPrompt:= false ;
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          if aMessage then
            ShowMessage(stConnectString + E.Message );
          Exit;
        end;
      else
        begin
          if aMessage then
            ShowMessage('�����ͺ��̽� ���ӿ���' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
    //CursorLocation := clUseClient;
  end;

  DBConnected := True;
  result := True;

end;

function TdmGMSDataBase.DataBaseDisConnect: Boolean;
begin
  DBConnected := False;
  with ADOConnection do
  begin
    Connected := False;
  end;
end;

procedure TdmGMSDataBase.DataModuleCreate(Sender: TObject);
begin
  DBConnected := False;
end;

function TdmGMSDataBase.DeleteTB_HOLIDAYDEVICE_DayAll(aDate: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_HOLIDAYDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''1234567890'' ';
  stSql := stSql + ' AND HO_DAY = ''' + aDate + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.GetNextTB_CARD_RelayID: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '1';
  stSql := 'select MAX(CA_RELAYID) as CA_RELAYID from TB_CARD ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      if FindField('CA_RELAYID').IsNull then Exit;
      result := inttostr(FindField('CA_RELAYID').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.GetTB_ArmArea_NextViewSeq: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := 1;

  stSql := 'Select Max(AR_VIEWSEQ) as AR_VIEWSEQ from TB_ARMAREA ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if Not isDigit(FindField('AR_VIEWSEQ').AsString) then Exit;
      result := FindField('AR_VIEWSEQ').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.GetTB_BUILDING_NextSeq(aCode, aDeepSeq: string;
  var aViewSeq: integer): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stCode : string;
begin
  result := 1;
  aViewSeq := 1;
  stSql := 'select Max(BC_BUILDINGCODE) as BC_BUILDINGCODE,Max(BC_VIEWSEQ) as BC_VIEWSEQ from TB_BUILDINGCODE ';
  stSql := stSql + ' where BC_BUILDINGCODE Like ''' + aCode + '%''';
  stSql := stSql + ' AND BC_DEEPSEQ = ' + aDeepSeq + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      if Trim(FindField('BC_BUILDINGCODE').AsString) = '' then Exit;
      stCode := FindField('BC_BUILDINGCODE').AsString;
      stCode := copy(stCode,2 + ( 3 * (strtoint(aDeepSeq) - 1) ) ,3);
      if Not isDigit(stCode) then Exit;
      result := strtoint(stCode) + 1;
      if Not isDigit(FindField('BC_VIEWSEQ').AsString) then Exit;
      aViewSeq := FindField('BC_VIEWSEQ').AsInteger + 1;
      //0001001025
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.GetTB_CARD_EmSeqFromCardNo(aCardNo: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := '';

  stSql := 'Select EM_SEQ from TB_CARD Where CA_CARDNO = ''' + aCardNo + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;

      result := FindField('EM_SEQ').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.GetTB_CARD_FingerCardNo(aPositionNum: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  nCardNo : integer;
  stHexCardNo : string;
begin
  if aPositionNum = '' then
  begin
    Randomize() ;
    nCardNo := Random(con_RANDMAXCARDNO) + 1;
    if nCardNo < 0 then
    begin
      result := GetTB_CARD_FingerCardNo;
      Exit;
    end;
    stHexCardNo := Dec2Hex(nCardNo,8);
    stHexCardNo := FillCharString(stHexCardNo,'*',16);//KT���Ÿ��

    result := stHexCardNo;
  end else
  begin
    stHexCardNo := Ascii2Hex(FillZeroStrNum(aPositionNum,4));
    stHexCardNo := FillCharString(stHexCardNo,'*',16);
    result := FillCharString(stHexCardNo,'*',16);
    Exit;
  end;
  //�ߺ� üũ
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + stHexCardNo + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      result := GetTB_CARD_FingerCardNo;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.GetTB_CARD_NextPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := 1;

  stSql := 'Select Max(CA_POSITIONNUM) as CA_POSITIONNUM from TB_CARD ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if Not isDigit(FindField('CA_POSITIONNUM').AsString) then Exit;
      result := FindField('CA_POSITIONNUM').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.GetTB_COMPANY_NextSeq(aCode,
  aDeepSeq: string;var aViewSeq:integer): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stCode : string;
begin
  result := 1;
  aViewSeq := 1;
  stSql := 'select Max(CO_COMPANYCODE) as CO_COMPANYCODE,Max(CO_VIEWSEQ) as CO_VIEWSEQ from TB_COMPANYCODE ';
  stSql := stSql + ' where CO_COMPANYCODE Like ''' + aCode + '%''';
  stSql := stSql + ' AND CO_DEEPSEQ = ' + aDeepSeq + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      if Trim(FindField('CO_COMPANYCODE').AsString) = '' then Exit;
      stCode := FindField('CO_COMPANYCODE').AsString;
      stCode := copy(stCode,2 + ( 3 * (strtoint(aDeepSeq) - 1) ) ,3);
      if Not isDigit(stCode) then Exit;
      result := strtoint(stCode) + 1;
      if Not isDigit(FindField('CO_VIEWSEQ').AsString) then Exit;
      aViewSeq := FindField('CO_VIEWSEQ').AsInteger + 1;
      //0001001025
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.GetTB_DOOR_NextViewSeq: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := 1;

  stSql := 'Select Max(DO_VIEWSEQ) as DO_VIEWSEQ from TB_DOOR ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if Not isDigit(FindField('DO_VIEWSEQ').AsString) then Exit;
      result := FindField('DO_VIEWSEQ').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.GetTB_EMPLOYEE_NextEmCode: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
  stEmCode : string;
begin

  result := 'KT00000001';

  stSql := 'Select Max(EM_CODE) as EM_CODE from TB_EMPLOYEE ';
  stSql := stSql + ' Where EM_CODE Like ''KT%''';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      stEmCode := FindField('EM_CODE').AsString;
      if Trim(stEmCode) = '' then Exit;
      stEmCode := copy(stEmCode,3,8);
      if Not isDigit(stEmCode) then Exit;
      result := 'KT' + FillZeroNumber(strtoint(stEmCode) + 1,8);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.GetTB_EMPLOYEE_NextEmSeq: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := 1;

  stSql := 'Select Max(EM_SEQ) as EM_SEQ from TB_EMPLOYEE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if Not isDigit(FindField('EM_SEQ').AsString) then Exit;
      result := FindField('EM_SEQ').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.GetTB_NODE_DeviceIDNodeNo(aDeviceID,aServerNo: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := -1;

  stSql := 'Select ND_NODENO from TB_NODE ';
  stSql := stSql + ' Where ND_DEVICEID = ''' + aDeviceID + ''' ';
  if aServerNo <> '' then stSql := stSql + ' AND ND_DECODERNO = ' + aServerNo + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if Not isDigit(FindField('ND_NODENO').AsString) then Exit;
      result := FindField('ND_NODENO').AsInteger;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.GetTB_NODE_NextNodeNo: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := 1;

  stSql := 'Select Max(ND_NODENO) as ND_NODENO from TB_NODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if Not isDigit(FindField('ND_NODENO').AsString) then Exit;
      result := FindField('ND_NODENO').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmGMSDataBase.InsertIntoGMSTB_ARMAREA_DeviceARMAREAInit(aNodeNo,
  aEcuID, aArmAreaNo, aArmAreaName,aBuildingCode,aViewSeq, aArmAreaUse, aArmAreaView: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aViewSeq) then aViewSeq := '1';

  stSql := 'Insert Into TB_ARMAREA (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' AR_ARMAREANO,';
  stSql := stSql + ' AR_ARMAREAUSE,';
  stSql := stSql + ' AR_VIEW,';
  stSql := stSql + ' AR_VIEWSEQ,';
  stSql := stSql + ' BC_BUILDINGCODE,';
  stSql := stSql + ' AR_ARMAREANAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '0,';
  stSql := stSql + '' + aArmAreaNo + ',';
  stSql := stSql + '''' + aArmAreaUse + ''', ';
  stSql := stSql + '''' + aArmAreaView + ''', ';
  stSql := stSql + '' + aViewSeq + ',';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + 'N''' + aArmAreaName + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_BUILDINGCODE_Value(aCode, aName,
  aDeepSeq, aUse, aViewSeq: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Insert Into TB_BUILDINGCODE (';
  stSql := stSql + 'BC_BUILDINGCODE,';
  stSql := stSql + 'BC_BUILDINGNAME,';
  stSql := stSql + 'BC_DEEPSEQ,';
  stSql := stSql + 'BC_CODEUSE,';
  stSql := stSql + 'BC_VIEWSEQ) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aCode + ''',' ;
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '' + aDeepSeq + ',';
  stSql := stSql + '''' + aUse + ''',';
  stSql := stSql + '' + aViewSeq + ')';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_CARDGUBUN_Value(aCardGubun,
  aName: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Insert Into TB_CARDGUBUN (';
  stSql := stSql + 'CA_CARDGUBUN,';
  stSql := stSql + 'CA_CARDGUBUNNAME,';
  stSql := stSql + 'CA_RELAYTYPE) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '' + aCardGubun + ',' ;
  stSql := stSql + 'N''' + aName + ''',';
  stSql := stSql + '''0'')';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(aEmSeq,
  aNodeNo, aEcuID, aExtendID, aType, aNumber, aPermit, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' CP_TYPE,';
  stSql := stSql + ' CP_NUMBER,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_APPLY,';
  stSql := stSql + ' CP_FINGERAPPLY ) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '''' + aType + ''', ';
  stSql := stSql + '' + aNumber + ', ';
  stSql := stSql + '''' + aPermit + ''', ';
  stSql := stSql + '''' + aApply + ''', ';
  stSql := stSql + '''' + aApply + ''' ) ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_CARDPERMIT_VALUE(aNodeNo, aEcuID,
  aExtendID, aCardNo, aPermit, aDoor1, aDoor2, aDoor3, aDoor4, aDoor5, aDoor6,
  aDoor7, aDoor8, aArmArea0, aArmArea1, aArmArea2, aArmArea3, aArmArea4,
  aArmArea5, aArmArea6, aArmArea7, aArmArea8, aPassword,
  aCardType: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMIT(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_DOOR1,';
  stSql := stSql + ' CP_DOOR2,';
  stSql := stSql + ' CP_DOOR3,';
  stSql := stSql + ' CP_DOOR4,';
  stSql := stSql + ' CP_DOOR5,';
  stSql := stSql + ' CP_DOOR6,';
  stSql := stSql + ' CP_DOOR7,';
  stSql := stSql + ' CP_DOOR8,';
  stSql := stSql + ' CP_ARMAREA0,';
  stSql := stSql + ' CP_ARMAREA1,';
  stSql := stSql + ' CP_ARMAREA2,';
  stSql := stSql + ' CP_ARMAREA3,';
  stSql := stSql + ' CP_ARMAREA4,';
  stSql := stSql + ' CP_ARMAREA5,';
  stSql := stSql + ' CP_ARMAREA6,';
  stSql := stSql + ' CP_ARMAREA7,';
  stSql := stSql + ' CP_ARMAREA8,';
  stSql := stSql + ' CP_RCVACK,';
  stSql := stSql + ' CP_MEMLOAD , ';
  stSql := stSql + ' CP_PASSWD , ';
  stSql := stSql + ' CP_CARDTYPE ) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''' + aPermit + ''', ';
  stSql := stSql + '''' + aDoor1 + ''', ';
  stSql := stSql + '''' + aDoor2 + ''', ';
  stSql := stSql + '''' + aDoor3 + ''', ';
  stSql := stSql + '''' + aDoor4 + ''', ';
  stSql := stSql + '''' + aDoor5 + ''', ';
  stSql := stSql + '''' + aDoor6 + ''', ';
  stSql := stSql + '''' + aDoor7 + ''', ';
  stSql := stSql + '''' + aDoor8 + ''', ';
  stSql := stSql + '''' + aArmArea0 + ''', ';
  stSql := stSql + '''' + aArmArea1 + ''', ';
  stSql := stSql + '''' + aArmArea2 + ''', ';
  stSql := stSql + '''' + aArmArea3 + ''', ';
  stSql := stSql + '''' + aArmArea4 + ''', ';
  stSql := stSql + '''' + aArmArea5 + ''', ';
  stSql := stSql + '''' + aArmArea6 + ''', ';
  stSql := stSql + '''' + aArmArea7 + ''', ';
  stSql := stSql + '''' + aArmArea8 + ''', ';
  stSql := stSql + '''Y'' , ';
  stSql := stSql + '''N'' , ';
  stSql := stSql + '''' + aPassword + ''' , ';
  stSql := stSql + '''' + aCardType + ''' ) ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_CARDPRINTLIST(aPrintNo,
  aCardNo: string): Boolean;
var
  stCardNo : string;
  stSql : string;
begin
  result := True;
  if CheckTB_CARDPRINTLIST(aPrintNo) = 1 then Exit;
  result := False;

  stCardNo := ConvertCardnoDigitTo16Byte(aCardNo);
  if stCardNo = '' then Exit;

  stSql := ' Insert Into TB_CARDPRINTLIST (CA_PRINTNO,CA_CARDNO) ';
  stSql := stSql + ' Values(''' + aPrintNo + ''',''' + stCardNo + ''') ';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_CARD_Value(aCardNo, aCardState,
  aCardGubun, aPositionNum, aRelayID, aGradeUse, aEmSeq,
  aCardPrintNo: string): Boolean;
var
  stSql : string;
  stUpdateTime : string;
begin
  stUpdateTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  stSql := 'Insert Into TB_CARD (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' CA_STATECODE, ';
  stSql := stSql + ' CA_CARDGUBUN, ';
  stSql := stSql + ' CA_POSITIONNUM, ';
  stSql := stSql + ' CA_RELAYID, ';
  stSql := stSql + ' CA_GRADEUSE, ';
  stSql := stSql + ' EM_SEQ, ';
  stSql := stSql + ' CA_PRINTNO, ';
  stSql := stSql + ' CA_UPDATETIME, ';
  stSql := stSql + ' AD_USERID) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''' + aCardState + ''', ';
  stSql := stSql + '' + aCardGubun + ', ';
  stSql := stSql + '' + aPositionNum + ', ';
  stSql := stSql + '' + aRelayID + ', ';
  stSql := stSql + '''' + aGradeUse + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''' + aCardPrintNo + ''', ';
  stSql := stSql + '''' + stUpdateTime + ''', ';
  stSql := stSql + '''SYSTEM'') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_COMPANYCODE_Value(aCode, aName,
  aDeepSeq, aUse, aViewSeq: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Insert Into TB_COMPANYCODE (';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_COMPANYNAME,';
  stSql := stSql + 'CO_DEEPSEQ,';
  stSql := stSql + 'CO_CODEUSE,';
  stSql := stSql + 'CO_VIEWSEQ) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aCode + ''',' ;
  stSql := stSql + 'N''' + aName + ''',';
  stSql := stSql + '' + aDeepSeq + ',';
  stSql := stSql + '''' + aUse + ''',';
  stSql := stSql + '' + aViewSeq + ')';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_DEVICERCV_DeviceInit(aNodeNo,
  aEcuID, aExtendNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DEVICERCV (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' DE_EXTENDID)';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendNo + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_DEVICE_DeviceInit(aNodeNo, aEcuID,
  aExtendNo, aDeviceName,aBuildingCode, aUse: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DEVICE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DE_DEVICENAME, ';
  stSql := stSql + ' BC_BUILDINGCODE, ';
  stSql := stSql + ' DE_DEVICEUSE ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendNo + ', ';
  stSql := stSql + 'N''' + aDeviceName + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '''' + aUse + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_DOORRCV_DeviceDoorInit(aNodeNo,
  aEcuID, aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DOORRCV (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DO_DOORNO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '''' + aDoorNo + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_DOORSCHEDULE_All(aNodeNo, aECUID,
  aDOORNO, aDayCode, a1Time, a2Time, a3Time, a4Time, a5Time, a1Mode, a2Mode,
  a3Mode, a4Mode, a5Mode, aRcvAck: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_DOORSCHEDULE (';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'DO_DOORNO,';
  stSql := stSql + 'DS_DAYCODE,';
  stSql := stSql + 'DS_TIME1,';
  stSql := stSql + 'DS_TIME2,';
  stSql := stSql + 'DS_TIME3,';
  stSql := stSql + 'DS_TIME4,';
  stSql := stSql + 'DS_TIME5,';
  stSql := stSql + 'DS_TIMEMODE1,';
  stSql := stSql + 'DS_TIMEMODE2,';
  stSql := stSql + 'DS_TIMEMODE3,';
  stSql := stSql + 'DS_TIMEMODE4,';
  stSql := stSql + 'DS_TIMEMODE5,';
  stSql := stSql + 'DS_UPDATETIME,';
  stSql := stSql + 'AD_USERID,';
  stSql := stSql + 'DS_DEVICESYNC )';
  stSql := stSql + ' values (';
  stSql := stSql + '''1234567890'',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '0,';
  stSql := stSql + '' + aDoorNo + ',';
  stSql := stSql + '''' + aDayCode + ''',';
  stSql := stSql + '''' + a1Time + ''',';
  stSql := stSql + '''' + a2Time + ''',';
  stSql := stSql + '''' + a3Time + ''',';
  stSql := stSql + '''' + a4Time + ''',';
  stSql := stSql + '''' + a5Time + ''',';
  stSql := stSql + '''' + a1Mode + ''',';
  stSql := stSql + '''' + a2Mode + ''',';
  stSql := stSql + '''' + a3Mode + ''',';
  stSql := stSql + '''' + a4Mode + ''',';
  stSql := stSql + '''' + a5Mode + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',now) + ''',';
  stSql := stSql + '''SYSTEM'',';
  stSql := stSql + '''' + aRcvAck + ''' ) ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_DOOR_DeviceDoorInit(aNodeNo, aEcuID,
  aDoorNo, aDoorName,aBuildingCode,aDoorViewSeq, aDoorUse, aDoorView: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aDoorViewSeq) then aDoorViewSeq := '1';

  stSql := 'Insert Into TB_DOOR (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' DO_DOORUSE,';
  stSql := stSql + ' DO_VIEW,';
  stSql := stSql + ' BC_BUILDINGCODE, ';
  stSql := stSql + ' DO_VIEWSEQ, ';
  stSql := stSql + ' DO_DOORNAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aDoorNo + ',';
  stSql := stSql + '''' + aDoorUse + ''', ';
  stSql := stSql + '''' + aDoorView + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '' + aDoorViewSeq + ',';
  stSql := stSql + 'N''' + aDoorName + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_EMPLOYEEFINGER_Template(aEmSeq,
  aFingerSeq, aFingerTemplate1_1, aFingerTemplate1_2, aFingerTemplate2_1,
  aFingerTemplate2_2, aFingerTemplate3_1, aFingerTemplate3_2: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEEFINGER(';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' EF_SEQ,';
  stSql := stSql + ' EF_TEMPLATE1_1, ';
  stSql := stSql + ' EF_TEMPLATE1_2, ';
  stSql := stSql + ' EF_TEMPLATE2_1, ';
  stSql := stSql + ' EF_TEMPLATE2_2, ';
  stSql := stSql + ' EF_TEMPLATE3_1, ';
  stSql := stSql + ' EF_TEMPLATE3_2) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aFingerSeq + ', ';
  stSql := stSql + '''' + aFingerTemplate1_1 + ''', ';
  stSql := stSql + '''' + aFingerTemplate1_2 + ''', ';
  stSql := stSql + '''' + aFingerTemplate2_1 + ''', ';
  stSql := stSql + '''' + aFingerTemplate2_2 + ''', ';
  stSql := stSql + '''' + aFingerTemplate3_1 + ''', ';
  stSql := stSql + '''' + aFingerTemplate3_2 + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_EMPLOYEE_Value(aEmSeq, aEmCode,
  aEmName, aCompanyCode, aPosiCode, aGubunCode, aCompanyPhone, aHomePhone,
  ahandPhone, aEmninfo, aRegDate, aEndDate, aACType, aATType, aFdType,
  aEmGroupCode, aGradeType, aFingerUse, aEmStateCode, aAWCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEE(';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' EM_GUBUNCODE,';
  stSql := stSql + ' EM_COMPANYPHONE,';
  stSql := stSql + ' EM_HOMEPHONE,';
  stSql := stSql + ' EM_HANDPHONE,';
  stSql := stSql + ' EM_EMINFO,';
  stSql := stSql + ' EM_REGDATE,';
  stSql := stSql + ' EM_ENDDATE,';
  stSql := stSql + ' EM_ACUSE,';
  stSql := stSql + ' EM_ATUSE,';
  stSql := stSql + ' EM_FDUSE,';
  stSql := stSql + ' EM_GROUPCODE,';
  stSql := stSql + ' EM_GRADETYPE, ';
  stSql := stSql + ' EM_FINGERUSE, ';
  stSql := stSql + ' EM_STATECODE, ';
  stSql := stSql + ' AW_CODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + 'N''' + aEmCode + ''', ';
  stSql := stSql + 'N''' + aEmName + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '' + aPosiCode + ', ';
  stSql := stSql + '' + aGubunCode + ', ';
  stSql := stSql + 'N''' + aCompanyPhone + ''', ';
  stSql := stSql + '''' + aHomePhone + ''', ';
  stSql := stSql + '''' + ahandPhone + ''', ';
  stSql := stSql + 'N''' + aEmninfo + ''', ';
  stSql := stSql + '''' + aRegDate + ''', ';
  stSql := stSql + '''' + aEndDate + ''', ';
  stSql := stSql + '''' + aACType + ''', ';
  stSql := stSql + '''' + aATType + ''', ';
  stSql := stSql + '''' + aFdType + ''', ';
  stSql := stSql + '''' + aEmGroupCode + ''', ';
  stSql := stSql + '' + aGradeType + ', ';
  stSql := stSql + '''' + aFingerUse + ''', ';
  stSql := stSql + '' + aEmStateCode + ', ';
  stSql := stSql + '' + aAWCode + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_HOLIDAY_Value(aDay, aName, aAcUse,
  aAtUse, aHoType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_HOLIDAY(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' HO_DAY,';
  stSql := stSql + ' HO_ACUSE,';
  stSql := stSql + ' HO_ATUSE,';
  stSql := stSql + ' HO_TYPE,';
  stSql := stSql + ' HO_NAME1 ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '''' + aDay + ''', ';
  stSql := stSql + '''' + aAcUse + ''', ';
  stSql := stSql + '''' + aAtUse + ''', ';
  stSql := stSql + '' + aHoType + ', ';
  stSql := stSql + 'N''' + aName+ ''' ) ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_NODERCV_NodeNo(
  aNodeNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_NODERCV(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_NODE_Value(aNodeNo, aSockType,
  aDeviceID, aNodeIP, aNodeName, aNodeDeviceType, aServerNo, aBuildingCode,
  aTelNumber, aAddr, aAddDate: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aNodeDeviceType) then aNodeDeviceType := '0';
  if Not isDigit(aServerNo) then aServerNo := '1';

  stSql := 'Insert Into TB_NODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' ND_SOCKETTYPE,';
  stSql := stSql + ' ND_DEVICEID,';
  stSql := stSql + ' ND_NODEIP,';
  stSql := stSql + ' ND_NODEPORT,';
  stSql := stSql + ' ND_NODENAME,';
  stSql := stSql + ' ND_DEVICETYPE,';
  stSql := stSql + ' ND_DECODERNO,';
  stSql := stSql + ' ND_OLDDECORDERNO,';
  stSql := stSql + ' BC_BUILDINGCODE,';
  stSql := stSql + ' ND_TELNUM,';
  stSql := stSql + ' ND_ADDR ,';
  stSql := stSql + ' ND_ADDDATE,';
  stSql := stSql + ' ND_MEMLOAD )';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aSockType + ''', ';
  stSql := stSql + '''' + aDeviceID + ''', ';
  stSql := stSql + '''' + aNodeIP + ''', ';
  stSql := stSql + '''3000'', ';
  stSql := stSql + 'N''' + aNodeName + ''', ';
  stSql := stSql + '' + aNodeDeviceType + ', ';
  stSql := stSql + '' + aServerNo + ', ';
  stSql := stSql + '' + aServerNo + ', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '''' + aTelNumber + ''', ';
  stSql := stSql + '''' + aAddr + ''', ';
  stSql := stSql + '''' + aAddDate + ''', ';
  stSql := stSql + '''N'') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_POSICODE_Value(aPosiCode, aName,
  aCompanyCode, aViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_POSICODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' PO_POSICODENAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_VIEWSEQ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aPosiCode + ', ';
  stSql := stSql + '''' + aName + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '' + aViewSeq + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_READERRCV_ReaderInit(aNodeNo,
  aEcuID, aReaderNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_READERRCV (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' RE_READERNO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aReaderNo + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_READER_ReaderInit(aNodeNo, aEcuID,
  aReaderNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_READER (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' RE_READERNO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aReaderNo + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_READER_TELNO(aNodeNo, aNO,
  aTELNumber: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_READER set RE_CARDREADERTEL' + aNO + ' = ''' + aTELNumber + ''' ';
  stSql := stsql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''00'' ';
  stSql := stSql + ' AND DE_EXTENDID = 0';
  stSql := stSql + ' AND RE_READERNO = 1';
  result := ProcessExecSQL(stSql);

  stSql := ' Update TB_READERRCV set RE_CARDREADERTEL' + aNO + ' = ''Y'' ';
  stSql := stsql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''00'' ';
  stSql := stSql + ' AND DE_EXTENDID = 0';
  stSql := stSql + ' AND RE_READERNO = 1';
  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_TIMECODEDEVICE_TimeCodeToDevice(
  aNodeNo, aEcuID, aBuildingCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_TIMECODEDEVICE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4 )';
  stSql := stSql + ' select ';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4 ';
  stSql := stSql + ' from TB_TIMECODE ';
  stSql := stSql + ' Where BC_BUILDINGCODE = ''' + aBuildingCode + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_ZONEEXTENTION_ZoneInit(aNodeNo,
  aEcuID, aExtNo, aName, aType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ZONEEXTENTION (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' ZE_EXTENTIONNAME,';
  stSql := stSql + ' ZE_TYPE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtNo + ',';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aType + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_ZONERCV_ZoneInit(aNodeNo, aEcuID,
  aExtNo, aZoneNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ZONERCV(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' ZN_ZONENO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtNo + ',';
  stSql := stSql + '' + aZoneNo + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.InsertIntoGMSTB_ZONE_ZoneInit(aNodeNo, aEcuID,
  aExtNo, aZoneNo, aZoneName: string;aBuildingCode:string='0'): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ZONE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' ZN_ZONENO,';
  stSql := stSql + ' ZN_ZONENAME,';
  stSql := stSql + ' BC_BUILDINGCODE )';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtNo + ',';
  stSql := stSql + '' + aZoneNo + ',';
  stSql := stSql + 'N''' + aZoneName + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''') ';

  result := ProcessExecSQL(stSql);
end;


function TdmGMSDataBase.ProcessExecSQL(aSql: String;
  bUpdateResult: Boolean): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  //������Ű��
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnection;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      Close;
      SQL.Text:= aSql;
      try
        nResult := ExecSQL;
//        LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log',aSql);
      except
      ON E: Exception do
        begin
          LogSave(G_stExeFolder + '\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + aSql);

          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('out of memory',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('������ �����߽��ϴ�',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;

          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;

  if bUpdateResult then
  begin
    if nResult > 0 then Result := True
    else
    begin
      Result := False;
      LogSave(G_stExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError(UPDATE)' + aSql);
    end;
  end else
  begin
    Result:= True;
  end;
end;

procedure TdmGMSDataBase.SetCancel(const Value: Boolean);
begin
  FCancel := Value;
end;

procedure TdmGMSDataBase.SetDBConnected(const Value: Boolean);
begin
  FDBConnected := Value;
end;

function TdmGMSDataBase.UpdateGMSTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(
  aEM_SEQ, aFingerApply: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ';
  stSql := stSql + ' CP_FINGERAPPLY = ''' + aFingerApply + ''' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEM_SEQ + ' ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_CARDPERMIT_VALUE(aNodeNo, aEcuID,
  aExtendID, aCardNo, aPermit, aDoor1, aDoor2, aDoor3, aDoor4, aDoor5, aDoor6,
  aDoor7, aDoor8, aArmArea0, aArmArea1, aArmArea2, aArmArea3, aArmArea4,
  aArmArea5, aArmArea6, aArmArea7, aArmArea8, aPassword,
  aCardType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMIT set ';
  stSql := stSql + ' CP_PERMIT = ''' + aPermit + ''', ';
  stSql := stSql + ' CP_DOOR1 = ''' + aDoor1 + ''', ';
  stSql := stSql + ' CP_DOOR2 = ''' + aDoor2 + ''', ';
  stSql := stSql + ' CP_DOOR3 = ''' + aDoor3 + ''', ';
  stSql := stSql + ' CP_DOOR4 = ''' + aDoor4 + ''', ';
  stSql := stSql + ' CP_DOOR5 = ''' + aDoor5 + ''', ';
  stSql := stSql + ' CP_DOOR6 = ''' + aDoor6 + ''', ';
  stSql := stSql + ' CP_DOOR7 = ''' + aDoor7 + ''', ';
  stSql := stSql + ' CP_DOOR8 = ''' + aDoor8 + ''', ';
  stSql := stSql + ' CP_ARMAREA0 = ''' + aArmArea0 + ''', ';
  stSql := stSql + ' CP_ARMAREA1 = ''' + aArmArea1 + ''', ';
  stSql := stSql + ' CP_ARMAREA2 = ''' + aArmArea2 + ''', ';
  stSql := stSql + ' CP_ARMAREA3 = ''' + aArmArea3 + ''', ';
  stSql := stSql + ' CP_ARMAREA4 = ''' + aArmArea4 + ''', ';
  stSql := stSql + ' CP_ARMAREA5 = ''' + aArmArea5 + ''', ';
  stSql := stSql + ' CP_ARMAREA6 = ''' + aArmArea6 + ''', ';
  stSql := stSql + ' CP_ARMAREA7 = ''' + aArmArea7 + ''', ';
  stSql := stSql + ' CP_ARMAREA8 = ''' + aArmArea8 + ''', ';
  stSql := stSql + ' CP_RCVACK = ''Y'', ';
  stSql := stSql + ' CP_MEMLOAD = ''N'' ';
  if aPassword <> '' then stSql := stSql + ', CP_PASSWD = ''' + aPassword + '''  ';
  if aCardType <> '' then stSql := stSql + ', CP_CARDTYPE = ''' + aCardType + '''  ';
  stSql := stSql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_ALARMEVENTSTATEPCCODE_Sound(aCode,
  aSound: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_ALARMEVENTSTATEPCCODE set AP_SOUND = ' + aSound + ' ';
  stSql := stSql + ' Where AP_EVENTSTATEPCCODE = ''' + aCode + '''';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_ARMAREA_Field_IntValue(aNodeNo, aEcuID,
  aExtendID, aArmAreaNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ARMAREA set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND AR_ARMAREANO = ' + aArmAreaNo + ' ';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_ARMAREA_Field_StringValue(aNodeNo, aEcuID,
  aExtendID, aArmAreaNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'AR_ARMAREANAME' then stSql := 'Update TB_ARMAREA set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_ARMAREA set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND AR_ARMAREANO = ' + aArmAreaNo + ' ';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_CARDGUBUN_Value(aCardType,
  aName: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_CARDGUBUN set CA_CARDGUBUNNAME = N''' + aName + ''' ';
  stSql := stSql + ' Where CA_CARDGUBUN = ' + aCardType + '';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_COMPANYCODE_Name(aCompanyCode,
  aCompanyName: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_COMPANYCODE set CO_COMPANYNAME = N''' + aCompanyName + ''' ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + '''';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_CONFIG_Value(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE, aCONFIGDETAIL: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_CONFIG set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  if aCONFIGDETAIL <> '' then stSql := stSql + ' ,CO_CONFIGDETAIL = ''' + aCONFIGDETAIL + ''' ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''' + aCONFIGGROUP + '''';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + '''';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_DOOR_Field_IntValue(aNodeNo, aEcuID,
  aExtendID, aNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DOOR set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aNo + ' ';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_DOOR_Field_StringValue(aNodeNo, aEcuID,
  aExtendID, aNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DOOR set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aNo + ' ';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_EMPLOYEE_Field_IntValue(aEmSeq,
  aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  result := True;
  stSql := ' Update TB_EMPLOYEE set ' + aFieldName + ' = ' + aValue + ' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_EMPLOYEE_Field_StringValue(aEmSeq,
  aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  result := True;
  stSql := ' Update TB_EMPLOYEE set ' + aFieldName + ' = ''' + aValue + ''' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_FORMNAME_Name(aPROGRAMGUBUN, aNAMECODE,
  aName: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_FORMNAME set FN_NAME1 = N''' + aName + ''' ';
  stSql := stSql + ' Where FN_PROGRAMGUBUN = ''' + aPROGRAMGUBUN + '''';
  stSql := stSql + ' AND FN_NAMECODE = ''' + aNAMECODE + '''';

  result := ProcessExecSql(stSql);
end;

function TdmGMSDataBase.UpdateGMSTB_ZONE_Field_StringValue(aNodeNo, aEcuID,
  aExtendID, aZoneNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'ZN_ZONENAME' then stSql := 'Update TB_ZONE set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_ZONE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''1234567890'' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND ZN_ZONENO = ' + aZoneNo + ' ';

  result := ProcessExecSQL(stSql);
end;

end.