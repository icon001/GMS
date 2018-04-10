unit uConfigSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, W7Classes, W7Panels, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvSmoothPanel, Vcl.ExtCtrls, AdvSmoothLabel,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvToolBtn,ADODB,ActiveX, uSubForm, CommandArray,Winapi.WinSpool,System.iniFiles,
  AdvGroupBox, FolderDialog, AdvGlassButton, AdvGlowButton, ToolPanels, AdvCombo,
  Vcl.Menus, AdvTabSet, AdvPageControl, Vcl.ComCtrls, AdvOfficeButtons,
  Vcl.Imaging.pngimage, AdvOfficePager, AdvOfficePagerStylers, AdvAppStyler,
  AdvPanel;

type
  TfmConfigSetting = class(TfmASubForm)
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    Image1: TImage;
    BodyPanel: TW7Panel;
    menuTab: TAdvOfficeTabSet;
    Config: TAdvSmoothPanel;
    FolderDialog1: TFolderDialog;
    ATConfig: TAdvSmoothPanel;
    btn_ATPositionCode: TAdvGlowButton;
    btn_ATWorkType: TAdvGlowButton;
    btn_ATCode: TAdvGlowButton;
    PopupMenu1: TPopupMenu;
    pm_PositionCodeAdd: TMenuItem;
    PanATWorkType: TAdvToolPanel;
    Label8: TLabel;
    sg_ATWorkType: TAdvStringGrid;
    ed_ATWorkTypeName: TEdit;
    ed_ATWorkTypeCode: TEdit;
    btn_ATWorkTypeSave: TAdvGlassButton;
    btn_WorkTypeDelete: TAdvGlassButton;
    panATPosiCode: TAdvToolPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    sg_ATPosiCode: TAdvStringGrid;
    ed_name: TEdit;
    ed_Code: TEdit;
    cmb_DeviceType: TAdvComboBox;
    gb_ATButton: TAdvGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ed_ATSTARTBUTTON: TEdit;
    ed_ATOFFBUTTON: TEdit;
    cmb_ATInOut: TAdvComboBox;
    gb_ATInOutButton: TAdvGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    ed_WorkOutButton: TEdit;
    ed_WorkInButton: TEdit;
    ed_AtDeviceType: TEdit;
    ed_ATINOUTDeviceType: TEdit;
    btn_ATPosiCodeSave: TAdvGlassButton;
    btn_ATPosiCodeDelete: TAdvGlassButton;
    cmb_NotBack: TAdvComboBox;
    cmb_Saturday: TAdvComboBox;
    cmb_absence: TAdvComboBox;
    PopupMenu2: TPopupMenu;
    pm_AtWorkTypeAdd: TMenuItem;
    panATCode: TAdvToolPanel;
    Label9: TLabel;
    sg_ATCode: TAdvStringGrid;
    btn_ATCodeSave: TAdvGlassButton;
    btn_ATCodeDelete: TAdvGlassButton;
    cmb_ATWorkType: TAdvComboBox;
    Label10: TLabel;
    ed_ATCodeName: TEdit;
    ed_ATCodeAWCode: TEdit;
    PageBuilding: TAdvPageControl;
    AdvTabSheet1: TAdvTabSheet;
    AdvTabSheet2: TAdvTabSheet;
    AdvTabSheet3: TAdvTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    cmb_YsterdayHH: TAdvComboBox;
    Label13: TLabel;
    Label14: TLabel;
    cmb_YsterdayMM: TAdvComboBox;
    cmb_WorkStartHH: TAdvComboBox;
    Label15: TLabel;
    cmb_WorkStartMM: TAdvComboBox;
    Label16: TLabel;
    Label17: TLabel;
    cmb_WorkENDHH: TAdvComboBox;
    Label18: TLabel;
    cmb_WorkENDMM: TAdvComboBox;
    Label19: TLabel;
    Label20: TLabel;
    cmb_WorkINFROMHH: TAdvComboBox;
    Label21: TLabel;
    cmb_WorkINFROMMM: TAdvComboBox;
    Label22: TLabel;
    Label23: TLabel;
    cmb_WorkINTOHH: TAdvComboBox;
    Label24: TLabel;
    cmb_WorkINTOMM: TAdvComboBox;
    Label25: TLabel;
    Label26: TLabel;
    cmb_WorkEXTENDHH: TAdvComboBox;
    Label27: TLabel;
    cmb_WorkEXTENDMM: TAdvComboBox;
    Label28: TLabel;
    Label29: TLabel;
    cmb_WorkNIGHTHH: TAdvComboBox;
    Label30: TLabel;
    cmb_WorkNIGHTMM: TAdvComboBox;
    Label31: TLabel;
    Label32: TLabel;
    cmb_SWorkStartHH: TAdvComboBox;
    Label33: TLabel;
    cmb_SWorkStartMM: TAdvComboBox;
    Label34: TLabel;
    Label35: TLabel;
    cmb_SWorkENDHH: TAdvComboBox;
    Label36: TLabel;
    cmb_SWorkENDMM: TAdvComboBox;
    Label37: TLabel;
    Label38: TLabel;
    cmb_SWorkINTOMM: TAdvComboBox;
    Label39: TLabel;
    cmb_SWorkINTOHH: TAdvComboBox;
    Label40: TLabel;
    Label41: TLabel;
    cmb_SWorkINFROMMM: TAdvComboBox;
    Label42: TLabel;
    cmb_SWorkINFROMHH: TAdvComboBox;
    Label43: TLabel;
    Label44: TLabel;
    cmb_SWorkEXTENDHH: TAdvComboBox;
    Label45: TLabel;
    cmb_SWorkEXTENDMM: TAdvComboBox;
    Label46: TLabel;
    Label47: TLabel;
    cmb_SWorkNIGHTMM: TAdvComboBox;
    Label48: TLabel;
    cmb_SWorkNIGHTHH: TAdvComboBox;
    Label49: TLabel;
    Label50: TLabel;
    cmb_HWorkStartHH: TAdvComboBox;
    Label51: TLabel;
    cmb_HWorkStartMM: TAdvComboBox;
    Label52: TLabel;
    Label53: TLabel;
    cmb_HWorkENDHH: TAdvComboBox;
    Label54: TLabel;
    cmb_HWorkENDMM: TAdvComboBox;
    Label55: TLabel;
    Label56: TLabel;
    cmb_HWorkINTOMM: TAdvComboBox;
    Label57: TLabel;
    cmb_HWorkINTOHH: TAdvComboBox;
    Label58: TLabel;
    Label59: TLabel;
    cmb_HWorkINFROMMM: TAdvComboBox;
    Label60: TLabel;
    cmb_HWorkINFROMHH: TAdvComboBox;
    Label61: TLabel;
    Label62: TLabel;
    cmb_HWorkEXTENDHH: TAdvComboBox;
    Label63: TLabel;
    cmb_HWorkEXTENDMM: TAdvComboBox;
    Label64: TLabel;
    Label65: TLabel;
    cmb_HWorkNIGHTMM: TAdvComboBox;
    Label66: TLabel;
    cmb_HWorkNIGHTHH: TAdvComboBox;
    Label67: TLabel;
    ed_ATCode: TEdit;
    PopupMenu3: TPopupMenu;
    pm_atcodeAdd: TMenuItem;
    ed_ExtendAdd: TEdit;
    ed_NightAdd: TEdit;
    ed_SExtendAdd: TEdit;
    ed_SNightAdd: TEdit;
    ed_HExtendAdd: TEdit;
    ed_HNightAdd: TEdit;
    FDConfig: TAdvSmoothPanel;
    AdvToolPanel3: TAdvToolPanel;
    Label76: TLabel;
    sg_FoodCode: TAdvStringGrid;
    btn_FoodCodeAdd: TAdvGlassButton;
    btn_FoodCodeDelete: TAdvGlassButton;
    cmb_FoodUse: TAdvComboBox;
    Label68: TLabel;
    cmb_FoodType: TAdvComboBox;
    Label69: TLabel;
    ed_FoodName: TEdit;
    Label70: TLabel;
    ed_FoodStartTime: TEdit;
    Label71: TLabel;
    ed_FoodEndTime: TEdit;
    Label72: TLabel;
    ed_FoodAmt: TEdit;
    ed_FoodCode: TEdit;
    btn_FoodTypeAdd: TAdvGlassButton;
    chk_DupFoodEvent: TAdvOfficeCheckBox;
    AdvToolPanel1: TAdvToolPanel;
    chk_FoodAutoGrade: TAdvOfficeCheckBox;
    Label73: TLabel;
    ed_FoodOutTime: TEdit;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvOfficePage2: TAdvOfficePage;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvPanelStyler1: TAdvPanelStyler;
    AdvOfficePage3: TAdvOfficePage;
    AdvSmoothPanel1: TAdvSmoothPanel;
    AdvToolPanel2: TAdvToolPanel;
    AdvToolPanel4: TAdvToolPanel;
    Label74: TLabel;
    cmb_CustomerType: TAdvComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    EHR연동: TTabSheet;
    Label75: TLabel;
    cmb_DBType1: TComboBox;
    Label77: TLabel;
    ed_dbip1: TEdit;
    Label78: TLabel;
    ed_dbport1: TEdit;
    Label79: TLabel;
    ed_dbuserid1: TEdit;
    Label80: TLabel;
    ed_dbpw1: TEdit;
    Label81: TLabel;
    ed_dbname1: TEdit;
    btn_Connect1Test: TSpeedButton;
    st_Connected1: TStaticText;
    btn_DB1Save: TAdvGlassButton;
    Label82: TLabel;
    ed_RelayTime: TEdit;
    Label83: TLabel;
    ed_dbname2: TEdit;
    Label84: TLabel;
    Label85: TLabel;
    ed_dbpw2: TEdit;
    ed_dbuserid2: TEdit;
    Label86: TLabel;
    Label87: TLabel;
    ed_dbport2: TEdit;
    ed_dbip2: TEdit;
    Label88: TLabel;
    Label89: TLabel;
    cmb_DBType2: TComboBox;
    btn_Connect2Test: TSpeedButton;
    st_Connected2: TStaticText;
    btn_DB2Save: TAdvGlassButton;
    rg_RelayUse: TAdvOfficeRadioGroup;
    TabSheet2: TTabSheet;
    Label90: TLabel;
    ed_RelayCode1: TEdit;
    Label91: TLabel;
    ed_RelayCode2: TEdit;
    Label92: TLabel;
    ed_RelayCode3: TEdit;
    Label93: TLabel;
    ed_RelayCode4: TEdit;
    AdvGlassButton1: TAdvGlassButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_CardRegistportSaveClick(Sender: TObject);
    procedure cmb_DeviceTypeChange(Sender: TObject);
    procedure cmb_ATInOutChange(Sender: TObject);
    procedure sg_ATPosiCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sg_ATPosiCodeClick(Sender: TObject);
    procedure btn_ATPositionCodeClick(Sender: TObject);
    procedure pm_PositionCodeAddClick(Sender: TObject);
    procedure btn_ATPosiCodeSaveClick(Sender: TObject);
    procedure btn_ATPosiCodeDeleteClick(Sender: TObject);
    procedure btn_ATWorkTypeClick(Sender: TObject);
    procedure sg_ATWorkTypeClick(Sender: TObject);
    procedure btn_WorkTypeDeleteClick(Sender: TObject);
    procedure btn_ATWorkTypeSaveClick(Sender: TObject);
    procedure sg_ATWorkTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pm_AtWorkTypeAddClick(Sender: TObject);
    procedure btn_ATCodeClick(Sender: TObject);
    procedure cmb_ATWorkTypeChange(Sender: TObject);
    procedure sg_ATCodeClick(Sender: TObject);
    procedure pm_atcodeAddClick(Sender: TObject);
    procedure btn_ATCodeSaveClick(Sender: TObject);
    procedure sg_ATCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_ATCodeDeleteClick(Sender: TObject);
    procedure cmb_FoodTypeChange(Sender: TObject);
    procedure sg_FoodCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sg_FoodCodeClick(Sender: TObject);
    procedure btn_FoodCodeDeleteClick(Sender: TObject);
    procedure btn_FoodCodeAddClick(Sender: TObject);
    procedure btn_FoodTypeAddClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_Connect1TestClick(Sender: TObject);
    procedure btn_Connect2TestClick(Sender: TObject);
    procedure btn_DB1SaveClick(Sender: TObject);
    procedure btn_DB2SaveClick(Sender: TObject);
  private
    { Private declarations }
    function LoadCustomerType:Boolean;
    Function SearchATCodeList(aCode : string) : Boolean;
    Function SearchFoodCodeList(aCode:string):Boolean;
    Function SearchATPosiCodeList(aCode:string):Boolean;
    Function SearchATWorkTypeList(aCode:string):Boolean;
    Function FormClear:Boolean;
    Function CreateComboTime:Boolean;
  private
    AttendWorkType : TStringList;
    ComPortList : TStringList;
    { Private declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;
  public
    { Public declarations }
    procedure Form_Close;
  end;

var
  fmConfigSetting: TfmConfigSetting;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBDelete,
  uDBFingerRelay,
  uDBFunction,
  uDBInsert,
  uDBRelay,
  uDBUpdate,
  uFormVariable,
  uFoodType,
  uMain;

{$R *.dfm}


procedure TfmConfigSetting.btn_ATCodeClick(Sender: TObject);
begin
  inherited;
  panATPosiCode.Visible := False;
  PanATWorkType.Visible := False;
  panATCode.Visible := True;
  panATCode.Top := 34;
  panATCode.Left := 135;
  LoadAttendWorkType(AttendWorkType,TComboBox(cmb_ATWorkType),False);
  cmb_ATWorkType.ItemIndex := 0;
  PageBuilding.ActivePageIndex := 0;
  SearchATCodeList('');

end;

procedure TfmConfigSetting.btn_ATCodeDeleteClick(Sender: TObject);
begin
  inherited;
  if ed_ATCode.Text = '' then
  begin
    SearchATCodeList('');
    Exit;
  end;
  if dmDBFunction.getTB_ATTENDCODE_RecordCount(ed_ATCodeAWCode.Text) < 2 then
  begin
    showmessage('근무자코드는 1개 이상 반드시 설정 되어 있어야 합니다.');
    Exit;
  end;
  dmDBDelete.DeleteTB_ATTENDCode_Value(ed_ATCodeAWCode.Text,ed_ATCode.Text);
  fmMain.LoadConfig;
  SearchATCodeList('');

end;

procedure TfmConfigSetting.btn_ATPosiCodeDeleteClick(Sender: TObject);
begin
  inherited;
  if ed_Code.Text = '' then
  begin
    SearchATPosiCodeList('');
    Exit;
  end;
  if dmDBFunction.getTB_ATTENDPOSITOIN_RecordCount < 2 then
  begin
    showmessage('근태처리방법은 1개 이상은 반드시 설정 되어 있어야 합니다.');
    Exit;
  end;
  dmDBDelete.DeleteTB_ATTENDPOSITION_Code(ed_Code.Text);
  fmMain.LoadConfig;
  SearchATPosiCodeList('');
end;

procedure TfmConfigSetting.btn_ATPosiCodeSaveClick(Sender: TObject);
var
  stCode : string;
begin
  inherited;
  if ed_Code.Text = '' then
  begin
    stCode := dmDBFunction.GetNextTB_ATTENDPOSITIONCode;
    dmDBInsert.InsertIntoTB_ATTENDPOSITION_VALUE(stCode,ed_name.Text,inttostr(cmb_DeviceType.ItemIndex),ed_ATSTARTBUTTON.Text,ed_ATOFFBUTTON.Text,
    inttostr(cmb_ATInOut.ItemIndex),ed_WorkOutButton.Text,ed_WorkInButton.Text);
  end else
  begin
    stCode := ed_Code.Text;
    dmDBUpdate.UpdateTB_ATTENDPOSITION_VALUE(stCode,ed_name.Text,inttostr(cmb_DeviceType.ItemIndex),ed_ATSTARTBUTTON.Text,ed_ATOFFBUTTON.Text,
    inttostr(cmb_ATInOut.ItemIndex),ed_WorkOutButton.Text,ed_WorkInButton.Text);
  end;
  fmMain.LoadConfig;
  SearchATPosiCodeList(stCode);

end;

procedure TfmConfigSetting.btn_ATPositionCodeClick(Sender: TObject);
begin
  inherited;
  panATPosiCode.Visible := True;
  PanATWorkType.Visible := False;
  panATCode.Visible := False;
  panATPosiCode.Top := 34;
  panATPosiCode.Left := 135;
  SearchATPosiCodeList('');
end;

procedure TfmConfigSetting.btn_CardRegistportSaveClick(Sender: TObject);
begin
  inherited;
  self.FindSubForm('Main').FindCommand('ACTION').Params.Values['VALUE'] := 'CRADREGISTERPORTREFRESH';
  self.FindSubForm('Main').FindCommand('ACTION').Execute;
  showmessage('설정되었습니다.');
end;


procedure TfmConfigSetting.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmConfigSetting.btn_Connect1TestClick(Sender: TObject);
begin
  inherited;
  if dmDBRelay.AdoRelay1Connected(inttostr(cmb_DBType1.ItemIndex + 1), ed_dbip1.Text, ed_dbport1.Text,
                    ed_dbuserid1.Text, ed_dbpw1.Text, ed_dbname1.Text) then st_Connected1.Caption := 'Connected'
  else st_Connected1.Caption := 'DisConnected';

end;

procedure TfmConfigSetting.btn_Connect2TestClick(Sender: TObject);
begin
  inherited;
  if dmDBRelay.AdoRelay2Connected(inttostr(cmb_DBType2.ItemIndex + 1), ed_dbip2.Text, ed_dbport2.Text,
                    ed_dbuserid2.Text, ed_dbpw2.Text, ed_dbname2.Text) then st_Connected2.Caption := 'Connected'
  else st_Connected2.Caption := 'DisConnected';

end;

procedure TfmConfigSetting.btn_DB1SaveClick(Sender: TObject);
begin
  inherited;
  G_nSystmRelayUse := rg_RelayUse.ItemIndex;
  if G_nSystmRelayUse = 1 then fmMain.RelayTimer.Enabled := True
  else fmMain.RelayTimer.Enabled := False;
  G_nSystmRelayCustomerNo := cmb_CustomerType.ItemIndex;
  if isDigit(ed_RelayTime.Text) then
    G_nSystmRelayCyle := strtoint(ed_RelayTime.Text);
  G_stSystmRelayDB1Type := inttostr(cmb_DBType1.ItemIndex + 1);
  G_stSystmRelayDB1IP := ed_dbip1.Text;
  G_stSystmRelayDB1PORT := ed_dbport1.Text;
  G_stSystmRelayDB1USERID := ed_dbuserid1.Text;
  G_stSystmRelayDB1USERPW := ed_dbpw1.Text;
  G_stSystmRelayDB1NAME := ed_dbname1.Text;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','USE','CO_CONFIGVALUE',inttostr(G_nSystmRelayUse));
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','CUSTMOR','CO_CONFIGVALUE',inttostr(G_nSystmRelayCustomerNo));
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','CYCLE','CO_CONFIGVALUE',inttostr(G_nSystmRelayCyle));
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB1TYPE','CO_CONFIGVALUE',G_stSystmRelayDB1Type);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB1IP','CO_CONFIGVALUE',G_stSystmRelayDB1IP);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB1PORT','CO_CONFIGVALUE',G_stSystmRelayDB1PORT);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB1USERID','CO_CONFIGVALUE',G_stSystmRelayDB1USERID);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB1USERPW','CO_CONFIGVALUE',G_stSystmRelayDB1USERPW);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB1DBNAME','CO_CONFIGVALUE',G_stSystmRelayDB1NAME);

