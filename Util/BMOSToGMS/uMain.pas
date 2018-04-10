unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, AdvProgr,Data.Win.ADODB,ActiveX;

type
  TfmMain = class(TForm)
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ed_MIAMSIP: TEdit;
    ed_MIAMSPort: TEdit;
    ed_MIAMSUserID: TEdit;
    ed_MIAMSUserPW: TEdit;
    btn_DataBaseConnect: TButton;
    btn_Convert: TButton;
    Progress: TAdvProgress;
    Label10: TLabel;
    ed_MIAMSDBName: TEdit;
    lb_Message: TLabel;
    lb_count: TLabel;
    procedure btn_DataBaseConnectClick(Sender: TObject);
    procedure btn_ConvertClick(Sender: TObject);
  private
    procedure ChangeTB_CARDPERMITCOMPANYGROUP_All;
    procedure ChangeTB_CARDPERMITCOMPANYGROUP_CompanyCode(aCompanyCode:string);
    procedure ChangeTB_CARDPERMITCOMPANYGROUP_CompanyCodeToCompanyCode(aOrgCompanyCode,aNewCompanyCode:string);

    procedure ChangeServerIP;
    procedure ChangeTB_CARDPERMITEMPLOYEEGROUP_All;
    procedure ChangeTB_CARDPERMITEMPLOYEEGROUP_EmGroupCode(aEmGroupCode:string);
    procedure ChangeTB_CARDPERMITEMPLOYEEGROUP_EmGroupCodeToEmGroupCode(aOrgCode,aNewCode:string);

    procedure DeleteTB_ARMAREA_NotUsed;
    procedure DeleteTB_BUILDINGCODE_NotUsed;
    procedure DeleteTB_CARDPERMIT_NotUsed;
    procedure DeleteTB_CARDPERMITCOMPANYGROUP_NotUsed;
    procedure DeleteTB_CARDPERMITEMPLOYEECODE_NotUsed;
    procedure DeleteTB_CARDPERMITEMPLOYEEGROUP_NotUsed;
    procedure DeleteTB_COMPANYCODE_NotUsed;
    procedure DeleteTB_DEVICE_NotUsed;
    procedure DeleteTB_DOOR_NotUsed;
    procedure DeleteTB_EMPLOYEE_NotUsed;
    procedure DeleteTB_EMPLOYEEGROUPCODE_NotUsed;
    procedure DeleteTB_READER_NotUsed;
    procedure DeleteTB_READERRCV_NotUsed;
    procedure DeleteTB_ZONE_NotUsed;
    procedure DeleteTB_ZONERCV_NotUsed;
    procedure DeleteTB_ZONEEXTENTION_NotUsed;
    procedure DeleteTB_ZONEEXTENTIONRCV_NotUsed;

    procedure UpdateTB_CONFIG_TableVersion;
    procedure UpdateTB_DECODER_ServerIP(aDecoderNo,aServerIP:string);
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation
uses
  uMIAMSDataBase,
  uKTAMSDataBase,
  uCommonFunction,
  uCommonVariable;
{$R *.dfm}

procedure TfmMain.btn_ConvertClick(Sender: TObject);
begin
  btn_Convert.Enabled := False;
  ChangeTB_CARDPERMITCOMPANYGROUP_All;
  ChangeTB_CARDPERMITEMPLOYEEGROUP_All;

  DeleteTB_ARMAREA_NotUsed;
  DeleteTB_BUILDINGCODE_NotUsed;
  DeleteTB_CARDPERMIT_NotUsed;
  DeleteTB_CARDPERMITCOMPANYGROUP_NotUsed;
  DeleteTB_CARDPERMITEMPLOYEECODE_NotUsed;
  DeleteTB_CARDPERMITEMPLOYEEGROUP_NotUsed;
  DeleteTB_COMPANYCODE_NotUsed;
  DeleteTB_DEVICE_NotUsed;
  DeleteTB_EMPLOYEE_NotUsed;
  DeleteTB_EMPLOYEEGROUPCODE_NotUsed;
  DeleteTB_READER_NotUsed;
  DeleteTB_READERRCV_NotUsed;
  DeleteTB_ZONE_NotUsed;
  DeleteTB_ZONERCV_NotUsed;
  DeleteTB_ZONEEXTENTION_NotUsed;
  DeleteTB_ZONEEXTENTIONRCV_NotUsed;

  UpdateTB_CONFIG_TableVersion;
  ChangeServerIP;
  btn_Convert.Enabled := True;
  showmessage('��ȯ�Ϸ�');
