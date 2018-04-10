unit uConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, AdvSpin,
  AdvGroupBox, AdvOfficeButtons,IniFiles,ActiveX,AdoDB, Vcl.Buttons,
  FolderDialog, Vcl.ComCtrls, AdvCombo;

type
  TfmConfig = class(TForm)
    btn_Save: TButton;
    btn_Close: TButton;
    FolderDialog1: TFolderDialog;
    PageControl1: TPageControl;
    tab_Decoder: TTabSheet;
    Label1: TLabel;
    se_DeamonStartNo: TAdvSpinEdit;
    Label2: TLabel;
    se_DeamonEndNo: TAdvSpinEdit;
    tab_Datebase: TTabSheet;
    rg_DataBaseBakup: TAdvOfficeRadioGroup;
    Label3: TLabel;
    ed_BackupDir: TEdit;
    btn_FileOpen: TSpeedButton;
    Label4: TLabel;
    ed_BackupCycle: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ed_ACEventDay: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    ed_PTEventDay: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    ed_backupTime: TEdit;
    Label11: TLabel;
    tab_Antipass: TTabSheet;
    tab_etc: TTabSheet;
    chk_CardLoading: TCheckBox;
    chk_ServerRestart: TCheckBox;
    Label12: TLabel;
    Label13: TLabel;
    ed_AntiInitTime: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    ed_AntiInitStart: TEdit;
    Label16: TLabel;
    ed_AntiInitEnd: TEdit;
    cmb_AntiInitUse: TAdvComboBox;
    chk_FileCreate: TCheckBox;
    chk_DeviceSync: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_FileOpenClick(Sender: TObject);
  private
    FServerStartNumber: integer;
    FServerEndNumber: integer;
    FCardPermitLoading: Boolean;
    FCardSync: Boolean;
    procedure SetServerStartNumber(const Value: integer);
    procedure SetServerEndNumber(const Value: integer);
    procedure SetCardPermitLoading(const Value: Boolean);
    procedure SetCardSync(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property CardSync : Boolean read FCardSync Write SetCardSync;
    property ServerStartNumber : integer read FServerStartNumber write SetServerStartNumber;
    property ServerEndNumber : integer read FServerEndNumber write SetServerEndNumber;
    property CardPermitLoading : Boolean read FCardPermitLoading write SetCardPermitLoading;
  end;

var
  fmConfig: TfmConfig;

implementation
uses
  uCommonVariable,
  uDBUpdate;
{$R *.dfm}

{ TfmConfig }

procedure TfmConfig.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmConfig.btn_FileOpenClick(Sender: TObject);
begin
  FolderDialog1.Caption := '백업 디렉토리 찾기';

  if FolderDialog1.Execute then
    ed_BackupDir.Text := FolderDialog1.Directory;

end;

procedure TfmConfig.btn_SaveClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  ServerStartNumber := se_DeamonStartNo.Value;
  ServerEndNumber := se_DeamonEndNo.Value;
  if rg_DataBaseBakup.ItemIndex = 1 then G_bDataBaseAutoBackup := True
  else G_bDataBaseAutoBackup := False;
  G_stDataBaseBackupDir := ed_BackupDir.Text;
  G_nDataBaseBackupCycle := strtoint(ed_BackupCycle.Text);
  G_nDataBaseACEventdeleteDay := strtoint(ed_ACEventDay.Text);
  G_nDataBasePTEventdeleteDay := strtoint(ed_PTEventDay.Text);
  G_stDataBaseBackupTime := ed_backupTime.Text ;
  CardPermitLoading := chk_CardLoading.Checked;
  G_bDaemonServerRestart := chk_ServerRestart.Checked;
  G_bBackupFileCreate := chk_FileCreate.Checked;
  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\Config.INI');
    ini_fun.WriteInteger('DECODER','STARTNO',ServerStartNumber);
    ini_fun.WriteInteger('DECODER','ENDNO',ServerEndNumber);
    ini_fun.WriteInteger('SERVER','DBBACKUP',rg_DataBaseBakup.ItemIndex);
    ini_fun.WriteString('SERVER','BACKUPDIR',G_stDataBaseBackupDir);
    if chk_CardLoading.Checked then ini_fun.WriteInteger('SERVER','CARDLOADING',1)
    else ini_fun.WriteInteger('SERVER','CARDLOADING',0);
    if chk_ServerRestart.Checked then ini_fun.WriteInteger('SERVER','RESTART',1)
    else ini_fun.WriteInteger('SERVER','RESTART',0);
    if chk_FileCreate.Checked then ini_fun.WriteInteger('SERVER','BACKUPFILECREATE',1)
    else ini_fun.WriteInteger('SERVER','BACKUPFILECREATE',0);

  Finally
    ini_fun.Free;
  End;
  dmDBUPdate.UpdateTB_CONFIG_Field_StringValue('DATABASE','BACKCYCLE','CO_CONFIGVALUE',ed_BackupCycle.Text);
  dmDBUPdate.UpdateTB_CONFIG_Field_StringValue('DATABASE','AC_DELETE','CO_CONFIGVALUE',ed_ACEventDay.Text);
  dmDBUPdate.UpdateTB_CONFIG_Field_StringValue('DATABASE','PT_DELETE','CO_CONFIGVALUE',ed_PTEventDay.Text);

  G_nAntiFreeTimeUse := cmb_AntiInitUse.ItemIndex;
  G_stAntiFreeTime := ed_AntiInitTime.Text;
  G_stGlobalAntiInitStartTime := ed_AntiInitStart.Text;
  G_stGlobalAntiInitEndTime := ed_AntiInitEnd.Text;
  dmDBUPdate.UpdateTB_CONFIG_Field_StringValue('ANTIPASS','ANTIFREE','CO_CONFIGVALUE',inttostr(G_nAntiFreeTimeUse));
  dmDBUPdate.UpdateTB_CONFIG_Field_StringValue('ANTIPASS','ANTIFREETIME','CO_CONFIGVALUE',G_stAntiFreeTime);
  dmDBUPdate.UpdateTB_CONFIG_Field_StringValue('ANTIPASS','ANTISTIME','CO_CONFIGVALUE',G_stGlobalAntiInitStartTime);
  dmDBUPdate.UpdateTB_CONFIG_Field_StringValue('ANTIPASS','ANTIETIME','CO_CONFIGVALUE',G_stGlobalAntiInitEndTime);

  G_bCardSync := chk_DeviceSync.Checked ;
  if G_bCardSync then dmDBUPdate.UpdateTB_CONFIG_Field_StringValue('CARD','SYNC','CO_CONFIGVALUE','1')
  else dmDBUPdate.UpdateTB_CONFIG_Field_StringValue('CARD','SYNC','CO_CONFIGVALUE','0');

end;

procedure TfmConfig.FormCreate(Sender: TObject);
begin
  if G_bDataBaseAutoBackup then
  begin
    rg_DataBaseBakup.ItemIndex := 1;
  end else
  begin
    rg_DataBaseBakup.ItemIndex := 0;
  end;
  ed_BackupDir.Text := G_stDataBaseBackupDir ;
  ed_BackupCycle.Text := inttostr(G_nDataBaseBackupCycle);
  ed_ACEventDay.Text := inttostr(G_nDataBaseACEventdeleteDay);
  ed_PTEventDay.Text := inttostr(G_nDataBasePTEventdeleteDay);
  ed_backupTime.Text := G_stDataBaseBackupTime;
  chk_ServerRestart.Checked := G_bDaemonServerRestart;
  cmb_AntiInitUse.ItemIndex := G_nAntiFreeTimeUse;
  ed_AntiInitTime.Text := G_stAntiFreeTime;
  ed_AntiInitStart.Text := G_stGlobalAntiInitStartTime;
  ed_AntiInitEnd.Text := G_stGlobalAntiInitEndTime;
  chk_FileCreate.Checked := G_bBackupFileCreate;
  chk_DeviceSync.Checked := G_bCardSync;

end;

procedure TfmConfig.SetCardPermitLoading(const Value: Boolean);
begin
  FCardPermitLoading := Value;
  chk_CardLoading.Checked := Value;
end;

procedure TfmConfig.SetCardSync(const Value: Boolean);
begin
  FCardSync := Value;

end;

procedure TfmConfig.SetServerEndNumber(const Value: integer);
begin
  if FServerEndNumber = Value then Exit;

  FServerEndNumber := Value;
  se_DeamonEndNo.Value := Value;
end;

procedure TfmConfig.SetServerStartNumber(const Value: integer);
begin
  if FServerStartNumber = Value then Exit;

  FServerStartNumber := Value;
  se_DeamonStartNo.Value := Value;
end;

end.