end;

procedure TfmConfigSetting.btn_DB2SaveClick(Sender: TObject);
begin
  inherited;
  G_nSystmRelayUse := rg_RelayUse.ItemIndex;
  if G_nSystmRelayUse = 1 then fmMain.RelayTimer.Enabled := True
  else fmMain.RelayTimer.Enabled := False;
  G_nSystmRelayCustomerNo := cmb_CustomerType.ItemIndex;
  if isDigit(ed_RelayTime.Text) then
    G_nSystmRelayCyle := strtoint(ed_RelayTime.Text);
  G_stSystmRelayDB2Type := inttostr(cmb_DBType2.ItemIndex + 1);
  G_stSystmRelayDB2IP := ed_dbip2.Text;
  G_stSystmRelayDB2PORT := ed_dbport2.Text;
  G_stSystmRelayDB2USERID := ed_dbuserid2.Text;
  G_stSystmRelayDB2USERPW := ed_dbpw2.Text;
  G_stSystmRelayDB2NAME := ed_dbname2.Text;
  G_stRelayCode1 := ed_RelayCode1.Text;
  G_stRelayCode2 := ed_RelayCode2.Text;
  G_stRelayCode3 := ed_RelayCode3.Text;
  G_stRelayCode4 := ed_RelayCode4.Text;

  if G_nSystmRelayCustomerNo = 2 then
  begin
    dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('CARD','CARDREGISTFORM','CO_CONFIGVALUE','1');
  end else
  begin
    dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('CARD','CARDREGISTFORM','CO_CONFIGVALUE','0');
  end;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','USE','CO_CONFIGVALUE',inttostr(G_nSystmRelayUse));
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','CUSTMOR','CO_CONFIGVALUE',inttostr(G_nSystmRelayCustomerNo));
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','CYCLE','CO_CONFIGVALUE',inttostr(G_nSystmRelayCyle));
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB2TYPE','CO_CONFIGVALUE',G_stSystmRelayDB2Type);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB2IP','CO_CONFIGVALUE',G_stSystmRelayDB2IP);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB2PORT','CO_CONFIGVALUE',G_stSystmRelayDB2PORT);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB2USERID','CO_CONFIGVALUE',G_stSystmRelayDB2USERID);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB2USERPW','CO_CONFIGVALUE',G_stSystmRelayDB2USERPW);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB2DBNAME','CO_CONFIGVALUE',G_stSystmRelayDB2NAME);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','RELAYCODE1','CO_CONFIGVALUE',G_stRelayCode1);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','RELAYCODE2','CO_CONFIGVALUE',G_stRelayCode2);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','RELAYCODE3','CO_CONFIGVALUE',G_stRelayCode3);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('SYSTEMRELAY','RELAYCODE4','CO_CONFIGVALUE',G_stRelayCode4);

  showmessage('저장완료');