end;

procedure TfmMain.btn_DataBaseConnectClick(Sender: TObject);
var
  stDataBaseIP : string;
  stSql : string;
begin
  btn_DataBaseConnect.Enabled := True;
  btn_Convert.Enabled := False;

  dmMIAMSDataBase.DataBaseDisConnect;
  dmMIAMSDataBase.DataBaseConnect(MSSQL,ed_MIAMSIP.Text,ed_MIAMSPort.Text,ed_MIAMSUserID.Text,ed_MIAMSUserPW.Text,ed_MIAMSDBName.Text,False);
  if Not dmMIAMSDataBase.DBConnected then
  begin
    showmessage('GMS �����ͺ��̽� ȯ�漳���� Ȯ���� �ּ���.');
    Exit;
  end;
  btn_DataBaseConnect.Enabled := False;
  btn_Convert.Enabled := True;
  //btn_passwordchange.Enabled := True;
end;

procedure TfmMain.ChangeServerIP;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  lb_Message.Caption := 'ChangeServerIP';
  stSql := ' Select CO_CONFIGVALUE from TB_CONFIG where CO_CONFIGGROUP = ''DAEMON'' AND CO_CONFIGCODE = ''SERVERIP'' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmMIAMSDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      UpdateTB_DECODER_ServerIP('1',FindField('CO_CONFIGVALUE').AsString);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.ChangeTB_CARDPERMITCOMPANYGROUP_All;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  lb_Message.Caption := 'TB_CARDPERMITCOMPANYGROUP Change';
  stSql := ' Select CO_COMPANYCODE from TB_COMPANYCODE where CO_CODEUSE = ''1'' Order by CO_COMPANYCODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmMIAMSDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := RecordCount;
      Progress.Position := 0;
      while Not Eof do
      begin
        ChangeTB_CARDPERMITCOMPANYGROUP_CompanyCode(FindField('CO_COMPANYCODE').AsString);
        lb_count.Caption := FindField('CO_COMPANYCODE').AsString + ':Changed';
        Progress.Position := Progress.Position + 1;
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

procedure TfmMain.ChangeTB_CARDPERMITCOMPANYGROUP_CompanyCode(
  aCompanyCode: string);
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  stSql := ' Select CO_COMPANYCODE from TB_COMPANYCODE where CO_CODEUSE = ''1''  and CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmMIAMSDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      while Not Eof do
      begin
        ChangeTB_CARDPERMITCOMPANYGROUP_CompanyCodeToCompanyCode(aCompanyCode,FindField('CO_COMPANYCODE').AsString);
        lb_count.Caption := aCompanyCode + '->' + FindField('CO_COMPANYCODE').AsString + ':Changed';
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

procedure TfmMain.ChangeTB_CARDPERMITCOMPANYGROUP_CompanyCodeToCompanyCode(
  aOrgCompanyCode, aNewCompanyCode: string);
var
  stSql : string;
  nDeepSeq : integer;
