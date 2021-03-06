unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, AdvProgr,Data.Win.ADODB,ActiveX;

type
  TfmMain = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ed_KTAMSPort: TEdit;
    ed_KTAMSUserID: TEdit;
    ed_KTAMSUserPW: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ed_MIAMSIP: TEdit;
    ed_MIAMSPort: TEdit;
    ed_MIAMSUserID: TEdit;
    ed_MIAMSUserPW: TEdit;
    cmb_KTAMSServerIP: TComboBox;
    btn_DataBaseConnect: TButton;
    btn_Convert: TButton;
    Progress: TAdvProgress;
    Label9: TLabel;
    ed_KTAMSDBName: TEdit;
    Label10: TLabel;
    ed_MIAMSDBName: TEdit;
    lb_Message: TLabel;
    lb_count: TLabel;
    chk_Add: TCheckBox;
    ed_Date: TEdit;
    procedure btn_DataBaseConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_ConvertClick(Sender: TObject);
    procedure btn_PasswordchangeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cmb_KTAMSServerIPChange(Sender: TObject);
  private
    L_stHeadQuartersCode : string;
    AddDeviceIDList : TStringList;
    { Private declarations }
    function ConvertTB_Card(aCode:string) : Boolean;
    function ConvertTB_Card_Add(aCode:string) : Boolean;
    function ConvertTB_Device(aCode:string) : Boolean;
    function ConvertTB_DEVICE_ADD(aCode,aDeviceID:string) :integer;
    function ConvertTB_device_cardno(aCode:string) : Boolean;
    function ConvertTB_device_cardno_Add(aCode,aDeviceID:string):Boolean;
    function ConvertTB_device_passno(aCode:string) : Boolean;
    function ConvertTB_device_telno(aCode:string) : Boolean;
    function ConvertTB_List_Card:Boolean;
    function ConvertTB_Local_Code(aCode:string) : Boolean;
    function CreateTB_BuildingCode(aCode,aName,aDeepSeq:string;aViewSeq:string='1') : Boolean;
    function CreateTB_COMPANYCode(aCode,aName,aDeepSeq:string;aViewSeq:string='1') : Boolean;
  private
    function GetTB_SLOCAL_Code(aCode,aLocalCode,aSLocalCode:string):string;
    function GetTB_SLOCAL_Code_Building(aCode,aLocalCode,aSLocalCode:string):string;
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
var
  stheadQuartersName : string;
  i : integer;
begin

  stheadQuartersName := cmb_KTAMSServerIP.Text;
  stheadQuartersName := FindCharCopy(stheadQuartersName,1,'(');
  stheadQuartersName := FindCharCopy(stheadQuartersName,0,')');
  L_stHeadQuartersCode := '0' + FillZeroNumber(cmb_KTAMSServerIP.ItemIndex,3);
  btn_Convert.enabled := False;
  if Not chk_Add.Checked then
  begin
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('ATTEND','USE','0');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARD','CARDREGISTFORM','0');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARD','DEFAULTARMPERMITTYPE','2'); //전체권한없음
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARD','DEFAULTDOORPERMITTYPE','2');  //전체권한없음
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARD','EMPLOYEESEARCH','2');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARD','FPTYPE','1');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARDDELETE','APPLYTYPE','1');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARDDELETE','DAYTERM','90');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARDDELETE','DELETETYPE','2');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','ATAUTO','0');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','FDAUTO','0');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','CARDBUTTONSTAT','1');  //출입버튼 통계 생성
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','MAXDOORCOUNT','1');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','PGTYPE','1');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','PROTOCOL','1');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','ACEVENT','0');//전체이력
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('DAEMON','PACKETTYPE','0'); //0.KTT
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('DAEMON','USEARMLEN','FALSE');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('DATABASE','AC_DELETE','720');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('DATABASE','AT_DELETE','720');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('DATABASE','FD_DELETE','720');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('DATABASE','PT_DELETE','720');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('FIRE','USEFIREOPEN','0');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('FOOD','USE','0');
    dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('REPORT','SEARCHTYPE','2');

    dmMIAMSDataBase.UpdateMiamsTB_ALARMEVENTSTATEPCCODE_Sound('000LT000','1');

    dmMIAMSDataBase.UpdateMiamsTB_FORMNAME_Name('0','COMMONDOORNAME','분기국사');
    dmMIAMSDataBase.UpdateMiamsTB_FORMNAME_Name('0','COMMONNODEIP01','분기국사IP');

    dmMIAMSDataBase.UpdateMiamsTB_CARDGUBUN_Value('1','분기국사카드');
    dmMIAMSDataBase.InsertIntoMiamsTB_CARDGUBUN_Value('2','사원증');
    dmMIAMSDataBase.InsertIntoMiamsTB_CARDGUBUN_Value('3','일반카드');

    dmKTAMSDataBase.UpdateTB_SLOCAL_BUILDINGCode('','');
    dmKTAMSDataBase.UpdateTB_SLOCAL_CompanyCode('','');
    dmMIAMSDataBase.UpdateMiamsTB_COMPANYCODE_Name('0','KT');
    ConvertTB_List_Card;
       //CreateTB_COMPANYCode('0001','KT','1');
    CreateTB_COMPANYCode(L_stHeadQuartersCode,stheadQuartersName,'1');
       //CreateTB_BuildingCode('0001','KT','1');
    CreateTB_BuildingCode(L_stHeadQuartersCode,stheadQuartersName,'1');

    ConvertTB_Local_Code(L_stHeadQuartersCode);
    ConvertTB_Device(L_stHeadQuartersCode);
    ConvertTB_Card(L_stHeadQuartersCode);
    ConvertTB_device_telno(L_stHeadQuartersCode);

    ConvertTB_device_passno(L_stHeadQuartersCode);

    //권한
    ConvertTB_device_cardno(L_stHeadQuartersCode);
  end else
  begin
    AddDeviceIDList.Clear;
    ConvertTB_Card_Add(L_stHeadQuartersCode);
    if AddDeviceIDList.Count > 0 then
    begin
      for i := 0 to AddDeviceIDList.Count - 1  do
        ConvertTB_device_cardno_Add(L_stHeadQuartersCode,AddDeviceIDList.Strings[i]);
    end;
  end;

  btn_Convert.enabled := False;
  btn_DataBaseConnect.Enabled := True;
end;

procedure TfmMain.btn_DataBaseConnectClick(Sender: TObject);
var
  stDataBaseIP : string;
  stSql : string;
begin
  btn_DataBaseConnect.Enabled := True;
  btn_Convert.Enabled := False;
  stDataBaseIP := cmb_KTAMSServerIP.Text;
  stDataBaseIP := FindCharCopy(stDataBaseIP,0,'(');

  dmKTAMSDataBase.DataBaseDisConnect;
  dmKTAMSDataBase.DataBaseConnect(MSSQL,stDataBaseIP,ed_KTAMSPort.Text,ed_KTAMSUserID.Text,ed_KTAMSUserPW.Text,ed_KTAMSDBName.Text,False);
  if Not dmKTAMSDataBase.DBConnected then
  begin
    showmessage('KTAMS 데이터베이스 환경설정을 확인해 주세요.');
    Exit;
  end;
  stSql := 'ALTER TABLE tb_device_cardno ADD RELAY char(1) ';
  dmKTAMSDataBase.ProcessExecSQL(stSql);

  dmMIAMSDataBase.DataBaseDisConnect;
  dmMIAMSDataBase.DataBaseConnect(MSSQL,ed_MIAMSIP.Text,ed_MIAMSPort.Text,ed_MIAMSUserID.Text,ed_MIAMSUserPW.Text,ed_MIAMSDBName.Text,False);
  if Not dmMIAMSDataBase.DBConnected then
  begin
    showmessage('MIAMS 데이터베이스 환경설정을 확인해 주세요.');
    Exit;
  end;
  btn_DataBaseConnect.Enabled := False;
  btn_Convert.Enabled := True;
  //btn_passwordchange.Enabled := True;
