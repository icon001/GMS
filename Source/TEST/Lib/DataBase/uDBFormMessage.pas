unit uDBFormMessage;

interface

uses
  System.SysUtils, System.Classes,Winapi.ActiveX,Data.Win.ADODB,DB;

type
  TdmFormMessage = class(TDataModule)
  private
    { Private declarations }
    Function GetTableFormMessageVersion:integer;
    function MessageTable_0001_VersionMake:Boolean;
    function MessageTable_0002_VersionMake:Boolean;
    function MessageTable_0003_VersionMake:Boolean;
    function MessageTable_0004_VersionMake:Boolean;
    function MessageTable_0005_VersionMake:Boolean;
  public
    { Public declarations }
    Function FormMessageVersionCheck:Boolean;

    function GetMessage(aCode:string):string;
  end;

var
  dmFormMessage: TdmFormMessage;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  uCommonVariable,
  uDataBase,
  uDBInsert,
  uDBUpdate;

{$R *.dfm}

{ TdmFormMessage }

function TdmFormMessage.FormMessageVersionCheck: Boolean;
var
  nTableVersion : integer;
begin
  result := False;
  nTableVersion := GetTableFormMessageVersion;
  if nTableVersion < 1 then MessageTable_0001_VersionMake;
  if nTableVersion < 2 then MessageTable_0002_VersionMake;
  if nTableVersion < 3 then MessageTable_0003_VersionMake;
  if nTableVersion < 4 then MessageTable_0004_VersionMake;
  if nTableVersion < 5 then MessageTable_0005_VersionMake;

  result := True;
end;