begin
  nDeepSeq := Length(aNewCompanyCode) div 3;
  stSql := ' Insert Into TB_CARDPERMITCOMPANYGROUP( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  stSql := stSql + 'CO_DEEPSEQ, ';
  stSql := stSql + 'CP_APPLY) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' AA.GROUP_CODE,';
  stSql := stSql + ' ''' + aNewCompanyCode + ''',';
  stSql := stSql + ' AA.ND_NODENO,';
  stSql := stSql + ' AA.DE_ECUID,';
  stSql := stSql + ' AA.DE_EXTENDID,';
  stSql := stSql + ' AA.CP_TYPE,';    //���Թ�Ÿ�� 1 ������� Ÿ�� 2
  stSql := stSql + ' AA.CP_NUMBER,';
  stSql := stSql + ' AA.CP_PERMIT,';    //���Ա��� �ο�
  stSql := stSql + ' ' + inttostr(nDeepSeq) + ', ';
  stSql := stSql + '''Y'' ';    //���� �ο� ó�� ����
  stSql := stSql + ' From (select * from TB_CARDPERMITCOMPANYGROUP where CO_COMPANYCODE = ''' + aOrgCompanyCode + ''')  AA';
  stSql := stSql + ' Where AA.GROUP_CODE = ''1234567890'' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITCOMPANYGROUP BB ';
  stSql := stSql + ' WHERE BB.GROUP_CODE = AA.GROUP_CODE ';
  stSql := stSql + ' AND BB.CO_COMPANYCODE = ''' + aNewCompanyCode + ''' ';
  stSql := stSql + ' AND BB.ND_NODENO = AA.ND_NODENO' ;
  stSql := stSql + ' AND BB.DE_ECUID = AA.DE_ECUID  ';
  stSql := stSql + ' AND BB.CP_TYPE = AA.CP_TYPE ';
  stSql := stSql + ' AND BB.CP_NUMBER = AA.CP_NUMBER)   ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

end;

procedure TfmMain.ChangeTB_CARDPERMITEMPLOYEEGROUP_All;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  lb_Message.Caption := 'TB_CARDPERMITEMPLOYEEGROUP Change';

  stSql := ' Select EM_GROUPCODE from TB_EMPLOYEEGROUPCODE where EM_CODEUSE = ''1'' Order by EM_GROUPCODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmMIAMSDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := RecordCount;
      Progress.Position := 0;
      while Not Eof do
      begin
        ChangeTB_CARDPERMITEMPLOYEEGROUP_EmGroupCode(FindField('EM_GROUPCODE').AsString);
        lb_count.Caption := FindField('EM_GROUPCODE').AsString + ':Changed';
        Progress.Position := Progress.Position + 1;
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

procedure TfmMain.ChangeTB_CARDPERMITEMPLOYEEGROUP_EmGroupCode(
  aEmGroupCode: string);
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  stSql := ' Select EM_GROUPCODE from TB_EMPLOYEEGROUPCODE where EM_CODEUSE = ''1''  and EM_GROUPCODE Like ''' + aEmGroupCode + '%'' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmMIAMSDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      while Not Eof do
      begin
        ChangeTB_CARDPERMITEMPLOYEEGROUP_EmGroupCodeToEmGroupCode(aEmGroupCode,FindField('EM_GROUPCODE').AsString);
        lb_count.Caption := aEmGroupCode + '->' + FindField('EM_GROUPCODE').AsString + ':Changed';
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

procedure TfmMain.ChangeTB_CARDPERMITEMPLOYEEGROUP_EmGroupCodeToEmGroupCode(
  aOrgCode, aNewCode: string);
var
  stSql : string;
  nDeepSeq : integer;
