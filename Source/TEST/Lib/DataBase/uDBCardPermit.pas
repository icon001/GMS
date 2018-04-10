unit uDBCardPermit;

interface

uses
  System.SysUtils, System.Classes,Winapi.ActiveX,Data.Win.ADODB,DB,Vcl.Forms,
  uDeviceVariable;

type
  TdmDBCardPermit = class(TDataModule)
  private
    FOnCardPermitProcess: TCardPermitProgress;
    { Private declarations }
    Function CompanyGradeToEmployeeCopyLikeAdd(aCompanyCode:string):Boolean;
    Function CompanyGradeToEmployeeCopyLikeUpdate(aCompanyCode:string):Boolean;
    Function EmGroupGradeToEmployeeCopyLikeAdd(aEmGroupCode:string):Boolean;
    Function EmGroupGradeToEmployeeCopyLikeUpdate(aEmGroupCode:string):Boolean;
    Function EmployeeGradeChange_CardPermitCompanyGroupToEmployeeCode(aEmSeq,aCompanyCode,aDeepSeq:string;aGradeUpdate:Boolean;aEmApprove:string=''):Boolean;
    Function EmployeeGradeChange_CardPermitEmployeeGroupToEmployeeCode(aEmSeq,aEmGroupCode,aDeepSeq:string;aGradeUpdate:Boolean;aEmApprove:string=''):Boolean;
  public
    { Public declarations }
    Function CardPermitDelete(aEmSeq:string):Boolean; //ī�� ������ ���� ī�� ���� ����
    Function CompanyArmAreaPermitAdd(aCompanyCode,aNodeNo,aEcuID,aExtendID,aArmAreaNo:string):Boolean; //ȸ�� �ڵ庰 �������
    Function CompanyArmAreaPermitDelete(aCompanyCode,aNodeNo,aEcuID,aExtendID,aArmAreaNo:string):Boolean;
    Function CompanyDoorPermitAdd(aCompanyCode,aNodeNo,aEcuID,aExtendID,aDoorNo:string):Boolean; //ȸ�� �ڵ庰 ���� ����
    Function CompanyDoorPermitDelete(aCompanyCode,aNodeNo,aEcuID,aExtendID,aDoorNo:string):Boolean;
    Function CompanyGradeToEmployeeCopyEqualAdd(aCompanyCode:string;aEmSeq:string=''):Boolean;
    Function CompanyGradeToEmployeeCopyEqualUpdate(aCompanyCode:string;aEmSeq:string=''):Boolean;  //�����Ͱ� ������ �������� Ÿ�Ӿƿ� �߻� ��
    Function CompanyGradeToEmployeeCopyEqualUpdate_II(aCompanyCode:string;aEmSeq:string=''):Boolean;
    Function CompanyGradeToEmployeeCopyEqualUpdate_III(aCompanyCode,aEmSeq:string):Boolean;
    Function CompanyGradeToEmployee_PermitChange(aNodeNo,aEcuID,aExtendID,aType,aNumber,aCompanyCode,aPermit,aEmSeq:string):Boolean;
    Function CompanyGradeToEmployeeEachApply(aCompanyCode:string):Boolean;
    Function CompanyGradeToEmployeeGrade(aCompanyCode:string=''):Boolean;  //����� ȸ���ڵ尡 ������ ��������.
    Function CompanyGradeToNotEmployeeDelete(aCompanyCode:string;aEmSeq:string=''):Boolean; //�Ҽӱ��ѿ��� ���� ������ѿ� �ִ� ��� ������� ���� ����.
    Function DoorAttendEmployeeGradePermitAdd(aNodeNo,aEcuID,aDoorNo,aType,aPermit,aApply:string):Boolean;
    Function DoorFoodEmployeeGradePermitAdd(aNodeNo,aEcuID,aDoorNo,aType,aPermit,aApply:string):Boolean;
    Function EmGroupArmAreaPermitAdd(aEmGroupCode,aNodeNo,aEcuID,aExtendID,aArmAreaNo:string):Boolean; //�׷��ڵ庰 �������
    Function EmGroupArmAreaPermitDelete(aEmGroupCode,aNodeNo,aEcuID,aExtendID,aArmAreaNo:string):Boolean;
    Function EmGroupDoorPermitAdd(aEmGroupCode,aNodeNo,aEcuID,aExtendID,aDoorNo:string):Boolean; //�׷��ڵ庰 ���� ����
    Function EmGroupDoorPermitDelete(aEmGroupCode,aNodeNo,aEcuID,aExtendID,aDoorNo:string):Boolean;
    Function EmGroupGradeToEmployeeCopyEqualAdd(aEmGroupCode:string;aEmSeq:string=''):Boolean;
    Function EmGroupGradeToEmployeeCopyEqualUpdate(aEmGroupCode:string;aEmSeq:string=''):Boolean;
    Function EmGroupGradeToEmployeeCopyEqualUpdate_II(aEmGroupCode:string;aEmSeq:string=''):Boolean;
    Function EmGroupGradeToEmployeeCopyEqualUpdate_III(aEmGroupCode,aEmSeq:string):Boolean;
    Function EmGroupGradeToEmployee_PermitChange(aNodeNo,aEcuID,aExtendID,aType,aNumber,aEmGroupCode,aPermit,aEmSeq:string):Boolean;
    Function EmGroupGradeToEmployeeGrade(aEmGroupCode:string=''):Boolean;
    Function EmGroupGradeToNotEmployeeDelete(aEmGroupCode:string;aEmSeq:string=''):Boolean; //�׷���ѿ��� ���� ������ѿ� �ִ� ��� ������� ���� ����.
//    Function EmGroupGradeToEmployeeEachApply(aEmGroupCode:string):Boolean;
//    Function EmGroupGradeToEmployeeGrade:Boolean;
    Function EmployeeArmAreaPermitAdd(aEmSeq,aNodeNo,aEcuID,aExtendID,aArmAreaNo:string;aEmApprove:string=''):Boolean;
    Function EmployeeArmAreaPermitDelete(aEmSeq,aNodeNo,aEcuID,aExtendID,aArmAreaNo:string):Boolean;
    Function EmployeeAttendDoorGradePermitAdd(aEmSeq,aType,aPermit,aApply:string):Boolean;
    Function EmployeeCardAllPermit(aEmSeq,aType,aPermit,aApply:string):Boolean;   //���κ� Ÿ���̸鼭 ��� �߰��� �ش� ����� ��ü ������ �ο� �ϴ� ���
    Function EmployeeDoorPermitAdd(aEmSeq,aNodeNo,aEcuID,aExtendID,aDoorNo:string;aEmApprove:string=''):Boolean;  //���κ� ���Թ� ���� ���
    Function EmployeeDoorPermitDelete(aEmSeq,aNodeNo,aEcuID,aExtendID,aDoorNo:string):Boolean;  //���κ� ���Թ� ���� ����
    Function EmployeeFoodDoorGradePermitAdd(aEmSeq,aType,aPermit,aApply:string):Boolean;
    Function EmployeeGradeChange_Process(aEmSeq,aCompanyCode,aEmGroupCode,aGradeType:string;aGradeUpdate :Boolean = False;aEmApprove:string=''):Boolean;  //���κ� ȸ���ڵ� Ȥ�� �׷� �ڵ� ����� ó���ϴ� ���
    Function EmployeePermitAllDelete(aEmSeq:string):Boolean; //��� ���� �� ��ü ���Ա����� ���� �ϴ� ���
    Function EmployeePermitToCardDeviceLoad(aNodeNo,aEcuID,aEmSeq:string):Boolean;
//    Function EmSeqCompanyGradeToEmployeeCopyLikeAdd(aEmSeq,aCompanyCode:string):Boolean;
//    Function EmSeqCompanyGradeToEmployeeCopyLikeUpdate(aEmSeq,aCompanyCode:string):Boolean;
    Function EmSeqEmGroupGradeToEmployeeCopyLikeAdd(aEmSeq,aEmGroupCode:string):Boolean;
    Function EmSeqEmGroupGradeToEmployeeCopyLikeUpdate(aEmSeq,aEmGroupCode:string):Boolean;
    Function ReSendEmSeqCardNo(aEmSeq:string):Boolean;
    Function TB_CARDPERMIT_PermitDELETE(aCardNo:string):Boolean;
  public
    ProPerty OnCardPermitProcess : TCardPermitProgress read FOnCardPermitProcess write FOnCardPermitProcess;
  end;

var
  dmDBCardPermit: TdmDBCardPermit;

implementation

uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBDelete,
  uDBFunction,
  uDBInsert,
  uDBUpdate;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmDBCardPermit }

{ TdmDBCardPermit }


