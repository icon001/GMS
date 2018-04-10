unit uDBFunction;

interface

uses
  Windows,System.SysUtils, System.Classes,Winapi.ActiveX,Data.Win.ADODB,DB,Vcl.Forms;

const
  con_RANDMAXCARDNO = 2147483646;

type
  TdmDBFunction = class(TDataModule)
  private
    { Private declarations }
    function CreateYearHoliday(aYear:integer):Boolean;
  public
    Function ChangeTB_CARDPERMIT_AllRCVACK(aOldState,aNewState:string;aDecoderNo:string=''):Boolean;

    function CheckTB_ACCESSEVENT(aDate,aTime,aNodeNo,aEcuID,aExtendID,aDoorNo,aCardNo:string):integer;
    function CheckTB_ACCESSEVENT_TelTime(aDate,aTime,aNodeNo,aEcuID:string):integer;
    function CheckTB_ADMIN_UserID(aUserID:string):integer;
    function CheckTB_ALARMEVENT_Value(aDate, aTime, aNodeNo, aEcuID,aExtendID, aMsgNo:string):integer;
    function CheckTB_ARMAREA_ArmAreaUseChange(aNodeNo,aEcuID,aExtendID,aArmAreaNo:string):integer;
    function CheckTB_ATTENDCODE_WorkStartTime(aWorkTypeCode,aCode,aType,aInFromTime,aInToTime:string;var aDupData:string):integer;
    function CheckTB_ATTENDEVENT_EmSeqATType(aDate,aEmSeq,aAWCode,aATCode:string;var aInTime,aOutTime:string):integer;
    function CheckTB_ATTENDEVENT_MasterInWork(aDate, aEmSeq:string):integer;
    function CheckTB_ATTENDEVENT_MasterOutWork(aDate, aEmSeq:string):integer;
    function CheckTB_ATTENDEVENT_MasterUpdate(aDate, aEmSeq:string):integer;
    function CheckTB_ATTENDEVENT_MasterWorkIn(aDate, aEmSeq:string):integer;
    function CheckTB_ATTENDEVENT_MasterWorkOut(aDate, aEmSeq:string):integer;
    function CheckTB_ATTENDEVENT_TodayEmSeqATType(aATDate, aEmSeq,aAWCode:string; var aATCode, aInTime, aOutTime:string):integer;
    function CheckTB_ATTENTEVENTLIST_Value(aATDate,aEmSeq,aInOutType:string):integer;
    function CheckTB_BUILDINGMAP_BuildingCode(aBuildingCode,aType:string):integer;
    function CheckTB_CARD_CARDNO(aCardNo:string;var aCardType,aEmSeq,aEmCode,aEmName:string):integer;
    function CheckTB_CARD_FingerCard(aEmSeq:string;var aFingerCard,aFingerCardState:string):integer;
    function CheckTB_CARDBUTTONEVENTSTAT(aDate,aNodeNo,aEcuID,aExtendID,aDoorNo:string):integer;
    function CheckTB_CARDDELETEEVENT_Key(aYear,aWeekDay:string):integer;
    function CheckTB_CARDDELETEEVENT_Work(aYear,aWeekDay,aWeek:string):integer;
    function CheckTB_CARDFTPDOWNLIST_Device(aNodeNo,aEcuID:string):integer;
    function CheckTB_CARDPERMIT_DeviceCardNo(aNodeNo,aEcuID,aExtendID,aCardNo:string):integer;
    function CheckTB_CARDPERMITCOMPANYGROUP_Permit(aCompanyCode,aNodeNo,aEcuID,aExtendID,aType,aNumber:string):integer;
    function CheckTB_CARDPERMITEMPLOYEECODE_DevicePermitCount(aNodeNo,aEcuID:string):integer;
    function CheckTB_CARDPERMITEMPLOYEECODE_EmSeqApply(aEmSeq,aApply:string;aNodeNo:string='';aEcuID:string=''):integer;
    function CheckTB_CARDPERMITEMPLOYEECODE_FingerApply(aEM_SEQ,aNODENO,aECUID,aCP_TYPE,aCP_NUMBER,aFingerApply:string):integer;
    function CheckTB_CARDPERMITEMPLOYEECODE_Permit(aEmSeq,aNodeNo,aEcuID,aExtendID,aType,aNumber:string;var aPermit:string):integer;
    function CheckTB_CARDPERMITEMPLOYEECODE_PermitGrade(aEmSeq,aNodeNo,aEcuID,aExtendID,aType,aNumber,aPermit:string):integer;
    function CheckTB_CARDPERMITEMPLOYEECODE_PermitValue(aEmSeq,aNodeNo,aEcuID,aExtendID,aType,aNumber:string;var aPermit:string):integer;
    function CheckTB_CARDPERMITEMPLOYEEGROUP_Permit(aEmGroupCode,aNodeNo,aEcuID,aExtendID,aType,aNumber:string):integer;
    function CheckTB_CARDPRINTLIST_CardNo(aCardNO:string; var aPrintNo:string):integer;
    function CheckTB_CARDPRINTLIST_PrintNo(aPrintNo:string; var aCardNO:string):integer;
    function CheckTB_CCTV_IP(aCCTVIp,aCCTVNo:string):integer;
    function CheckTB_COMPANYCODE_CompanyName(aCompanyName:string):integer;
    function CheckTB_CONFIG_Value(aConfigGroup,aConfigCode:string):integer;
    function CheckTB_Decoder_IP(aDecoderIP,aServerPort:string;aDecoderNo:string=''):integer;
    function CheckTB_DEVICE_Used(aNodeNo,aEcuID,aExtendID,aUsed:string):integer;
    function CheckTB_DEVICE_Value(aNodeNo,aEcuID,aExtendID:string):integer;
    function CheckTB_Door_FieldString(aNodeNo,aEcuID,aDoorNo,aField,aData:string):integer;
    function CheckTB_DOOR_JavaraType(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    function checkTB_DOORSCHEDULE_DayCode(aNodeNo,aEcuID,aDoorNo,aDayCode:string):integer;
    function CheckTB_DOORSTATEEVENT_Key(aDate,aTime, aNodeNo, aEcuID,aExtendID,aDoorNo:string):integer;
    function CheckTB_DOORTELEVENT_Key(aDate, aTime, aNodeNo, aEcuID,aExtendID, aDoorNo:string):integer;
    function CheckTB_EMPLOYEE_CompanyCodeLike(aCompanyCode:string):integer;
    function checkTB_EMPLOYEE_EMCODE_Variable(aEmCode:string;var aEmSeq,aACType,aATType,aFDType,aEmName:string):integer;
    function checkTB_EMPLOYEE_EMSeq(aEmSeq:string):integer;
    function CheckTB_EMPLOYEE_PosiCode(aPosiCode:string):integer;
    function CheckTB_EMPLOYEEDEVICETIMECODE_Value(aEmSeq,aNodeNo,aEcuID:string):integer;
    Function CheckTB_EMPLOYEEDEVICETIMECODE_ValueTime(aEmseq,aNodeNo,aEcuID:string;var aTimeCodeUse,aTimeGroup,aTime1,aTime2,aTime3,aTime4,aWeek:string):integer;
    function CheckTB_EMPLOYEEFINGER_Value(aEmSeq,aFingerSeq:string):integer;
    function CheckTB_EMPLOYEEGUBUN_Name(aName:string):integer;
    function CheckTB_FINGERDEVICE_IP(aIp,aFingerID:string):integer;
    function CheckTB_FINGERDEVICECARD_PermitValue(aFnSeq,aCardPOSITIONNUM,aPERMIT:string):integer;
    function CheckTB_FINGERDEVICECARD_SENDSTATE(aFNDEVICESEQ,aPOSITIONNUM,aSendState:string):integer;
    function CheckTB_FINGERDEVICECARD_Value(aFnSeq,aCardPOSITIONNUM:string):integer;
    function CheckTB_FOODCODECOUNT_Value(aDate,aFDType,aFDCode:string):integer;
    function CheckTB_FOODOUTCOUNT(aFoodDate,aFDType,aFoodCode:string):integer;
    function CheckTB_FOODEVENT_FDTYPE(aDate,aEmSeq,aFdTye,aFdCode:string):integer;
    function checkTB_FOODEVENT_Value(aDate,aTime,aEmSeq,aNodeNo,aEcuID,aReaderNo:string):integer;
    function CheckTB_GUESTLIST_GLCode(aGLDate,aGlCode:string;var aGlSeq:string):integer;
    function CheckTB_HOLIDAY_Date(aDate:string):integer;
    function CheckTB_NODE_DeviceID(aSockType,aDeviceID:string;var aNodeNo:string):integer;
    function CheckTB_NODE_NodeIP(aNodeIP,aNodeNo:string):integer;
    function CheckTB_POSICODE_PosiName(aCompanyCode,aPosiName:string):integer;

    function CopyDeviceToCardPermitEmployeeCode(aNodeNo,aEcuID,aExtendID,aType,aNumber,aPermit,aApply:string):Boolean;
    function CopyHolidayToAllDevice(aDate,aType:string):Boolean;
    function copyHoliDayToDevice(aNodeNo,aEcuID:string):Boolean;
    function CopyTB_CARDPERMITCOMPANYGROUP_ChiledCode(aParentCode,aChildCode,aDeepSeq:string):Boolean;
    function CopyTB_CARDPERMITEMPLOYEEGROUP_ChiledCode(aParentCode,aChildCode,aDeepSeq:string):Boolean;

    function DefaultHolidayCreate:Boolean;

    function GetNextNodeNo : string;
    function GetNextTB_AdminGradeCode : string;
    function GetNextTB_ANTIGROUPCODE_ID : string;
    function GetNextTB_ATTENDCODEValue(aAwCode:string) : string;
    function GetNextTB_ATTENDPOSITIONCode : string;
    function GetNextTB_ATTENDWORKTYPECode : string;
    function GetNextTB_CARD_PositionNum : string;
    function GetNextTB_CARD_RelayID : string;
    function GetNextTB_CCTV_No : string;
    function GetNextTB_COMPANYCODE_ChildCompanyCode(aParentCode:string;var aCode,aDeepSeq,aViewSeq:string):Boolean;
    function GetNextTB_DECODER_ID : string;
    function GetNextTB_EMPLOYEE_EmployeeCode:string;
    function GetNextTB_EMPLOYEE_EmSeq:string;
    function GetNextTB_EMPLOYEEGROUPCODE_ChildEmGroupCode(aParentCode:string;var aCode,aDeepSeq,aViewSeq:string):Boolean;
    function GetNextTB_EMPLOYEEGUBUN_Code:string;
    function GetNextTB_EMPLOYEESTATECODE_Code:string;
    function GetNextTB_FINGERDEVICE_ID : string;
    function GetNextTB_FIREGROUP_ID : string;
    Function GetNextTB_FOODCODEValue(aFoodType:string):string;
    function GetNextTB_FOODGROUP_ID : string;
    function GetNextTB_FOODTYPE_ID : string;
    function GetNextTB_POSICODE:string;

    function GetProgramGrade(aAdminGradeCode,aProgID,aProgramType:string;var aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean):Boolean;
    function GetTB_ALARMEVENTSTATEPCCODE_State(aAlarmStatePCCode:string;var aAlarmStatePCCodeName:string;var aAlarmView:string; var aAlarmSound:string;var aAlarmColor:string):Boolean;
    function GetTB_ARMAREA_ArmAreaName(aNodeNo,aEcuID,aArmAreaNo:string):string;
    function GetTB_ARMAREA_ArmAreaInfo(aNodeNo,aEcuID,aArmAreaNo:string; var aArmAreaName,aArmAreaView:string):Boolean;
    function GetTB_ARMAREA_BuildingCode(aNodeNo,aEcuID,aArmAreaNo:string):string;
    function GetTB_ARMAREA_BuildingInfo(aNodeNo,aEcuID,aArmAreaNo:string;var aBuildingName,aTelNo,aMemo:string):Boolean;
    function GetTB_ARMAREA_BuildingName(aNodeNo,aEcuID,aArmAreaNo:string):string;
    function GetTB_ARMAREA_CCTVSeq(aNodeNo,aEcuID,aArmAreaNo:string;var aCCTVSeq:string):Boolean;
    function GetTB_ARMAREA_ViewSeq(aNodeNo,aEcuID,aArmAreaNo:string):string;
    function getTB_ATTENDCODE_RecordCount(aAWCode:string):integer;
    function getTB_ATTENDPOSITOIN_RecordCount:integer;
    function getTB_ATTENDWORKTYPE_RecordCount:integer;
    function GetTB_BUILDINGCODE_BuildingName(aBuildingCode:string):string;
    function GetTB_CARD_CardCount(aEmSeq:string):integer;
    function GetTB_CARD_EMPLOYEEInfo(aCardNo:string; var aEmSeq,aEmCode,aEmName:string):Boolean;
    function GetTB_CARD_FingerCardNo:string;
    function GetTB_CARDPERMITEMPLOYEECODE_ApplyCount:integer;
    function GetTB_CARDPRINTLIST_AutoPrintNo:string;
    function GetTB_CARDPRINTLIST_CardNo(aPrintNo:string):string;
    function GetTB_CARDPRINTLIST_PrintNoFromCardNo(aCardNo:string):string;
    function GetTB_CCTV_Name(aCCTVNo : string):string;
    function GetTB_CCTV_Info(aCCTVSeq:string; var aCCTVIP,aCCTVPort,aCCTVIName,aCCTVUserID,aCCTVUserPw:string):Boolean;
    function GetTB_COMPANYCODE_AutoPermitDelete(aCompanyCode:string):string;
    function GetTB_COMPANYCODE_codeFromName(aCompanyName,aDeepSeq:string;var aSearchDeepSeq:string):string;
    Function GetTB_COMPANYCODE_CodeFromBaseName(aCompanyCode,aName:string):string;
    Function GetTB_COMPANYCODE_CodeFromRelayCode(aCode:string;var aCompanyName:string):string;
    function GetTB_COMPANYCODE_CompanyCodeFromName(aCompanyCode,aCompanyName,aDeepSeq:string):string;
    function GetTB_COMPANYCODE_CurrentDeepSeq(aOrgCode:string):string;
    function GetTB_DEVICE_BuildingCode(aNodeNo,aEcuID,aExtendID:string):string;
    function GetTB_DEVICE_DeviceInfo(aNodeNo,aEcuID:string; var aEcuName,aEcuUse,aArmAreaUse:string):Boolean;
    function GetTB_DOORTELEVENT_LastAccessInfo(aNodeNo,aEcuID,aExtendID,aDoorNo,aPassword:string;var aEmName:string;var aEmHandphone:string):Boolean;
    function GetTB_DOOR_AtDedicateUse(aNodeNo,aEcuID,aDoorNo:string):string;
    function GetTB_Door_BuildingCode(aNodeNo,aEcuID,aDoorNo:string):string;
    function GetTB_Door_BuildingName(aNodeNo,aEcuID,aDoorNo:string):string;
    function GetTB_DOOR_DoorInfo(aNodeNo,aEcuID,aDoorNo:string;var aDoorName,aDoorView,aDoorMemo:string):Boolean;
    function GetTB_Door_DoorMemo(aNodeNo,aEcuID,aDoorNo:string):string;
    function GetTB_DOOR_DoorName(aNodeNo,aEcuID,aDoorNo:string):string;
    function GetTB_DOOR_FdDedicateUse(aNodeNo,aEcuID,aDoorNo:string):string;
    function GetTB_DOOR_FireDoorOpen(aNodeNo,aEcuID,aDoorNo:string):string;
    Function GetTB_DOOR_NoFromRelayNo(aNo:string; var aNodeNo:string;var aEcuID:string; var aDoorNo:string):integer; //연동번호로 출입문 코드를 확인한다
    Function GetTB_Door_RelayNo(aNodeNo,aEcuID,aDoorNo:string):string;
    function GetTB_DOOR_ScheduleUse(aNodeNo,aEcuID,aDoorNo:string):string;
    function GetTB_DOOR_TimeCodeUse(aNodeNo,aEcuID,aDoorNo:string):string;
    function GetTB_Door_ViewSeq(aNodeNo,aEcuID,aDoorNo:string):string;
    function GetTB_EMPLOYEE_EmSeq(aEmCode:string;var aEmSeq,aCompanyCode,aEmGroupCode,aCardGroupType:string):integer;
    Function GetTB_EMPLOYEEGUBUN_CodeFromRelayCode(aRelayCode:string;var aName:string):string;
    function GetTB_EMPLOYEEGUBUN_ViewSeq(aCode:string):string;
    function GetTB_EMPLOYEEGROUPCODE_AutoPermitDelete(aGroupCode:string):string;
    function GetTB_EMPLOYEEGROUPCODE_codeFromName(aName,aDeepSeq:string; var aSearchDeepSeq:string):string;
    function GetTB_EMPLOYEEGROUPCODE_CurrentDeepSeq(aOrgCode:string):string;
    function GetTB_EMPLOYEEGUBUN_CodeFromName(aWorkGubunName:string):string;
    function GetTB_EMPLOYEESTATECODE_codeFromName(aName:string):string;
    function GetTB_FINGERDEVICE_DeviceInfo(aFingerSeq:string; var aNodeNo,aEcuID,aType,aDoorNo:string):Boolean;
//    Function GetTB_FORMNAME_Name(aProgramGubun,aMenuGubun,aNameCode,aLangType:string):string;
    function GetTB_NODE_NextDeviceID(aSockType:string;var aNodeNo,aDeviceID:string):Boolean;
    function GetTB_NODE_NodeIP(aNodeNo:string):string;
    function GetTB_NODE_NodeName(aNodeNo:string):string;
    function GetTB_POSICODE_codeFromName(aCompanyCode,aName:string):string;
  end;

var
  dmDBFunction: TdmDBFunction;

implementation

uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBInsert,
  uDBUpdate,
  uSolarLunar;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDataModule1 }