begin
  nDeepSeq := Length(aNewCode) div 3;
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEEGROUP( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_GROUPCODE,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  stSql := stSql + 'EM_DEEPSEQ, ';
  stSql := stSql + 'CP_APPLY) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' AA.GROUP_CODE,';
  stSql := stSql + ' ''' + aNewCode + ''',';
  stSql := stSql + ' AA.ND_NODENO,';
  stSql := stSql + ' AA.DE_ECUID,';
  stSql := stSql + ' AA.DE_EXTENDID,';
  stSql := stSql + ' AA.CP_TYPE,';    //���Թ�Ÿ�� 1 ������� Ÿ�� 2
  stSql := stSql + ' AA.CP_NUMBER,';
  stSql := stSql + ' AA.CP_PERMIT,';    //���Ա��� �ο�
  stSql := stSql + ' ' + inttostr(nDeepSeq) + ', ';
  stSql := stSql + '''Y'' ';    //���� �ο� ó�� ����
  stSql := stSql + ' From (select * from TB_CARDPERMITEMPLOYEEGROUP where EM_GROUPCODE = ''' + aOrgCode + ''')  AA';
  stSql := stSql + ' Where AA.GROUP_CODE = ''1234567890'' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEEGROUP BB ';
  stSql := stSql + ' WHERE BB.GROUP_CODE = AA.GROUP_CODE ';
  stSql := stSql + ' AND BB.EM_GROUPCODE = ''' + aNewCode + ''' ';
  stSql := stSql + ' AND BB.ND_NODENO = AA.ND_NODENO' ;
  stSql := stSql + ' AND BB.DE_ECUID = AA.DE_ECUID  ';
  stSql := stSql + ' AND BB.CP_TYPE = AA.CP_TYPE ';
  stSql := stSql + ' AND BB.CP_NUMBER = AA.CP_NUMBER)   ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_ARMAREA_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_ARMAREA Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_ARMAREA where DE_EXTENDID <> 0 ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_BUILDINGCODE_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_BUILDINGCODE Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_BUILDINGCODE where BC_CODEUSE <> ''1'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_CARDPERMITCOMPANYGROUP_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_CARDPERMITCOMPANYGROUP Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_CARDPERMITCOMPANYGROUP where CP_PERMIT = ''0'' and CP_APPLY = ''Y'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_CARDPERMITEMPLOYEECODE_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_CARDPERMITEMPLOYEECODE Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_CARDPERMITEMPLOYEECODE where CP_PERMIT = ''0'' and CP_APPLY = ''Y'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_CARDPERMITEMPLOYEEGROUP_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_CARDPERMITEMPLOYEEGROUP Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_CARDPERMITEMPLOYEEGROUP where CP_PERMIT = ''0'' and CP_APPLY = ''Y'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_CARDPERMIT_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_CARDPERMIT Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_CARDPERMIT where CP_PERMIT = ''0'' and CP_RCVACK = ''Y'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_COMPANYCODE_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_COMPANYCODE Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_COMPANYCODE where CO_CODEUSE = ''0'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_DEVICE_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_DEVICE Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_DEVICE where DE_DEVICEUSE = ''0'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

  stSql := ' Delete From TB_DEVICERCV where DE_EXTENDID <> 0 ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

  stSql := ' Delete From TB_DEVICERCV where DE_ECUID <> ''00'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

end;

procedure TfmMain.DeleteTB_DOOR_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_DOOR Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_DOOR where DO_DOORUSE = ''0'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

  stSql := ' Delete From TB_DOORRCV where DE_EXTENDID <> 0 ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

  stSql := ' Delete From TB_DOORRCV where DE_ECUID <> ''00'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

end;

procedure TfmMain.DeleteTB_EMPLOYEEGROUPCODE_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_EMPLOYEEGROUPCODE Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_EMPLOYEEGROUPCODE where EM_CODEUSE = ''0'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_EMPLOYEE_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_EMPLOYEE Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_EMPLOYEE where EM_ACUSE = ''0'' AND EM_ATUSE = ''0'' AND EM_FDUSE = ''0'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

end;

procedure TfmMain.DeleteTB_READERRCV_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_READERRCV Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_READERRCV where DE_EXTENDID <> 0 ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

  stSql := ' Delete From TB_READERRCV where DE_ECUID <> ''00'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_READER_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_READER Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_READER where DE_EXTENDID <> 0 ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

  stSql := ' Delete From TB_READER where DE_ECUID <> ''00'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_ZONEEXTENTIONRCV_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_ZONEEXTENTIONRCV Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_ZONEEXTENTIONRCV where DE_ECUID <> ''00'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_ZONEEXTENTION_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_ZONEEXTENTION Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_ZONEEXTENTION where DE_ECUID <> ''00'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_ZONERCV_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_ZONERCV Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_ZONERCV where DE_EXTENDID <> 0 ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

  stSql := ' Delete From TB_ZONERCV where DE_ECUID <> ''00'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_ZONE_NotUsed;
var
  stSql : string;
begin
  lb_Message.Caption := 'TB_ZONE Delete';
  Application.ProcessMessages;

  stSql := ' Delete From TB_ZONE where DE_EXTENDID <> 0 ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

  stSql := ' Delete From TB_ZONE where DE_ECUID <> ''00'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

end;


procedure TfmMain.UpdateTB_CONFIG_TableVersion;
var
  stSql : string;
begin
  stSql := ' Update TB_CONFIG set CO_CONFIGVALUE = ''1'' where CO_CONFIGGROUP = ''COMMON'' and CO_CONFIGCODE = ''TABLE_VER'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

  stSql := ' Update TB_CONFIG set CO_CONFIGVALUE = ''0'' where CO_CONFIGGROUP = ''COMMON'' and CO_CONFIGCODE = ''FORMNAME_VER'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

  stSql := ' Update TB_CONFIG set CO_CONFIGVALUE = ''2'' where CO_CONFIGGROUP = ''REPORT'' and CO_CONFIGCODE = ''SEARCHTYPE'' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);
end;

procedure TfmMain.UpdateTB_DECODER_ServerIP(aDecoderNo, aServerIP: string);
var
  stSql : string;
begin
  stSql := ' Update TB_DECODER set ND_DECODERIP = ''' + aServerIP + ''' where ND_DECODERNO = ' + aDecoderNo + ' ';

  dmMIAMSDataBase.ProcessExecSQL(stSql);

end;

end.