function TdmDBCardPermit.CardPermitDelete(aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  stSql := ' Select * from TB_CARD where EM_SEQ = ' + aEmSeq + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
        Next;
      end;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBCardPermit.CompanyArmAreaPermitAdd(aCompanyCode, aNodeNo, aEcuID,
  aExtendID, aArmAreaNo: string): Boolean;
var
  nDeep : integer;
begin
  if dmDBFunction.CheckTB_CARDPERMITCOMPANYGROUP_Permit(aCompanyCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_ARMAREA,aArmAreaNo) = 1 then
  begin
    result := dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_Field_StringValue(aCompanyCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_PERMIT','1');
    dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_Field_StringValue(aCompanyCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_APPLY','N');
  end else
  begin
    nDeep := 0;
    nDeep := Length(aCompanyCode) div G_nCompanyCodeLength;
    result := dmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE(aCompanyCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_ARMAREA,aArmAreaNo,'1',inttostr(nDeep),'N');
  end;

end;

function TdmDBCardPermit.CompanyArmAreaPermitDelete(aCompanyCode, aNodeNo,
  aEcuID, aExtendID, aArmAreaNo: string): Boolean;
var
  nDeep : integer;
begin
  if dmDBFunction.CheckTB_CARDPERMITCOMPANYGROUP_Permit(aCompanyCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_ARMAREA,aArmAreaNo) = 1 then
  begin
    result := dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_Field_StringValue(aCompanyCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_PERMIT','0');
    dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_Field_StringValue(aCompanyCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_APPLY','N');
  end else
  begin
    nDeep := 0;
    nDeep := Length(aCompanyCode) div G_nCompanyCodeLength;
    result := dmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE(aCompanyCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_ARMAREA,aArmAreaNo,'0',inttostr(nDeep),'N');
  end;
end;

function TdmDBCardPermit.CompanyDoorPermitAdd(aCompanyCode, aNodeNo, aEcuID,
  aExtendID, aDoorNo: string): Boolean;
var
  nDeep : integer;
begin
  if dmDBFunction.CheckTB_CARDPERMITCOMPANYGROUP_Permit(aCompanyCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDoorNo) = 1 then
  begin
    result := dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_Field_StringValue(aCompanyCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_PERMIT','1');
    dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_Field_StringValue(aCompanyCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_APPLY','N');
  end else
  begin
    nDeep := 0;
    nDeep := Length(aCompanyCode) div G_nCompanyCodeLength;
    result := dmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE(aCompanyCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDOORNO,'1',inttostr(nDeep),'N');
  end;

end;

function TdmDBCardPermit.CompanyDoorPermitDelete(aCompanyCode, aNodeNo, aEcuID,
  aExtendID, aDoorNo: string): Boolean;
var
  nDeep : integer;
begin
  if dmDBFunction.CheckTB_CARDPERMITCOMPANYGROUP_Permit(aCompanyCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDoorNo) = 1 then
  begin
    result := dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_Field_StringValue(aCompanyCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_PERMIT','0');
    dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_Field_StringValue(aCompanyCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_APPLY','N');
  end else
  begin
    nDeep := 0;
    nDeep := Length(aCompanyCode) div G_nCompanyCodeLength;
    result := dmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE(aCompanyCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDOORNO,'0',inttostr(nDeep),'N');
  end;

end;

function TdmDBCardPermit.CompanyGradeToEmployeeCopyEqualAdd(
  aCompanyCode: string;aEmSeq:string=''): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE ( ';
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
  stSql := stSql + ' Select ';
  stSql := stSql + '''' + G_stGroupCode + ''',';
  stSql := stSql + ' a.EM_SEQ,';
  stSql := stSql + ' a.ND_NODENO,';
  stSql := stSql + ' a.DE_ECUID,';
  stSql := stSql + ' a.DE_EXTENDID,';
  stSql := stSql + ' a.CP_TYPE,';
  stSql := stSql + ' a.CP_NUMBER,';
  stSql := stSql + ' a.CP_PERMIT,';
  stSql := stSql + ' ''N'', ';
  stSql := stSql + ' ''N'' ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( select a1.GROUP_CODE, a1.EM_SEQ, a1.ND_NODENO, a1.DE_ECUID, a1.DE_EXTENDID, a1.CP_TYPE, a1.CP_NUMBER,a2.CP_PERMIT from ';
  stSql := stSql + ' ( Select ';
  stSql := stSql + ' aa.GROUP_CODE,';
  stSql := stSql + ' aa.EM_SEQ,';
  stSql := stSql + ' bb.ND_NODENO,';
  stSql := stSql + ' bb.DE_ECUID,';
  stSql := stSql + ' bb.DE_EXTENDID,';
  stSql := stSql + ' bb.CP_TYPE,';
  stSql := stSql + ' bb.CP_NUMBER ';
  stSql := stSql + ' From TB_EMPLOYEE aa ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP bb ';
  stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
(*  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE ) '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE ) '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(aa.CO_COMPANYCODE From 1 for len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE ) ';
*)
  stSql := stSql + ' AND aa.CO_COMPANYCODE = bb.CO_COMPANYCODE ) ';
  stSql := stSql + ' WHERE aa.EM_GRADETYPE = 1 '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸
  stSql := stSql + ' AND aa.EM_ACUSE = ''1'' ';      //�����ڿ��� ���� ���� ���� ���
  stSql := stSql + ' AND aa.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' group by aa.GROUP_CODE, aa.EM_SEQ, bb.ND_NODENO, bb.DE_ECUID, bb.DE_EXTENDID, bb.CP_TYPE, bb.CP_NUMBER ) a1 ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP a2 ';
  stSql := stSql + ' on(a1.group_code = a2.group_code ';
  stSql := stSql + ' and a1.ND_NODENO = a2.ND_NODENO ';
  stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
  stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
  stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
  stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ) ';
  stSql := stSql + ' where a2.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' ) A ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aEmSeq <> '' then stSql := stSql + ' AND A.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEECODE B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = A.GROUP_CODE ';
  stSql := stSql + ' AND B.ND_NODENO = A.ND_NODENO ';
  stSql := stSql + ' AND B.DE_ECUID = A.DE_ECUID  ';
  stSql := stSql + ' AND B.DE_EXTENDID = A.DE_EXTENDID  ';
  stSql := stSql + ' AND B.CP_TYPE = A.CP_TYPE  ';
  stSql := stSql + ' AND B.CP_NUMBER = A.CP_NUMBER  ';
  stSql := stSql + ' AND B.EM_SEQ = A.EM_SEQ )  ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.CompanyGradeToEmployeeCopyEqualUpdate(
  aCompanyCode: string;aEmSeq:string=''): Boolean;
var
  stSql : string;
begin
  stSql := ' Update A Set ';
  stSql := stSql + ' a.CP_PERMIT = b.CP_PERMIT ,';
  stSql := stSql + ' a.CP_APPLY = ''N'', ';
  stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
  stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
  stSql := stSql + ' (select a1.EM_SEQ, ';   //a1 start
  stSql := stSql + ' a1.EM_GRADETYPE, ';
  stSql := stSql + ' a1.ND_NODENO, ';
  stSql := stSql + ' a1.DE_ECUID, ';
  stSql := stSql + ' a1.DE_EXTENDID, ';
  stSql := stSql + ' a1.CP_TYPE, ';
  stSql := stSql + ' a1.CP_NUMBER, ';
  stSql := stSql + ' a2.CP_PERMIT ';
  stSql := stSql + ' From ';
  stSql := stSql + ' ( select ';
  stSql := stSql + ' aa.EM_SEQ,';
  stSql := stSql + ' aa.EM_GRADETYPE,';
  stSql := stSql + ' bb.ND_NODENO,';
  stSql := stSql + ' bb.DE_ECUID,';
  stSql := stSql + ' bb.DE_EXTENDID,';
  stSql := stSql + ' bb.CP_TYPE,';
  stSql := stSql + ' bb.CP_NUMBER ';
  stSql := stSql + ' From TB_EMPLOYEE aa ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP bb ';
  stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
(*  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(aa.CO_COMPANYCODE From 1 for len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  ';
*)
  stSql := stSql + ' AND aa.CO_COMPANYCODE = bb.CO_COMPANYCODE ';
  stSql := stSql + ' AND aa.CO_COMPANYCODE = ''' + aCompanyCode + ''' '; //���� Ÿ���� ȸ���ڵ� Ÿ���̸鼭 �ش� ȸ���ڵ常 ������Ʈ
  stSql := stSql + ' AND aa.EM_ACUSE = ''1'' ';      //�����ڿ��� ���� ���� ���� ���
  stSql := stSql + ' AND aa.EM_GRADETYPE = 1 ) ';
  stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP a2 ';
  stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
  stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
  stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
  stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
  stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
  stSql := stSql + ' and a2.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) ';
  stSql := stSql + ' ) B ';
  stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE ';
  stSql := stSql + ' AND a.CP_NUMBER = b.CP_NUMBER ';
  stSql := stSql + ' AND a.CP_PERMIT <> b.CP_PERMIT ';
  if aEmSeq <> '' then stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + '';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.CompanyGradeToEmployeeCopyEqualUpdate_II(aCompanyCode,
  aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  nRow : integer;
begin
  result := False;
  stSql := ' select * from TB_CARDPERMITCOMPANYGROUP ';
  stSql := stSql + ' where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if aEmSeq = '' then stSql := stSql + ' AND CP_APPLY <> ''Y'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      result := True;
      if recordcount = 0 then Exit;
      nRow := 0;
      while Not Eof do
      begin
        CompanyGradeToEmployee_PermitChange(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,
                                            FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,aCompanyCode,FindField('CP_PERMIT').AsString,aEmSeq);

        if aEmSeq = '' then
        dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_Field_StringValue(aCompanyCode,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,
                                            FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,'CP_APPLY','Y');

        inc(nRow);
        if Assigned(FOnCardPermitProcess) then
        begin
          OnCardPermitProcess(Self,'1',aCompanyCode,recordcount,nRow);
        end;

        Next;
        Application.ProcessMessages;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmDBCardPermit.CompanyGradeToEmployeeCopyEqualUpdate_III(aCompanyCode,
  aEmSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update A Set ';
  stSql := stSql + ' a.CP_PERMIT = b.CP_PERMIT ,';
  stSql := stSql + ' a.CP_APPLY = ''N'', ';
  stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
  stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
  stSql := stSql + ' ( select ';
  stSql := stSql + aEmSeq + ' as EM_SEQ,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_TYPE,';
  stSql := stSql + ' CP_NUMBER ';
  stSql := stSql + ' from TB_CARDPERMITCOMPANYGROUP ';
  stSql := stSql + ' where CO_COMPANYCODE = ''' + aCompanyCode + ''') B '; //���� Ÿ���� ȸ���ڵ� Ÿ���̸鼭 �ش� ȸ���ڵ常 ������Ʈ
  stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE ';
  stSql := stSql + ' AND a.CP_NUMBER = b.CP_NUMBER ';
  stSql := stSql + ' AND a.CP_PERMIT <> b.CP_PERMIT ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.CompanyGradeToEmployeeCopyLikeAdd(
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE ( ';
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
  stSql := stSql + ' Select ';
  stSql := stSql + '''' + G_stGroupCode + ''',';
  stSql := stSql + ' a.EM_SEQ,';
  stSql := stSql + ' a.ND_NODENO,';
  stSql := stSql + ' a.DE_ECUID,';
  stSql := stSql + ' a.DE_EXTENDID,';
  stSql := stSql + ' a.CP_TYPE,';
  stSql := stSql + ' a.CP_NUMBER,';
  stSql := stSql + ' a.CP_PERMIT,';
  stSql := stSql + ' ''N'', ';
  stSql := stSql + ' ''N'' ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( select a1.GROUP_CODE, a1.EM_SEQ, a1.ND_NODENO, a1.DE_ECUID, a1.DE_EXTENDID, a1.CP_TYPE, a1.CP_NUMBER,a2.CP_PERMIT from ';
  stSql := stSql + ' ( Select ';
  stSql := stSql + ' aa.GROUP_CODE,';
  stSql := stSql + ' aa.EM_SEQ,';
  stSql := stSql + ' bb.ND_NODENO,';
  stSql := stSql + ' bb.DE_ECUID,';
  stSql := stSql + ' bb.DE_EXTENDID,';
  stSql := stSql + ' bb.CP_TYPE,';
  stSql := stSql + ' bb.CP_NUMBER ';
  stSql := stSql + ' From TB_EMPLOYEE aa ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP bb ';
  stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE ) '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE ) '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(aa.CO_COMPANYCODE From 1 for len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE ) ';
  stSql := stSql + ' WHERE aa.EM_GRADETYPE = 1 '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ���� ���ڰ�...
  stSql := stSql + ' AND aa.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
  stSql := stSql + ' group by aa.GROUP_CODE, aa.EM_SEQ, bb.ND_NODENO, bb.DE_ECUID, bb.DE_EXTENDID, bb.CP_TYPE, bb.CP_NUMBER ) a1 ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP a2 ';
  stSql := stSql + ' on(a1.group_code = a2.group_code ';
  stSql := stSql + ' and a1.ND_NODENO = a2.ND_NODENO ';
  stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
  stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
  stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
  stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ) ';
  stSql := stSql + ' where a2.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' ) A ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEECODE B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = A.GROUP_CODE ';
  stSql := stSql + ' AND B.ND_NODENO = A.ND_NODENO ';
  stSql := stSql + ' AND B.DE_ECUID = A.DE_ECUID  ';
  stSql := stSql + ' AND B.DE_EXTENDID = A.DE_EXTENDID  ';
  stSql := stSql + ' AND B.CP_TYPE = A.CP_TYPE  ';
  stSql := stSql + ' AND B.CP_NUMBER = A.CP_NUMBER  ';
  stSql := stSql + ' AND B.EM_SEQ = A.EM_SEQ )  ';
(*
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE ( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' CP_TYPE,';
  stSql := stSql + ' CP_NUMBER,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_APPLY )';
  stSql := stSql + ' Select ';
  stSql := stSql + '''' + G_stGroupCode + ''',';
  stSql := stSql + ' a.EM_SEQ,';
  stSql := stSql + ' b.ND_NODENO,';
  stSql := stSql + ' b.DE_ECUID,';
  stSql := stSql + ' b.DE_EXTENDID,';
  stSql := stSql + ' b.CP_TYPE,';
  stSql := stSql + ' b.CP_NUMBER,';
  stSql := stSql + ' b.CP_PERMIT,';
  stSql := stSql + ' ''N'' ';
  stSql := stSql + ' From TB_EMPLOYEE a ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND substring(a.CO_COMPANYCODE,1,len(b.CO_COMPANYCODE)) = b.CO_COMPANYCODE ) ';
  stSql := stSql + ' WHERE a.EM_GRADETYPE = 1 '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ���� ���ڰ�...
  stSql := stSql + ' AND a.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ���� ���ڰ�...
*)
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.CompanyGradeToEmployeeCopyLikeUpdate(
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  if G_nDBType = MSSQL then
  begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = b.CP_PERMIT ,';
    stSql := stSql + ' a.CP_APPLY = ''N'', ';
    stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' (select a1.EM_SEQ, ';   //a1 start
    stSql := stSql + ' a1.EM_GRADETYPE, ';
    stSql := stSql + ' a1.ND_NODENO, ';
    stSql := stSql + ' a1.DE_ECUID, ';
    stSql := stSql + ' a1.DE_EXTENDID, ';
    stSql := stSql + ' a1.CP_TYPE, ';
    stSql := stSql + ' a1.CP_NUMBER, ';
    stSql := stSql + ' a2.CP_PERMIT ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' aa.EM_GRADETYPE,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER ';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(aa.CO_COMPANYCODE From 1 for len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  ';
    stSql := stSql + ' AND aa.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 1 ) ';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE ';
    stSql := stSql + ' AND a.CP_NUMBER = b.CP_NUMBER ';
    stSql := stSql + ' AND a.CP_PERMIT <> b.CP_PERMIT ';
//    LogSave(G_stExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log',stSql);
  end else if G_nDBType = POSTGRESQL then
  begin
    stSql := ' Update TB_CARDPERMITEMPLOYEECODE Set ';
    stSql := stSql + ' TB_CARDPERMITEMPLOYEECODE.CP_PERMIT = ';
    stSql := stSql + ' (select a2.CP_PERMIT ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER,';
    stSql := stSql + ' bb.CP_PERMIT';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    stSql := stSql + ' AND substr(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  ';
    //stSql := stSql + ' AND aa.CO_COMPANYCODE = bb.CO_COMPANYCODE  ';
    stSql := stSql + ' AND aa.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 1  )';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE TB_CARDPERMITEMPLOYEECODE.EM_SEQ = B.EM_SEQ '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ ���ڰ�...
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.ND_NODENO = B.ND_NODENO ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.DE_ECUID = B.DE_ECUID ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.DE_EXTENDID = B.DE_EXTENDID ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.CP_TYPE = B.CP_TYPE ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.CP_NUMBER = B.CP_NUMBER )';
    stSql := stSql + ' TB_CARDPERMITEMPLOYEECODE.CP_APPLY = ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' ''N'' ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER,';
    stSql := stSql + ' bb.CP_PERMIT';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    stSql := stSql + ' AND substr(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  ';
    //stSql := stSql + ' AND aa.CO_COMPANYCODE = bb.CO_COMPANYCODE  ';
    stSql := stSql + ' AND aa.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 1  )';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE TB_CARDPERMITEMPLOYEECODE.EM_SEQ = B.EM_SEQ '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ ���ڰ�...
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.ND_NODENO = B.ND_NODENO ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.DE_ECUID = B.DE_ECUID ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.DE_EXTENDID = B.DE_EXTENDID ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.CP_TYPE = B.CP_TYPE ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.CP_NUMBER = B.CP_NUMBER ) ';
  end else if G_nDBType = FireBird then
  begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = b.CP_PERMIT ,';
    stSql := stSql + ' a.CP_APPLY = ''N'' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' (select a1.EM_SEQ, ';   //a1 start
    stSql := stSql + ' a1.EM_GRADETYPE, ';
    stSql := stSql + ' a1.ND_NODENO, ';
    stSql := stSql + ' a1.DE_ECUID, ';
    stSql := stSql + ' a1.DE_EXTENDID, ';
    stSql := stSql + ' a1.CP_TYPE, ';
    stSql := stSql + ' a1.CP_NUMBER, ';
    stSql := stSql + ' a2.CP_PERMIT ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' aa.EM_GRADETYPE,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER ';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(aa.CO_COMPANYCODE From 1 for len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  ';
    stSql := stSql + ' AND aa.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 1 ) ';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE ';
    stSql := stSql + ' AND a.CP_NUMBER = b.CP_NUMBER ';
    stSql := stSql + ' AND a.CP_PERMIT <> b.CP_PERMIT ';
  end;


  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCardPermit.CompanyGradeToEmployeeEachApply(
  aCompanyCode: string): Boolean;
begin
  //�ش� ȸ���ڵ� ����� ���� ������ ���� ��
  // ���� �ϸ� �ȵ�, 0 �� ������ �̿��� �� 0001�� ������ ������Ʈ �ؾ� �Ǵµ� ��� ���� �� //
  //dmDBDelete.DeleteTB_CARDPERMITEMPLOYEECODE_CompanyCodeLike(aCompanyCode);   //�ش� ȸ���ڵ�� ��ȸ�� �ڵ� �ش��ϴ� ��������� ���� ���̺��� ���� �Ѵ�. �� �Է� �ϱ� ���� �ʱ�ȭ �۾�
  //�ش� ȸ���ڵ� �� ��ȸ�� ����� ���� ���� �Է�
  result := CompanyGradeToEmployeeCopyLikeUpdate(aCompanyCode);
  result := CompanyGradeToEmployeeCopyLikeAdd(aCompanyCode);

end;


function TdmDBCardPermit.CompanyGradeToEmployeeGrade(aCompanyCode:string=''):Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stCompanyCode : string;
begin
  stSql := ' Select CO_DEEPSEQ,CO_COMPANYCODE ';
  stSql := stSql + ' from TB_CARDPERMITCOMPANYGROUP ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CP_APPLY <> ''Y'' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' GROUP BY CO_DEEPSEQ,CO_COMPANYCODE ';
  stSql := stSql + ' Order by CO_DEEPSEQ,CO_COMPANYCODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        stCompanyCode := FindField('CO_COMPANYCODE').AsString;
        dmDBCardPermit.CompanyGradeToNotEmployeeDelete(stCompanyCode);   //�Ҽӱ��ѿ��� ���� ������ѿ��� �ִ°�� ���� ��������.
        //dmDBCardPermit.CompanyGradeToEmployeeCopyEqualUpdate(stCompanyCode);  //�ش� ȸ���ڵ��� ���� �κи� ������Ʈ ����.
        dmDBCardPermit.CompanyGradeToEmployeeCopyEqualUpdate_II(stCompanyCode);
        dmDBCardPermit.CompanyGradeToEmployeeCopyEqualAdd(stCompanyCode);
        dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyCodeApply(stCompanyCode,'Y');
        {
        //if dmDBCardPermit.CompanyGradeToEmployeeEachApply(stCompanyCode) then
        if CompanyGradeToEmployeeEachApply(stCompanyCode) then      }
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TdmDBCardPermit.CompanyGradeToEmployee_PermitChange(aNodeNo, aEcuID,
  aExtendID, aType, aNumber, aCompanyCode,aPermit, aEmSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update A Set ';
  stSql := stSql + ' a.CP_PERMIT = ''' + aPermit + ''' ,';
  stSql := stSql + ' a.CP_APPLY = ''N'', ';
  stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
  stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE a,';
  stSql := stSql + ' (select EM_SEQ from TB_EMPLOYEE ';
  stSql := stSql + '  where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + '  AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if aEmSeq <> '' then stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + '';
  stSql := stSql + '  AND EM_ACUSE = ''1'' ';
  stSql := stSql + '  AND EM_GRADETYPE = 1 ) b ';
  stSql := stSql + ' WHERE a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND a.DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND a.CP_TYPE = ' + aType + ' ';
  stSql := stSql + ' AND a.CP_NUMBER = ' + aNumber +' ';
  stSql := stSql + ' AND a.CP_PERMIT <> ''' + aPermit + ''' ';
  if aEmSeq <> '' then stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ''
  else stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.CompanyGradeToNotEmployeeDelete(
  aCompanyCode: string;aEmSeq:string=''): Boolean;
var
  stSql : string;
begin
  stSql := ' Update A Set ';
  stSql := stSql + ' a.CP_PERMIT = ''0'' ,';
  stSql := stSql + ' a.CP_APPLY = ''N'', ';
  stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
  stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A ';
  if aEmSeq = '' then //����ڵ尡 �Է� ���� ���� ���
  begin
    stSql := stSql + ' Inner Join (select * from TB_EMPLOYEE ';
    stSql := stSql + ' WHERE EM_GRADETYPE = 1 '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸
    stSql := stSql + ' AND EM_ACUSE = ''1'' ';      //�����ڿ��� ���� ���� ���� ���
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ) B';
    stSql := stSql + ' ON(A.GROUP_CODE = B.GROUP_CODE ';
    stSql := stSql + ' AND A.EM_SEQ = B.EM_SEQ ) ';
  end;
  if G_bAttendDedicateDoorUse or G_bFoodDedicateDoorUse then
  begin
    stSql := stSql + ' Inner Join (select * from TB_DOOR ';
    stSql := stSql + ' WHERE GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (DO_ATTYPE is NULL OR DO_ATTYPE = ''0'' ) ';      //�������� ���Թ��� �ƴѰ��
    if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (DO_FDTYPE is NULL OR DO_FDTYPE = ''0'' ) ';      //�ļ����� ���Թ��� �ƴѰ��
    stSql := stSql + ') D ';
    stSql := stSql + ' ON(A.GROUP_CODE = D.GROUP_CODE ';
    stSql := stSql + ' AND A.ND_NODENO = D.ND_NODENO ';
    stSql := stSql + ' AND A.DE_ECUID = D.DE_ECUID ';
    stSql := stSql + ' AND A.DE_EXTENDID = D.DE_EXTENDID ';
    stSql := stSql + ' AND A.CP_TYPE = ''1'' ';
    stSql := stSql + ' AND A.CP_NUMBER = D.DO_DOORNO ) ';
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aEmSeq <> '' then stSql := stSql + ' AND A.EM_SEQ = ' + aEmSeq + '';  //����� ��� �� ��쿡�� �ش� ����� �۾�����.
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' ( select * from (Select bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER,aa.EM_SEQ from TB_EMPLOYEE aa ';
  stSql := stSql + ' Left Join TB_CARDPERMITCOMPANYGROUP bb ';
  stSql := stSql + ' ON(aa.GROUP_CODE = bb.GROUP_CODE ';
  stSql := stSql + ' AND aa.CO_COMPANYCODE = bb.CO_COMPANYCODE ) ';
  stSql := stSql + ' WHERE aa.EM_GRADETYPE = 1 '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸
  stSql := stSql + ' AND aa.EM_ACUSE = ''1'' ';      //�����ڿ��� ���� ���� ���� ���
  stSql := stSql + ' AND aa.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) C';
  stSql := stSql + ' Where A.ND_NODENO = C.ND_NODENO ';
  stSql := stSql + ' AND A.DE_ECUID = C.DE_ECUID ';
  stSql := stSql + ' AND A.DE_EXTENDID = C.DE_EXTENDID ';
  stSql := stSql + ' AND A.CP_TYPE = C.CP_TYPE ';
  stSql := stSql + ' AND A.CP_NUMBER = C.CP_NUMBER ';
  stSql := stSql + ' AND A.EM_SEQ = C.EM_SEQ ) ';


  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.DoorAttendEmployeeGradePermitAdd(aNodeNo, aEcuID,
  aDoorNo, aType, aPermit, aApply: string): Boolean;
begin
  if aType = '1' then
  begin
    result := dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyAttendDoorToEmCode(aNodeNo, aEcuID,aDoorNo,aPermit,aApply);
    result := dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_CopyAttendDoorToEmCode(aNodeNo, aEcuID,aDoorNo,aApply);
  end;

end;

function TdmDBCardPermit.DoorFoodEmployeeGradePermitAdd(aNodeNo, aEcuID,
  aDoorNo, aType, aPermit, aApply: string): Boolean;
begin
  if aType = '1' then
  begin
    result := dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyFoodDoorToEmCode(aNodeNo, aEcuID,aDoorNo,aPermit,aApply);
    result := dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_CopyFoodDoorToEmCode(aNodeNo, aEcuID,aDoorNo,aApply);  //�ļ���������� �������� ����
  end;

end;

function TdmDBCardPermit.EmGroupArmAreaPermitAdd(aEmGroupCode, aNodeNo, aEcuID,
  aExtendID, aArmAreaNo: string): Boolean;
var
  nDeep : integer;
begin
  if dmDBFunction.CheckTB_CARDPERMITEMPLOYEEGROUP_Permit(aEmGroupCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_ARMAREA,aArmAreaNo) = 1 then
  begin
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_StringValue(aEmGroupCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_APPLY','N');
    result := dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_StringValue(aEmGroupCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_PERMIT','1');
  end else
  begin
    nDeep := 0;
    nDeep := Length(aEmGroupCode) div G_nEmployeeGroupLength;
    result := dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE(aEmGroupCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_ARMAREA,aArmAreaNo,'1',inttostr(nDeep),'N');
  end;

end;

function TdmDBCardPermit.EmGroupArmAreaPermitDelete(aEmGroupCode, aNodeNo,
  aEcuID, aExtendID, aArmAreaNo: string): Boolean;
var
  nDeep : integer;
begin
  if dmDBFunction.CheckTB_CARDPERMITEMPLOYEEGROUP_Permit(aEmGroupCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_ARMAREA,aArmAreaNo) = 1 then
  begin
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_StringValue(aEmGroupCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_APPLY','N');
    result := dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_StringValue(aEmGroupCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_PERMIT','0');
  end else
  begin
    nDeep := 0;
    nDeep := Length(aEmGroupCode) div G_nEmployeeGroupLength;
    result := dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE(aEmGroupCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_ARMAREA,aArmAreaNo,'0',inttostr(nDeep),'N');
  end;
end;

function TdmDBCardPermit.EmGroupDoorPermitAdd(aEmGroupCode, aNodeNo, aEcuID,
  aExtendID, aDoorNo: string): Boolean;
var
  nDeep : integer;
begin
  if dmDBFunction.CheckTB_CARDPERMITEMPLOYEEGROUP_Permit(aEmGroupCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDoorNo) = 1 then
  begin
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_StringValue(aEmGroupCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_APPLY','N');
    result := dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_StringValue(aEmGroupCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_PERMIT','1');
  end else
  begin
    nDeep := 0;
    nDeep := Length(aEmGroupCode) div G_nEmployeeGroupLength;
    result := dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE(aEmGroupCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDOORNO,'1',inttostr(nDeep),'N');
  end;
end;

function TdmDBCardPermit.EmGroupDoorPermitDelete(aEmGroupCode, aNodeNo, aEcuID,
  aExtendID, aDoorNo: string): Boolean;
var
  nDeep : integer;
begin
  if dmDBFunction.CheckTB_CARDPERMITEMPLOYEEGROUP_Permit(aEmGroupCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDoorNo) = 1 then
  begin
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_StringValue(aEmGroupCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_APPLY','N');
    result := dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_StringValue(aEmGroupCode,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_PERMIT','0');
  end else
  begin
    nDeep := 0;
    nDeep := Length(aEmGroupCode) div G_nEmployeeGroupLength;
    result := dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE(aEmGroupCode,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDOORNO,'0',inttostr(nDeep),'N');
  end;
end;

function TdmDBCardPermit.EmGroupGradeToEmployeeCopyEqualAdd(
  aEmGroupCode: string;aEmSeq:string=''): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE ( ';
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
  stSql := stSql + ' Select ';
  stSql := stSql + '''' + G_stGroupCode + ''',';
  stSql := stSql + ' a.EM_SEQ,';
  stSql := stSql + ' a.ND_NODENO,';
  stSql := stSql + ' a.DE_ECUID,';
  stSql := stSql + ' a.DE_EXTENDID,';
  stSql := stSql + ' a.CP_TYPE,';
  stSql := stSql + ' a.CP_NUMBER,';
  stSql := stSql + ' a.CP_PERMIT,';
  stSql := stSql + ' ''N'', ';
  stSql := stSql + ' ''N'' ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( select a1.GROUP_CODE, a1.EM_SEQ, a1.ND_NODENO, a1.DE_ECUID, a1.DE_EXTENDID, a1.CP_TYPE, a1.CP_NUMBER,a2.CP_PERMIT from ';
  stSql := stSql + ' ( Select ';
  stSql := stSql + ' aa.GROUP_CODE,';
  stSql := stSql + ' aa.EM_SEQ,';
  stSql := stSql + ' bb.ND_NODENO,';
  stSql := stSql + ' bb.DE_ECUID,';
  stSql := stSql + ' bb.DE_EXTENDID,';
  stSql := stSql + ' bb.CP_TYPE,';
  stSql := stSql + ' bb.CP_NUMBER ';
  stSql := stSql + ' From TB_EMPLOYEE aa ';
  stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
  stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
(*  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(aa.CO_COMPANYCODE From 1 for len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  ';
*)
  stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE ';
  stSql := stSql + ' AND aa.EM_GROUPCODE = ''' + aEmGroupCode + ''' '; //���� Ÿ���� ȸ���ڵ� Ÿ���̸鼭 �ش� ȸ���ڵ常 ������Ʈ
  stSql := stSql + ' AND aa.EM_ACUSE = ''1'' ';      //�����ڿ��� ���� ���� ���� ���
  stSql := stSql + ' AND aa.EM_GRADETYPE = 2 ) ';

  //stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
  (*
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE ) '
  else if G_nDBType = PostGresql then
    stSql := stSql + ' AND substr(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE ) '
  else if G_nDBType = FireBird then
    stSql := stSql + ' AND substring(aa.EM_GROUPCODE From 1 for len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE ) ';
  *)
  //stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE ) ';
  //stSql := stSql + ' WHERE aa.EM_GRADETYPE = 2 '; //���� Ÿ���� �׷���� Ÿ���� ��츸 ADD���ڰ�...
  //stSql := stSql + ' AND aa.EM_ACUSE = ''1'' ';      //�����ڿ��� ���� ���� ���� ���
  //stSql := stSql + ' AND aa.EM_GROUPCODE = ''' + aEmGroupCode + ''' ';
  stSql := stSql + ' group by aa.GROUP_CODE, aa.EM_SEQ, bb.ND_NODENO, bb.DE_ECUID, bb.DE_EXTENDID, bb.CP_TYPE, bb.CP_NUMBER ) a1 ';
  stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP a2 ';
  stSql := stSql + ' on(a1.group_code = a2.group_code ';
  stSql := stSql + ' and a1.ND_NODENO = a2.ND_NODENO ';
  stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
  stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
  stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
  stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ) ';
  stSql := stSql + ' where a2.EM_GROUPCODE = ''' + aEmGroupCode + ''' ';
  stSql := stSql + ' ) A ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aEmSeq <> '' then stSql := stSql + ' AND A.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEECODE B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = A.GROUP_CODE ';
  stSql := stSql + ' AND B.ND_NODENO = A.ND_NODENO ';
  stSql := stSql + ' AND B.DE_ECUID = A.DE_ECUID  ';
  stSql := stSql + ' AND B.DE_EXTENDID = A.DE_EXTENDID  ';
  stSql := stSql + ' AND B.CP_TYPE = A.CP_TYPE  ';
  stSql := stSql + ' AND B.CP_NUMBER = A.CP_NUMBER   ';
  stSql := stSql + ' AND B.EM_SEQ = A.EM_SEQ )  ';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.EmGroupGradeToEmployeeCopyEqualUpdate(
  aEmGroupCode: string;aEmSeq:string=''): Boolean;
var
  stSql : string;
begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = b.CP_PERMIT ,';
    stSql := stSql + ' a.CP_APPLY = ''N'', ';
    stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' (select a1.EM_SEQ, ';
    stSql := stSql + ' a1.EM_GRADETYPE, ';
    stSql := stSql + ' a1.ND_NODENO, ';
    stSql := stSql + ' a1.DE_ECUID, ';
    stSql := stSql + ' a1.DE_EXTENDID, ';
    stSql := stSql + ' a1.CP_TYPE, ';
    stSql := stSql + ' a1.CP_NUMBER, ';
    stSql := stSql + ' a2.CP_PERMIT ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' aa.EM_GRADETYPE,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER ';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    (*if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  '
    else if G_nDBType = PostGresql then
      stSql := stSql + ' AND substr(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  '
    else if G_nDBType = FireBird then
      stSql := stSql + ' AND substring(aa.EM_GROUPCODE From 1 for len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  ';
    *)
    stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE = ''' + aEmGroupCode + ''' '; //���� Ÿ���� �׷��ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_ACUSE = ''1'' ';      //�����ڿ��� ���� ���� ���� ���
    stSql := stSql + ' AND aa.EM_GRADETYPE = 2 ) ';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.EM_GROUPCODE = ''' + aEmGroupCode + ''')  ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE ';
    stSql := stSql + ' AND a.CP_NUMBER = b.CP_NUMBER ';
    stSql := stSql + ' AND a.CP_PERMIT <> b.CP_PERMIT ';
    if aEmSeq <> '' then stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + '';


  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.EmGroupGradeToEmployeeCopyEqualUpdate_II(aEmGroupCode,
  aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  nRow : integer;
begin
  result := False;
  stSql := ' select * from TB_CARDPERMITEMPLOYEEGROUP ';
  stSql := stSql + ' where EM_GROUPCODE = ''' + aEmGroupCode + ''' ';
  if aEmSeq = '' then stSql := stSql + ' AND CP_APPLY <> ''Y'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      result := True;
      if recordcount = 0 then Exit;
      nRow := 0;
      while Not Eof do
      begin
        EmGroupGradeToEmployee_PermitChange(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,
                                            FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,aEmGroupCode,FindField('CP_PERMIT').AsString,aEmSeq);
        if aEmSeq = '' then
        dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_StringValue(aEmGroupCode,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,
                                            FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,'CP_APPLY','Y');

        inc(nRow);
        if Assigned(FOnCardPermitProcess) then
        begin
          OnCardPermitProcess(Self,'2',aEmGroupCode,recordcount,nRow);
        end;
        Next;
        Application.ProcessMessages;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmDBCardPermit.EmGroupGradeToEmployeeCopyEqualUpdate_III(aEmGroupCode,
  aEmSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update A Set ';
  stSql := stSql + ' a.CP_PERMIT = b.CP_PERMIT ,';
  stSql := stSql + ' a.CP_APPLY = ''N'', ';
  stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
  stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
  stSql := stSql + ' ( select ';
  stSql := stSql + aEmSeq + ' as EM_SEQ,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_TYPE,';
  stSql := stSql + ' CP_NUMBER ';
  stSql := stSql + ' from TB_CARDPERMITEMPLOYEEGROUP ';
  stSql := stSql + ' where EM_GROUPCODE = ''' + aEmGroupCode + ''') B '; //���� Ÿ���� �׷��ڵ� Ÿ���̸鼭 �ش� �׷��ڵ常 ������Ʈ
  stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE ';
  stSql := stSql + ' AND a.CP_NUMBER = b.CP_NUMBER ';
  stSql := stSql + ' AND a.CP_PERMIT <> b.CP_PERMIT ';
  if aEmSeq <> '' then stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + '';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.EmGroupGradeToEmployeeCopyLikeAdd(
  aEmGroupCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE ( ';
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
  stSql := stSql + ' Select ';
  stSql := stSql + '''' + G_stGroupCode + ''',';
  stSql := stSql + ' a.EM_SEQ,';
  stSql := stSql + ' a.ND_NODENO,';
  stSql := stSql + ' a.DE_ECUID,';
  stSql := stSql + ' a.DE_EXTENDID,';
  stSql := stSql + ' a.CP_TYPE,';
  stSql := stSql + ' a.CP_NUMBER,';
  stSql := stSql + ' a.CP_PERMIT,';
  stSql := stSql + ' ''N'', ';
  stSql := stSql + ' ''N'' ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( select a1.GROUP_CODE, a1.EM_SEQ, a1.ND_NODENO, a1.DE_ECUID, a1.DE_EXTENDID, a1.CP_TYPE, a1.CP_NUMBER,a2.CP_PERMIT from ';
  stSql := stSql + ' ( Select ';
  stSql := stSql + ' aa.GROUP_CODE,';
  stSql := stSql + ' aa.EM_SEQ,';
  stSql := stSql + ' bb.ND_NODENO,';
  stSql := stSql + ' bb.DE_ECUID,';
  stSql := stSql + ' bb.DE_EXTENDID,';
  stSql := stSql + ' bb.CP_TYPE,';
  stSql := stSql + ' bb.CP_NUMBER ';
  stSql := stSql + ' From TB_EMPLOYEE aa ';
  stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
  stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE ) '
  else if G_nDBType = PostGresql then
    stSql := stSql + ' AND substr(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE ) '
  else if G_nDBType = FireBird then
    stSql := stSql + ' AND substring(aa.EM_GROUPCODE From 1 for len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE ) ';
  //stSql := stSql + ' AND aa.EM_GROUPCODE = substring(bb.EM_GROUPCODE,1,len(aa.EM_GROUPCODE)) ) ';
  //stSql := stSql + ' AND aa.EM_GROUPCODE =bb.EM_GROUPCODE) ';
  stSql := stSql + ' WHERE aa.EM_GRADETYPE = 2 '; //���� Ÿ���� ����׷��ڵ� Ÿ���� ��츸 ADD���ڰ�...
  stSql := stSql + ' AND aa.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' ';
  stSql := stSql + ' group by aa.GROUP_CODE, aa.EM_SEQ, bb.ND_NODENO, bb.DE_ECUID, bb.DE_EXTENDID, bb.CP_TYPE, bb.CP_NUMBER ) a1 ';
  stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP a2 ';
  stSql := stSql + ' on(a1.group_code = a2.group_code ';
  stSql := stSql + ' and a1.ND_NODENO = a2.ND_NODENO ';
  stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
  stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
  stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
  stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ) ';
  stSql := stSql + ' where a2.EM_GROUPCODE = ''' + aEmGroupCode + ''' ';
  stSql := stSql + ' ) A ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEECODE B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = A.GROUP_CODE ';
  stSql := stSql + ' AND B.ND_NODENO = A.ND_NODENO ';
  stSql := stSql + ' AND B.DE_ECUID = A.DE_ECUID  ';
  stSql := stSql + ' AND B.DE_EXTENDID = A.DE_EXTENDID  ';
  stSql := stSql + ' AND B.CP_TYPE = A.CP_TYPE  ';
  stSql := stSql + ' AND B.CP_NUMBER = A.CP_NUMBER   ';
  stSql := stSql + ' AND B.EM_SEQ = A.EM_SEQ )  ';
(*
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE ( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' CP_TYPE,';
  stSql := stSql + ' CP_NUMBER,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_APPLY )';
  stSql := stSql + ' Select ';
  stSql := stSql + '''' + G_stGroupCode + ''',';
  stSql := stSql + ' a.EM_SEQ,';
  stSql := stSql + ' b.ND_NODENO,';
  stSql := stSql + ' b.DE_ECUID,';
  stSql := stSql + ' b.DE_EXTENDID,';
  stSql := stSql + ' b.CP_TYPE,';
  stSql := stSql + ' b.CP_NUMBER,';
  stSql := stSql + ' b.CP_PERMIT,';
  stSql := stSql + ' ''N'' ';
  stSql := stSql + ' From TB_EMPLOYEE a ';
  stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND substring(a.EM_GROUPCODE,1,len(b.EM_GROUPCODE)) = b.EM_GROUPCODE ) ';
  stSql := stSql + ' WHERE a.EM_GRADETYPE = 2 '; //���� Ÿ���� ����׷��ڵ� Ÿ���� ��츸 ���� ���ڰ�...
  stSql := stSql + ' AND a.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ���� ���ڰ�...
*)
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.EmGroupGradeToEmployeeCopyLikeUpdate(
  aEmGroupCode: string): Boolean;
var
  stSql : string;
begin
  if G_nDBType = MSSQL then
  begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = b.CP_PERMIT ,';
    stSql := stSql + ' a.CP_APPLY = ''N'', ';
    stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' (select a1.EM_SEQ, ';
    stSql := stSql + ' a1.EM_GRADETYPE, ';
    stSql := stSql + ' a1.ND_NODENO, ';
    stSql := stSql + ' a1.DE_ECUID, ';
    stSql := stSql + ' a1.DE_EXTENDID, ';
    stSql := stSql + ' a1.CP_TYPE, ';
    stSql := stSql + ' a1.CP_NUMBER, ';
    stSql := stSql + ' a2.CP_PERMIT ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' aa.EM_GRADETYPE,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER ';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  '
    else if G_nDBType = PostGresql then
      stSql := stSql + ' AND substr(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  '
    else if G_nDBType = FireBird then
      stSql := stSql + ' AND substring(aa.EM_GROUPCODE From 1 for len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  ';
    //stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 2 ) ';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE ';
    stSql := stSql + ' AND a.CP_NUMBER = b.CP_NUMBER ';
    stSql := stSql + ' AND a.CP_PERMIT <> b.CP_PERMIT ';
(*  stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = b.CP_PERMIT,';
    stSql := stSql + ' a.CP_APPLY = ''N'' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.CO_COMPANYCODE,';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' aa.EM_GRADETYPE,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER,';
    stSql := stSql + ' bb.CP_PERMIT ';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    //stSql := stSql + ' AND substring(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 2 ) ) B ';
    stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ ���ڰ�...
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE ';
    stSql := stSql + ' AND a.CP_NUMBER = b.CP_NUMBER '; *)
  end else if G_nDBType = POSTGRESQL then
  begin
   stSql := ' Update TB_CARDPERMITEMPLOYEECODE Set ';
    stSql := stSql + ' TB_CARDPERMITEMPLOYEECODE.CP_PERMIT = ';
    stSql := stSql + ' (select a2.CP_PERMIT ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER ';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    stSql := stSql + ' AND substr(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  ';
    //stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 2  )';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE TB_CARDPERMITEMPLOYEECODE.EM_SEQ = B.EM_SEQ '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ ���ڰ�...
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.ND_NODENO = B.ND_NODENO ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.DE_ECUID = B.DE_ECUID ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.DE_EXTENDID = B.DE_EXTENDID ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.CP_TYPE = B.CP_TYPE ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.CP_NUMBER = B.CP_NUMBER ),';
    stSql := stSql + ' TB_CARDPERMITEMPLOYEECODE.CP_APPLY = ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' ''N'' ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER ';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    //stSql := stSql + ' AND substring(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 2  )';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE TB_CARDPERMITEMPLOYEECODE.EM_SEQ = B.EM_SEQ '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ ���ڰ�...
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.ND_NODENO = B.ND_NODENO ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.DE_ECUID = B.DE_ECUID ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.DE_EXTENDID = B.DE_EXTENDID ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.CP_TYPE = B.CP_TYPE ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.CP_NUMBER = B.CP_NUMBER ),';
  end else if G_nDBType = FireBird then
  begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = b.CP_PERMIT ,';
    stSql := stSql + ' a.CP_APPLY = ''N'' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' (select a1.EM_SEQ, ';
    stSql := stSql + ' a1.EM_GRADETYPE, ';
    stSql := stSql + ' a1.ND_NODENO, ';
    stSql := stSql + ' a1.DE_ECUID, ';
    stSql := stSql + ' a1.DE_EXTENDID, ';
    stSql := stSql + ' a1.CP_TYPE, ';
    stSql := stSql + ' a1.CP_NUMBER, ';
    stSql := stSql + ' a2.CP_PERMIT ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' aa.EM_GRADETYPE,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER ';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  '
    else if G_nDBType = PostGresql then
      stSql := stSql + ' AND substr(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  '
    else if G_nDBType = FireBird then
      stSql := stSql + ' AND substring(aa.EM_GROUPCODE From 1 for len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  ';
    //stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 2 ) ';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE ';
    stSql := stSql + ' AND a.CP_NUMBER = b.CP_NUMBER ';
    stSql := stSql + ' AND a.CP_PERMIT <> b.CP_PERMIT ';

  end;


  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCardPermit.EmGroupGradeToEmployeeGrade(aEmGroupCode:string=''): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stEmGroupCode : string;
begin
  stSql := ' Select EM_DEEPSEQ,EM_GROUPCODE ';
  stSql := stSql + ' from TB_CARDPERMITEMPLOYEEGROUP ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CP_APPLY <> ''Y'' ';
  stSql := stSql + ' GROUP BY EM_DEEPSEQ,EM_GROUPCODE ';
  stSql := stSql + ' Order by EM_DEEPSEQ,EM_GROUPCODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        stEmGroupCode := FindField('EM_GROUPCODE').AsString;
        EmGroupGradeToNotEmployeeDelete(stEmGroupCode);
        //EmGroupGradeToEmployeeCopyEqualUpdate(stEmGroupCode);
        EmGroupGradeToEmployeeCopyEqualUpdate_II(stEmGroupCode);
        EmGroupGradeToEmployeeCopyEqualAdd(stEmGroupCode);
        dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_EmGroupCodeApply(stEmGroupCode,'Y');

        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBCardPermit.EmGroupGradeToEmployee_PermitChange(aNodeNo, aEcuID,
  aExtendID, aType, aNumber, aEmGroupCode, aPermit, aEmSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update A Set ';
  stSql := stSql + ' a.CP_PERMIT = ''' + aPermit + ''' ,';
  stSql := stSql + ' a.CP_APPLY = ''N'', ';
  stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
  stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE a,';
  stSql := stSql + ' (select EM_SEQ from TB_EMPLOYEE ';
  stSql := stSql + '  where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE = ''' + aEmGroupCode + ''' '; //���� Ÿ���� �׷��ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
  if aEmSeq <> '' then stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + '';
  stSql := stSql + '  AND EM_ACUSE = ''1'' ';
  stSql := stSql + '  AND EM_GRADETYPE = 2 ) b ';
  stSql := stSql + ' WHERE a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND a.DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND a.CP_TYPE = ' + aType + ' ';
  stSql := stSql + ' AND a.CP_NUMBER = ' + aNumber +' ';
  stSql := stSql + ' AND a.CP_PERMIT <> ''' + aPermit + ''' ';
  if aEmSeq <> '' then stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ''
  else stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.EmGroupGradeToNotEmployeeDelete(
  aEmGroupCode: string;aEmSeq:string=''): Boolean;
var
  stSql : string;
begin
  stSql := ' Update A Set ';
  stSql := stSql + ' a.CP_PERMIT = ''0'' ,';
  stSql := stSql + ' a.CP_APPLY = ''N'', ';
  stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
  stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A ';
  if aEmSeq = '' then //����ڵ尡 �Է� ���� ���� ���
  begin
    stSql := stSql + ' Inner Join (select * from TB_EMPLOYEE ';
    stSql := stSql + ' WHERE EM_GRADETYPE = 2 '; //���� Ÿ���� �׷��ڵ� Ÿ���� ��츸
    stSql := stSql + ' AND EM_ACUSE = ''1'' ';      //�����ڿ��� ���� ���� ���� ���
    stSql := stSql + ' AND EM_GROUPCODE = ''' + aEmGroupCode + ''' ) B';
    stSql := stSql + ' ON(A.GROUP_CODE = B.GROUP_CODE ';
    stSql := stSql + ' AND A.EM_SEQ = B.EM_SEQ ) ';
  end;
  if G_bAttendDedicateDoorUse or G_bFoodDedicateDoorUse then
  begin
    stSql := stSql + ' Inner Join (select * from TB_DOOR ';
    stSql := stSql + ' WHERE GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (DO_ATTYPE is NULL OR DO_ATTYPE = ''0'' ) ';      //�������� ���Թ��� �ƴѰ��
    if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (DO_FDTYPE is NULL OR DO_FDTYPE = ''0'' ) ';      //�ļ����� ���Թ��� �ƴѰ��
    stSql := stSql + ') D ';
    stSql := stSql + ' ON(A.GROUP_CODE = D.GROUP_CODE ';
    stSql := stSql + ' AND A.ND_NODENO = D.ND_NODENO ';
    stSql := stSql + ' AND A.DE_ECUID = D.DE_ECUID ';
    stSql := stSql + ' AND A.DE_EXTENDID = D.DE_EXTENDID ';
    stSql := stSql + ' AND A.CP_TYPE = ''1'' ';
    stSql := stSql + ' AND A.CP_NUMBER = D.DO_DOORNO ) ';
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aEmSeq <> '' then stSql := stSql + ' AND A.EM_SEQ = ' + aEmSeq + '';  //����� ��� �� ��쿡�� �ش� ����� �۾�����.
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' ( select * from (Select bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER,aa.EM_SEQ from TB_EMPLOYEE aa ';
  stSql := stSql + ' Left Join TB_CARDPERMITEMPLOYEEGROUP bb ';
  stSql := stSql + ' ON(aa.GROUP_CODE = bb.GROUP_CODE ';
  stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE ) ';
  stSql := stSql + ' WHERE aa.EM_GRADETYPE = 2 '; //���� Ÿ���� �׷��ڵ� Ÿ���� ��츸
  stSql := stSql + ' AND aa.EM_ACUSE = ''1'' ';      //�����ڿ��� ���� ���� ���� ���
  stSql := stSql + ' AND aa.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) C';
  stSql := stSql + ' Where A.ND_NODENO = C.ND_NODENO ';
  stSql := stSql + ' AND A.DE_ECUID = C.DE_ECUID ';
  stSql := stSql + ' AND A.DE_EXTENDID = C.DE_EXTENDID ';
  stSql := stSql + ' AND A.CP_TYPE = C.CP_TYPE ';
  stSql := stSql + ' AND A.CP_NUMBER = C.CP_NUMBER ';
  stSql := stSql + ' AND A.EM_SEQ = C.EM_SEQ ) ';


  result := dmDataBase.ProcessExecSQL(stSql);
end;

(*    ���α׷����� ó�� ��ƾ�� ���� �ش� ������ �����ؼ� ����
function TdmDBCardPermit.EmGroupGradeToEmployeeEachApply(
  aEmGroupCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  stSql := ' Select * from tb_employee ';
  stSql := stSql + ' where EM_GROUPCODE Like ''' + aEmGroupCode + '%'' ';
  stSql := stSql + ' AND EM_ACUSE = ''1'' ';
  stSql := stSql + ' AND EM_GRADETYPE = 2 ';

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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','EmGroupGradeToEmployeeEachApply');
        result := False;
        Exit;
      End;
      While Not Eof do
      begin
        EmSeqEmGroupGradeToEmployeeCopyLikeUpdate(FindField('EM_SEQ').asstring,aEmGroupCode);
        EmSeqEmGroupGradeToEmployeeCopyLikeAdd(FindField('EM_SEQ').asstring,aEmGroupCode);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  //�ش� ����׷� ����� ���� ������ ���� ��
  // �����ϸ� �ȵ�.dmDBDelete.DeleteTB_CARDPERMITEMPLOYEECODE_EmGroupCodeLike(aEmGroupCode);   //�ش� ȸ���ڵ�� ��ȸ�� �ڵ� �ش��ϴ� ��������� ���� ���̺��� ���� �Ѵ�. �� �Է� �ϱ� ���� �ʱ�ȭ �۾�
  //�ش� ȸ���ڵ� �� ��ȸ�� ����� ���� ���� �Է�
  //result := EmGroupGradeToEmployeeCopyLikeUpdate(aEmGroupCode);
  //result := EmGroupGradeToEmployeeCopyLikeAdd(aEmGroupCode);

end;
*)

(*
function TdmDBCardPermit.EmGroupGradeToEmployeeGrade: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stEmGroupCode : string;
begin
  stSql := ' Select EM_DEEPSEQ,EM_GROUPCODE ';
  stSql := stSql + ' from TB_CARDPERMITEMPLOYEEGROUP ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CP_APPLY <> ''Y'' ';
  stSql := stSql + ' GROUP BY EM_DEEPSEQ,EM_GROUPCODE ';
  stSql := stSql + ' Order by EM_DEEPSEQ,EM_GROUPCODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        stEmGroupCode := FindField('EM_GROUPCODE').AsString;
        //if dmDBCardPermit.EmGroupGradeToEmployeeEachApply(stEmGroupCode) then
        if EmGroupGradeToEmployeeEachApply(stEmGroupCode) then
           dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_EmGroupCodeApply(stEmGroupCode,'Y');
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;
*)

function TdmDBCardPermit.EmployeeArmAreaPermitAdd(aEmSeq, aNodeNo, aEcuID,
  aExtendID, aArmAreaNo: string;aEmApprove:string=''): Boolean;
var
  stPermit : string;
begin
  if dmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_Permit(aEmSeq,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_ARMAREA,aArmAreaNo,stPermit) = 1 then
  begin
    if stPermit <> '1' then //������ ���� �� ��쿡�� ó�� ����.
    begin
      if G_nEmployeeAPPROVE = 1 then  //������������� ��� ���̸鼭
      begin
        if aEmApprove = '0'  then //���� ��û�̸�
           dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue(aEmSeq,aNodeNo, aEcuID, '', '', '', 'EM_APPROVE',aEmApprove); //�ش��ϴ� ��Ʈ�ѷ��� ���ν�û������ ��������
      end;
      result := dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_PERMIT','1');
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_APPLY','N');
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_FINGERAPPLY','N');
    end;
  end else
  begin
    if G_nEmployeeAPPROVE = 1 then  //������������� ��� ���̸鼭
    begin
      if aEmApprove = '0'  then //���� ��û�̸�
         dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue(aEmSeq,aNodeNo, aEcuID, '', '', '', 'EM_APPROVE',aEmApprove); //�ش��ϴ� ��Ʈ�ѷ��� ���ν�û������ ��������
    end;
    result := dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_ARMAREA,aArmAreaNo,'1','N',aEmApprove);
  end;