function TdmFormMessage.GetMessage(aCode: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select FM_MESSAGENAME' + inttostr(G_nFormLanguageType) + ' as MESSAGE from TB_FORMMESSAGE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FM_MESSAGECODE = ''' + aCode + ''' ';

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
      result := FindField('MESSAGE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmFormMessage.GetTableFormMessageVersion: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''FORMMESSAGE_VER'' ';
  with dmDataBase.ADOTempQuery do
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
    Try
      result := strtoint(FindField('CO_CONFIGVALUE').AsString);
    Except
      Exit;
    End;
  end;
end;

function TdmFormMessage.MessageTable_0001_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','FORMMESSAGE_VER','1','�޽������̺� ����');

  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('BLANKFIELD','$WORK �����Ͱ� ��� �ֽ��ϴ�.','$WORK Data is Empty');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('CARDGRADEDELETE','ī�� ������ ��� ���� �˴ϴ�.��� �Ͻðڽ��ϱ�?','Do You Want Access privileges Delete?');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('CARDDUP','�ش� ī�带 ���($EMCODE) �̸�($NAME)���� ������Դϴ�. ī�带 ���� �Ͻðڽ��ϱ�?','$EMCODE - $NAME Card Use. Card Change?');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('DATATYPEFAIL','������ Ÿ���� Ʋ���ϴ�.','Data Type Fail!');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('DBDATADUP','�����Ͱ� �ߺ����� �����մϴ�.','Data Duplication');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('DBSAVEERROR','������ $WORK ����.','Data $WORK Error');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('EMCODEDUP','�ش� ������� �̸�($NAME)���� ������Դϴ�. ��� ���� �Ͻðڽ��ϱ�?','The employee number is busy. Do you want to continue?');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('EMCODEDUPSYSTEM','�ش� ����� ����/�ļ� �ý��ۿ��� ������Դϴ�. ������ �о� �鿩 �۾��Ͻðڽ��ϱ�?','Do you want to read the information work?');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('FINGERCARDCHANGE','���($EMCODE) �̸�($NAME) ����ī�庯������ ���������� �����۾��� �����ϼ���.','$EMCODE - $NAME Finger Card ReSend!');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('LOGINMESSAGE','�α��� ����!!! �۾� ��ư�� Ŭ�� �Ͽ� �ش� �۾��� ���� �ϼ���.','Login Success!!!');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('LOGOUTMESSAGE','START ��ư�� Ŭ���Ͽ� �α��� �� �۾��ϼ���','Please Login to Work!');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('NAMEERROR','$NAME��(��) �ùٸ��� �ʽ��ϴ�.','$NAME Error');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('NODEDELETEMESSAGE','�ش� ��带 ���� �Ͻø� �������̻����˴ϴ�. ���� ���� �Ͻðڽ��ϱ�?','Do You Realy Delete?');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('NOTSELECTDATA','$WORK �����͸� ���� �ϼ���.','Select the $WORK data!!');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('PASSWORDCHECKERROR','��й�ȣ üũ ����.','Password Check Error!');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('SAVINGMESSAGE','�����͸� �������Դϴ�.','To store the data.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('SELECTERROR','$WORK �����͸� ���� �ϼ���.','Do not select $WORK data!');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('WORKCOUNTINFO','$COUNT���� $WORK��(��) �����Ͻðڽ��ϱ�?','Do you want to $WORK?');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('WORKMESSAGE','$WORK��(��) �����Ͻðڽ��ϱ�?','Do you want to $WORK?');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('EMPPOSIUSE','�����ڵ带 ����ϴ� ��������� ���� �մϴ�.','Jobtitle to use the code, there are employee information');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('FINGERSENSOR','�����Է¼����� �հ����� ��ʽÿ�.','Your finger on the sensor');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('CLICKPICTURE','Ŭ���Ͽ� �������.','Click the Add Picture');

end;

function TdmFormMessage.MessageTable_0002_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('CLIPDATACOPY','$DATA�� ClipBoard�� ���� �Ǿ����ϴ�.','$DATA�� ClipBoard�� ���� �Ǿ����ϴ�.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('SERVERDISCONNECT','������ ��ſ����� ���� �����ϴ�.','������ ��ſ����� ���� �����ϴ�.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('SENDFAIL','���۽���','���۽���');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('SELECTDEVICENOTDOOR','���� ���õ� ��Ⱑ ���Թ��� �ƴմϴ�.','���� ���õ� ��Ⱑ ���Թ��� �ƴմϴ�.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('SERVERDISCONNECTWORK','������ ��ſ����� ���������ϴ�. $WORK�� ����� ����� ���¿����� ���� �����մϴ�.','������ ��ſ����� ���������ϴ�. $WORK�� ����� ����� ���¿����� ���� �����մϴ�.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('DBCONNECTFAIL','�����ͺ��̽� ���� ����.�����ͺ��̽����� ȯ�漳���� �ٽ� �ϼ���.','DataBase Connected Fail.');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMMESSAGE_VER','CO_CONFIGVALUE','2');
end;

function TdmFormMessage.MessageTable_0003_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('INCORRECTAUTHKEY','����Ű���� Ʋ���ϴ�.','Authentication key is invalid.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('EXPIRAUTHKEY','����Ű�� ��ȿ�Ⱓ�� ����Ǿ����ϴ�.','Authentication key has expired');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('WORKEXCUTE','$WORK �۾��� �����մϴ�.','Start $WORK');
//  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('SERVERDISCONNECT','������ ��ſ����� ���������ϴ�.','������ ��ſ����� ���������ϴ�.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('SAVEFAIL','���� ����','Failed to save');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('NOTSAVEWORK','�������� ���� �۾��� �ֽ��ϴ�.����Ͻðڽ��ϱ�?','There is a work that has not been saved. Do you want to continue?');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('FINGERSAVESUCCESS','�����Է¼���.��Ϲ�ư���� �����ϼ���.','Succeeded fingerprint.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('FINGERREADEROPENFAIL','������ϱ� ���� ����.','Failed to fingerprint open');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('CARDTAGREADER','ī�带 ���������� �±��Ͽ� �ּ���.','Please Touch the fingerprint.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('CARDREADFAILED','ī���б� ����.','Failed to read card.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('FINGERSAVEFAILED','�����Է½���. �ٽ� �õ��ϼ���.','Failed fingerprint.Please try again.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('CARDGROUPCHANGE','���õ� ����� ī������� �׷�������� �����Ͻðڽ��ϱ�?','Do you want to change the permissions of the group rights of the card of the selected employee?');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('CARDGROUPCHANGEGRADE','�׷���� ����� ���� ������ ��� �ٲ� �� �ֽ��ϴ�. �׷��� �׷�������� �����Ͻðڽ��ϱ�?','This permission can be changed at all to change the current group permissions. Do you want to change the group permission yet?');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('NOTSELECTARMAREA','��������� ������ �ּž� �մϴ�.','You will need to select the security area.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('COMPANYEXISTEMPLOYEE','�ش� �Ҽ��� ��������� �����մϴ�. ��������� �Ҽ��� ���� �� �۾� �Ͻñ� �ٶ��ϴ�.','Information of employees that belong there. Please working after you have changed the affiliation of employee information.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('PARENTCOMPNYGRADE','���� �Ҽ��ڵ��� ������ �°� �����ø� ���� ���� ������ ���� �˴ϴ�. ��� �Ͻðڽ��ϱ�?','Once you have received the inheritance rights of top affiliation code, formal current information will be deleted. Do you want to continue? ');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('NOTSELECTDOOR','���Թ��� ������ �ּž� �մϴ�.','You will need to select the Door. ');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('PARENTGROUPGRADE','���� �׷��ڵ��� ������ �°� �����ø� ���� ���� ������ ���� �˴ϴ�. ��� �Ͻðڽ��ϱ�?','Once you have received the inheritance rights of the parent group code, formal current information will be deleted. Do you want to continue? ');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('NOTSELECTEMPLOYEE','����� ���� �ϼž� �մϴ�.','Please select employees');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('TRYAGAINFINGER','�ٽ� �ѹ� �հ����� ��ʽÿ�.','I will rely on the finger again.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('EMPLOYEEIMAGE','��� �̹��� ã��.','Image search of employees');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('NOTACCESSPERMIT','���ԺҰ�','NOT ACCESS PERMIT');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('ACCESSPERMIT','���԰���','ACCESS PERMIT');
//  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('DATACOPY','$DATA�� ClipBoard�� ���� �Ǿ����ϴ�.','$DATA has been copied to ClipBoard');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('CHILDTIME','���������� �ϰ� �����Ͻðڽ��ϱ�?','Do you collectively apply to sub belong?');


  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMMESSAGE_VER','CO_CONFIGVALUE','3');
end;

function TdmFormMessage.MessageTable_0004_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('WORKFAIL','$WORK ����','Failed $WORK','$WORK ����');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('WORKSUCCESS','$WORK ����','Success $WORK','$WORK ����');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMMESSAGE_VER','CO_CONFIGVALUE','4');
end;

function TdmFormMessage.MessageTable_0005_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('DEVICEUNUSED','��Ʈ�ѷ� �̻��� ���ýý����� �ش� ��Ʈ�ѷ��� ������ ��� �����˴ϴ�.','��Ʈ�ѷ� �̻��� ���ýý����� �ش� ��Ʈ�ѷ��� ������ ��� �����˴ϴ�.','��Ʈ�ѷ� �̻��� ���ýý����� �ش� ��Ʈ�ѷ��� ������ ��� �����˴ϴ�.');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('PARENTGRADECOPY','�����ڵ��� ������ �����Ͻðڽ��ϱ�?','�����ڵ��� ������ �����Ͻðڽ��ϱ�?','�����ڵ��� ������ �����Ͻðڽ��ϱ�?');
  dmDBInsert.InsertIntoTB_FORMMESSAGE_All('DEVICELOADING','������� �ε���...','������� �ε���...','������� �ε���...');


  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMMESSAGE_VER','CO_CONFIGVALUE','5');
end;

end.