end;

procedure TfmConfigSetting.btn_WorkTypeDeleteClick(Sender: TObject);
begin
  inherited;
  if ed_ATWorkTypeCode.Text = '' then
  begin
    SearchATWorkTypeList('');
    Exit;
  end;
  if dmDBFunction.getTB_ATTENDWORKTYPE_RecordCount < 2 then
  begin
    showmessage('근무자타입은 1개 이상 반드시 설정 되어 있어야 합니다.');
    Exit;
  end;
  dmDBDelete.DeleteTB_ATTENDWORKTYPE_Code(ed_ATWorkTypeCode.Text);
  fmMain.LoadConfig;
  SearchATWorkTypeList('');
end;

procedure TfmConfigSetting.cmb_ATInOutChange(Sender: TObject);
begin
  inherited;
  if cmb_ATInOut.ItemIndex = 0 then
  begin
    gb_ATInOutButton.Visible := False;
  end else
  begin
    gb_ATInOutButton.Visible := True;
    gb_ATInOutButton.Caption := cmb_DeviceType.Text;
  end;

end;

procedure TfmConfigSetting.cmb_ATWorkTypeChange(Sender: TObject);
begin
  inherited;
  SearchATCodeList('');
end;

procedure TfmConfigSetting.cmb_DeviceTypeChange(Sender: TObject);
begin
  inherited;
  if cmb_DeviceType.ItemIndex = 0 then
  begin
    gb_ATButton.Visible := False;
  end else
  begin
    gb_ATButton.Visible := True;
    gb_ATButton.Caption := cmb_DeviceType.Text;
  end;
end;

procedure TfmConfigSetting.cmb_FoodTypeChange(Sender: TObject);
begin
  inherited;
  SearchFoodCodeList('');
end;

function TfmConfigSetting.CreateComboTime: Boolean;
var
  i : integer;