end;

function TdmDBCardPermit.EmployeeArmAreaPermitDelete(aEmSeq, aNodeNo, aEcuID,
  aExtendID, aArmAreaNo: string): Boolean;
begin
  result := dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_PERMIT','0');
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_APPLY','N');
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_ARMAREA, aArmAreaNo, 'CP_FINGERAPPLY','N');
end;

function TdmDBCardPermit.EmployeeAttendDoorGradePermitAdd(aEmSeq, aType,
  aPermit, aApply: string): Boolean;
begin
  if aType = '1' then
  begin
    result := dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyAttendEmCodeToDoor(aEmSeq,aPermit,aApply);
    result := dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_CopyAttendEmCodeToDoor(aEmSeq,aPermit,aApply);
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_AttendEmSeqApply(aEmSeq,'N');
  end;
end;

function TdmDBCardPermit.EmployeeCardAllPermit(aEmSeq,aType,aPermit,aApply: string): Boolean;
var
  stSql : string;
begin
  //���Թ� ��ü ���� �ο�
  if aType = '1' then
    result := dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyAllDoorToEmCode(aEmSeq,aPermit,aApply);
  //������� ��ü ���� �ο�
  if aType = '2' then
    result := dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyAllArmAreaToEmCode(aEmSeq,aPermit,aApply);