{ TdmDBFunction }


{ TdmDBFunction }

function TdmDBFunction.ChangeTB_CARDPERMIT_AllRCVACK(aOldState, aNewState,
  aDecoderNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  stSql := 'select * from TB_NODE ';
  //stSql := stSql + ' Where CP_RCVACK = ''' + aOldState + ''' ';
  if isDigit(aDecoderNo) then stSql := stSql + ' Where ND_DECODERNO = ' + aDecoderNo + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        dmDBUpdate.UpdateTB_CARDPERMIT_NodeRCVACK(FindField('ND_NODENO').AsString,aOldState,aNewState);
        Application.ProcessMessages;    //-- Hide Error 폼이 뜨기 전에 실행되서 에러 나는듯...
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_ACCESSEVENT(aDate, aTime, aNodeNo, aEcuID,
  aExtendID, aDoorNo, aCardNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ACCESSEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AE_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AE_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_ACCESSEVENT_TelTime(aDate, aTime, aNodeNo,
  aEcuID: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ACCESSEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AE_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AE_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AE_CONTROLTYPECODE = ''P'' ';    //전화 열림인 시간이 있는지 체크

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_ADMIN_UserID(aUserID: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ADMIN ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AD_USERID = ''' + aUserID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_ALARMEVENT_Value(aDate, aTime, aNodeNo, aEcuID,
  aExtendID, aMsgNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ALARMEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AE_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AE_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND AE_MSGNO = ''' + aMsgNo + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_ARMAREA_ArmAreaUseChange(aNodeNo, aEcuID,
  aExtendID, aArmAreaNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ARMAREA ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND AR_ARMAREANO = ' + aArmAreaNo + ' ';
  stSql := stSql + ' AND AR_ARMAREAUSECHANGE = ''1'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_ATTENDCODE_WorkStartTime(aWorkTypeCode, aCode,
  aType, aInFromTime,aInToTime: string; var aDupData: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ATTENDCODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AW_CODE = ' + aWorkTypeCode + ' ';
  stSql := stSql + ' AND AT_ATCODE <> ' + aCode + ' ';
  if aType = '1' then //평일 체크
  begin
    stSql := stSql + ' AND ( ';
    stSql := stSql + ' ( AT_INFROMTIME <= ''' + aInFromTime + ''' ';
    stSql := stSql + ' AND AT_INTOTIME >= ''' + aInFromTime + ''' ) ';
    stSql := stSql + ' OR ( AT_INFROMTIME <= ''' + aInToTime + ''' ';
    stSql := stSql + ' AND AT_INTOTIME >= ''' + aInToTime + ''' ) ';
    stSql := stSql + ' OR ( AT_INFROMTIME < AT_INTOTIME ';
    stSql := stSql + ' AND AT_INFROMTIME >= ''' + aInFromTime + ''' ';
    stSql := stSql + ' AND AT_INTOTIME <= ''' + aInToTime + ''' ) ';
    stSql := stSql + ' ) ';
  end else if aType = '2' then //토요일 체크
  begin
    stSql := stSql + ' AND ( ';
    stSql := stSql + ' ( AT_SINFROMTIME <= ''' + aInFromTime + ''' ';
    stSql := stSql + ' AND AT_SINTOTIME >= ''' + aInFromTime + ''' ) ';
    stSql := stSql + ' OR ( AT_SINFROMTIME <= ''' + aInToTime + ''' ';
    stSql := stSql + ' AND AT_SINTOTIME >= ''' + aInToTime + ''' ) ';
    stSql := stSql + ' OR ( AT_SINFROMTIME < AT_SINTOTIME ';
    stSql := stSql + ' AND AT_SINFROMTIME >= ''' + aInFromTime + ''' ';
    stSql := stSql + ' AND AT_SINTOTIME <= ''' + aInToTime + ''' ) ';
    stSql := stSql + ' ) ';
  end else if aType = '3' then //공휴일 체크
  begin
    stSql := stSql + ' AND ( ';
    stSql := stSql + ' ( AT_HINFROMTIME <= ''' + aInFromTime + ''' ';
    stSql := stSql + ' AND AT_HINTOTIME >= ''' + aInFromTime + ''' ) ';
    stSql := stSql + ' OR ( AT_HINFROMTIME <= ''' + aInToTime + ''' ';
    stSql := stSql + ' AND AT_HINTOTIME >= ''' + aInToTime + ''' ) ';
    stSql := stSql + ' OR ( AT_HINFROMTIME < AT_HINTOTIME ';
    stSql := stSql + ' AND AT_HINFROMTIME >= ''' + aInFromTime + ''' ';
    stSql := stSql + ' AND AT_HINTOTIME <= ''' + aInToTime + ''' ) ';
    stSql := stSql + ' ) ';
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
      aDupData := FindField('AT_CODENAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_ATTENDEVENT_EmSeqATType(aDate, aEmSeq,aAWCode,aATCode: string;
  var aInTime, aOutTime: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ATTENDEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND AW_CODE = ' + aAWCode + ' ';
  stSql := stSql + ' AND AT_ATCODE = ' + aATCode + ' ';


  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
      //aAWCode := FindField('AW_CODE').AsString;
      aInTime := FindField('AE_ATINTIME').AsString;
      aOutTime := FindField('AE_ATOUTTIME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_ATTENDEVENT_MasterInWork(aDate,
  aEmSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ATTENDEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND AE_WORKINUSER is not null ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_ATTENDEVENT_MasterOutWork(aDate,
  aEmSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ATTENDEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND AE_WORKOUTUSER is not null ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_ATTENDEVENT_MasterUpdate(aDate,
  aEmSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ATTENDEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND (AE_ATTYPEUSER is not null ';
  stSql := stSql + ' or AE_INUSER is not null ';
  stSql := stSql + ' or AE_WORKOUTUSER is not null ';
  stSql := stSql + ' or AE_WORKINUSER is not null ';
  stSql := stSql + ' or AE_OUTUSER is not null) ';


  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_ATTENDEVENT_MasterWorkIn(aDate,
  aEmSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ATTENDEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND AE_INUSER is not null ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_ATTENDEVENT_MasterWorkOut(aDate,
  aEmSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ATTENDEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND AE_OUTUSER is not null ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_ATTENDEVENT_TodayEmSeqATType(aATDate,
  aEmSeq,aAWCode: string; var aATCode, aInTime, aOutTime: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ATTENDEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aATDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND AW_CODE = ' + aAWCode + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
      aATCode := FindField('AT_ATCODE').AsString;
      aInTime := FindField('AE_ATINTIME').AsString;
      aOutTime := FindField('AE_ATOUTTIME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_ATTENTEVENTLIST_Value(aATDate, aEmSeq,
  aInOutType: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_ATTENDEVENTLIST ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aATDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND AC_INOUTTYPE = ' + aInOutType + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_BUILDINGMAP_BuildingCode(
  aBuildingCode,aType: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_BUILDINGMAP ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_BUILDINGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND BM_TYPE = ' + aType + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_CARDBUTTONEVENTSTAT(aDate, aNodeNo, aEcuID,
  aExtendID, aDoorNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDBUTTONEVENTSTAT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CB_DAY = ''' + aDate + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_CARDDELETEEVENT_Key(aYear,
  aWeekDay: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDDELETEEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CD_YEAR = ''' + aYear + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_CARDDELETEEVENT_Work(aYear, aWeekDay,
  aWeek: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDDELETEEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CD_YEAR = ''' + aYear + ''' ';
  stSql := stSql + ' AND CD_WEEK = ' + aWeekDay + ' ';
  if isDigit(aWeek) then
  begin
    case strtoint(aWeek) of
      1 : begin
        stSql := stSql + ' AND CD_SUN = ''Y'' ';
      end;
      2 : begin
        stSql := stSql + ' AND CD_MON = ''Y'' ';
      end;
      3 : begin
        stSql := stSql + ' AND CD_TUE = ''Y'' ';
      end;
      4 : begin
        stSql := stSql + ' AND CD_WED = ''Y'' ';
      end;
      5 : begin
        stSql := stSql + ' AND CD_THU = ''Y'' ';
      end;
      6 : begin
        stSql := stSql + ' AND CD_FRI = ''Y'' ';
      end;
      7 : begin
        stSql := stSql + ' AND CD_SAT = ''Y'' ';
      end;
    end;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_CARDFTPDOWNLIST_Device(aNodeNo,
  aEcuID: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDFTPDOWNLIST ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_CARDPERMITCOMPANYGROUP_Permit(aCompanyCode,
  aNodeNo, aEcuID, aExtendID, aType, aNumber: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMITCOMPANYGROUP ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' ';
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_DevicePermitCount(aNodeNo,
  aEcuID: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select count(*) as CNT from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      else result := FindField('CNT').AsInteger;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_EmSeqApply(aEmSeq,
  aApply: string;aNodeNo:string='';aEcuID:string=''): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND CP_APPLY = ''' + aApply + ''' ';
  if aEcuID <> '' then
  begin
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_FingerApply(aEM_SEQ,aNODENO,aECUID,aCP_TYPE,aCP_NUMBER,aFingerApply:string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEM_SEQ + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNODENO + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aCP_TYPE + ''' ';
  stSql := stSql + ' AND CP_NUMBER = ' + aCP_NUMBER + ' ';
  stSql := stSql + ' AND CP_FINGERAPPLY = ''' + aFingerApply + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_Permit(aEmSeq, aNodeNo,
  aEcuID, aExtendID, aType, aNumber: string;var aPermit:string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' ';
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
        aPermit := FindField('CP_PERMIT').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_PermitGrade(aEmSeq,
  aNodeNo, aEcuID, aExtendID, aType, aNumber, aPermit: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' ';
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';
  stSql := stSql + ' AND CP_PERMIT = ''' + aPermit + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_PermitValue(aEmSeq,   //승인코드를 가져 가자.
  aNodeNo, aEcuID, aExtendID, aType, aNumber: string;
  var aPermit: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' ';
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
        aPermit := FindField('CP_PERMIT').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_CARDPERMITEMPLOYEEGROUP_Permit(aEmGroupCode,
  aNodeNo, aEcuID, aExtendID, aType, aNumber: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMITEMPLOYEEGROUP ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE = ''' + aEmGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' ';
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_CARDPERMIT_DeviceCardNo(aNodeNo, aEcuID,
  aExtendID, aCardNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMIT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_CARDPRINTLIST_CardNo(aCardNO: string;
  var aPrintNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPRINTLIST ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNO + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordcount = 0 then Exit;
      result := 1;
      aPrintNo := FindField('CA_PRINTNO').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_CARDPRINTLIST_PrintNo(aPrintNo: string;
  var aCardNO: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPRINTLIST ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_PRINTNO = ''' + aPrintNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordcount = 0 then Exit;
      result := 1;
      aPrintNo := FindField('CA_CARDNO').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.checkTB_CARD_CARDNO(aCardNo: string; var aCardType,
  aEmSeq,aEmCode,aEmName: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select a.CA_CARDGUBUN,b.EM_SEQ,b.EM_CODE,b.EM_NAME from TB_CARD a ';
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ) ';
  stSql := stSql + ' Where  a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if recordcount > 0 then
      begin
        aCardType := FindField('CA_CARDGUBUN').AsString;
        aEmSeq := FindField('EM_SEQ').AsString;
        aEmCode := FindField('EM_CODE').AsString;
        aEmName := FindField('EM_NAME').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_CARD_FingerCard(aEmSeq: string;
  var aFingerCard,aFingerCardState: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select CA_CARDNO,CA_STATECODE from TB_CARD ';
  stSql := stSql + ' Where  EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND CA_CARDGUBUN = ''0'' ';  //지문전용카드

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if recordcount > 0 then
      begin
        aFingerCard := FindField('CA_CARDNO').AsString;
        aFingerCardState := FindField('CA_STATECODE').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_CCTV_IP(aCCTVIp, aCCTVNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CCTV ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CT_IP = ''' + aCCTVIp + ''' ';
  stSql := stSql + ' AND CT_NO <> ' + aCCTVNo + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_COMPANYCODE_CompanyName(
  aCompanyName: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_COMPANYCODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYNAME = N''' + aCompanyName + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_CONFIG_Value(aConfigGroup,
  aConfigCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aConfigGroup + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aConfigCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_Decoder_IP(aDecoderIP,
  aServerPort: string;aDecoderNo:string=''): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_Decoder ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_DECODERIP = ''' + aDecoderIP + ''' ';
  if aDecoderNo <> '' then stSql := stSql + ' AND ND_DECODERNO <> ' + aDecoderNo + ' ';
  stSql := stSql + ' AND (ND_DECODERDEVICEPORT = ' + aServerPort + ' ';
  stSql := stSql + ' OR ND_DECODERDEVICEPORT = ' + aServerPort + ' ';
  stSql := stSql + ' OR ND_DECORDERFTPPORT = ' + aServerPort + ') ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_DEVICE_Used(aNodeNo, aEcuID, aExtendID,
  aUsed: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_DEVICE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DE_DEVICEUSE = ''' + aUsed + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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


function TdmDBFunction.CheckTB_DEVICE_Value(aNodeNo, aEcuID,aExtendID: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_DEVICE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.checkTB_DOORSCHEDULE_DayCode(aNodeNo, aEcuID, aDoorNo,
  aDayCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;

  stSql := 'select * from TB_DOORSCHEDULE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  stSql := stSql + ' AND DS_DAYCODE = ''' + aDayCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_DOORSTATEEVENT_Key(aDate, aTime, aNodeNo, aEcuID,
  aExtendID, aDoorNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;

  stSql := 'select * from TB_DOORSTATEEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND DE_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND DE_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_DOORTELEVENT_Key(aDate, aTime, aNodeNo, aEcuID,
  aExtendID, aDoorNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;

  stSql := 'select * from TB_DOORTELEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND DE_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND DE_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_Door_FieldString(aNodeNo, aEcuID, aDoorNo,
  aField, aData: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;

  stSql := 'select * from TB_DOOR ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  stSql := stSql + ' AND ' + aField + ' = ''' + aData + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_DOOR_JavaraType(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;

  stSql := 'select * from TB_DOOR ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if (FindField('DO_LOCKTYPE').AsInteger = 10) or
        (FindField('DO_LOCKTYPE').AsInteger = 11)
       then result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_EMPLOYEEDEVICETIMECODE_Value(aEmSeq, aNodeNo,
  aEcuID: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEEDEVICETIMECODE ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_EMPLOYEEDEVICETIMECODE_ValueTime(aEmseq, aNodeNo,
  aEcuID: string; var aTimeCodeUse,aTimeGroup, aTime1, aTime2, aTime3, aTime4,
  aWeek: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEEDEVICETIMECODE ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordcount = 0 then Exit;
      result := 1;
      aTimeCodeUse := FindField('EM_TIMECODEUSE').AsString;
      aTimeGroup := FindField('TC_GROUP').AsString;
      aTime1 := FindField('TC_TIME1').AsString;
      aTime2 := FindField('TC_TIME2').AsString;
      aTime3 := FindField('TC_TIME3').AsString;
      aTime4 := FindField('TC_TIME4').AsString;
      aWeek := FindField('TC_WEEKCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_EMPLOYEEFINGER_Value(aEmSeq,
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
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_EMPLOYEEGUBUN_Name(aName: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEEGUBUN ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GUBUNCODENAME = ''' + aName + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_EMPLOYEE_CompanyCodeLike(
  aCompanyCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.checkTB_EMPLOYEE_EMCODE_Variable(aEmCode: string;
  var aEmSeq, aACType, aATType, aFDType, aEmName: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';


  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if recordcount < 1 then result := 0
      else
      begin
        result := 1;
        aEmSeq := FindField('EM_SEQ').AsString;
        aEmName := FindField('EM_NAME').AsString;
        aACType := FindField('EM_ACUSE').AsString;
        aATType := FindField('EM_ATUSE').AsString;
        aFDType := FindField('EM_FDUSE').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.checkTB_EMPLOYEE_EMSeq(aEmSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';


  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if recordcount < 1 then result := 0
      else
      begin
        result := 1;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_EMPLOYEE_PosiCode(aPosiCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND PO_POSICODE = ' + aPosiCode + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_FINGERDEVICECARD_PermitValue(aFnSeq,
  aCardPOSITIONNUM, aPERMIT: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_FINGERDEVICECARD ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_DEVICESEQ = ' + aFnSeq + ' ';
  stSql := stSql + ' AND CA_POSITIONNUM = ' + aCardPOSITIONNUM + '';
  stSql := stSql + ' AND CP_PERMIT = ''' + aPERMIT + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_FINGERDEVICECARD_SENDSTATE(aFNDEVICESEQ,
  aPOSITIONNUM, aSendState: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_FINGERDEVICECARD ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_DEVICESEQ = ' + aFNDEVICESEQ + ' ';
  stSql := stSql + ' AND CA_POSITIONNUM = ' + aPOSITIONNUM + '';
  stSql := stSql + ' AND FD_SEND = ''' + aSendState + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_FINGERDEVICECARD_Value(aFnSeq,
  aCardPOSITIONNUM: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_FINGERDEVICECARD ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_DEVICESEQ = ' + aFnSeq + ' ';
  stSql := stSql + ' AND CA_POSITIONNUM = ' + aCardPOSITIONNUM + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_FINGERDEVICE_IP(aIp, aFingerID: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_FINGERDEVICE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_DEVICEIP = ''' + aIp + ''' ';
  stSql := stSql + ' AND FN_DEVICESEQ <> ' + aFingerID + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_FOODCODECOUNT_Value(aDate, aFDType,
  aFDCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_FOODCODECOUNT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FC_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND RE_FDTYPE = ''' + aFDType + ''' ';
  stSql := stSql + ' AND FO_CODE = ' + aFdCode + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_FOODEVENT_FDTYPE(aDate, aEmSeq, aFdTye,
  aFdCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_FOODEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FE_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND RE_FDTYPE = ''' + aFdTye + ''' ';
  stSql := stSql + ' AND FO_CODE = ' + aFdCode + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.checkTB_FOODEVENT_Value(aDate, aTime, aEmSeq, aNodeNo,
  aEcuID, aReaderNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_FOODEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FE_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND FE_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ' + aReaderNo + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmDBFunction.CheckTB_FOODOUTCOUNT(aFoodDate, aFDType,
  aFoodCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_FOODOUTCOUNT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FC_DATE = ''' + aFoodDate + ''' ';
  stSql := stSql + ' AND RE_FDTYPE = ''' + aFDType + ''' ';
  stSql := stSql + ' AND FO_CODE = ''' + aFoodCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_GUESTLIST_GLCode(aGLDate,aGlCode: string;var aGlSeq:string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_GUESTLIST ';
  stSql := stSql + ' Where GL_CODE = ''' + aGlCode + ''' ';
  stSql := stSql + ' AND GL_DATE = ''' + aGLDate + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
        aGlSeq := FindField('GL_SEQ').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_HOLIDAY_Date(aDate: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_HOLIDAY ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND HO_DAY = ''' + aDate + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_NODE_DeviceID(aSockType,
  aDeviceID: string;var aNodeNo : string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_NODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_DEVICEID = ''' + aDeviceID + ''' ';
  if aSockType <> '' then stSql := stSql + ' AND ND_SOCKETTYPE = ''' + aSockType + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
        aNodeNo := FindField('ND_NODENO').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_NODE_NodeIP(aNodeIP, aNodeNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_NODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODEIP = ''' + aNodeIP + ''' ';
  stSql := stSql + ' AND ND_NODENO <> ' + aNodeNo + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.CheckTB_POSICODE_PosiName(aCompanyCode,
  aPosiName: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_POSICODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_POSICODENAME = ''' + aPosiName + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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


function TdmDBFunction.CopyDeviceToCardPermitEmployeeCode(aNodeNo, aEcuID,aExtendID,
  aType, aNumber, aPermit, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_SEQ,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  stSql := stSql + 'CP_APPLY, ';
  stSql := stSql + 'CP_FINGERAPPLY ) ';
  stSql := stSql + 'select GROUP_CODE,';
  stSql := stSql + 'EM_SEQ,';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '' + aExtendID + ',';
  stSql := stSql + '''' + aType + ''',';
  stSql := stSql + '' + aNumber + ',';
  stSql := stSql + '''' + aPermit + ''',';
  stSql := stSql + '''' + aApply + ''', ';
  stSql := stSql + '''' + aApply + ''' ';
  stSql := stSql + ' From TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_ACUSE = ''1'' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBFunction.CopyHolidayToAllDevice(aDate,aType: string): Boolean;
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
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' and DE_EXTENDID = 0 ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBFunction.copyHoliDayToDevice(aNodeNo, aEcuID: string): Boolean;
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
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND HO_ACUSE = ''1'' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBFunction.CopyTB_CARDPERMITCOMPANYGROUP_ChiledCode(aParentCode,
  aChildCode,aDeepSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITCOMPANYGROUP  ';
  stSql := stSql + '( GROUP_CODE, ';
  stSql := stSql + 'CO_COMPANYCODE, ';
  stSql := stSql + 'ND_NODENO, ';
  stSql := stSql + 'DE_ECUID, ';
  stSql := stSql + 'DE_EXTENDID, ';
  stSql := stSql + 'CP_TYPE, ';
  stSql := stSql + 'CP_NUMBER, ';
  stSql := stSql + 'CP_PERMIT, ';
  stSql := stSql + 'CO_DEEPSEQ, ';
  stSql := stSql + 'CP_APPLY ) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' GROUP_CODE, ';
  stSql := stSql + '''' +  aChildCode + ''', ';
  stSql := stSql + 'ND_NODENO, ';
  stSql := stSql + 'DE_ECUID, ';
  stSql := stSql + 'DE_EXTENDID, ';
  stSql := stSql + 'CP_TYPE, ';
  stSql := stSql + 'CP_NUMBER, ';
  stSql := stSql + 'CP_PERMIT, ';
  stSql := stSql + '' +  aDeepSeq + ', ';
  stSql := stSql + '''N''  ';
  stSql := stSql + ' From  TB_CARDPERMITCOMPANYGROUP ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aParentCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBFunction.CopyTB_CARDPERMITEMPLOYEEGROUP_ChiledCode(aParentCode,
  aChildCode, aDeepSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEEGROUP  ';
  stSql := stSql + '( GROUP_CODE, ';
  stSql := stSql + 'EM_GROUPCODE, ';
  stSql := stSql + 'ND_NODENO, ';
  stSql := stSql + 'DE_ECUID, ';
  stSql := stSql + 'DE_EXTENDID, ';
  stSql := stSql + 'CP_TYPE, ';
  stSql := stSql + 'CP_NUMBER, ';
  stSql := stSql + 'CP_PERMIT, ';
  stSql := stSql + 'EM_DEEPSEQ, ';
  stSql := stSql + 'CP_APPLY ) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' GROUP_CODE, ';
  stSql := stSql + '''' +  aChildCode + ''', ';
  stSql := stSql + 'ND_NODENO, ';
  stSql := stSql + 'DE_ECUID, ';
  stSql := stSql + 'DE_EXTENDID, ';
  stSql := stSql + 'CP_TYPE, ';
  stSql := stSql + 'CP_NUMBER, ';
  stSql := stSql + 'CP_PERMIT, ';
  stSql := stSql + '' +  aDeepSeq + ', ';
  stSql := stSql + '''N''  ';
  stSql := stSql + ' From  TB_CARDPERMITEMPLOYEEGROUP ';
  stSql := stSql + ' Where EM_GROUPCODE = ''' + aParentCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBFunction.CreateYearHoliday(aYear: integer): Boolean;
var
  stYear : string;
  stDate : string;
  nYear,nMonth,nDay : Word;
begin
  inherited;
  stYear := inttostr(aYear);
  stDate := stYear + '0101';   //신정
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','신정','NewYear');
  stDate := stYear + '0301';   //삼일절
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','삼일절','');
  stDate := stYear + '0505';   //어린이날
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','어린이날','KIDSDay');
  stDate := stYear + '0606';   //현충일
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','현충일','');
  stDate := stYear + '0815';   //광복절
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','광복절','');
  stDate := stYear + '1009';   //한글날
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','한글날','');
  stDate := stYear + '1013';   //개천절
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','개천절','');
  stDate := stYear + '1225';   //성탄절
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','성탄절','Christmas');

  Lunar_To_Solar(aYear - 1,12,29,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //구정연휴
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','구정연휴','');
  Lunar_To_Solar(aYear,1,1,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //구정연휴
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','구정','');
  Lunar_To_Solar(nYear,1,2,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //구정연휴
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','구정연휴','');
  Lunar_To_Solar(nYear,4,8,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //석가탄신일
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','부처님오신날','');
  Lunar_To_Solar(nYear,8,14,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //추석연휴
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','추석연휴','');
  Lunar_To_Solar(nYear,8,15,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //추석연휴
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','추석','');
  Lunar_To_Solar(nYear,8,16,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //추석연휴
  dmDBInsert.InsertIntoTB_HOLIDAY_All(stDate,'1','1','추석연휴','');

end;

function TdmDBFunction.DefaultHolidayCreate: Boolean;
var
  nYear : integer;
  stYear : string;
begin
  Try
    stYear := FormatDateTime('yyyy',now);
    for nYear := strtoint(stYear) to strtoint(stYear) + 10 do
    begin
      CreateYearHoliday(nYear);
    end;
  Except
    Exit;
  End;

end;


function TdmDBFunction.GetNextNodeNo: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := FillZeroNumber(1,G_nNodeCodeLength);
  if G_nDBTYPE = FireBird then
  begin
    stSql := 'Select FIRST 1 ND_NODENO from TB_NODE ';
    stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' Order by ND_NODENO DESC ';
  end else
  begin
    stSql := 'select MAX(ND_NODENO) as ND_NODENO from TB_NODE ';
    stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('ND_NODENO').IsNull then Exit;
      result := FillZeroNumber(FindField('ND_NODENO').AsInteger + 1,G_nNodeCodeLength);

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_AdminGradeCode: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '1';
  stSql := 'select MAX(AG_GRADECODE) as AG_GRADECODE from TB_ADMINGRADECODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('AG_GRADECODE').IsNull then Exit;
      result := inttostr(FindField('AG_GRADECODE').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_ANTIGROUPCODE_ID: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '1';
  stSql := 'select MAX(AG_CODE) as AG_CODE from TB_ANTIGROUPCODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('AG_CODE').IsNull then Exit;
      result := inttostr(FindField('AG_CODE').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_ATTENDCODEValue(aAwCode:string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '1';
  stSql := 'select MAX(AT_ATCODE) as AT_ATCODE from TB_ATTENDCODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND  AW_CODE = ' + aAwCode + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('AT_ATCODE').IsNull then Exit;
      result := inttostr(FindField('AT_ATCODE').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_ATTENDPOSITIONCode: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '1';
  stSql := 'select MAX(AP_CODE) as AP_CODE from TB_ATTENDPOSITION ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('AP_CODE').IsNull then Exit;
      result := inttostr(FindField('AP_CODE').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_ATTENDWORKTYPECode: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '1';
  stSql := 'select MAX(AW_CODE) as AW_CODE from TB_ATTENDWORKTYPE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('AW_CODE').IsNull then Exit;
      result := inttostr(FindField('AW_CODE').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_CARD_PositionNum: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '1';
  stSql := 'select MAX(CA_POSITIONNUM) as CA_POSITIONNUM from TB_CARD ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('CA_POSITIONNUM').IsNull then Exit;
      result := inttostr(FindField('CA_POSITIONNUM').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_CARD_RelayID: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '1';
  stSql := 'select MAX(CA_RELAYID) as CA_RELAYID from TB_CARD ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.GetNextTB_CCTV_No: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '1';
  stSql := 'select MAX(CT_NO) as CT_NO from TB_CCTV ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('CT_NO').IsNull then Exit;
      result := inttostr(FindField('CT_NO').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(
  aParentCode: string; var aCode, aDeepSeq, aViewSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nDeepSeq : integer;
  nViewSeq : integer;
  stTemp : string;
  nChildCode : integer;
begin
  aCode := '';
  aDeepSeq := '0';
  aViewSeq := '0';
  nViewSeq := 0;
  nChildCode := 0;

  stSql := 'Select * from TB_COMPANYCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE Like ''' + aParentCode + '%'' ';
  stSql := stSql + ' Order by CO_DEEPSEQ,CO_VIEWSEQ ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if FindField('CO_COMPANYCODE').AsString = aParentCode then
        begin
          nDeepSeq := FindField('CO_DEEPSEQ').AsInteger;
          aDeepSeq := inttostr(nDeepSeq + 1);
        end;
        if FindField('CO_DEEPSEQ').AsInteger = (nDeepSeq + 1) then
        begin
          if nViewSeq < FindField('CO_VIEWSEQ').AsInteger  then nViewSeq := FindField('CO_VIEWSEQ').AsInteger;
          stTemp := FindField('CO_COMPANYCODE').AsString;
          stTemp := copy(stTemp,1 + (((nDeepSeq) * G_nCompanyCodeLength) + 1 ),G_nCompanyCodeLength);
          Try
            if nChildCode < strtoint(stTemp)  then nChildCode := strtoint(stTemp);
          Except
          End;
        end;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  aViewSeq := inttostr(nViewSeq + 1);
  aCode := aParentCode + FillZeroNumber(nChildCode + 1,G_nCompanyCodeLength);

end;

function TdmDBFunction.GetNextTB_DECODER_ID: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '1';
  stSql := 'select MAX(ND_DECODERNO) as ND_DECODERNO from TB_DECODER ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('ND_DECODERNO').IsNull then Exit;
      result := inttostr(FindField('ND_DECODERNO').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_EMPLOYEEGROUPCODE_ChildEmGroupCode(
  aParentCode: string; var aCode, aDeepSeq, aViewSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nDeepSeq : integer;
  nViewSeq : integer;
  stTemp : string;
  nChildCode : integer;
begin
  aCode := '';
  aDeepSeq := '0';
  aViewSeq := '0';
  nViewSeq := 0;
  nChildCode := 0;

  stSql := 'Select * from TB_EMPLOYEEGROUPCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE Like ''' + aParentCode + '%'' ';
  stSql := stSql + ' Order by EM_DEEPSEQ,EM_VIEWSEQ ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if FindField('EM_GROUPCODE').AsString = aParentCode then
        begin
          nDeepSeq := FindField('EM_DEEPSEQ').AsInteger;
          aDeepSeq := inttostr(nDeepSeq + 1);
        end;
        if FindField('EM_DEEPSEQ').AsInteger = (nDeepSeq + 1) then
        begin
          if nViewSeq < FindField('EM_VIEWSEQ').AsInteger  then nViewSeq := FindField('EM_VIEWSEQ').AsInteger;
          stTemp := FindField('EM_GROUPCODE').AsString;
          stTemp := copy(stTemp,1 + (((nDeepSeq) * G_nEmployeeGroupLength) + 1 ),G_nEmployeeGroupLength);
          Try
            if nChildCode < strtoint(stTemp)  then nChildCode := strtoint(stTemp);
          Except

          End;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  aViewSeq := inttostr(nViewSeq + 1);
  aCode := aParentCode + FillZeroNumber(nChildCode + 1,G_nEmployeeGroupLength);
end;

function TdmDBFunction.GetNextTB_EMPLOYEEGUBUN_Code: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := inttostr(1);
  stSql := 'Select Max(EM_GUBUNCODE) as EM_GUBUNCODE from TB_EMPLOYEEGUBUN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if recordCount < 1 then Exit;
      result := inttostr(FindField('EM_GUBUNCODE').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_EMPLOYEESTATECODE_Code: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin
  result := '1';

  stSql := 'Select Max(EM_STATECODE) as EM_STATECODE from TB_EMPLOYEESTATECODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('EM_STATECODE').IsNull then Exit;
      result := inttostr(FindField('EM_STATECODE').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_EMPLOYEE_EmployeeCode: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stEmCode : string;
begin
  result := 'Z-00001';
  stSql := 'select MAX(EM_CODE) as EM_CODE from TB_EMPLOYEE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_CODE Like ''Z-%'' ';
  if G_nDBType = POSTGRESQL then stSql := stSql + ' AND Length(EM_CODE) = 7 '
  else stSql := stSql + ' AND Len(EM_CODE) = 7 ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      stEmCode := FindField('EM_CODE').AsString ;
      if isDigit(copy(stEmCode,3,5)) then
      begin
        result := 'Z-' + FillZeroNumber(strtoint(copy(stEmCode,3,5)) + 1,5);
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_EMPLOYEE_EmSeq: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := '1';

  stSql := 'Select Max(EM_SEQ) as EM_SEQ from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('EM_SEQ').IsNull then Exit;
      result := inttostr(FindField('EM_SEQ').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_FINGERDEVICE_ID: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := '1';

  stSql := 'Select Max(FN_DEVICESEQ) as FN_DEVICESEQ from TB_FINGERDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('FN_DEVICESEQ').IsNull then Exit;
      result := inttostr(FindField('FN_DEVICESEQ').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_FIREGROUP_ID: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := '001';

  stSql := 'Select Max(FG_GROUPCODE) as FG_GROUPCODE from TB_FIREGROUP ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('FG_GROUPCODE').IsNull then Exit;
      if isDigit(FindField('FG_GROUPCODE').AsString) then
         result := FillZeroNumber(strtoint(FindField('FG_GROUPCODE').AsString) + 1,3);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_FOODCODEValue(aFoodType: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '1';
  stSql := 'select MAX(FO_CODE) as FO_CODE from TB_FOODCODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND  RE_FDTYPE = ''' + aFoodType + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('FO_CODE').IsNull then Exit;
      result := inttostr(FindField('FO_CODE').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_FOODGROUP_ID: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stTemp : string;
  nTemp : integer;
begin
  result := '1';
  stSql := 'select MAX(FG_CODE) as FG_CODE from TB_FOODGROUP ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('FG_CODE').IsNull then Exit;
      result := inttostr(FindField('FG_CODE').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_FOODTYPE_ID: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stTemp : string;
  nTemp : integer;
begin
  result := '1';
  stSql := 'select MAX(RE_FDTYPE) as RE_FDTYPE from TB_FOODTYPE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('RE_FDTYPE').IsNull then Exit;
      stTemp := FindField('RE_FDTYPE').AsString;
      nTemp := ord(stTemp[1]);
      result := char(nTemp + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextTB_POSICODE: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := inttostr(1);
  stSql := 'Select Max(PO_POSICODE) as PO_POSICODE from TB_POSICODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if recordCount < 1 then Exit;
      result := inttostr(FindField('PO_POSICODE').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetProgramGrade(aAdminGradeCode, aProgID,aProgramType: string;
  var aInsertGrade, aUpdateGrade, aDeleteGrade: Boolean): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  if G_bIsMaster then
  begin
    aInsertGrade := True;
    aUpdateGrade := True;
    aDeleteGrade := True;
    result := True;
    Exit;
  end;
  aInsertGrade := False;
  aUpdateGrade := False;
  aDeleteGrade := False;

  stSql := 'select * from TB_ADMINGRADEPROGRAM ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AG_GRADECODE = ''' + aAdminGradeCode + ''' ';
  stSql := stSql + ' AND FN_PROGRAMGUBUN = ''' + aProgramType + ''' ';
  stSql := stSql + ' AND FN_NAMECODE = ''' + aProgID + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('AG_INSERT').AsString = '1' then aInsertGrade := True;
      if FindField('AG_UPDATE').AsString = '1' then aUpdateGrade := True;
      if FindField('AG_DELETE').AsString = '1' then aDeleteGrade := True;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_ALARMEVENTSTATEPCCODE_State(
  aAlarmStatePCCode: string;var aAlarmStatePCCodeName:string;var aAlarmView:string; var aAlarmSound:string;var aAlarmColor:string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  aAlarmView := '0';
  aAlarmSound := '0';
  stSql := 'select AP_EVENTSTATEPCCODENAME' + inttostr(G_nFormLanguageType) + ' as NAME,AP_VIEW,AP_SOUND,AP_COLOR from TB_ALARMEVENTSTATEPCCODE  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AP_EVENTSTATEPCCODE = ''' + aAlarmStatePCCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      aAlarmStatePCCodeName := FindField('NAME').AsString;
      aAlarmView := FindField('AP_VIEW').AsString;
      aAlarmSound := FindField('AP_SOUND').AsString;
      aAlarmColor := FindField('AP_COLOR').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_ARMAREA_ArmAreaInfo(aNodeNo, aEcuID,
  aArmAreaNo: string; var aArmAreaName, aArmAreaView: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  aArmAreaName := '';
  aArmAreaView := '0';
  stSql := 'select * from TB_ARMAREA  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AR_ARMAREANO = ' + aArmAreaNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      aArmAreaName := FindField('AR_ARMAREANAME').AsString;
      aArmAreaView := FindField('AR_VIEW').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_ARMAREA_ArmAreaName(aNodeNo, aEcuID,
  aArmAreaNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_ARMAREA  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AR_ARMAREANO = ' + aArmAreaNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('AR_ARMAREANAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_ARMAREA_BuildingCode(aNodeNo, aEcuID,
  aArmAreaNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select BC_BUILDINGCODE from TB_ARMAREA  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AR_ARMAREANO = ' + aArmAreaNo + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('BC_BUILDINGCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_ARMAREA_BuildingInfo(aNodeNo, aEcuID,
  aArmAreaNo: string; var aBuildingName, aTelNo, aMemo: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  stSql := 'select a.AR_TELNO,a.AR_MEMO, b.BC_BUILDINGNAME from TB_ARMAREA a ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.BC_BUILDINGCODE = b.BC_BUILDINGCODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND a.AR_ARMAREANO = ' + aArmAreaNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := True;
      aBuildingName := FindField('BC_BUILDINGNAME').AsString;
      aTelNo := FindField('AR_TELNO').AsString;
      aMemo := FindField('AR_MEMO').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_ARMAREA_BuildingName(aNodeNo, aEcuID,
  aArmAreaNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select b.BC_BUILDINGNAME from TB_ARMAREA a ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.BC_BUILDINGCODE = b.BC_BUILDINGCODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND a.AR_ARMAREANO = ' + aArmAreaNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('BC_BUILDINGNAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_ARMAREA_CCTVSeq(aNodeNo, aEcuID,
  aArmAreaNo: string; var aCCTVSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  stSql := 'select * from TB_ARMAREA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AR_ARMAREANO = ' + aArmAreaNo + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('CT_NO').IsNull then Exit;
      aCCTVSeq := FindField('CT_NO').AsString;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_ARMAREA_ViewSeq(aNodeNo, aEcuID,
  aArmAreaNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '0';
  stSql := 'select * from TB_ARMAREA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AR_ARMAREANO = ' + aArmAreaNo + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('AR_VIEWSEQ').IsNull then Exit;
      result := FindField('AR_VIEWSEQ').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.getTB_ATTENDCODE_RecordCount(aAWCode:string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := 0;
  stSql := 'select count(*) as cnt from TB_ATTENDCODE ';
  stSql := stSql + ' Where AW_CODE = ' + aAWCode + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('cnt').AsInteger;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.getTB_ATTENDPOSITOIN_RecordCount: integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := 0;
  stSql := 'select count(*) as cnt from TB_ATTENDPOSITION ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('cnt').AsInteger;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.getTB_ATTENDWORKTYPE_RecordCount: integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := 0;
  stSql := 'select count(*) as cnt from TB_ATTENDWORKTYPE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('cnt').AsInteger;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_BUILDINGCODE_BuildingName(
  aBuildingCode: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_BUILDINGCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_BUILDINGCODE = ''' + aBuildingCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('BC_BUILDINGNAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_CARDPERMITEMPLOYEECODE_ApplyCount: integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := 0;
  stSql := 'select count(*) as cnt from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CP_APPLY <> ''Y'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('cnt').AsInteger;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_CARDPRINTLIST_AutoPrintNo: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stTemp : string;
begin
  result := 'AT-00001';
  stSql := 'select Max(CA_PRINTNO) as CA_PRINTNO from TB_CARDPRINTLIST ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_PRINTNO Like ''AT-%'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      stTemp := FindField('CA_PRINTNO').AsString;
    end;
    Delete(stTemp,1,3);
    if Not IsDigit(stTemp) then Exit;
    result := 'AT-' + FillZeroNumber(strtoint(stTemp) + 1,5);
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_CARDPRINTLIST_CardNo(aPrintNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stTemp : string;
begin
  result := '';
  stSql := 'select CA_CARDNO from TB_CARDPRINTLIST ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_PRINTNO = ''' + aPrintNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('CA_CARDNO').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_CARDPRINTLIST_PrintNoFromCardNo(
  aCardNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stTemp : string;
begin
  result := '';
  stSql := 'select CA_PRINTNO from TB_CARDPRINTLIST ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('CA_PRINTNO').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_CARD_CardCount(aEmSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stTemp : string;
begin
  result := 0;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := recordcount;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_CARD_EMPLOYEEInfo(aCardNo: string; var aEmSeq,aEmCode,
  aEmName: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  stSql := 'select a.CA_CARDGUBUN,a.EM_SEQ,b.EM_CODE,b.EM_NAME from TB_CARD a ';
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ) ';
  stSql := stSql + ' Where  a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := True;
      aEmSeq := FindField('EM_SEQ').AsString;
      aEmCode := FindField('EM_CODE').AsString;
      aEmName := FindField('EM_NAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_CARD_FingerCardNo: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  nCardNo : integer;
  stHexCardNo : string;
begin
  Randomize() ;
  nCardNo := Random(con_RANDMAXCARDNO) + 1;
  if nCardNo < 0 then
  begin
    result := GetTB_CARD_FingerCardNo;
    Exit;
  end;
  stHexCardNo := Dec2Hex(nCardNo,8);
  if G_nCardNoType = 0 then stHexCardNo := stHexCardNo //시리얼 카드
  else if G_nCardNoType = 1 then stHexCardNo := FillCharString(stHexCardNo,'*',16)  //16바이트 카드
  else if G_nCardNoType = 2 then stHexCardNo := stHexCardNo + '0**';//KT사옥타입

  result := stHexCardNo;
  //중복 체크
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + stHexCardNo + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

function TdmDBFunction.GetTB_CCTV_Info(aCCTVSeq: string; var aCCTVIP, aCCTVPort,
  aCCTVIName, aCCTVUserID, aCCTVUserPw: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  stSql := 'select * from TB_CCTV  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CT_NO = ' + aCCTVSeq + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      aCCTVIP := FindField('CT_IP').AsString;
      aCCTVPort := FindField('CT_PORT').AsString;
      aCCTVIName := FindField('CT_NAME').AsString;
      aCCTVUserID := FindField('CT_USERID').AsString;
      aCCTVUserPw := FindField('CT_USERPW').AsString;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_CCTV_Name(aCCTVNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_CCTV  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CT_NO = ' + aCCTVNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('CT_NAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_COMPANYCODE_AutoPermitDelete(
  aCompanyCode: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_COMPANYCODE  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('CO_AutoPermitDelete').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_COMPANYCODE_CodeFromBaseName(aCompanyCode,
  aName: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := ' Select * from TB_COMPANYCODE ';
  stSql := stSql + ' where CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
  stSql := stSql + ' AND CO_COMPANYNAME = ''' + aName + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('CO_COMPANYCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_COMPANYCODE_codeFromName(aCompanyName,
  aDeepSeq: string;var aSearchDeepSeq:string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  aSearchDeepSeq := '0';
  stSql := 'select * from TB_COMPANYCODE  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYNAME = N''' + aCompanyName + ''' ';
  if aDeepSeq <> '' then stSql := stSql + ' AND CO_DEEPSEQ = ' + aDeepSeq + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      aSearchDeepSeq := FindField('CO_DEEPSEQ').AsString;
      result := FindField('CO_COMPANYCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_COMPANYCODE_CodeFromRelayCode(aCode: string;
  var aCompanyName: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := ' Select * from TB_COMPANYCODE where CO_RELAYCOMPANYCODE = ''' + aCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('CO_COMPANYCODE').AsString;
      aCompanyName := FindField('CO_COMPANYNAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(aCompanyCode,
  aCompanyName, aDeepSeq: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_COMPANYCODE  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYNAME = N''' + aCompanyName + ''' ';
  stSql := stSql + ' AND CO_DEEPSEQ = ' + aDeepSeq + ' ';
  stSql := stSql + ' AND CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
  stSql := stSql + ' AND CO_CODEUSE = ''1'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('CO_COMPANYCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_COMPANYCODE_CurrentDeepSeq(
  aOrgCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'Select * from TB_COMPANYCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aOrgCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        result := FindField('CO_DEEPSEQ').AsString;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_DEVICE_BuildingCode(aNodeNo, aEcuID,
  aExtendID: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '0';
  stSql := 'select * from TB_DEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('BC_BUILDINGCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_DEVICE_DeviceInfo(aNodeNo, aEcuID: string;
  var aEcuName, aEcuUse,aArmAreaUse: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  aEcuName := '';
  aEcuUse := '0';
  aArmAreaUse := '0';
  result := False;

  stSql := 'select * from TB_DEVICE  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      aEcuName := FindField('DE_DEVICENAME').AsString;
      aEcuUse := FindField('DE_DEVICEUSE').AsString;
      aArmAreaUse := FindField('DE_ARMAREAUSE').AsString;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmDBFunction.GetTB_DOORTELEVENT_LastAccessInfo(aNodeNo, aEcuID,
  aExtendID, aDoorNo, aPassword: string; var aEmName,
  aEmHandphone: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  stSql := 'select top 1 * from TB_DOORTELEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  stSql := stSql + ' AND DE_PASSWORD = ''' + aPassword + ''' ';
  stSql := stSql + ' Order by DE_DATE desc,DE_TIME desc ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := True;
      aEmName := FindField('DE_ACCESSNAME').AsString;
      aEmHandphone := FindField('DE_ACCESSTEL').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_DOOR_AtDedicateUse(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select DO_ATTYPE from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('DO_ATTYPE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_Door_BuildingCode(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select BC_BUILDINGCODE from TB_DOOR  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('BC_BUILDINGCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_Door_BuildingName(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select b.BC_BUILDINGNAME from TB_DOOR a ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.BC_BUILDINGCODE = b.BC_BUILDINGCODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND a.DO_DOORNO = ' + aDoorNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('BC_BUILDINGNAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_DOOR_DoorInfo(aNodeNo, aEcuID, aDoorNo: string;
  var aDoorName, aDoorView,aDoorMemo: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  aDoorName := '';
  aDoorView := '0';
  aDoorMemo := '';

  stSql := 'select * from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      aDoorName := FindField('DO_DOORNAME').AsString;
      aDoorView := FindField('DO_VIEW').AsString;
      aDoorMemo := FindField('DO_MEMO').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_Door_DoorMemo(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select DO_MEMO from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('DO_MEMO').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_DOOR_DoorName(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select DO_DOORNAME from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('DO_DOORNAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_DOOR_FdDedicateUse(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select DO_FDTYPE from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('DO_FDTYPE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_DOOR_FireDoorOpen(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select DO_FIREDOOROPEN from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('DO_FIREDOOROPEN').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_DOOR_NoFromRelayNo(aNo: string; var aNodeNo,
  aEcuID, aDoorNo: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := 1;

  stSql := 'Select * from TB_DOOR ';
  stSql := stSql + ' Where DO_RELAYID = ' + aNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if RecordCount < 1 then Exit;
      result := 1;
      aNodeNo := FindField('ND_NODENO').AsString;
      aEcuID := FindField('DE_ECUID').AsString;
      aDoorNo := FindField('DO_DOORNO').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_Door_RelayNo(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select DO_RELAYID from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('DO_RELAYID').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_DOOR_ScheduleUse(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select DO_SCHEDULEUSE from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('DO_SCHEDULEUSE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_DOOR_TimeCodeUse(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select DO_TIMECODEUSE from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('DO_TIMECODEUSE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_Door_ViewSeq(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '1';
  stSql := 'select DO_VIEWSEQ from TB_DOOR  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if FindField('DO_VIEWSEQ').IsNull then Exit;
      result := FindField('DO_VIEWSEQ').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_EMPLOYEEGROUPCODE_AutoPermitDelete(
  aGroupCode: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_EMPLOYEEGROUPCODE  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE = ''' + aGroupCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('EM_AutoPermitDelete').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_EMPLOYEEGROUPCODE_codeFromName(aName,
  aDeepSeq: string; var aSearchDeepSeq: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  aSearchDeepSeq := '0';
  stSql := 'select * from TB_EMPLOYEEGROUPCODE  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE Like ''' + G_stAdminEmGroupCode + '%'' ';
  stSql := stSql + ' AND EM_GROUPCODENAME = ''' + aName + ''' ';
  if aDeepSeq <> '' then stSql := stSql + ' AND EM_DEEPSEQ = ' + aDeepSeq + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      aSearchDeepSeq := FindField('EM_DEEPSEQ').AsString;
      result := FindField('EM_GROUPCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_EMPLOYEEGROUPCODE_CurrentDeepSeq(
  aOrgCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'Select * from TB_EMPLOYEEGROUPCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE = ''' + aOrgCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        result := FindField('EM_DEEPSEQ').AsString;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_EMPLOYEEGUBUN_CodeFromName(
  aWorkGubunName: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_EMPLOYEEGUBUN  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GUBUNCODENAME = ''' + aWorkGubunName + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('EM_GUBUNCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_EMPLOYEEGUBUN_CodeFromRelayCode(aRelayCode: string;
  var aName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '';
  stSql := ' select * from TB_EMPLOYEEGUBUN where EM_RELAYCODE = ''' + aRelayCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('EM_GUBUNCODE').AsString;
      aName := FindField('EM_GUBUNCODENAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_EMPLOYEEGUBUN_ViewSeq(aCode: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '0';
  stSql := 'select * from TB_EMPLOYEEGUBUN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GUBUNCODE = ''' + aCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('EM_VIEWSEQ').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_EMPLOYEESTATECODE_codeFromName(
  aName: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_EMPLOYEESTATECODE  ';
  stSql := stSql + ' Where EM_STATECODENAME = ''' + aName + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('EM_STATECODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_EMPLOYEE_EmSeq(aEmCode: string;var aEmSeq,aCompanyCode,aEmGroupCode,aCardGroupType:string):integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select *  from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := 0;
      if recordCount < 1 then Exit;
      aEmSeq := FindField('EM_SEQ').AsString;
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      aEmGroupCode := FindField('EM_GROUPCODE').AsString;
      aCardGroupType := FindField('EM_GRADETYPE').AsString;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_FINGERDEVICE_DeviceInfo(aFingerSeq: string;
  var aNodeNo, aEcuID,aType, aDoorNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  stSql := 'select *  from TB_FINGERDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_DEVICESEQ = ' + aFingerSeq + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := True;
      aNodeNo := FindField('ND_NODENO').AsString;
      aEcuID := FindField('DE_ECUID').AsString;
      aType := FindField('CP_TYPE').AsString;
      aDoorNo := FindField('DO_DOORNO').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

(*
function TdmDBFunction.GetTB_FORMNAME_Name(aProgramGubun, aMenuGubun, aNameCode,
  aLangType: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select FN_NAME' + aLangType + ' as NAME  from TB_FORMNAME ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_PROGRAMGUBUN = ''' + aProgramGubun + ''' ';
  stSql := stSql + ' AND FN_MENUGUBUN = ' + aMenuGubun + ' ';
  stSql := stSql + ' AND FN_NAMECODE = ''' + aNameCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('NAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;
*)
function TdmDBFunction.GetTB_NODE_NextDeviceID(aSockType:string;var aNodeNo,aDeviceID:string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  aNodeNo := '1';
  aDeviceID := FillZeroNumber(1,G_nIDLength);

  stSql := 'select MAX(ND_NODENO) as NodeNo, Max(ND_DEVICEID) as DeviceID from TB_NODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aSockType <> '' then stSql := stSql + ' AND ND_SOCKETTYPE = ''' + aSockType + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := True;
      aNodeNo := inttostr(FindField('NodeNo').AsInteger + 1);
      if isDigit(FindField('DeviceID').AsString) then
      begin
        aDeviceID := FillZeroNumber(strtoint(FindField('DeviceID').AsString),G_nIDLength);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_NODE_NodeIP(aNodeNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_NODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('ND_NODEIP').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_NODE_NodeName(aNodeNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_NODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('ND_NODENAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_POSICODE_codeFromName(aCompanyCode,
  aName: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_POSICODE  ';
  stSql := stSql + ' Where PO_POSICODENAME = ''' + aName + ''' ';
  if aCompanyCode <> ''  then stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      result := FindField('PO_POSICODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

end.