begin
  cmb_YsterdayHH.Items.Clear;
  cmb_YsterdayMM.Items.Clear;
  cmb_WorkStartHH.Items.Clear;
  cmb_WorkStartMM.Items.Clear;
  cmb_WorkENDHH.Items.Clear;
  cmb_WorkENDMM.Items.Clear;
  cmb_WorkINFROMHH.Items.Clear;
  cmb_WorkINFROMMM.Items.Clear;
  cmb_WorkINTOHH.Items.Clear;
  cmb_WorkINTOMM.Items.Clear;
  cmb_WorkEXTENDHH.Items.Clear;
  cmb_WorkEXTENDMM.Items.Clear;
  cmb_WorkNIGHTHH.Items.Clear;
  cmb_WorkNIGHTMM.Items.Clear;

  cmb_SWorkStartHH.Items.Clear;
  cmb_SWorkStartMM.Items.Clear;
  cmb_SWorkENDHH.Items.Clear;
  cmb_SWorkENDMM.Items.Clear;
  cmb_SWorkINFROMHH.Items.Clear;
  cmb_SWorkINFROMMM.Items.Clear;
  cmb_SWorkINTOHH.Items.Clear;
  cmb_SWorkINTOMM.Items.Clear;
  cmb_SWorkEXTENDHH.Items.Clear;
  cmb_SWorkEXTENDMM.Items.Clear;
  cmb_SWorkNIGHTHH.Items.Clear;
  cmb_SWorkNIGHTMM.Items.Clear;

  cmb_HWorkStartHH.Items.Clear;
  cmb_HWorkStartMM.Items.Clear;
  cmb_HWorkENDHH.Items.Clear;
  cmb_HWorkENDMM.Items.Clear;
  cmb_HWorkINFROMHH.Items.Clear;
  cmb_HWorkINFROMMM.Items.Clear;
  cmb_HWorkINTOHH.Items.Clear;
  cmb_HWorkINTOMM.Items.Clear;
  cmb_HWorkEXTENDHH.Items.Clear;
  cmb_HWorkEXTENDMM.Items.Clear;
  cmb_HWorkNIGHTHH.Items.Clear;
  cmb_HWorkNIGHTMM.Items.Clear;
  for i := 0 to 24 do
  begin
    cmb_YsterdayHH.Items.Add(FillZeroNumber(i,2));
    cmb_WorkStartHH.Items.Add(FillZeroNumber(i,2));
    cmb_WorkENDHH.Items.Add(FillZeroNumber(i,2));
    cmb_WorkINFROMHH.Items.Add(FillZeroNumber(i,2));
    cmb_WorkINTOHH.Items.Add(FillZeroNumber(i,2));
    cmb_WorkEXTENDHH.Items.Add(FillZeroNumber(i,2));
    cmb_WorkNIGHTHH.Items.Add(FillZeroNumber(i,2));

    cmb_SWorkStartHH.Items.Add(FillZeroNumber(i,2));
    cmb_SWorkENDHH.Items.Add(FillZeroNumber(i,2));
    cmb_SWorkINFROMHH.Items.Add(FillZeroNumber(i,2));
    cmb_SWorkINTOHH.Items.Add(FillZeroNumber(i,2));
    cmb_SWorkEXTENDHH.Items.Add(FillZeroNumber(i,2));
    cmb_SWorkNIGHTHH.Items.Add(FillZeroNumber(i,2));

    cmb_HWorkStartHH.Items.Add(FillZeroNumber(i,2));
    cmb_HWorkENDHH.Items.Add(FillZeroNumber(i,2));
    cmb_HWorkINFROMHH.Items.Add(FillZeroNumber(i,2));
    cmb_HWorkINTOHH.Items.Add(FillZeroNumber(i,2));
    cmb_HWorkEXTENDHH.Items.Add(FillZeroNumber(i,2));
    cmb_HWorkNIGHTHH.Items.Add(FillZeroNumber(i,2));
  end;

  for i := 0 to 11 do
  begin
    cmb_YsterdayMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_WorkStartMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_WorkENDMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_WorkINFROMMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_WorkINTOMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_WorkEXTENDMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_WorkNIGHTMM.Items.Add(FillZeroNumber(i * 5,2));

    cmb_SWorkStartMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_SWorkENDMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_SWorkINFROMMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_SWorkINTOMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_SWorkEXTENDMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_SWorkNIGHTMM.Items.Add(FillZeroNumber(i * 5,2));

    cmb_HWorkStartMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_HWorkENDMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_HWorkINFROMMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_HWorkINTOMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_HWorkEXTENDMM.Items.Add(FillZeroNumber(i * 5,2));
    cmb_HWorkNIGHTMM.Items.Add(FillZeroNumber(i * 5,2));
  end;
  cmb_YsterdayHH.ItemIndex := 0;
  cmb_YsterdayMM.ItemIndex := 0;
  cmb_WorkStartHH.ItemIndex := 0;
  cmb_WorkStartMM.ItemIndex := 0;
  cmb_WorkENDHH.ItemIndex := 0;
  cmb_WorkENDMM.ItemIndex := 0;
  cmb_WorkINFROMHH.ItemIndex := 0;
  cmb_WorkINFROMMM.ItemIndex := 0;
  cmb_WorkINTOHH.ItemIndex := 0;
  cmb_WorkINTOMM.ItemIndex := 0;
  cmb_WorkEXTENDHH.ItemIndex := 0;
  cmb_WorkEXTENDMM.ItemIndex := 0;
  cmb_WorkNIGHTHH.ItemIndex := 0;
  cmb_WorkNIGHTMM.ItemIndex := 0;

  cmb_SWorkStartHH.ItemIndex := 0;
  cmb_SWorkStartMM.ItemIndex := 0;
  cmb_SWorkENDHH.ItemIndex := 0;
  cmb_SWorkENDMM.ItemIndex := 0;
  cmb_SWorkINFROMHH.ItemIndex := 0;
  cmb_SWorkINFROMMM.ItemIndex := 0;
  cmb_SWorkINTOHH.ItemIndex := 0;
  cmb_SWorkINTOMM.ItemIndex := 0;
  cmb_SWorkEXTENDHH.ItemIndex := 0;
  cmb_SWorkEXTENDMM.ItemIndex := 0;
  cmb_SWorkNIGHTHH.ItemIndex := 0;
  cmb_SWorkNIGHTMM.ItemIndex := 0;

  cmb_HWorkStartHH.ItemIndex := 0;
  cmb_HWorkStartMM.ItemIndex := 0;
  cmb_HWorkENDHH.ItemIndex := 0;
  cmb_HWorkENDMM.ItemIndex := 0;
  cmb_HWorkINFROMHH.ItemIndex := 0;
  cmb_HWorkINFROMMM.ItemIndex := 0;
  cmb_HWorkINTOHH.ItemIndex := 0;
  cmb_HWorkINTOMM.ItemIndex := 0;
  cmb_HWorkEXTENDHH.ItemIndex := 0;
  cmb_HWorkEXTENDMM.ItemIndex := 0;
  cmb_HWorkNIGHTHH.ItemIndex := 0;
  cmb_HWorkNIGHTMM.ItemIndex := 0;
end;

function TfmConfigSetting.DecodeCommportName(PortName: String): WORD;
var
 Pt : Integer;
begin
 PortName := UpperCase(PortName);
 if (Copy(PortName, 1, 3) = 'COM') then begin
    Delete(PortName, 1, 3);
    Pt := Pos(':', PortName);
    if Pt = 0 then Result := 0
       else Result := StrToInt(Copy(PortName, 1, Pt-1));
 end
 else if (Copy(PortName, 1, 7) = '\\.\COM') then begin
    Delete(PortName, 1, 7);
    Result := StrToInt(PortName);
 end
 else Result := 0;

end;

function TfmConfigSetting.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

function TfmConfigSetting.FormClear: Boolean;
begin
  ed_name.Text := '';
  ed_Code.Text := '';
  cmb_DeviceType.ItemIndex := 0;
  ed_AtDeviceType.Text := '';
  ed_ATSTARTBUTTON.Text := '';
  ed_ATOFFBUTTON.Text := '';
  cmb_ATInOut.ItemIndex := 0;
  ed_ATINOUTDeviceType.Text := '';
  ed_WorkOutButton.Text := '';
  ed_WorkInButton.Text := '';
end;

procedure TfmConfigSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(con_FormAFSConfig);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;

  AttendWorkType.Free;
  ComPortList.Free;
  Action := caFree;
end;

procedure TfmConfigSetting.FormCreate(Sender: TObject);
begin
  //Height := 420;
  AttendWorkType := TStringList.Create;
  ComPortList := TStringList.Create;

  PanATWorkType.Visible := False;
  panATPosiCode.Visible := False;
  panATCode.Visible := False;

  LoadCustomerType;


  CreateComboTime;
  cmb_FoodUse.ItemIndex := 0;
  if G_bFoodUse then cmb_FoodUse.ItemIndex := 1;
  LoadFoodTypeCode(TComboBox(cmb_FoodType),False);
  cmb_FoodType.ItemIndex := 0;

  chk_DupFoodEvent.Checked := G_bFoodDupEvent;
  chk_FoodAutoGrade.Checked := G_bFoodDedicateDoorUse;
  SearchFoodCodeList('');

  rg_RelayUse.ItemIndex := G_nSystmRelayUse;
  cmb_CustomerType.ItemIndex := G_nSystmRelayCustomerNo;
  ed_RelayTime.Text := inttostr(G_nSystmRelayCyle);
  cmb_DBType1.ItemIndex := strtoint(G_stSystmRelayDB1Type) - 1;
  ed_dbip1.Text := G_stSystmRelayDB1IP;
  ed_dbport1.Text := G_stSystmRelayDB1PORT;
  ed_dbuserid1.Text := G_stSystmRelayDB1USERID;
  ed_dbpw1.Text := G_stSystmRelayDB1USERPW;
  ed_dbname1.Text := G_stSystmRelayDB1NAME;

  cmb_DBType2.ItemIndex := strtoint(G_stSystmRelayDB2Type) - 1;
  ed_dbip2.Text := G_stSystmRelayDB2IP;
  ed_dbport2.Text := G_stSystmRelayDB2PORT;
  ed_dbuserid2.Text := G_stSystmRelayDB2USERID;
  ed_dbpw2.Text := G_stSystmRelayDB2USERPW;
  ed_dbname2.Text := G_stSystmRelayDB2NAME;

  ed_RelayCode1.Text := G_stRelayCode1;
  ed_RelayCode2.Text := G_stRelayCode2;
  ed_RelayCode3.Text := G_stRelayCode3;
  ed_RelayCode4.Text := G_stRelayCode4;

end;


procedure TfmConfigSetting.FormResize(Sender: TObject);
begin
  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := True;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;

end;