end;


function TdmDBCardPermit.EmployeeDoorPermitAdd(aEmSeq, aNodeNo, aEcuID,
  aExtendID, aDoorNo: string;aEmApprove:string=''): Boolean;
var
  stPermit : string;
begin
  result := False;
  if dmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_PermitValue(aEmSeq,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDoorNo,stPermit) = 1 then   //������ ���� ��� �ٽ� �ٿ�ε� ���� ����.
  begin
    if stPermit <> '1' then
    begin
      if G_nEmployeeAPPROVE = 1 then  //������������� ��� ���̸鼭
      begin
        if aEmApprove = '0'  then //���� ��û�̸�
           dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue(aEmSeq,aNodeNo, aEcuID, '', '', '', 'EM_APPROVE',aEmApprove); //�ش��ϴ� ��Ʈ�ѷ��� ���ν�û������ ��������
      end;
      result := dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_PERMIT','1');
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_APPLY','N');
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_FINGERAPPLY','N');
    end;
  end else
  begin
    if G_nEmployeeAPPROVE = 1 then  //������������� ��� ���̸鼭
    begin
      if aEmApprove = '0'  then //���� ��û�̸�
         dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue(aEmSeq,aNodeNo, aEcuID, '', '', '', 'EM_APPROVE',aEmApprove); //�ش��ϴ� ��Ʈ�ѷ��� ���ν�û������ ��������
    end;
    result := dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDOORNO,'1','N',aEmApprove);
  end;