end;

procedure TfmMain.btn_PasswordchangeClick(Sender: TObject);
begin
  ConvertTB_device_passno(L_stHeadQuartersCode);
  btn_DataBaseConnect.Enabled := True;
end;

procedure TfmMain.Button1Click(Sender: TObject);
var
  stheadQuartersName : string;
begin
  stheadQuartersName := cmb_KTAMSServerIP.Text;
  stheadQuartersName := FindCharCopy(stheadQuartersName,1,'(');
  stheadQuartersName := FindCharCopy(stheadQuartersName,0,')');
  L_stHeadQuartersCode := '0' + FillZeroNumber(cmb_KTAMSServerIP.ItemIndex,3);
  btn_Convert.enabled := False;

  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('ATTEND','USE','0');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARD','CARDREGISTFORM','0');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARD','DEFAULTARMPERMITTYPE','2'); //전체권한없음
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARD','DEFAULTDOORPERMITTYPE','2');  //전체권한없음
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARD','EMPLOYEESEARCH','2');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARD','FPTYPE','1');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARDDELETE','APPLYTYPE','1');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARDDELETE','DAYTERM','90');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('CARDDELETE','DELETETYPE','2');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','ATAUTO','0');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','FDAUTO','0');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','CARDBUTTONSTAT','1');  //출입버튼 통계 생성
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','MAXDOORCOUNT','1');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','PGTYPE','1');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','PROTOCOL','1');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('COMMON','ACEVENT','0');//전체이력
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('DAEMON','PACKETTYPE','0'); //0.KTT
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('DAEMON','USEARMLEN','FALSE');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('DATABASE','AC_DELETE','720');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('DATABASE','AT_DELETE','720');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('DATABASE','FD_DELETE','720');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('DATABASE','PT_DELETE','720');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('FIRE','USEFIREOPEN','0');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('FOOD','USE','0');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value('REPORT','SEARCHTYPE','2');

  dmMIAMSDataBase.UpdateMiamsTB_ALARMEVENTSTATEPCCODE_Sound('000LT000','1');

  dmMIAMSDataBase.UpdateMiamsTB_FORMNAME_Name('0','COMMONDOORNAME','분기국사');
  dmMIAMSDataBase.UpdateMiamsTB_FORMNAME_Name('0','COMMONNODEIP01','분기국사IP');

  dmMIAMSDataBase.UpdateMiamsTB_CARDGUBUN_Value('1','분기국사카드');
  dmMIAMSDataBase.InsertIntoMiamsTB_CARDGUBUN_Value('2','사원증');
  dmMIAMSDataBase.InsertIntoMiamsTB_CARDGUBUN_Value('3','일반카드');

  dmKTAMSDataBase.UpdateTB_SLOCAL_BUILDINGCode('','');
  dmKTAMSDataBase.UpdateTB_SLOCAL_CompanyCode('','');
  dmMIAMSDataBase.UpdateMiamsTB_COMPANYCODE_Name('0','KT');
//  ConvertTB_List_Card;
     //CreateTB_COMPANYCode('0001','KT','1');
  CreateTB_COMPANYCode(L_stHeadQuartersCode,stheadQuartersName,'1');
     //CreateTB_BuildingCode('0001','KT','1');
  CreateTB_BuildingCode(L_stHeadQuartersCode,stheadQuartersName,'1');
  ConvertTB_Local_Code(L_stHeadQuartersCode);
  ConvertTB_Device(L_stHeadQuartersCode);
//  ConvertTB_Card(L_stHeadQuartersCode);


  //권한
//  ConvertTB_device_cardno(L_stHeadQuartersCode);
//  ConvertTB_device_telno(L_stHeadQuartersCode);

//  ConvertTB_device_passno(L_stHeadQuartersCode);

  btn_Convert.enabled := True;
  btn_DataBaseConnect.Enabled := True;
end;

procedure TfmMain.cmb_KTAMSServerIPChange(Sender: TObject);
begin
  if cmb_KTAMSServerIP.itemIndex = 5 then    //부산본부
  begin
    ed_KTAMSUserID.Text := 'ktams';
    ed_KTAMSUserPW.Text := 'ktamspass';
  end else if cmb_KTAMSServerIP.itemIndex = 6 then    //전남본부
  begin
    ed_KTAMSUserID.Text := 'sa';
    ed_KTAMSUserPW.Text := 'sapasswd123@@';
  end else    //전남본부
  begin
    ed_KTAMSUserID.Text := 'ktams';
    ed_KTAMSUserPW.Text := 'ktpass';
  end;
  btn_DataBaseConnect.Enabled := True;
  btn_Convert.Enabled := False;

end;

function TfmMain.ConvertTB_Card(aCode:string): Boolean;
var
  TempKTAMSAdoQuery : TAdoQuery;
  stSql : string;
  stCompanyCode : string;
  nEmSeq : integer;
  stEmCode : string;
  stRegDate : string;
  stValidDate : string;
  stCardNo : string;
  nPositionNum : integer;
begin
  lb_Message.Caption := 'TB_Card Converting...';
  stSql := 'Select * from tb_cardno ';
  Try
    CoInitialize(nil);
    TempKTAMSAdoQuery := TADOQuery.Create(nil);
    TempKTAMSAdoQuery.Connection := dmKTAMSDataBase.ADOConnection;
    TempKTAMSAdoQuery.DisableControls;

    with TempKTAMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        stCompanyCode := GetTB_SLOCAL_Code(aCode,FindField('LOCAL_CODE').AsString,FindField('SLOCAL_CODE').AsString);
        stCardNo := FindField('CARDNO').AsString;
        stCardNo := dmMIAMSDataBase.ConvertCardnoDigitTo16Byte(stCardNo);

        if (stCardNo <> '') and (dmMIAMSDataBase.CheckTB_CARD(stCardNo,nEmSeq) <> 1) then
        begin
          nEmSeq := dmMIAMSDataBase.GetTB_EMPLOYEE_NextEmSeq;
          stEmCode := dmMIAMSDataBase.GetTB_EMPLOYEE_NextEmCode;
          stRegDate := FormatDateTime('yyyymmdd',now); // FindField('REG_DAY').AsString;
          stRegDate := stringReplace(stRegDate,'-','',[rfReplaceAll]);
          stRegDate := stringReplace(stRegDate,':','',[rfReplaceAll]);
          stRegDate := stringReplace(stRegDate,' ','',[rfReplaceAll]);
          stRegDate := stringReplace(stRegDate,'.','',[rfReplaceAll]);
          stRegDate := copy(stRegDate,1,8);
          if Not isDate(stRegDate) then stRegDate := FormatDateTime('yyyymmdd',now);
          stValidDate := FindField('VALIDDAY').AsString;
          stValidDate := stringReplace(stValidDate,'-','',[rfReplaceAll]);
          stValidDate := stringReplace(stValidDate,':','',[rfReplaceAll]);
          stValidDate := stringReplace(stValidDate,' ','',[rfReplaceAll]);
          stValidDate := stringReplace(stValidDate,'.','',[rfReplaceAll]);
          stValidDate := copy(stValidDate,1,8);
          if Not isDate(stValidDate) then stValidDate := '99991231';
          nPositionNum := dmMIAMSDataBase.GetTB_CARD_NextPositionNum;
          dmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEE_Value(inttostr(nEmSeq), stEmCode,
                          FindField('USER_NAME').AsString, stCompanyCode, '0', '0',FindField('TEL2').AsString,'',
                          FindField('TEL1').AsString, FindField('DEPART_NAME').AsString, stRegDate, stValidDate, '1', '1', '1',
                          '0', '3', '0', '1', '1');
          dmMIAMSDataBase.InsertIntoMiamsTB_CARD_Value(stCardNo,'1','1',inttostr(nPositionNum),inttostr(nPositionNum),'0',inttostr(nEmSeq),FindField('PRINTNO').AsString);
        end;

        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempKTAMSAdoQuery.EnableControls;
    TempKTAMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_LIST_Card Convert Success';