procedure TfmConfigSetting.FormShow(Sender: TObject);
var
  stComPort : string;
  nIndex : integer;
begin
  top := 0;
  Left := 0;
  Width := BodyPanel.Width;

  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(con_FormAFSConfig);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;

end;

procedure TfmConfigSetting.Form_Close;
begin
  Close;
end;

function TfmConfigSetting.GetSerialPortList(List: TStringList;
  const doOpenTest: Boolean): LongWord;
type
 TArrayPORT_INFO_1 = array[0..0] Of PORT_INFO_1;
 PArrayPORT_INFO_1 = ^TArrayPORT_INFO_1;
var
{$IF USE_ENUMPORTS_API}
 PL : PArrayPORT_INFO_1;
 TotalSize, ReturnCount : LongWord;
 Buf : String;
 CommNum : WORD;
{$IFEND}
 I : LongWord;
 CHandle : THandle;
begin
 List.Clear;
{$IF USE_ENUMPORTS_API}
 EnumPorts(nil, 1, nil, 0, TotalSize, ReturnCount);
 if TotalSize < 1 then begin
    Result := 0;
    Exit;
    end;
 GetMem(PL, TotalSize);
 EnumPorts(nil, 1, PL, TotalSize, TotalSize, Result);

 if Result < 1 then begin
    FreeMem(PL);
    Exit;
    end;

 for I:=0 to Result-1 do begin
    Buf := UpperCase(PL^[I].pName);
    CommNum := DecodeCommportName(PL^[I].pName);
    if CommNum = 0 then Continue;
    List.AddObject(EncodeCommportName(CommNum), Pointer(CommNum));
    end;
{$ELSE}
 for I:=1 to G_nMaxComPort do List.AddObject(EncodeCommportName(I), Pointer(I));
{$IFEND}
 // Open Test
 if List.Count > 0 then
   for I := List.Count-1 downto 0 do
   begin
      CHandle := CreateFile(PChar(List[I]), GENERIC_WRITE or GENERIC_READ,
        0, nil, OPEN_EXISTING,
        FILE_ATTRIBUTE_NORMAL,
        0);
      if CHandle = INVALID_HANDLE_VALUE then
      begin
        if doOpenTest or (GetLastError() <> ERROR_ACCESS_DENIED) then
            List.Delete(I);
        Continue;
      end;
      CloseHandle(CHandle);
   end;

 Result := List.Count;
{$IF USE_ENUMPORTS_API}
 if Assigned(PL) then FreeMem(PL);
{$IFEND}

end;

function TfmConfigSetting.LoadCustomerType: Boolean;
begin
  cmb_CustomerType.Clear;
  if G_nProgramType = 2 then //SK이면
  begin
    cmb_CustomerType.Items.Add('Hynix');
    cmb_CustomerType.Items.Add('SK가스');
    cmb_CustomerType.Items.Add('SK충청');
  end;
end;

procedure TfmConfigSetting.pm_atcodeAddClick(Sender: TObject);
begin
  inherited;
    if sg_ATCode.Cells[0,sg_ATCode.RowCount - 1] <> '' then
    begin
      sg_ATCode.AddRow;
      sg_ATCode.SelectRows(sg_ATCode.RowCount - 1,1);
    end else
    begin
      sg_ATCode.SelectRows(sg_ATCode.RowCount - 1,1);
    end;
    sg_ATCodeClick(self);


end;

procedure TfmConfigSetting.pm_AtWorkTypeAddClick(Sender: TObject);
begin
  inherited;
    if sg_ATWorkType.Cells[0,sg_ATWorkType.RowCount - 1] <> '' then
    begin
      sg_ATWorkType.AddRow;
      sg_ATWorkType.SelectRows(sg_ATWorkType.RowCount - 1,1);
    end else
    begin
      sg_ATWorkType.SelectRows(sg_ATWorkType.RowCount - 1,1);
    end;
    sg_ATWorkTypeClick(self);

end;

procedure TfmConfigSetting.pm_PositionCodeAddClick(Sender: TObject);
begin
  inherited;
    if sg_ATPosiCode.Cells[0,sg_ATPosiCode.RowCount - 1] <> '' then
    begin
      sg_ATPosiCode.AddRow;
      sg_ATPosiCode.SelectRows(sg_ATPosiCode.RowCount - 1,1);
    end else
    begin
      sg_ATPosiCode.SelectRows(sg_ATPosiCode.RowCount - 1,1);
    end;
    sg_ATPosiCodeClick(self);
end;