end;

function TdmDBCardPermit.EmployeeDoorPermitDelete(aEmSeq, aNodeNo, aEcuID,
  aExtendID, aDoorNo: string): Boolean;
var
  stPermit : string;
begin
  result := False;
  if dmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_PermitValue(aEmSeq,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDoorNo,stPermit) = 1 then    //������ ���� ��� �ٽ� �ٿ�ε� ���� ����.
  begin
    if stPermit <> '0' then
    begin
      result := dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_PERMIT','0');
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_APPLY','N');
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_FINGERAPPLY','N');
    end;
  end;
end;

function TdmDBCardPermit.EmployeeFoodDoorGradePermitAdd(aEmSeq, aType, aPermit,
  aApply: string): Boolean;
begin
  if aType = '1' then
  begin
    result := dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_CopyFoodEmCodeToDoor(aEmSeq,aPermit,aApply);
    result := dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyFoodEmCodeToDoor(aEmSeq,aPermit,aApply);
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FoodEmSeqApply(aEmSeq,'N');
  end;

end;

function TdmDBCardPermit.EmployeeGradeChange_CardPermitCompanyGroupToEmployeeCode(
  aEmSeq, aCompanyCode, aDeepSeq: string;aGradeUpdate:Boolean;aEmApprove:string=''): Boolean;