end;

function TfmMain.ConvertTB_Card_Add(aCode: string): Boolean;
var
  TempKTAMSAdoQuery : TAdoQuery;
  stSql : string;
  stCompanyCode : string;
  nEmSeq : integer;
  stEmCode : string;
  stRegDate : string;
  stValidDate : string;
  stCardNo : string;
  nPositionNum : integer;
  stDateTime : string;
  stDeviceID : string;
  stEcuID : string;
  stServerNo : string;
  stPermit : string;
  stEmSeq : string;
  nNodeNo : integer;
  stTempSql : string;
begin
  (*stDateTime := ed_Date.Text;
  stDateTime := stringReplace(stDateTime,'-','',[rfReplaceAll]);
  if Length(stDateTime) <> 8 then
  begin
    showmessage('날짜가 유효하지 않습니다.');
    Exit;
  end;
  stDateTime := copy(stDateTime,1,4) + '-' + copy(stDateTime,5,2) + '-' + copy(stDateTime,7,2) + ' 00:00:00.000';
  *)
  lb_Message.Caption := 'TB_Card Converting...';
  stSql := 'Select a.*,b.DEVICE_ID,b.PERMIT from tb_cardno a ';
  stSql := stSql + ' Left Join tb_device_cardno b ';
  stSql := stsql + ' ON(a.CARDNO = b.CARD_NO) ';
  stSql := stSql + ' Where b.RELAY is null or b.RELAY = '''' ';
  Try
    CoInitialize(nil);
    TempKTAMSAdoQuery := TADOQuery.Create(nil);
    TempKTAMSAdoQuery.Connection := dmKTAMSDataBase.ADOConnection;
    TempKTAMSAdoQuery.DisableControls;

    with TempKTAMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        stCompanyCode := GetTB_SLOCAL_Code(aCode,FindField('LOCAL_CODE').AsString,FindField('SLOCAL_CODE').AsString);
        stCardNo := FindField('CARDNO').AsString;
        stCardNo := dmMIAMSDataBase.ConvertCardnoDigitTo16Byte(stCardNo);

        if (stCardNo <> '') and (dmMIAMSDataBase.CheckTB_CARD(stCardNo,nEmSeq) <> 1) then
        begin
          nEmSeq := dmMIAMSDataBase.GetTB_EMPLOYEE_NextEmSeq;
          stEmCode := dmMIAMSDataBase.GetTB_EMPLOYEE_NextEmCode;
          stRegDate := FormatDateTime('yyyymmdd',now); // FindField('REG_DAY').AsString;
          stRegDate := stringReplace(stRegDate,'-','',[rfReplaceAll]);
          stRegDate := stringReplace(stRegDate,':','',[rfReplaceAll]);
          stRegDate := stringReplace(stRegDate,' ','',[rfReplaceAll]);
          stRegDate := stringReplace(stRegDate,'.','',[rfReplaceAll]);
          stRegDate := copy(stRegDate,1,8);
          if Not isDate(stRegDate) then stRegDate := FormatDateTime('yyyymmdd',now);
          stValidDate := FindField('VALIDDAY').AsString;
          stValidDate := stringReplace(stValidDate,'-','',[rfReplaceAll]);
          stValidDate := stringReplace(stValidDate,':','',[rfReplaceAll]);
          stValidDate := stringReplace(stValidDate,' ','',[rfReplaceAll]);
          stValidDate := stringReplace(stValidDate,'.','',[rfReplaceAll]);
          stValidDate := copy(stValidDate,1,8);
          if stValidDate < '20161231' then stValidDate := '20161231';

          if Not isDate(stValidDate) then stValidDate := '99991231';
          nPositionNum := dmMIAMSDataBase.GetTB_CARD_NextPositionNum;
          dmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEE_Value(inttostr(nEmSeq), stEmCode,
                          FindField('USER_NAME').AsString, stCompanyCode, '0', '0',FindField('TEL2').AsString,'',
                          FindField('TEL1').AsString, FindField('DEPART_NAME').AsString, stRegDate, stValidDate, '1', '1', '1',
                          '0', '3', '0', '1', '1');

          dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEE_Field_IntValue(inttostr(nEmSeq),'EM_CARDUSE','1');
          dmMIAMSDataBase.InsertIntoMiamsTB_CARD_Value(stCardNo,'1','1',inttostr(nPositionNum),inttostr(nPositionNum),'0',inttostr(nEmSeq),FindField('PRINTNO').AsString);
        end;
        if (stCardNo <> '') then
        begin
          stDeviceID := FindField('DEVICE_ID').AsString;
          stDeviceID := copy(stDeviceID,1,7);
          stEcuID := '00';
          stServerNo := inttostr(cmb_KTAMSServerIP.ItemIndex);

          if (stDeviceID <> '') then
          begin
            nNodeNo := dmMIAMSDataBase.GetTB_NODE_DeviceIDNodeNo(stDeviceID,'');
            if nNodeNo = -1 then
            begin
            //  nNodeNo := ConvertTB_DEVICE_ADD(aCode,stDeviceID);
            end;
            if nNodeNo > 0  then
            begin
              //stCardNo := FindField('CARDNO').AsString;
              //if isDigit(stCardNo) then
              begin
                //stCardNo := dmMIAMSDataBase.ConvertCardnoDigitTo16Byte(stCardNo);
                if Uppercase(FindField('PERMIT').AsString) = 'L' then stPermit := '1'
                else stPermit := '0';

                stEmSeq := dmMIAMSDataBase.GetTB_CARD_EmSeqFromCardNo(stCardNo);

                if nNodeNo > -1 then
                begin
                  if dmMIAMSDataBase.CheckTB_CARDPERMIT_Value(inttostr(nNodeNo),'00','0',stCardNo) <> 1 then
                  begin
                    dmMIAMSDataBase.InsertIntoMiamsTB_CARDPERMIT_VALUE(inttostr(nNodeNo),'00','0',stCardNo,stPermit,'1','1','1','1','1','1','1','1',
                       '1','1','1','1','1','1','1','1','1');
                  end else
                  begin
                    dmMIAMSDataBase.UpdateMiamsTB_CARDPERMIT_VALUE(inttostr(nNodeNo),'00','0',stCardNo,stPermit,'1','1','1','1','1','1','1','1',
                       '1','1','1','1','1','1','1','1','1');
                  end;
                  if dmMIAMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),'00','0','1',stEmSeq) <> 1 then
                  begin
                    dmMIAMSDataBase.InsertIntoMiamsTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),'00','0','1','1',stPermit,'Y');
                  end;
                end;
              end;
            end;
            stTempSql := 'Update tb_device_cardno set RELAY = ''Y'' where CARD_NO = ''' + FindField('CARDNO').AsString + ''' and DEVICE_ID = ''' + FindField('DEVICE_ID').AsString + ''' ';
            dmKTAMSDataBase.ProcessExecSQL(stTempSql);
          end;
        end;

        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempKTAMSAdoQuery.EnableControls;
    TempKTAMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_LIST_Card Convert Success';
end;

function TfmMain.ConvertTB_Device(aCode: string): Boolean;
var
  TempKTAMSAdoQuery : TAdoQuery;
  stSql : string;
  stBuildingCode : string;
  stDeviceID : string;
  stEcuID : string;
  stDoorNo : string;
  stArmAreaNo : string;
  stServerNo : string;
  stDeviceType : string;
  nNodeNo : integer;
  nViewDoor : integer;
  nDoorViewSeq : integer;
  nArmAreaViewSeq : integer;
  i,j,k : integer;
begin
  lb_Message.Caption := 'tb_device Converting...';
  stSql := 'Select * from tb_device ';
  Try
    CoInitialize(nil);
    TempKTAMSAdoQuery := TADOQuery.Create(nil);
    TempKTAMSAdoQuery.Connection := dmKTAMSDataBase.ADOConnection;
    TempKTAMSAdoQuery.DisableControls;

    with TempKTAMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;
      nDoorViewSeq := dmMIAMSDataBase.GetTB_DOOR_NextViewSeq;
      nArmAreaViewSeq := dmMIAMSDataBase.GetTB_ArmArea_NextViewSeq;

      while Not Eof do
      begin
        stBuildingCode := GetTB_SLOCAL_Code_Building(aCode,FindField('LOCAL_CODE').AsString,FindField('SLOCAL_CODE').AsString);
        stDeviceID := FindField('DEVICE_ID').AsString;
        stDeviceID := copy(stDeviceID,1,7);
        stEcuID := '00';
        stDoorNo := '1';
        stArmAreaNo := '0';
        nViewDoor := 1;
        stServerNo := inttostr(cmb_KTAMSServerIP.itemindex);
        stDeviceType := '0'; //'0'.Device,'1'.연동장비

        if (stDeviceID <> '') then
        begin
          if (dmMIAMSDataBase.CheckTB_NODE_DeviceID(stDeviceID) <> 1) then
          begin
            nNodeNo := dmMIAMSDataBase.GetTB_NODE_NextNodeNo;
            dmMIAMSDataBase.InsertIntoMiamsTB_NODE_Value(inttostr(nNodeNo),'1',stDeviceID,FindField('DEVICE_IP').AsString,FindField('DEVICE_NAME').AsString,stDeviceType,stServerNo,stBuildingCode,FindField('TELNO').AsString,FindField('ADDR').AsString,FindField('INST_DAY').AsString);
            dmMIAMSDataBase.InsertIntoMiamsTB_NODERCV_NodeNo(inttostr(nNodeNo));
            dmMIAMSDataBase.InsertIntoMiamsTB_DOOR_DeviceDoorInit(inttostr(nNodeNo),stEcuID,'1',FindField('DEVICE_NAME').AsString,stBuildingCode,inttostr(nDoorViewSeq),'1','1' );
            (*
            for j := 1 to 8 do
            begin
              if j <= nViewDoor then
                 dmMIAMSDataBase.InsertIntoMiamsTB_DOOR_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString,stBuildingCode,inttostr(nDoorViewSeq),'1','1' )
              else
                 dmMIAMSDataBase.InsertIntoMiamsTB_DOOR_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString + '_' + inttostr(j),stBuildingCode,inttostr(nDoorViewSeq),'0','0' );
              dmMIAMSDataBase.InsertIntoMiamsTB_DOORRCV_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j));
              Application.ProcessMessages;
            end;
            *)

            for j := 0 to 8 do
            begin
              dmMIAMSDataBase.InsertIntoMiamsTB_ARMAREA_DeviceArmAreaInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString + '_' + inttostr(j),stBuildingCode,inttostr(nArmAreaViewSeq),'0','0' );
              Application.ProcessMessages;
            end;
            //for j := 0 to 8 do
            begin
              j := 0;
              for k := 1 to 8 do
              begin
                dmMIAMSDataBase.InsertIntoMiamsTB_ZONE_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),inttostr(k),FindField('DEVICE_NAME').AsString + '_' + inttostr(k));
                dmMIAMSDataBase.InsertIntoMiamsTB_ZONERCV_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),inttostr(k));
                Application.ProcessMessages;
              end;
              dmMIAMSDataBase.InsertIntoMiamsTB_ZONEEXTENTION_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString + '_' + inttostr(j),'0');
            end;
            for j := 1 to 8 do
            begin
              dmMIAMSDataBase.InsertIntoMiamsTB_READER_ReaderInit(inttostr(nNodeNo),stEcuID,inttostr(j));
              dmMIAMSDataBase.InsertIntoMiamsTB_READERRCV_ReaderInit(inttostr(nNodeNo),stEcuID,inttostr(j));
              Application.ProcessMessages;
            end;

            dmMIAMSDataBase.InsertIntoMiamsTB_DEVICE_DeviceInit(inttostr(nNodeNo),stEcuID,'0',FindField('DEVICE_NAME').AsString,stBuildingCode,'1');
            dmMIAMSDataBase.InsertIntoMiamsTB_DEVICERCV_DeviceInit(inttostr(nNodeNo),stEcuID,'0');

            //타임코드 -> 타임코드기기테이블 복사
            dmMIAMSDataBase.InsertIntoMiamsTB_TIMECODEDEVICE_TimeCodeToDevice(inttostr(nNodeNo),stEcuID,'0');
            dmMIAMSDataBase.copyHoliDayToDevice(inttostr(nNodeNo),stEcuID);

            inc(nDoorViewSeq);
            inc(nArmAreaViewSeq);

          end else
          begin
            if dmMIAMSDataBase.CheckTB_NODE_NodeIP(FindField('DEVICE_IP').AsString) <> 1 then
            begin
              nNodeNo := dmMIAMSDataBase.GetTB_NODE_NextNodeNo;
              dmMIAMSDataBase.InsertIntoMiamsTB_NODE_Value(inttostr(nNodeNo),'1',stDeviceID,FindField('DEVICE_IP').AsString,FindField('DEVICE_NAME').AsString,stDeviceType,stServerNo,stBuildingCode,FindField('TELNO').AsString,FindField('ADDR').AsString,FindField('INST_DAY').AsString);
              dmMIAMSDataBase.InsertIntoMiamsTB_NODERCV_NodeNo(inttostr(nNodeNo));
              for j := 1 to 8 do
              begin

                if j <= nViewDoor then
                begin
                   dmMIAMSDataBase.InsertIntoMiamsTB_DOOR_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString,stBuildingCode,inttostr(nDoorViewSeq),'1','1' );
                //else
                //   dmMIAMSDataBase.InsertIntoMiamsTB_DOOR_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString + '_' + inttostr(j),stBuildingCode,inttostr(nDoorViewSeq),'0','0' );
                  dmMIAMSDataBase.InsertIntoMiamsTB_DOORRCV_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j));
                end;

                Application.ProcessMessages;
              end;

              for j := 0 to 8 do
              begin
                dmMIAMSDataBase.InsertIntoMiamsTB_ARMAREA_DeviceArmAreaInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString + '_' + inttostr(j),stBuildingCode,inttostr(nArmAreaViewSeq),'0','0' );
                Application.ProcessMessages;
              end;
              //for j := 0 to 8 do
              begin
                j := 0;
                for k := 1 to 8 do
                begin
                  dmMIAMSDataBase.InsertIntoMiamsTB_ZONE_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),inttostr(k),FindField('DEVICE_NAME').AsString + '_' + inttostr(j)+ '_' + inttostr(k));
                  dmMIAMSDataBase.InsertIntoMiamsTB_ZONERCV_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),inttostr(k));
                  Application.ProcessMessages;
                end;
                dmMIAMSDataBase.InsertIntoMiamsTB_ZONEEXTENTION_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString + '_' + inttostr(j),'0');
              end;
              for j := 1 to 8 do
              begin
                dmMIAMSDataBase.InsertIntoMiamsTB_READER_ReaderInit(inttostr(nNodeNo),stEcuID,inttostr(j));
                dmMIAMSDataBase.InsertIntoMiamsTB_READERRCV_ReaderInit(inttostr(nNodeNo),stEcuID,inttostr(j));
                Application.ProcessMessages;
              end;

              dmMIAMSDataBase.InsertIntoMiamsTB_DEVICE_DeviceInit(inttostr(nNodeNo),stEcuID,'0',FindField('DEVICE_NAME').AsString,stBuildingCode,'1');
              dmMIAMSDataBase.InsertIntoMiamsTB_DEVICERCV_DeviceInit(inttostr(nNodeNo),stEcuID,'0');

              //타임코드 -> 타임코드기기테이블 복사
              dmMIAMSDataBase.InsertIntoMiamsTB_TIMECODEDEVICE_TimeCodeToDevice(inttostr(nNodeNo),stEcuID,'0');
              dmMIAMSDataBase.copyHoliDayToDevice(inttostr(nNodeNo),stEcuID);

              inc(nDoorViewSeq);
              inc(nArmAreaViewSeq);
            end;
          end;
        end;

        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempKTAMSAdoQuery.EnableControls;
    TempKTAMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'tb_device Convert Success';
end;

function TfmMain.ConvertTB_DEVICE_ADD(aCode, aDeviceID: string): integer;
var
  TempKTAMSAdoQuery : TAdoQuery;
  stSql : string;
  stBuildingCode : string;
  stDeviceID : string;
  stEcuID : string;
  stDoorNo : string;
  stArmAreaNo : string;
  stServerNo : string;
  stDeviceType : string;
  nNodeNo : integer;
  nViewDoor : integer;
  nDoorViewSeq : integer;
  nArmAreaViewSeq : integer;
  i,j,k : integer;
begin
  if AddDeviceIDList.IndexOf(aDeviceID) < 0 then
     AddDeviceIDList.Add(aDeviceID);
  stSql := 'Select * from tb_device where substring(DEVICE_ID,1,7) = ''' + copy(aDeviceID,1,7) + '''';
  Try
    CoInitialize(nil);
    TempKTAMSAdoQuery := TADOQuery.Create(nil);
    TempKTAMSAdoQuery.Connection := dmKTAMSDataBase.ADOConnection;
    TempKTAMSAdoQuery.DisableControls;

    with TempKTAMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      nDoorViewSeq := dmMIAMSDataBase.GetTB_DOOR_NextViewSeq;
      nArmAreaViewSeq := dmMIAMSDataBase.GetTB_ArmArea_NextViewSeq;

      while Not Eof do
      begin
        stBuildingCode := GetTB_SLOCAL_Code_Building(aCode,FindField('LOCAL_CODE').AsString,FindField('SLOCAL_CODE').AsString);
        stDeviceID := FindField('DEVICE_ID').AsString;
        stDeviceID := copy(stDeviceID,1,7);
        stEcuID := '00';
        stDoorNo := '1';
        stArmAreaNo := '0';
        nViewDoor := 1;
        stServerNo := inttostr(cmb_KTAMSServerIP.itemindex);
        stDeviceType := '0'; //'0'.Device,'1'.연동장비

        Try
          if (stDeviceID <> '') then
          begin
            if (dmMIAMSDataBase.CheckTB_NODE_DeviceID(stDeviceID) <> 1) then
            begin
              nNodeNo := dmMIAMSDataBase.GetTB_NODE_NextNodeNo;
              dmMIAMSDataBase.InsertIntoMiamsTB_NODE_Value(inttostr(nNodeNo),'1',stDeviceID,FindField('DEVICE_IP').AsString,FindField('DEVICE_NAME').AsString,stDeviceType,stServerNo,stBuildingCode,FindField('TELNO').AsString,FindField('ADDR').AsString,FindField('INST_DAY').AsString);
              dmMIAMSDataBase.InsertIntoMiamsTB_NODERCV_NodeNo(inttostr(nNodeNo));
              dmMIAMSDataBase.InsertIntoMiamsTB_DOOR_DeviceDoorInit(inttostr(nNodeNo),stEcuID,'1',FindField('DEVICE_NAME').AsString,stBuildingCode,inttostr(nDoorViewSeq),'1','1' );
              (*
              for j := 1 to 8 do
              begin
                if j <= nViewDoor then
                   dmMIAMSDataBase.InsertIntoMiamsTB_DOOR_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString,stBuildingCode,inttostr(nDoorViewSeq),'1','1' )
                else
                   dmMIAMSDataBase.InsertIntoMiamsTB_DOOR_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString + '_' + inttostr(j),stBuildingCode,inttostr(nDoorViewSeq),'0','0' );
                dmMIAMSDataBase.InsertIntoMiamsTB_DOORRCV_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j));
                Application.ProcessMessages;
              end;
              *)

              for j := 0 to 8 do
              begin
                dmMIAMSDataBase.InsertIntoMiamsTB_ARMAREA_DeviceArmAreaInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString + '_' + inttostr(j),stBuildingCode,inttostr(nArmAreaViewSeq),'0','0' );
                Application.ProcessMessages;
              end;
              //for j := 0 to 8 do
              begin
                j := 0;
                for k := 1 to 8 do
                begin
                  dmMIAMSDataBase.InsertIntoMiamsTB_ZONE_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),inttostr(k),FindField('DEVICE_NAME').AsString + '_' + inttostr(k));
                  dmMIAMSDataBase.InsertIntoMiamsTB_ZONERCV_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),inttostr(k));
                  Application.ProcessMessages;
                end;
                dmMIAMSDataBase.InsertIntoMiamsTB_ZONEEXTENTION_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString + '_' + inttostr(j),'0');
              end;
              for j := 1 to 8 do
              begin
                dmMIAMSDataBase.InsertIntoMiamsTB_READER_ReaderInit(inttostr(nNodeNo),stEcuID,inttostr(j));
                dmMIAMSDataBase.InsertIntoMiamsTB_READERRCV_ReaderInit(inttostr(nNodeNo),stEcuID,inttostr(j));
                Application.ProcessMessages;
              end;

              dmMIAMSDataBase.InsertIntoMiamsTB_DEVICE_DeviceInit(inttostr(nNodeNo),stEcuID,'0',FindField('DEVICE_NAME').AsString,stBuildingCode,'1');
              dmMIAMSDataBase.InsertIntoMiamsTB_DEVICERCV_DeviceInit(inttostr(nNodeNo),stEcuID,'0');

              //타임코드 -> 타임코드기기테이블 복사
              dmMIAMSDataBase.InsertIntoMiamsTB_TIMECODEDEVICE_TimeCodeToDevice(inttostr(nNodeNo),stEcuID,'0');
              dmMIAMSDataBase.copyHoliDayToDevice(inttostr(nNodeNo),stEcuID);

              inc(nDoorViewSeq);
              inc(nArmAreaViewSeq);

            end else
            begin
              if dmMIAMSDataBase.CheckTB_NODE_NodeIP(FindField('DEVICE_IP').AsString) <> 1 then
              begin
                nNodeNo := dmMIAMSDataBase.GetTB_NODE_NextNodeNo;
                dmMIAMSDataBase.InsertIntoMiamsTB_NODE_Value(inttostr(nNodeNo),'1',stDeviceID,FindField('DEVICE_IP').AsString,FindField('DEVICE_NAME').AsString,stDeviceType,stServerNo,stBuildingCode,FindField('TELNO').AsString,FindField('ADDR').AsString,FindField('INST_DAY').AsString);
                dmMIAMSDataBase.InsertIntoMiamsTB_NODERCV_NodeNo(inttostr(nNodeNo));
                for j := 1 to 8 do
                begin

                  if j <= nViewDoor then
                  begin
                     dmMIAMSDataBase.InsertIntoMiamsTB_DOOR_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString,stBuildingCode,inttostr(nDoorViewSeq),'1','1' );
                  //else
                  //   dmMIAMSDataBase.InsertIntoMiamsTB_DOOR_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString + '_' + inttostr(j),stBuildingCode,inttostr(nDoorViewSeq),'0','0' );
                    dmMIAMSDataBase.InsertIntoMiamsTB_DOORRCV_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j));
                  end;

                  Application.ProcessMessages;
                end;

                for j := 0 to 8 do
                begin
                  dmMIAMSDataBase.InsertIntoMiamsTB_ARMAREA_DeviceArmAreaInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString + '_' + inttostr(j),stBuildingCode,inttostr(nArmAreaViewSeq),'0','0' );
                  Application.ProcessMessages;
                end;
                //for j := 0 to 8 do
                begin
                  j := 0;
                  for k := 1 to 8 do
                  begin
                    dmMIAMSDataBase.InsertIntoMiamsTB_ZONE_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),inttostr(k),FindField('DEVICE_NAME').AsString + '_' + inttostr(j)+ '_' + inttostr(k));
                    dmMIAMSDataBase.InsertIntoMiamsTB_ZONERCV_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),inttostr(k));
                    Application.ProcessMessages;
                  end;
                  dmMIAMSDataBase.InsertIntoMiamsTB_ZONEEXTENTION_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('DEVICE_NAME').AsString + '_' + inttostr(j),'0');
                end;
                for j := 1 to 8 do
                begin
                  dmMIAMSDataBase.InsertIntoMiamsTB_READER_ReaderInit(inttostr(nNodeNo),stEcuID,inttostr(j));
                  dmMIAMSDataBase.InsertIntoMiamsTB_READERRCV_ReaderInit(inttostr(nNodeNo),stEcuID,inttostr(j));
                  Application.ProcessMessages;
                end;

                dmMIAMSDataBase.InsertIntoMiamsTB_DEVICE_DeviceInit(inttostr(nNodeNo),stEcuID,'0',FindField('DEVICE_NAME').AsString,stBuildingCode,'1');
                dmMIAMSDataBase.InsertIntoMiamsTB_DEVICERCV_DeviceInit(inttostr(nNodeNo),stEcuID,'0');

                //타임코드 -> 타임코드기기테이블 복사
                dmMIAMSDataBase.InsertIntoMiamsTB_TIMECODEDEVICE_TimeCodeToDevice(inttostr(nNodeNo),stEcuID,'0');
                dmMIAMSDataBase.copyHoliDayToDevice(inttostr(nNodeNo),stEcuID);

                inc(nDoorViewSeq);
                inc(nArmAreaViewSeq);
              end;
            end;
          end;
        Except
        //
        End;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempKTAMSAdoQuery.EnableControls;
    TempKTAMSAdoQuery.Free;
    CoUninitialize;
  End;
  result := nNodeNo;
  lb_Message.Caption := 'tb_device Convert Success';
end;

function TfmMain.ConvertTB_device_cardno(aCode: string): Boolean;
var
  TempKTAMSAdoQuery : TAdoQuery;
  stSql : string;
  stDeviceID : string;
  stEcuID : string;
  stServerNo : string;
  stCardNo : string;
  stEmSeq : string;
  stPermit : string;
  nNodeNo : integer;
begin
  lb_Message.Caption := 'tb_device_cardno Converting...';
  stSql := 'Select a.* from tb_device_cardno a ';
  stSql := stSql + ' Inner Join tb_cardno b ';
  stSql := stSql + ' ON(a.CARD_NO = b.CARDNO ) ';

  Try
    CoInitialize(nil);
    TempKTAMSAdoQuery := TADOQuery.Create(nil);
    TempKTAMSAdoQuery.Connection := dmKTAMSDataBase.ADOConnection;
    TempKTAMSAdoQuery.DisableControls;

    with TempKTAMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        stDeviceID := FindField('DEVICE_ID').AsString;
        stDeviceID := copy(stDeviceID,1,7);
        stEcuID := '00';
        stServerNo := inttostr(cmb_KTAMSServerIP.ItemIndex);

        if (stDeviceID <> '') then
        begin
          nNodeNo := dmMIAMSDataBase.GetTB_NODE_DeviceIDNodeNo(stDeviceID,stServerNo);
          stCardNo := FindField('CARD_NO').AsString;
          if isDigit(stCardNo) then
          begin
            stCardNo := dmMIAMSDataBase.ConvertCardnoDigitTo16Byte(stCardNo);
            if Uppercase(FindField('PERMIT').AsString) = 'L' then stPermit := '1'
            else stPermit := '0';

            stEmSeq := dmMIAMSDataBase.GetTB_CARD_EmSeqFromCardNo(stCardNo);

            if nNodeNo > -1 then
            begin
              if dmMIAMSDataBase.CheckTB_CARDPERMIT_Value(inttostr(nNodeNo),'00','0',stCardNo) <> 1 then
              begin
                dmMIAMSDataBase.InsertIntoMiamsTB_CARDPERMIT_VALUE(inttostr(nNodeNo),'00','0',stCardNo,stPermit,'1','1','1','1','1','1','1','1',
                   '1','1','1','1','1','1','1','1','1');
              end;
              if dmMIAMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),'00','0','1',stEmSeq) <> 1 then
              begin
                dmMIAMSDataBase.InsertIntoMiamsTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),'00','0','1','1',stPermit,'Y');
              end;
            end;
          end;
        end;

        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempKTAMSAdoQuery.EnableControls;
    TempKTAMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'tb_device_cardno Convert Success';
end;

function TfmMain.ConvertTB_device_cardno_Add(aCode, aDeviceID: string): Boolean;
var
  TempKTAMSAdoQuery : TAdoQuery;
  stSql : string;
  stDeviceID : string;
  stEcuID : string;
  stServerNo : string;
  stCardNo : string;
  stEmSeq : string;
  stPermit : string;
  nNodeNo : integer;
begin
  lb_Message.Caption := 'tb_device_cardno Converting...';
  stSql := 'Select a.* from tb_device_cardno a ';
  stSql := stSql + ' Inner Join tb_cardno b ';
  stSql := stSql + ' ON(a.CARD_NO = b.CARDNO ) ';
  stSql := stSql + ' Where substring(a.DEVICE_ID,1,7) = ''' + copy(aDeviceID,1,7) + ''' ';

  Try
    CoInitialize(nil);
    TempKTAMSAdoQuery := TADOQuery.Create(nil);
    TempKTAMSAdoQuery.Connection := dmKTAMSDataBase.ADOConnection;
    TempKTAMSAdoQuery.DisableControls;

    with TempKTAMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        stDeviceID := FindField('DEVICE_ID').AsString;
        stDeviceID := copy(stDeviceID,1,7);
        stEcuID := '00';
        stServerNo := inttostr(cmb_KTAMSServerIP.ItemIndex);

        if (stDeviceID <> '') then
        begin
          nNodeNo := dmMIAMSDataBase.GetTB_NODE_DeviceIDNodeNo(stDeviceID,'');
          stCardNo := FindField('CARD_NO').AsString;
          if isDigit(stCardNo) then
          begin
            stCardNo := dmMIAMSDataBase.ConvertCardnoDigitTo16Byte(stCardNo);
            if Uppercase(FindField('PERMIT').AsString) = 'L' then stPermit := '1'
            else stPermit := '0';

            stEmSeq := dmMIAMSDataBase.GetTB_CARD_EmSeqFromCardNo(stCardNo);

            if nNodeNo > -1 then
            begin
              if dmMIAMSDataBase.CheckTB_CARDPERMIT_Value(inttostr(nNodeNo),'00','0',stCardNo) <> 1 then
              begin
                dmMIAMSDataBase.InsertIntoMiamsTB_CARDPERMIT_VALUE(inttostr(nNodeNo),'00','0',stCardNo,stPermit,'1','1','1','1','1','1','1','1',
                   '1','1','1','1','1','1','1','1','1');
              end;
              if dmMIAMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),'00','0','1',stEmSeq) <> 1 then
              begin
                dmMIAMSDataBase.InsertIntoMiamsTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),'00','0','1','1',stPermit,'Y');
              end;
            end;
          end;
        end;

        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempKTAMSAdoQuery.EnableControls;
    TempKTAMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'tb_device_cardno Convert Success';
end;

function TfmMain.ConvertTB_device_passno(aCode: string): Boolean;
var
  TempKTAMSAdoQuery : TAdoQuery;
  stSql : string;
  stServerNo : string;
  nNodeNo : integer;
  stCardNo : string;
begin
  lb_Message.Caption := 'TB_device_passno Converting...';
  stSql := 'Select * from TB_device_passno where PERMIT = ''L'' ';
  Try
    CoInitialize(nil);
    TempKTAMSAdoQuery := TADOQuery.Create(nil);
    TempKTAMSAdoQuery.Connection := dmKTAMSDataBase.ADOConnection;
    TempKTAMSAdoQuery.DisableControls;

    with TempKTAMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      stServerNo := inttostr(cmb_KTAMSServerIP.ItemIndex);

      while Not Eof do
      begin
        nNodeNo := dmMIAMSDataBase.GetTB_NODE_DeviceIDNodeNo(copy(FindField('DEVICE_ID').AsString,1,7),stServerNo);
        if nNodeNo <> -1 then
        begin
          stCardNo := Dec2Hex(strtoint(FindField('PASSNO').AsString),8);
          stCardNo := FillCharString(stCardNo,'*',16);

          if dmMIAMSDataBase.CheckTB_CARDPERMIT_DeviceCardNo(inttostr(nNodeNo),'00','0',stCardNo) = 0 then
          begin
            //입력
            dmMIAMSDataBase.InsertIntoMiamsTB_CARDPERMIT_VALUE(inttostr(nNodeNo), '00', '0',stCardNo,'1','1','1', '1', '1', '1', '1',
            '1','1', '1', '1', '1', '1', '1', '1','1', '1', '1',FindField('PASSNO').AsString,'0');
          end else
          begin
            //업데이트
            dmMIAMSDataBase.UpdateMiamsTB_CARDPERMIT_VALUE(inttostr(nNodeNo), '00', '0',stCardNo,'1','1','1', '1', '1', '1', '1',
            '1','1', '1', '1', '1', '1', '1', '1','1', '1', '1',FindField('PASSNO').AsString,'0');
          end;
        end;
        Progress.Position := Progress.Position + 1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempKTAMSAdoQuery.EnableControls;
    TempKTAMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_device_passno Convert Success';
end;

function TfmMain.ConvertTB_device_telno(aCode: string): Boolean;
var
  TempKTAMSAdoQuery : TAdoQuery;
  stSql : string;
  stServerNo : string;
  nNodeNo : integer;
begin
  lb_Message.Caption := 'TB_device_telno Converting...';
  stSql := 'Select * from TB_device_telno ';
  Try
    CoInitialize(nil);
    TempKTAMSAdoQuery := TADOQuery.Create(nil);
    TempKTAMSAdoQuery.Connection := dmKTAMSDataBase.ADOConnection;
    TempKTAMSAdoQuery.DisableControls;

    with TempKTAMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      stServerNo := inttostr(cmb_KTAMSServerIP.ItemIndex);

      while Not Eof do
      begin
        nNodeNo := dmMIAMSDataBase.GetTB_NODE_DeviceIDNodeNo(copy(FindField('DEVICE_ID').AsString,1,7),stServerNo);
        dmMIAMSDataBase.InsertIntoMiamsTB_READER_TELNO(inttostr(nNodeNo),FindField('MNO').AsString,FindField('TELNO').AsString);
        Progress.Position := Progress.Position + 1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempKTAMSAdoQuery.EnableControls;
    TempKTAMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_device_telno Convert Success';
end;

function TfmMain.ConvertTB_List_Card: Boolean;
var
  TempKTAMSAdoQuery : TAdoQuery;
  stSql : string;
begin
  lb_Message.Caption := 'TB_LIST_Card Converting...';
  stSql := 'Select * from TB_LIST_CARD ';
  Try
    CoInitialize(nil);
    TempKTAMSAdoQuery := TADOQuery.Create(nil);
    TempKTAMSAdoQuery.Connection := dmKTAMSDataBase.ADOConnection;
    TempKTAMSAdoQuery.DisableControls;

    with TempKTAMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        dmMIAMSDataBase.InsertIntoMiamsTB_CARDPRINTLIST(FindField('PRINTNO').AsString,FindField('CARDNO').AsString);
        Progress.Position := Progress.Position + 1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempKTAMSAdoQuery.EnableControls;
    TempKTAMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_LIST_Card Convert Success';
end;

function TfmMain.ConvertTB_Local_Code(aCode:string): Boolean;
var
  TempKTAMSAdoQuery : TAdoQuery;
  stSql : string;
  nViewSeq : integer;
begin
  lb_Message.Caption := 'TB_Local_Code Converting...';
  stSql := 'Select * from tb_local ';
  nViewSeq := 0;
  Try
    CoInitialize(nil);
    TempKTAMSAdoQuery := TADOQuery.Create(nil);
    TempKTAMSAdoQuery.Connection := dmKTAMSDataBase.ADOConnection;
    TempKTAMSAdoQuery.DisableControls;

    with TempKTAMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        inc(nViewSeq);
        if FindField('LOCAL_CODE').AsString <> '000' then
        begin
          CreateTB_BuildingCode(aCode + FindField('LOCAL_CODE').AsString,FindField('LOCAL_NAME').AsString,'2',inttostr(nViewSeq));
          CreateTB_CompanyCode(aCode + FindField('LOCAL_CODE').AsString,FindField('LOCAL_NAME').AsString,'2',inttostr(nViewSeq));
        end;
        Progress.Position := Progress.Position + 1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempKTAMSAdoQuery.EnableControls;
    TempKTAMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_Local_Code Convert Success';
end;

function TfmMain.CreateTB_BuildingCode(aCode,aName,aDeepSeq:string;aViewSeq:string='1'): Boolean;
var
  stSql : string;
begin
  if dmMIAMSDataBase.CheckTB_BUILDINGCODE_Code(aCode,aDeepSeq) <> 1 then
  begin
    dmMIAMSDataBase.InsertIntoMiamsTB_BUILDINGCODE_Value(aCode,aName,aDeepSeq,'1',aViewSeq);
  end;
  result := True;

end;

function TfmMain.CreateTB_COMPANYCode(aCode,aName,aDeepSeq:string;aViewSeq:string='1'): Boolean;
var
  stSql : string;
begin
  if dmMIAMSDataBase.CheckTB_COMPANYCODE_Code(aCode,aDeepSeq) <> 1 then
  begin
    dmMIAMSDataBase.InsertIntoMiamsTB_COMPANYCODE_Value(aCode,aName,aDeepSeq,'1',aViewSeq);
  end;
  result := True;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  lb_Message.Caption := '';
  G_stExeFolder := ExtractFileDir(Application.ExeName);
  AddDeviceIDList := TStringList.Create;
end;

function TfmMain.GetTB_SLOCAL_Code(aCode, aLocalCode,
  aSLocalCode: string): string;
var
  stCompanyCode : string;
  stCompanyName : string;
  nNextSeq : integer;
  nViewSeq : integer;
  nDeepSeq : integer;
begin
  stCompanyCode := dmKTAMSDataBase.GetTB_SLOCAL_CompanyCode(aSLocalCode,stCompanyName);

  if Trim(stCompanyCode) = '' then
  begin
    if dmKTAMSDataBase.CheckTB_LOCAL_Code(aLocalCode) <> 1 then  //현재 로컬 코드가 존재 하지 않으면 본부 소속으로 처리 하자.
    begin
      stCompanyCode := aCode;
    end else
    begin
      if stCompanyName = '' then
      begin
        stCompanyCode := aCode;
      end else
      begin
        if dmMIAMSDataBase.CheckTB_COMPANYCODE_Code(aCode + aLocalCode,'2') = 1 then  //현재 지점코드가 등록 되어 있으면 해당 지점 밑에 코드를 등록 한다.
        begin
          nNextSeq := dmMIAMSDataBase.GetTB_COMPANY_NextSeq(aCode + aLocalCode,'3',nViewSeq);
          stCompanyCode := aCode + aLocalCode + FillZeroNumber(nNextSeq,3);
          dmMIAMSDataBase.InsertIntoMiamsTB_COMPANYCODE_Value(stCompanyCode,stCompanyName,'3','1',inttostr(nViewSeq));
          dmKTAMSDataBase.UpdateTB_SLOCAL_CompanyCode(aSLocalCode,stCompanyCode);
        end else
        begin
          stCompanyCode := aCode; //지점이 등록 되어 있지 않으면 본부 소속으로 남는다.
        end;
      end;
    end;
  end else
  begin
    nDeepSeq := Length(stCompanyCode) div 3;
    //혹시 여기에서 회사 코드가 존재 하지 않으면 다시 할당 받아야 한다. 테스트 후에 실제 적용시 이 루틴을 타게 된다.
    if dmMIAMSDataBase.CheckTB_COMPANYCODE_Code(stCompanyCode,inttostr(nDeepSeq)) <> 1 then
    begin
      if stCompanyName = '' then
      begin
        stCompanyCode := aCode;
      end else
      begin
        nNextSeq := dmMIAMSDataBase.GetTB_COMPANY_NextSeq(aCode + aLocalCode,inttostr(nDeepSeq),nViewSeq);
        stCompanyCode := aCode + FillZeroNumber(nNextSeq,3);
        dmMIAMSDataBase.InsertIntoMiamsTB_COMPANYCODE_Value(stCompanyCode,stCompanyName,inttostr(nDeepSeq),'1',inttostr(nViewSeq));
        dmKTAMSDataBase.UpdateTB_SLOCAL_CompanyCode(aSLocalCode,stCompanyCode);
      end;
    end;
  end;
  result := stCompanyCode;
end;

function TfmMain.GetTB_SLOCAL_Code_Building(aCode, aLocalCode,
  aSLocalCode: string): string;
var
  stBuildingCode : string;
  stBuildingName : string;
  nNextSeq : integer;
  nViewSeq : integer;
begin
  stBuildingCode := dmKTAMSDataBase.GetTB_SLOCAL_BuildingCode(aSLocalCode,stBuildingName);

  if Trim(stBuildingCode) = '' then
  begin
    if dmKTAMSDataBase.CheckTB_LOCAL_Code(aLocalCode) <> 1 then  //현재 로컬 코드가 존재 하지 않으면 본부 소속으로 처리 하자.
    begin
      stBuildingCode := aCode;
    end else
    begin
      if stBuildingName = '' then
      begin
        stBuildingCode := aCode;
      end else
      begin
        if dmMIAMSDataBase.CheckTB_BUILDINGCODE_Code(aCode + aLocalCode,'2') = 1 then  //현재 빌딩코드가 등록 되어 있으면 해당 지점 밑에 코드를 등록 한다.
        begin
          nNextSeq := dmMIAMSDataBase.GetTB_BUILDING_NextSeq(aCode + aLocalCode,'3',nViewSeq);
          stBuildingCode := aCode + aLocalCode + FillZeroNumber(nNextSeq,3);
          dmMIAMSDataBase.InsertIntoMiamsTB_BUILDINGCODE_Value(stBuildingCode,stBuildingName,'3','1',inttostr(nViewSeq));
          dmKTAMSDataBase.UpdateTB_SLOCAL_BUILDINGCode(aSLocalCode,stBuildingCode);
        end else
        begin
          stBuildingCode := aCode; //지점이 등록 되어 있지 않으면 본부 소속으로 남는다.
        end;
      end;
    end;
  end else
  begin
    //혹시 여기에서 회사 코드가 존재 하지 않으면 다시 할당 받아야 한다. 테스트 후에 실제 적용시 이 루틴을 타게 된다.
    if dmMIAMSDataBase.CheckTB_BUILDINGCODE_Code(stBuildingCode,'3') <> 1 then
    begin
      if stBuildingName = '' then
      begin
        stBuildingCode := aCode;
      end else
      begin
        nNextSeq := dmMIAMSDataBase.GetTB_BUILDING_NextSeq(aCode + aLocalCode,'3',nViewSeq);
        stBuildingCode := aCode + FillZeroNumber(nNextSeq,3);
        dmMIAMSDataBase.InsertIntoMiamsTB_BUILDINGCODE_Value(stBuildingCode,stBuildingName,'3','1',inttostr(nViewSeq));
        dmKTAMSDataBase.UpdateTB_SLOCAL_BUILDINGCode(aSLocalCode,stBuildingCode);
      end;
    end;
  end;
  result := stBuildingCode;

end;

end.