function TfmConfigSetting.SearchATCodeList(aCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stWorkTypeCode : string;
begin
  GridInit(sg_ATCode,6);
  if cmb_ATWorkType.ItemIndex > -1 then stWorkTypeCode := AttendWorkType.Strings[cmb_ATWorkType.ItemIndex];

  if Not isDigit(stWorkTypeCode) then
  begin
    Exit;
  end;

  stSql := 'Select * from TB_ATTENDCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AW_CODE = ' + stWorkTypeCode + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then
      begin
        sg_ATCodeClick(self);
        Exit;
      end;

      sg_ATCode.RowCount := recordCount + 1;
      nRow := 1;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        with sg_ATCode do
        begin
          Cells[0,nRow] := FindField('AT_CODENAME').AsString;
          Cells[1,nRow] := FindField('AT_YESTERDAYTIME').AsString;
          Cells[2,nRow] := FindField('AT_WORKSTARTTIME').AsString;
          Cells[3,nRow] := FindField('AT_WORKENDTIME').AsString;
          Cells[4,nRow] := FindField('AT_INFROMTIME').AsString;
          Cells[5,nRow] := FindField('AT_INTOTIME').AsString;
          Cells[6,nRow] := FindField('AT_EXTENDTIME').AsString;
          Cells[7,nRow] := FindField('AT_NIGHTTIME').AsString;
          Cells[8,nRow] := FindField('AT_NORMALADD').AsString;
          Cells[9,nRow] := FindField('AT_EARLYADD').AsString;
          Cells[10,nRow] := FindField('AT_JIGAKADD').AsString;
          Cells[11,nRow] := FindField('AT_JOTAEADD').AsString;
          Cells[12,nRow] := FindField('AT_EXTENDADD').AsString;
          Cells[13,nRow] := FindField('AT_NIGHTADD').AsString;
          Cells[14,nRow] := FindField('AT_SWORKSTARTTIME').AsString;
          Cells[15,nRow] := FindField('AT_SWORKENDTIME').AsString;
          Cells[16,nRow] := FindField('AT_SINFROMTIME').AsString;
          Cells[17,nRow] := FindField('AT_SINTOTIME').AsString;
          Cells[18,nRow] := FindField('AT_SEXTENDTIME').AsString;
          Cells[19,nRow] := FindField('AT_SNIGHTTIME').AsString;
          Cells[20,nRow] := FindField('AT_SNORMALADD').AsString;
          Cells[21,nRow] := FindField('AT_SEARLYADD').AsString;
          Cells[22,nRow] := FindField('AT_SJIGAKADD').AsString;
          Cells[23,nRow] := FindField('AT_SJOTAEADD').AsString;
          Cells[24,nRow] := FindField('AT_SEXTENDADD').AsString;
          Cells[25,nRow] := FindField('AT_SNIGHTADD').AsString;
          Cells[26,nRow] := FindField('AT_HWORKSTARTTIME').AsString;
          Cells[27,nRow] := FindField('AT_HWORKENDTIME').AsString;
          Cells[28,nRow] := FindField('AT_HINFROMTIME').AsString;
          Cells[29,nRow] := FindField('AT_HINTOTIME').AsString;
          Cells[30,nRow] := FindField('AT_HEXTENDTIME').AsString;
          Cells[31,nRow] := FindField('AT_HNIGHTTIME').AsString;
          Cells[32,nRow] := FindField('AT_HNORMALADD').AsString;
          Cells[33,nRow] := FindField('AT_HEARLYADD').AsString;
          Cells[34,nRow] := FindField('AT_HJIGAKADD').AsString;
          Cells[35,nRow] := FindField('AT_HJOTAEADD').AsString;
          Cells[36,nRow] := FindField('AT_HEXTENDADD').AsString;
          Cells[37,nRow] := FindField('AT_HNIGHTADD').AsString;
          Cells[38,nRow] := FindField('AT_OUTRANGE').AsString;
          Cells[39,nRow] := FindField('AT_SOUTRANGE').AsString;
          Cells[40,nRow] := FindField('AT_HOUTRANGE').AsString;
          Cells[41,nRow] := FindField('AW_CODE').AsString;
          Cells[42,nRow] := FindField('AT_ATCODE').AsString;
          if (FindField('AW_CODE').AsString + FindField('AT_ATCODE').AsString )  = aCode then
          begin
            SelectRows(nRow,1);
          end;

        end;
        Application.ProcessMessages;
        inc(nRow);
        Next;
      end;
      sg_ATCodeClick(self);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmConfigSetting.SearchATPosiCodeList(aCode:string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_ATPosiCode,7);
  stSql := 'Select * from TB_ATTENDPOSITION ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;

      sg_ATPosiCode.RowCount := recordCount + 1;
      nRow := 1;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        with sg_ATPosiCode do
        begin
          Cells[0,nRow] := FindField('AP_NAME').AsString;
          //AddCheckBox(0,nRow,False,False);
          if Not FindField('AP_DEVICETYPE').IsNull then
          begin
            case FindField('AP_DEVICETYPE').AsString[1] of
                '0' : Cells[1,nRow] := '업데이트방식';
                '1' : Cells[1,nRow] := '카드리더방식';
                '2' : Cells[1,nRow] := '버튼구분방식';
            end;
          end;
          Cells[2,nRow] := FindField('AP_ATSTARTBUTTON').AsString;
          Cells[3,nRow] := FindField('AP_ATOFFBUTTON').AsString;
          if Not FindField('AP_INOUTDEVICETYPE').IsNull then
          begin
            case FindField('AP_INOUTDEVICETYPE').AsString[1] of
                '0' : Cells[4,nRow] := '사용안함';
                '1' : Cells[4,nRow] := '카드리더방식';
                '2' : Cells[4,nRow] := '버튼구분방식';
            end;
          end;
          //Cells[4,nRow] := FindField('AP_NAME').AsString;
          Cells[5,nRow] := FindField('AP_WORKOUTBUTTON').AsString;
          Cells[6,nRow] := FindField('AP_WORKINBUTTON').AsString;
          Cells[7,nRow] := FindField('AP_CODE').AsString;
          Cells[8,nRow] := FindField('AP_DEVICETYPE').AsString;
          Cells[9,nRow] := FindField('AP_INOUTDEVICETYPE').AsString;
          if (FindField('AP_CODE').AsString )  = aCode then
          begin
            SelectRows(nRow,1);
          end;

        end;
        Application.ProcessMessages;
        inc(nRow);
        Next;
      end;
      sg_ATPosiCodeClick(self);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmConfigSetting.SearchATWorkTypeList(aCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_ATWorkType,1);
  stSql := 'Select * from TB_ATTENDWORKTYPE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;

      sg_ATWorkType.RowCount := recordCount + 1;
      nRow := 1;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        with sg_ATWorkType do
        begin
          Cells[0,nRow] := FindField('AW_NAME').AsString;
          Cells[1,nRow] := FindField('AW_CODE').AsString;
          Cells[2,nRow] := FindField('AW_SATURDAYTYPE').AsString;
          Cells[3,nRow] := FindField('AW_FIXATTYPE').AsString;
          Cells[4,nRow] := FindField('AW_NOTBACKUPTYPE').AsString;
          if (FindField('AW_CODE').AsString )  = aCode then
          begin
            SelectRows(nRow,1);
          end;

        end;
        Application.ProcessMessages;
        inc(nRow);
        Next;
      end;
      sg_ATWorkTypeClick(self);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmConfigSetting.SearchFoodCodeList(aCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stWorkTypeCode : string;
  stFoodType : string;
begin
  GridInit(sg_FoodCode,5);
  stFoodType := '1';
  stFoodType := copy(cmb_FoodType.Text,1,1);
  stSql := 'Select * from TB_FOODCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND RE_FDTYPE = ''' + stFoodType + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then
      begin
        Exit;
      end;

      sg_FoodCode.RowCount := recordCount + 1;
      nRow := 1;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        with sg_FoodCode do
        begin
          Cells[0,nRow] := FindField('FO_NAME').AsString;
          Cells[1,nRow] := FindField('FO_STARTTIME').AsString;
          Cells[2,nRow] := FindField('FO_ENDTIME').AsString;
          Cells[3,nRow] := FindField('FO_AMT').AsString;
          Cells[4,nRow] := FindField('FO_CODE').AsString;
          Cells[5,nRow] := FindField('FO_INITTIME').AsString;
          if (FindField('FO_CODE').AsString)  = aCode then
          begin
            SelectRows(nRow,1);
          end;

        end;
        Application.ProcessMessages;
        inc(nRow);
        Next;
      end;
      sg_FoodCodeClick(self);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmConfigSetting.sg_ATCodeClick(Sender: TObject);
var
  stTemp : string;
begin
  with sg_ATCode do
  begin
    ed_ATCodeName.Text := Cells[0,Row];
    ed_ATCodeAWCode.Text := AttendWorkType.Strings[cmb_ATWorkType.ItemIndex];
    ed_ATCode.Text := Cells[42,Row];

    stTemp := Cells[1,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_YsterdayHH.ItemIndex := cmb_YsterdayHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_YsterdayMM.ItemIndex := cmb_YsterdayMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[2,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_WorkStartHH.ItemIndex := cmb_WorkStartHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_WorkStartMM.ItemIndex := cmb_WorkStartMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[3,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_WorkENDHH.ItemIndex := cmb_WorkENDHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_WorkENDMM.ItemIndex := cmb_WorkENDMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[4,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_WorkINFROMHH.ItemIndex := cmb_WorkINFROMHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_WorkINFROMMM.ItemIndex := cmb_WorkINFROMMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[5,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_WorkINTOHH.ItemIndex := cmb_WorkINTOHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_WorkINTOMM.ItemIndex := cmb_WorkINTOMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[6,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_WorkEXTENDHH.ItemIndex := cmb_WorkEXTENDHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_WorkEXTENDMM.ItemIndex := cmb_WorkEXTENDMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[7,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_WorkNIGHTHH.ItemIndex := cmb_WorkNIGHTHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_WorkNIGHTMM.ItemIndex := cmb_WorkNIGHTMM.Items.IndexOf(copy(stTemp,3,2));

    ed_ExtendAdd.Text := Cells[12,Row];
    ed_NightAdd.Text := Cells[13,Row];

    stTemp := Cells[14,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_SWorkStartHH.ItemIndex := cmb_SWorkStartHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_SWorkStartMM.ItemIndex := cmb_SWorkStartMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[15,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_SWorkENDHH.ItemIndex := cmb_SWorkENDHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_SWorkENDMM.ItemIndex := cmb_SWorkENDMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[16,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_SWorkINFROMHH.ItemIndex := cmb_SWorkINFROMHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_SWorkINFROMMM.ItemIndex := cmb_SWorkINFROMMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[17,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_SWorkINTOHH.ItemIndex := cmb_SWorkINTOHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_SWorkINTOMM.ItemIndex := cmb_SWorkINTOMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[18,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_SWorkEXTENDHH.ItemIndex := cmb_SWorkEXTENDHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_SWorkEXTENDMM.ItemIndex := cmb_SWorkEXTENDMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[19,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_SWorkNIGHTHH.ItemIndex := cmb_SWorkNIGHTHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_SWorkNIGHTMM.ItemIndex := cmb_SWorkNIGHTMM.Items.IndexOf(copy(stTemp,3,2));

    ed_SExtendAdd.Text := Cells[24,Row];
    ed_SNightAdd.Text := Cells[25,Row];

    stTemp := Cells[26,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_HWorkStartHH.ItemIndex := cmb_HWorkStartHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_HWorkStartMM.ItemIndex := cmb_HWorkStartMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[27,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_HWorkENDHH.ItemIndex := cmb_HWorkENDHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_HWorkENDMM.ItemIndex := cmb_HWorkENDMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[28,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_HWorkINFROMHH.ItemIndex := cmb_HWorkINFROMHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_HWorkINFROMMM.ItemIndex := cmb_HWorkINFROMMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[29,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_HWorkINTOHH.ItemIndex := cmb_HWorkINTOHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_HWorkINTOMM.ItemIndex := cmb_HWorkINTOMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[30,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_HWorkEXTENDHH.ItemIndex := cmb_HWorkEXTENDHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_HWorkEXTENDMM.ItemIndex := cmb_HWorkEXTENDMM.Items.IndexOf(copy(stTemp,3,2));

    stTemp := Cells[31,Row];
    stTemp := StringReplace(stTemp,':','',[rfReplaceAll]);
    stTemp := FillZeroStrNum(stTemp,4);
    cmb_HWorkNIGHTHH.ItemIndex := cmb_HWorkNIGHTHH.Items.IndexOf(copy(stTemp,1,2));
    cmb_HWorkNIGHTMM.ItemIndex := cmb_HWorkNIGHTMM.Items.IndexOf(copy(stTemp,3,2));

    ed_HExtendAdd.Text := Cells[36,Row];
    ed_HNightAdd.Text := Cells[37,Row];
  end;
end;

procedure TfmConfigSetting.sg_ATCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = 40) or (Key = 13) then
  begin
    if sg_ATCode.Row = sg_ATCode.RowCount - 1 then
    begin
      if sg_ATCode.Cells[1,sg_ATCode.Row] <> '' then
      begin
        sg_ATCode.AddRow;
      end;
    end;
  end;

end;

procedure TfmConfigSetting.sg_ATPosiCodeClick(Sender: TObject);
begin
  inherited;
  FormClear;
  with sg_ATPosiCode do
  begin
    ed_name.Text := Cells[0,Row];
    ed_Code.Text := Cells[7,Row];
    if isDigit(Cells[8,Row]) then
      cmb_DeviceType.ItemIndex := strtoint(Cells[8,Row]);
    ed_AtDeviceType.Text := Cells[8,Row];
    ed_ATSTARTBUTTON.Text := Cells[2,Row];
    ed_ATOFFBUTTON.Text := Cells[3,Row];
    if isDigit(Cells[9,Row]) then
      cmb_ATInOut.ItemIndex := strtoint(Cells[9,Row]);
    ed_ATINOUTDeviceType.Text := Cells[9,Row];
    ed_WorkOutButton.Text := Cells[5,Row];
    ed_WorkInButton.Text := Cells[6,Row];
    cmb_DeviceTypeChange(self);
    cmb_ATInOutChange(self);
  end;
end;

procedure TfmConfigSetting.sg_ATPosiCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = 40) or (Key = 13) then
  begin
    if sg_ATPosiCode.Row = sg_ATPosiCode.RowCount - 1 then
    begin
      if sg_ATPosiCode.Cells[0,sg_ATPosiCode.Row] <> '' then
      begin
        sg_ATPosiCode.AddRow;
      end;
    end;
  end;

end;

procedure TfmConfigSetting.sg_ATWorkTypeClick(Sender: TObject);
begin
  inherited;
  ed_ATWorkTypeName.Text := '';
  ed_ATWorkTypeCode.Text := '';
  cmb_Saturday.ItemIndex := 0;
  cmb_absence.ItemIndex := 0;
  cmb_NotBack.ItemIndex := 0;

  with sg_ATWorkType do
  begin
    ed_ATWorkTypeName.Text := Cells[0,Row];
    ed_ATWorkTypeCode.Text := Cells[1,Row];
    if isDigit(Cells[2,Row]) then
      cmb_Saturday.ItemIndex := strtoint(Cells[2,Row]);
    if isDigit(Cells[3,Row]) then
      cmb_absence.ItemIndex := strtoint(Cells[3,Row]);
    if isDigit(Cells[4,Row]) then
      cmb_NotBack.ItemIndex := strtoint(Cells[4,Row]);
  end;

end;

procedure TfmConfigSetting.sg_ATWorkTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = 40) or (Key = 13) then
  begin
    if sg_ATWorkType.Row = sg_ATWorkType.RowCount - 1 then
    begin
      if sg_ATWorkType.Cells[1,sg_ATWorkType.Row] <> '' then
      begin
        sg_ATWorkType.AddRow;
      end;
    end;
  end;

end;

procedure TfmConfigSetting.sg_FoodCodeClick(Sender: TObject);
begin
  inherited;
//
  with sg_FoodCode do
  begin
    ed_FoodName.Text := Cells[0,Row];
    ed_FoodStartTime.Text := Cells[1,Row];
    ed_FoodEndTime.Text := Cells[2,Row];
    ed_FoodAmt.Text := Cells[3,Row];
    ed_FoodCode.Text := Cells[4,Row];
    ed_FoodOutTime.Text := Cells[5,Row];
  end;
end;

procedure TfmConfigSetting.sg_FoodCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Exit;
  if (Key = 40) or (Key = 13) then
  begin
    if sg_FoodCode.Row = sg_FoodCode.RowCount - 1 then
    begin
      if sg_FoodCode.Cells[1,sg_FoodCode.Row] <> '' then
      begin
        sg_FoodCode.AddRow;
      end;
    end;
  end;
end;

procedure TfmConfigSetting.btn_ATWorkTypeClick(Sender: TObject);
begin
  inherited;
  panATPosiCode.Visible := False;
  PanATWorkType.Visible := True;
  panATCode.Visible := False;
  PanATWorkType.Top := 34;
  PanATWorkType.Left := 135;
  SearchATWorkTypeList('');

end;

procedure TfmConfigSetting.btn_ATWorkTypeSaveClick(Sender: TObject);
var
  stCode : string;
begin
  inherited;
  if ed_ATWorkTypeCode.Text = '' then
  begin
    stCode := dmDBFunction.GetNextTB_ATTENDWORKTYPECode;
    dmDBInsert.InsertIntoTB_ATTENDWORKTYPE_VALUE(stCode,ed_ATWorkTypeName.Text,inttostr(cmb_NotBack.ItemIndex),inttostr(cmb_Saturday.ItemIndex),inttostr(cmb_absence.ItemIndex));
  end else
  begin
    stCode := ed_ATWorkTypeCode.Text;
    dmDBUpdate.UpdateTB_ATTENDWORKTYPE_VALUE(stCode,ed_ATWorkTypeName.Text,inttostr(cmb_NotBack.ItemIndex),inttostr(cmb_Saturday.ItemIndex),inttostr(cmb_absence.ItemIndex));;
  end;
  fmMain.LoadConfig;
  SearchATWorkTypeList(stCode);
end;

procedure TfmConfigSetting.btn_ATCodeSaveClick(Sender: TObject);
var
  stCode : string;
  stWorkTypeCode : string;
  stYesterDayTime : string;

  stWorkStartTime,stSWorkStartTime,stHWorkStartTime : string;
  stWorkEndTime,stSWorkEndTime,stHWorkEndTime : string;
  stInFromTime,stSInFromTime,stHInFromTime : string;
  stInToTime,stSInToTime,stHInToTime : string;
  stExtendTime,stSExtendTime,stHExtendTime : string;
  stNightTime,stSNightTime,stHNightTime : string;
  stExtendAdd,stSExtendAdd,stHExtendAdd : string;
  stNightAdd,stSNightAdd,stHNightAdd : string;
  stTemp : string;
begin
  inherited;

  stYesterDayTime := FillZeroStrNum(cmb_YsterdayHH.Text,2) + FillZeroStrNum(cmb_YsterdayMM.Text,2);

  stWorkStartTime := FillZeroStrNum(cmb_WorkStartHH.Text,2) + FillZeroStrNum(cmb_WorkStartMM.Text,2);
  stWorkEndTime := FillZeroStrNum(cmb_WorkEndHH.Text,2) + FillZeroStrNum(cmb_WorkEndMM.Text,2);
  stInFromTime := FillZeroStrNum(cmb_WorkINFROMHH.Text,2) + FillZeroStrNum(cmb_WorkINFROMMM.Text,2);
  stInToTime := FillZeroStrNum(cmb_WorkINToHH.Text,2) + FillZeroStrNum(cmb_WorkINToMM.Text,2);
  stExtendTime := FillZeroStrNum(cmb_WorkEXTENDHH.Text,2) + FillZeroStrNum(cmb_WorkEXTENDMM.Text,2);
  stNightTime := FillZeroStrNum(cmb_WorkNIGHTHH.Text,2) + FillZeroStrNum(cmb_WorkNIGHTMM.Text,2);
  if isDigit(ed_ExtendAdd.Text) then stExtendAdd := ed_ExtendAdd.Text
  else stExtendAdd := '0';
  if isDigit(ed_NightAdd.Text) then stNightAdd := ed_NightAdd.Text
  else stNightAdd := '0';

  stSWorkStartTime := FillZeroStrNum(cmb_SWorkStartHH.Text,2) + FillZeroStrNum(cmb_SWorkStartMM.Text,2);
  stSWorkEndTime := FillZeroStrNum(cmb_SWorkEndHH.Text,2) + FillZeroStrNum(cmb_SWorkEndMM.Text,2);
  stSInFromTime := FillZeroStrNum(cmb_SWorkINFROMHH.Text,2) + FillZeroStrNum(cmb_SWorkINFROMMM.Text,2);
  stSInToTime := FillZeroStrNum(cmb_SWorkINToHH.Text,2) + FillZeroStrNum(cmb_SWorkINToMM.Text,2);
  stSExtendTime := FillZeroStrNum(cmb_SWorkEXTENDHH.Text,2) + FillZeroStrNum(cmb_SWorkEXTENDMM.Text,2);
  stSNightTime := FillZeroStrNum(cmb_SWorkNIGHTHH.Text,2) + FillZeroStrNum(cmb_SWorkNIGHTMM.Text,2);
  if isDigit(ed_SExtendAdd.Text) then stSExtendAdd := ed_SExtendAdd.Text
  else stSExtendAdd := '0';
  if isDigit(ed_SNightAdd.Text) then stSNightAdd := ed_SNightAdd.Text
  else stSNightAdd := '0';

  stHWorkStartTime := FillZeroStrNum(cmb_HWorkStartHH.Text,2) + FillZeroStrNum(cmb_HWorkStartMM.Text,2);
  stHWorkEndTime := FillZeroStrNum(cmb_HWorkEndHH.Text,2) + FillZeroStrNum(cmb_HWorkEndMM.Text,2);
  stHInFromTime := FillZeroStrNum(cmb_HWorkINFROMHH.Text,2) + FillZeroStrNum(cmb_HWorkINFROMMM.Text,2);
  stHInToTime := FillZeroStrNum(cmb_HWorkINToHH.Text,2) + FillZeroStrNum(cmb_HWorkINToMM.Text,2);
  stHExtendTime := FillZeroStrNum(cmb_HWorkEXTENDHH.Text,2) + FillZeroStrNum(cmb_HWorkEXTENDMM.Text,2);
  stHNightTime := FillZeroStrNum(cmb_HWorkNIGHTHH.Text,2) + FillZeroStrNum(cmb_HWorkNIGHTMM.Text,2);
  if isDigit(ed_HExtendAdd.Text) then stHExtendAdd := ed_HExtendAdd.Text
  else stHExtendAdd := '0';
  if isDigit(ed_HNightAdd.Text) then stHNightAdd := ed_HNightAdd.Text
  else stHNightAdd := '0';


  if ed_ATCode.Text = '' then
  begin
    if cmb_ATWorkType.ItemIndex < 0 then
    begin
      showmessage('근무자타입선택이 잘못 되었습니다.');
      Exit;
    end;
    stWorkTypeCode := AttendWorkType.Strings[cmb_ATWorkType.ItemIndex];
    stCode := dmDBFunction.GetNextTB_ATTENDCODEValue(stWorkTypeCode);

    if dmDBFunction.CheckTB_ATTENDCODE_WorkStartTime(stWorkTypeCode,stCode,'1',stInFromTime,stInToTime,stTemp) = 1 then
    begin
      showmessage(stTemp + ' 와 출근 가능시간이 중복되었습니다.');
      Exit;
    end;

    (*aAWCode, aCode, aName,aYesterDayTime, aWorkStartTime,
  aWorkEndTime, aInFromTime, aInToTime, aExtendTime, aNightTime, aNormalAdd,
  aEarlyAdd, aJigakAdd, aJotaeAdd, aExtendAdd, aNightAdd, aSWorkStartTime,
  aSWorkEndTime, aSInFromTime, aSInToTime, aSExtendTime, aSNightTime,
  aSNormalAdd, aSEarlyAdd, aSJigakAdd, aSJotaeAdd, aSExtendAdd, aSNightAdd,
  aHWorkStartTime, aHWorkEndTime, aHInFromTime, aHInToTime, aHExtendTime,
  aHNightTime, aHNormalAdd, aHEarlyAdd, aHJigakAdd, aHJotaeAdd, aHExtendAdd,
  aHNightAdd, aOutRange, aSoutRange, aHoutRange*)

    dmDBInsert.InsertIntoTB_ATTENDCODE_VALUE(stWorkTypeCode,stCode,ed_ATCodeName.Text,stYesterDayTime,stWorkStartTime,stWorkEndTime,
               stInFromTime,stInToTime,stExtendTime,stNightTime,'0','0','0','0',stExtendAdd,stNightAdd,stSWorkStartTime,stSWorkEndTime,
               stSInFromTime,stSInToTime,stSExtendTime,stSNightTime,'0','0','0','0',stSExtendAdd,stSNightAdd,stHWorkStartTime,stHWorkEndTime,
               stHInFromTime,stHInToTime,stHExtendTime,stHNightTime,'0','0','0','0',stHExtendAdd,stHNightAdd,'0','0','0');
  end else
  begin
    stCode := ed_ATCode.Text;
    stWorkTypeCode := ed_ATCodeAWCode.Text;
    if dmDBFunction.CheckTB_ATTENDCODE_WorkStartTime(stWorkTypeCode,stCode,'1',stInFromTime,stInToTime,stTemp) = 1 then
    begin
      showmessage(stTemp + ' 와 출근 가능시간이 중복되었습니다.');
      Exit;
    end;
    dmDBUpdate.UpdateTB_ATTENDCODE_VALUE(stWorkTypeCode,stCode,ed_ATCodeName.Text,stYesterDayTime,stWorkStartTime,stWorkEndTime,
               stInFromTime,stInToTime,stExtendTime,stNightTime,'0','0','0','0',stExtendAdd,stNightAdd,stSWorkStartTime,stSWorkEndTime,
               stSInFromTime,stSInToTime,stSExtendTime,stSNightTime,'0','0','0','0',stSExtendAdd,stSNightAdd,stHWorkStartTime,stHWorkEndTime,
               stHInFromTime,stHInToTime,stHExtendTime,stHNightTime,'0','0','0','0',stHExtendAdd,stHNightAdd,'0','0','0');
  end;
  fmMain.LoadConfig;
  SearchATCodeList(stWorkTypeCode + stCode);
end;

procedure TfmConfigSetting.btn_FoodCodeAddClick(Sender: TObject);
var
  stFoodType : string;
  stFoodCode : string;
  stFoodUse : string;
  stFoodOutTime : string;
begin
  inherited;
  stFoodUse := inttostr(cmb_FoodUse.ItemIndex);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FOOD','USE','CO_CONFIGVALUE',stFoodUse);
  G_bFoodDupEvent := chk_DupFoodEvent.Checked;
  if G_bFoodDupEvent then
     dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FOOD','DUPEVENT','CO_CONFIGVALUE','1')
  else dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FOOD','DUPEVENT','CO_CONFIGVALUE','0');
  G_bFoodDedicateDoorUse := chk_FoodAutoGrade.Checked;
  if G_bFoodDedicateDoorUse then
     dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FDAUTO','CO_CONFIGVALUE','1')
  else dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FDAUTO','CO_CONFIGVALUE','0');
  if G_bFoodDedicateDoorUse then
  begin
    // --- 여기서 식수타입 도어 Company 권한 삭제
      dmDBDelete.DeleteTB_CARDPERMITCOMPANYGROUP_FDType;
    //--- 그룹 권한 삭제
      dmDBDelete.DeleteTB_CARDPERMITEMPLOYEEGROUP_FDType;
      // --- 식수권한 재작업
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FDTypeAdd;
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FDNotTypeDelete;
      dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_FDTypeAdd;
  end;

  stFoodType := copy(cmb_FoodType.Text,1,1);
  stFoodCode := ed_FoodCode.Text;
  if cmb_FoodType.ItemIndex < 0 then
  begin
    showmessage('식수타입선택이 잘못 되었습니다.');
    Exit;
  end;
  stFoodOutTime := ed_FoodEndTime.Text;
  if ed_FoodOutTime.Text <> '' then stFoodOutTime := FillZeroStrNum(ed_FoodOutTime.Text,4);

  if Not isDigit(stFoodCode) then
  begin
    stFoodCode := dmDBFunction.GetNextTB_FOODCODEValue(stFoodType);
    if Not IsDigit(ed_FoodStartTime.Text) then ed_FoodStartTime.Text := '0000';
    if Not IsDigit(ed_FoodEndTime.Text) then ed_FoodEndTime.Text := '0000';
    dmDBInsert.InsertIntoTB_FOODCODE_VALUE(stFoodType,stFoodCode,ed_FoodName.Text,ed_FoodStartTime.Text,ed_FoodEndTime.Text,ed_FoodAmt.Text,stFoodOutTime);
  end else
  begin
    dmDBUpdate.UpdateTB_FOODCODE_VALUE(stFoodType,stFoodCode,ed_FoodName.Text,ed_FoodStartTime.Text,ed_FoodEndTime.Text,ed_FoodAmt.Text,stFoodOutTime);
  end;
  fmMain.LoadConfig;
  SearchFoodCodeList(stFoodCode);
end;

procedure TfmConfigSetting.btn_FoodCodeDeleteClick(Sender: TObject);
begin
  inherited;
  if Not isDigit(ed_FoodCode.Text) then
  begin
    SearchFoodCodeList('');
    Exit;
  end;
  dmDBDelete.DeleteTB_FoodCode_Value(copy(cmb_FoodType.Text,1,1),ed_FoodCode.Text);
  fmMain.LoadConfig;
  SearchFoodCodeList('');
end;

procedure TfmConfigSetting.btn_FoodTypeAddClick(Sender: TObject);
var
  nIndex : integer;
begin
  inherited;
  fmFoodType := TfmFoodType.Create(nil);
  fmFoodType.ShowModal;
  fmFoodType.Free;
  nIndex := cmb_FoodType.ItemIndex;
  LoadFoodTypeCode(TComboBox(cmb_FoodType),False);
  if cmb_FoodType.Items.Count > nIndex  then cmb_FoodType.ItemIndex := nIndex;

end;

procedure TfmConfigSetting.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;

end;

initialization
  RegisterClass(TfmConfigSetting);
Finalization
  UnRegisterClass(TfmConfigSetting);

end.