var
  stCurrentCompanyCode : string;
  stSql : string;
  TempAdoQuery :TADOQuery;
  bContinue : Boolean;
  stPermit : string;
begin
  result := True;
  if aDeepSeq = '0' then stCurrentCompanyCode := '0'
  else
  begin
    if Length(aCompanyCode) < (G_nCompanyCodeLength * strtoint(aDeepSeq)) then Exit; //���� ���� ���� �������� ���� ������.

    stCurrentCompanyCode := copy(aCompanyCode,1,1 + (G_nCompanyCodeLength * strtoint(aDeepSeq)));
  end;

  stSql := 'Select a.*,b.DO_ATTYPE,b.DO_FDTYPE from TB_CARDPERMITCOMPANYGROUP a ';
  stSql := stsql + ' Left Join TB_DOOR b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND a.CP_TYPE = ''1'' ';
  stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + stCurrentCompanyCode + ''' ';
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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','EmployeeGradeChange_CardPermitCompanyGroupToEmployeeCode');
        result := False;
        Exit;
      End;
      While Not Eof do
      begin
        bContinue := False;
        if G_bAttendDedicateDoorUse and (FindField('DO_ATTYPE').AsString = '1') then bContinue := True
        else if G_bFoodDedicateDoorUse and (FindField('DO_FDTYPE').AsString = '1') then bContinue := True;

        if Not bContinue then
        begin
          if dmDBFunction.checkTB_CARDPERMITEMPLOYEECODE_Permit(aEmSeq,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,stPermit) = 1 then
          begin
            //�����ϸ� Update
            if aGradeUpdate then
            begin
              if G_nEmployeeAPPROVE = 1 then  //������������� ��� ���̸鼭
              begin
                if aEmApprove = '0'  then //���� ��û�̸�
                   dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue(aEmSeq,FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, '', '', '', 'EM_APPROVE',aEmApprove); //�ش��ϴ� ��Ʈ�ѷ��� ���ν�û������ ��������
              end;
             //ī�� �߰� �Ǵ� ���� �� ��쿡�� ������ ������ ó�� �ؾ� ��
              dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,FindField('CP_PERMIT').AsString,'N',aEmApprove);
            end else
            begin
              if dmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_PermitGrade(aEmSeq,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,FindField('CP_PERMIT').AsString) <> 1 then  //������ �ٸ� ��쿡�� ������Ʈ ����
              begin
                if G_nEmployeeAPPROVE = 1 then  //������������� ��� ���̸鼭
                begin
                  if aEmApprove = '0'  then //���� ��û�̸�
                     dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue(aEmSeq,FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, '', '', '', 'EM_APPROVE',aEmApprove); //�ش��ϴ� ��Ʈ�ѷ��� ���ν�û������ ��������
                end;
                dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,FindField('CP_PERMIT').AsString,'N',aEmApprove);
              end;
            end;
          end else
          begin
            if G_nEmployeeAPPROVE = 1 then  //������������� ��� ���̸鼭
            begin
              if aEmApprove = '0'  then //���� ��û�̸�
                 dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue(aEmSeq,FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, '', '', '', 'EM_APPROVE',aEmApprove); //�ش��ϴ� ��Ʈ�ѷ��� ���ν�û������ ��������
            end;
            //Insert
            dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,FindField('CP_PERMIT').AsString,'N',aEmApprove);
          end;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := EmployeeGradeChange_CardPermitCompanyGroupToEmployeeCode(aEmSeq,aCompanyCode,inttostr(strtoint(aDeepSeq) + 1),aGradeUpdate);

end;

function TdmDBCardPermit.EmployeeGradeChange_CardPermitEmployeeGroupToEmployeeCode(
  aEmSeq, aEmGroupCode, aDeepSeq: string;aGradeUpdate:Boolean;aEmApprove:string=''): Boolean;
var
  stCurrentEmGroupCode : string;
  stSql : string;
  TempAdoQuery :TADOQuery;
  bContinue : Boolean;
  stPermit : string;
begin
  result := True;
  if aDeepSeq = '0' then stCurrentEmGroupCode := '0'
  else
  begin
    if Length(aEmGroupCode) < (G_nEmployeeGroupLength * strtoint(aDeepSeq)) then Exit; //���� ���� ���� �������� ���� ������.

    stCurrentEmGroupCode := copy(aEmGroupCode,1,1 + (G_nEmployeeGroupLength * strtoint(aDeepSeq)));
  end;

  stSql := 'Select a.*,b.DO_ATTYPE,b.DO_FDTYPE from TB_CARDPERMITEMPLOYEEGROUP a ';
  stSql := stsql + ' Left Join TB_DOOR b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND a.CP_TYPE = ''1'' ';
  stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.EM_GROUPCODE = ''' + stCurrentEmGroupCode + ''' ';

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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','EmployeeGradeChange_CardPermitEmployeeGroupToEmployeeCode');
        result := False;
        Exit;
      End;
      While Not Eof do
      begin
        bContinue := False;
        if G_bAttendDedicateDoorUse and (FindField('DO_ATTYPE').AsString = '1') then bContinue := True
        else if G_bFoodDedicateDoorUse and (FindField('DO_FDTYPE').AsString = '1') then bContinue := True;

        if Not bContinue then
        begin
          if dmDBFunction.checkTB_CARDPERMITEMPLOYEECODE_Permit(aEmSeq,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,stPermit) = 1 then
          begin
            //�����ϸ� Update
            if aGradeUpdate then
            begin
              if G_nEmployeeAPPROVE = 1 then  //������������� ��� ���̸鼭
              begin
                if aEmApprove = '0'  then //���� ��û�̸�
                   dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue(aEmSeq,FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, '', '', '', 'EM_APPROVE',aEmApprove); //�ش��ϴ� ��Ʈ�ѷ��� ���ν�û������ ��������
              end;
              dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,FindField('CP_PERMIT').AsString,'N',aEmApprove);
            end else
            begin
              if dmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_PermitGrade(aEmSeq,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,FindField('CP_PERMIT').AsString) <> 1 then  //������ Ʋ�� ��쿡�� ������
              begin
                if G_nEmployeeAPPROVE = 1 then  //������������� ��� ���̸鼭
                begin
                  if aEmApprove = '0'  then //���� ��û�̸�
                     dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue(aEmSeq,FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, '', '', '', 'EM_APPROVE',aEmApprove); //�ش��ϴ� ��Ʈ�ѷ��� ���ν�û������ ��������
                end;
                dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,FindField('CP_PERMIT').AsString,'N',aEmApprove);
              end;
            end;
          end else
          begin
            if G_nEmployeeAPPROVE = 1 then  //������������� ��� ���̸鼭
            begin
              if aEmApprove = '0'  then //���� ��û�̸�
                 dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue(aEmSeq,FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, '', '', '', 'EM_APPROVE',aEmApprove); //�ش��ϴ� ��Ʈ�ѷ��� ���ν�û������ ��������
            end;
            //Insert
            dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,FindField('CP_PERMIT').AsString,'N',aEmApprove);
          end;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := EmployeeGradeChange_CardPermitEmployeeGroupToEmployeeCode(aEmSeq,aEmGroupCode,inttostr(strtoint(aDeepSeq) + 1),aGradeUpdate);

end;

function TdmDBCardPermit.EmployeeGradeChange_Process(aEmSeq, aCompanyCode,
  aEmGroupCode, aGradeType: string;aGradeUpdate :Boolean = False;aEmApprove:string=''): Boolean;
begin
  if aGradeType = '3' then Exit; //���� ���� ī�� ���� �� ��쿡�� ó�� ���� ����.
  //if G_nCardDefaultDoorPermitType <> 1 then //��ü������ ������ ���� ���� �ʴ� ��� �ش� �Ҽӿ� ���� ���Թ��� ���� �� �ִ�. �̷� ��� ���� ���� ������ �ȵǹǷ� �ش� ����� ������ ��� ���� �� �� ���� ����.
  //begin
  //  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_PermitStop(aEmSeq,con_ComLogTYPE_DOOR);   //���� ��������� ���� �� �μ� �Ǵ� �׷� ���� ����
  //end;
  //if G_nCardDefaultArmPermitType <> 1 then //��ü������ ������ ���� ���� �ʴ� ��� �ش� �Ҽӿ� ���� ��������� ���� �� �ִ�. �̷� ��� ������� ���� ������ �ȵǹǷ� �ش� ����� ������ ��� ���� �� �� ���� ����.
  //begin
  //  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_PermitStop(aEmSeq,con_ComLogTYPE_ARMAREA);   //���� ��������� ���� �� �μ� �Ǵ� �׷� ���� ����
  //end;
  if aGradeType = '1' then       //ȸ�� �ڵ庰 ���� �� �۾� �ϴ� ���
  begin
    //EmployeeGradeChange_CardPermitCompanyGroupToEmployeeCode(aEmSeq,aCompanyCode,'0',aGradeUpdate,aEmApprove);
    dmDBCardPermit.CompanyGradeToNotEmployeeDelete(aCompanyCode,aEmSeq);   //�Ҽӱ��ѿ��� ���� ������ѿ��� �ִ°�� ���� ��������.
    //dmDBCardPermit.CompanyGradeToEmployeeCopyEqualUpdate(aCompanyCode,aEmSeq);  //�ش� ȸ���ڵ��� ���� �κи� ������Ʈ ����.
    if aEmSeq = '' then dmDBCardPermit.CompanyGradeToEmployeeCopyEqualUpdate_II(aCompanyCode,aEmSeq)  //�ش� ȸ���ڵ��� ���� �κи� ������Ʈ ����.
    else dmDBCardPermit.CompanyGradeToEmployeeCopyEqualUpdate_III(aCompanyCode,aEmSeq);
    dmDBCardPermit.CompanyGradeToEmployeeCopyEqualAdd(aCompanyCode,aEmSeq);
  end else if aGradeType = '2' then
  begin
    //EmployeeGradeChange_CardPermitEmployeeGroupToEmployeeCode(aEmSeq,aEmGroupCode,'0',aGradeUpdate,aEmApprove);
    dmDBCardPermit.EmGroupGradeToNotEmployeeDelete(aEmGroupCode,aEmSeq);
    //dmDBCardPermit.EmGroupGradeToEmployeeCopyEqualUpdate(aEmGroupCode,aEmSeq);
    if aEmSeq = '' then  dmDBCardPermit.EmGroupGradeToEmployeeCopyEqualUpdate_II(aEmGroupCode,aEmSeq)
    else dmDBCardPermit.EmGroupGradeToEmployeeCopyEqualUpdate_III(aEmGroupCode,aEmSeq);
    dmDBCardPermit.EmGroupGradeToEmployeeCopyEqualAdd(aEmGroupCode,aEmSeq);
  end;
end;

function TdmDBCardPermit.EmployeePermitAllDelete(aEmSeq: string): Boolean;
begin
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_PermitStop(aEmSeq,'1');   //���Թ� ������ ��ü ����
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_PermitStop(aEmSeq,'2');   //������� ������ ��ü ����
end;

function TdmDBCardPermit.EmployeePermitToCardDeviceLoad(aNodeNo, aEcuID,
  aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stOldCardNo : string;
  stNodeNo : string;
  nIndex : integer;
  bNodeSetting : Boolean;
  stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8 : string;
  stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8:string;
begin

  result := True;
  stSql := ' Select ';
  stSql := stSql + ' a.EM_SEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.CP_TYPE,f.EM_STATE,';
  stSql := stSql + ' a.CP_NUMBER,a.CP_PERMIT,b.CA_CARDNO,b.CA_STATECODE,b.CA_POSITIONNUM, ';
  stSql := stSql + ' c.EM_CODE,c.EM_NAME,c.CO_COMPANYCODE,c.EM_ACUSE,c.EM_ATUSE,c.EM_FDUSE,';
  stSql := stSql + ' e.EM_TIMECODEUSE,e.TC_GROUP,e.TC_TIME1,e.TC_TIME2,e.TC_TIME3,e.TC_TIME4,e.TC_WEEKCODE,c.EM_REGDATE,c.EM_ENDDATE ';
  stSql := stSql + ' from TB_CARDPERMITEMPLOYEECODE a ';
  stSql := stSql + ' INNER Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = c.EM_SEQ) ';
  stSql := stSql + ' Inner Join TB_DEVICE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID  ';
  stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEEDEVICETIMECODE e ';
  stSql := stSql + ' ON(a.EM_SEQ = e.EM_SEQ ';
  stSql := stSql + ' AND a.ND_NODENO = e.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = e.DE_ECUID ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEESTATECODE f ';
  stSql := stSql + ' ON(c.EM_STATECODE = f.EM_STATECODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' Order by b.CA_CARDNO';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;

      stOldCardNo := '';
      stPermit := '0';
      stDoor1:= '0';
      stDoor2:= '0';
      stDoor3:= '0';
      stDoor4:= '0';
      stDoor5:= '0';
      stDoor6:= '0';
      stDoor7:= '0';
      stDoor8:= '0';
      stArmArea0:= '0';
      stArmArea1:= '0';
      stArmArea2:= '0';
      stArmArea3:= '0';
      stArmArea4:= '0';
      stArmArea5:= '0';
      stArmArea6:= '0';
      stArmArea7:= '0';
      stArmArea8:= '0';



      First;
      bNodeSetting := True;
      while Not Eof do
      begin
        stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
        if stOldCardNo <> '' then  //ī���ȣ�� ���� �� ���
        begin
          if stOldCardNo <> FindField('CA_CARDNO').AsString then
          begin
            //���⿡�� TB_CARDPERMIT ���̺��� �μ�Ʈ ����.
            if dmDBFunction.CheckTB_CARDPERMIT_DeviceCardNo(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',stOldCardNo) = 1 then
            begin
              dmDBUpdate.UpdateTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',stOldCardNo,
                         stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                         stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8);
            end else
            begin
              dmDBInsert.InsertIntoTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',stOldCardNo,
                         stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                         stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8);
            end;
            stOldCardNo := FindField('CA_CARDNO').AsString;
            stPermit := '0';
            stDoor1:= '0';
            stDoor2:= '0';
            stDoor3:= '0';
            stDoor4:= '0';
            stDoor5:= '0';
            stDoor6:= '0';
            stDoor7:= '0';
            stDoor8:= '0';
            stArmArea0:= '0';
            stArmArea1:= '0';
            stArmArea2:= '0';
            stArmArea3:= '0';
            stArmArea4:= '0';
            stArmArea5:= '0';
            stArmArea6:= '0';
            stArmArea7:= '0';
            stArmArea8:= '0';
            bNodeSetting := True;
          end;
        end;
        if FindField('CP_TYPE').AsString = '1' then //�� Ÿ��
        begin
          if FindField('CP_NUMBER').AsString = '1' then  stDoor1:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '2' then  stDoor2:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '3' then  stDoor3:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '4' then  stDoor4:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '5' then  stDoor5:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '6' then  stDoor6:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '7' then  stDoor7:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '8' then  stDoor8:= FindField('CP_PERMIT').AsString;
          if FindField('CP_PERMIT').AsString ='1' then stPermit := '1';
          bNodeSetting := False;
        end else if FindField('CP_TYPE').AsString = '2' then   //�������
        begin
          if FindField('CP_NUMBER').AsString = '0' then  stArmArea0:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '1' then  stArmArea1:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '2' then  stArmArea2:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '3' then  stArmArea3:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '4' then  stArmArea4:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '5' then  stArmArea5:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '6' then  stArmArea6:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '7' then  stArmArea7:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '8' then  stArmArea8:= FindField('CP_PERMIT').AsString;
          if FindField('CP_PERMIT').AsString ='1' then stPermit := '1';
          bNodeSetting := False;
        end;
        stOldCardNo := FindField('CA_CARDNO').AsString;
        Application.ProcessMessages;
        Next;
      end;
      if Not bNodeSetting then    //������ ���� ���Ѱ� ������ ���� ����.
      begin
        if dmDBFunction.CheckTB_CARDPERMIT_DeviceCardNo(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString) = 1 then
        begin
          dmDBUpdate.UpdateTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString,
                     stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                     stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8);
        end else
        begin
          dmDBInsert.InsertIntoTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString,
                     stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                     stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8);
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

(*
function TdmDBCardPermit.EmSeqCompanyGradeToEmployeeCopyLikeAdd(aEmSeq,
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE ( ';
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
  stSql := stSql + ' Select ';
  stSql := stSql + '''' + G_stGroupCode + ''',';
  stSql := stSql + ' a.EM_SEQ,';
  stSql := stSql + ' a.ND_NODENO,';
  stSql := stSql + ' a.DE_ECUID,';
  stSql := stSql + ' a.DE_EXTENDID,';
  stSql := stSql + ' a.CP_TYPE,';
  stSql := stSql + ' a.CP_NUMBER,';
  stSql := stSql + ' a.CP_PERMIT,';
  stSql := stSql + ' ''N'', ';
  stSql := stSql + ' ''N'' ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( select a1.GROUP_CODE, a1.EM_SEQ, a1.ND_NODENO, a1.DE_ECUID, a1.DE_EXTENDID, a1.CP_TYPE, a1.CP_NUMBER,a2.CP_PERMIT from ';
  stSql := stSql + ' ( Select ';
  stSql := stSql + ' aa.GROUP_CODE,';
  stSql := stSql + ' aa.EM_SEQ,';
  stSql := stSql + ' bb.ND_NODENO,';
  stSql := stSql + ' bb.DE_ECUID,';
  stSql := stSql + ' bb.DE_EXTENDID,';
  stSql := stSql + ' bb.CP_TYPE,';
  stSql := stSql + ' bb.CP_NUMBER ';
  stSql := stSql + ' From TB_EMPLOYEE aa ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP bb ';
  stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE ) '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE ) '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(aa.CO_COMPANYCODE From 1 for len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE ) ';
  stSql := stSql + ' WHERE aa.EM_GRADETYPE = 1 '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ���� ���ڰ�...
  stSql := stSql + ' AND aa.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
  stSql := stSql + ' AND aa.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' group by aa.GROUP_CODE, aa.EM_SEQ, bb.ND_NODENO, bb.DE_ECUID, bb.DE_EXTENDID, bb.CP_TYPE, bb.CP_NUMBER ) a1 ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP a2 ';
  stSql := stSql + ' on(a1.group_code = a2.group_code ';
  stSql := stSql + ' and a1.ND_NODENO = a2.ND_NODENO ';
  stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
  stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
  stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
  stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ) ';
  stSql := stSql + ' where a2.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' ) A ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEECODE B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = A.GROUP_CODE ';
  stSql := stSql + ' AND B.ND_NODENO = A.ND_NODENO ';
  stSql := stSql + ' AND B.DE_ECUID = A.DE_ECUID  ';
  stSql := stSql + ' AND B.DE_EXTENDID = A.DE_EXTENDID  ';
  stSql := stSql + ' AND B.CP_TYPE = A.CP_TYPE  ';
  stSql := stSql + ' AND B.CP_NUMBER = A.CP_NUMBER  ';
  stSql := stSql + ' AND B.EM_SEQ = A.EM_SEQ )  ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;
*)
(*
function TdmDBCardPermit.EmSeqCompanyGradeToEmployeeCopyLikeUpdate(aEmSeq,
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update A Set ';
  stSql := stSql + ' a.CP_PERMIT = b.CP_PERMIT ,';
  stSql := stSql + ' a.CP_APPLY = ''N'', ';
  stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
  stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
  stSql := stSql + ' (select a1.EM_SEQ, ';   //a1 start
  stSql := stSql + ' a1.EM_GRADETYPE, ';
  stSql := stSql + ' a1.ND_NODENO, ';
  stSql := stSql + ' a1.DE_ECUID, ';
  stSql := stSql + ' a1.DE_EXTENDID, ';
  stSql := stSql + ' a1.CP_TYPE, ';
  stSql := stSql + ' a1.CP_NUMBER, ';
  stSql := stSql + ' a2.CP_PERMIT ';
  stSql := stSql + ' From ';
  stSql := stSql + ' ( select ';
  stSql := stSql + ' aa.EM_SEQ,';
  stSql := stSql + ' aa.EM_GRADETYPE,';
  stSql := stSql + ' bb.ND_NODENO,';
  stSql := stSql + ' bb.DE_ECUID,';
  stSql := stSql + ' bb.DE_EXTENDID,';
  stSql := stSql + ' bb.CP_TYPE,';
  stSql := stSql + ' bb.CP_NUMBER ';
  stSql := stSql + ' From TB_EMPLOYEE aa ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP bb ';
  stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(aa.CO_COMPANYCODE From 1 for len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  ';
  stSql := stSql + ' AND aa.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
  stSql := stSql + ' AND aa.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND aa.EM_GRADETYPE = 1 ) ';
  stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP a2 ';
  stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
  stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
  stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
  stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
  stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
  stSql := stSql + ' and a2.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) ';
  stSql := stSql + ' ) B ';
  stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE ';
  stSql := stSql + ' AND a.CP_NUMBER = b.CP_NUMBER ';
  stSql := stSql + ' AND a.CP_PERMIT <> b.CP_PERMIT ';


  result := dmDataBase.ProcessExecSQL(stSql);
end;
*)

function TdmDBCardPermit.EmSeqEmGroupGradeToEmployeeCopyLikeAdd(aEmSeq,
  aEmGroupCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE ( ';
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
  stSql := stSql + ' Select ';
  stSql := stSql + '''' + G_stGroupCode + ''',';
  stSql := stSql + ' a.EM_SEQ,';
  stSql := stSql + ' a.ND_NODENO,';
  stSql := stSql + ' a.DE_ECUID,';
  stSql := stSql + ' a.DE_EXTENDID,';
  stSql := stSql + ' a.CP_TYPE,';
  stSql := stSql + ' a.CP_NUMBER,';
  stSql := stSql + ' a.CP_PERMIT,';
  stSql := stSql + ' ''N'', ';
  stSql := stSql + ' ''N'' ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( select a1.GROUP_CODE, a1.EM_SEQ, a1.ND_NODENO, a1.DE_ECUID, a1.DE_EXTENDID, a1.CP_TYPE, a1.CP_NUMBER,a2.CP_PERMIT from ';
  stSql := stSql + ' ( Select ';
  stSql := stSql + ' aa.GROUP_CODE,';
  stSql := stSql + ' aa.EM_SEQ,';
  stSql := stSql + ' bb.ND_NODENO,';
  stSql := stSql + ' bb.DE_ECUID,';
  stSql := stSql + ' bb.DE_EXTENDID,';
  stSql := stSql + ' bb.CP_TYPE,';
  stSql := stSql + ' bb.CP_NUMBER ';
  stSql := stSql + ' From TB_EMPLOYEE aa ';
  stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
  stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE ) '
  else if G_nDBType = PostGresql then
    stSql := stSql + ' AND substr(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE ) '
  else if G_nDBType = FireBird then
    stSql := stSql + ' AND substring(aa.EM_GROUPCODE From 1 for len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE ) ';
  stSql := stSql + ' WHERE aa.EM_GRADETYPE = 2 '; //���� Ÿ���� ����׷��ڵ� Ÿ���� ��츸 ADD���ڰ�...
  stSql := stSql + ' AND aa.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' ';
  stSql := stSql + ' AND aa.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' group by aa.GROUP_CODE, aa.EM_SEQ, bb.ND_NODENO, bb.DE_ECUID, bb.DE_EXTENDID, bb.CP_TYPE, bb.CP_NUMBER ) a1 ';
  stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP a2 ';
  stSql := stSql + ' on(a1.group_code = a2.group_code ';
  stSql := stSql + ' and a1.ND_NODENO = a2.ND_NODENO ';
  stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
  stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
  stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
  stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ) ';
  stSql := stSql + ' where a2.EM_GROUPCODE = ''' + aEmGroupCode + ''' ';
  stSql := stSql + ' ) A ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEECODE B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = A.GROUP_CODE ';
  stSql := stSql + ' AND B.ND_NODENO = A.ND_NODENO ';
  stSql := stSql + ' AND B.DE_ECUID = A.DE_ECUID  ';
  stSql := stSql + ' AND B.DE_EXTENDID = A.DE_EXTENDID  ';
  stSql := stSql + ' AND B.CP_TYPE = A.CP_TYPE  ';
  stSql := stSql + ' AND B.CP_NUMBER = A.CP_NUMBER   ';
  stSql := stSql + ' AND B.EM_SEQ = A.EM_SEQ )  ';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.EmSeqEmGroupGradeToEmployeeCopyLikeUpdate(aEmSeq,
  aEmGroupCode: string): Boolean;
var
  stSql : string;
begin
//  if G_nDBType = MSSQL then
//  begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = b.CP_PERMIT ,';
    stSql := stSql + ' a.CP_APPLY = ''N'', ';
    stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' (select a1.EM_SEQ, ';
    stSql := stSql + ' a1.EM_GRADETYPE, ';
    stSql := stSql + ' a1.ND_NODENO, ';
    stSql := stSql + ' a1.DE_ECUID, ';
    stSql := stSql + ' a1.DE_EXTENDID, ';
    stSql := stSql + ' a1.CP_TYPE, ';
    stSql := stSql + ' a1.CP_NUMBER, ';
    stSql := stSql + ' a2.CP_PERMIT ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' aa.EM_GRADETYPE,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER ';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  '
    else if G_nDBType = PostGresql then
      stSql := stSql + ' AND substr(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  '
    else if G_nDBType = FireBird then
      stSql := stSql + ' AND substring(aa.EM_GROUPCODE From 1 for len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  ';
    //stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_SEQ = ' + aEmSeq + ' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 2 ) ';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.EM_GROUPCODE = ''' + aEmGroupCode + ''')  ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE ';
    stSql := stSql + ' AND a.CP_NUMBER = b.CP_NUMBER ';
    stSql := stSql + ' AND a.CP_PERMIT <> b.CP_PERMIT ';
(*
  end else if G_nDBType = POSTGRESQL then
  begin
   stSql := ' Update TB_CARDPERMITEMPLOYEECODE Set ';
    stSql := stSql + ' TB_CARDPERMITEMPLOYEECODE.CP_PERMIT = ';
    stSql := stSql + ' (select a2.CP_PERMIT ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER ';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    stSql := stSql + ' AND substr(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  ';
    //stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 2  )';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE TB_CARDPERMITEMPLOYEECODE.EM_SEQ = B.EM_SEQ '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ ���ڰ�...
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.ND_NODENO = B.ND_NODENO ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.DE_ECUID = B.DE_ECUID ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.DE_EXTENDID = B.DE_EXTENDID ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.CP_TYPE = B.CP_TYPE ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.CP_NUMBER = B.CP_NUMBER ),';
    stSql := stSql + ' TB_CARDPERMITEMPLOYEECODE.CP_APPLY = ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' ''N'' ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER ';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    //stSql := stSql + ' AND substring(aa.CO_COMPANYCODE,1,len(bb.CO_COMPANYCODE)) = bb.CO_COMPANYCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 2  )';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE TB_CARDPERMITEMPLOYEECODE.EM_SEQ = B.EM_SEQ '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ ���ڰ�...
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.ND_NODENO = B.ND_NODENO ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.DE_ECUID = B.DE_ECUID ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.DE_EXTENDID = B.DE_EXTENDID ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.CP_TYPE = B.CP_TYPE ';
    stSql := stSql + ' AND TB_CARDPERMITEMPLOYEECODE.CP_NUMBER = B.CP_NUMBER ),';
  end else if G_nDBType = FireBird then
  begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = b.CP_PERMIT ,';
    stSql := stSql + ' a.CP_APPLY = ''N'' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' (select a1.EM_SEQ, ';
    stSql := stSql + ' a1.EM_GRADETYPE, ';
    stSql := stSql + ' a1.ND_NODENO, ';
    stSql := stSql + ' a1.DE_ECUID, ';
    stSql := stSql + ' a1.DE_EXTENDID, ';
    stSql := stSql + ' a1.CP_TYPE, ';
    stSql := stSql + ' a1.CP_NUMBER, ';
    stSql := stSql + ' a2.CP_PERMIT ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( select ';
    stSql := stSql + ' aa.EM_SEQ,';
    stSql := stSql + ' aa.EM_GRADETYPE,';
    stSql := stSql + ' bb.ND_NODENO,';
    stSql := stSql + ' bb.DE_ECUID,';
    stSql := stSql + ' bb.DE_EXTENDID,';
    stSql := stSql + ' bb.CP_TYPE,';
    stSql := stSql + ' bb.CP_NUMBER ';
    stSql := stSql + ' From TB_EMPLOYEE aa ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP bb ';
    stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  '
    else if G_nDBType = PostGresql then
      stSql := stSql + ' AND substr(aa.EM_GROUPCODE,1,len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  '
    else if G_nDBType = FireBird then
      stSql := stSql + ' AND substring(aa.EM_GROUPCODE From 1 for len(bb.EM_GROUPCODE)) = bb.EM_GROUPCODE  ';
    //stSql := stSql + ' AND aa.EM_GROUPCODE = bb.EM_GROUPCODE  ';
    stSql := stSql + ' AND aa.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' '; //���� Ÿ���� ȸ���ڵ� Ÿ���� ��츸 ������Ʈ���ڰ�...
    stSql := stSql + ' AND aa.EM_GRADETYPE = 2 ) ';
    stSql := stSql + ' group by aa.EM_SEQ,aa.EM_GRADETYPE,bb.ND_NODENO,bb.DE_ECUID,bb.DE_EXTENDID,bb.CP_TYPE,bb.CP_NUMBER ) a1 ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP a2 ';
    stSql := stSql + ' on(a1.ND_NODENO = a2.ND_NODENO ';
    stSql := stSql + ' and a1.DE_ECUID = a2.DE_ECUID ';
    stSql := stSql + ' and a1.DE_EXTENDID = a2.DE_EXTENDID ';
    stSql := stSql + ' and a1.CP_TYPE = a2.CP_TYPE ';
    stSql := stSql + ' and a1.CP_NUMBER = a2.CP_NUMBER ';
    stSql := stSql + ' and a2.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE ';
    stSql := stSql + ' AND a.CP_NUMBER = b.CP_NUMBER ';
    stSql := stSql + ' AND a.CP_PERMIT <> b.CP_PERMIT ';

  end;    *)


  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.ReSendEmSeqCardNo(aEmSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update A set A.CP_RCVACK = ''N'' ';
  stSql := stSql + ' From TB_CARDPERMIT A,';
  stSql := stSql + ' (select * from TB_CARD where EM_SEQ = ' + aEmSeq + ') B' ;
  stSql := stsql + ' Where A.CA_CARDNO = B.CA_CARDNO ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCardPermit.TB_CARDPERMIT_PermitDELETE(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CARDPERMIT set CP_PERMIT = ''0'',CP_RCVACK = ''N'' ';
  stSql := stSql + ' Where  CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

end.