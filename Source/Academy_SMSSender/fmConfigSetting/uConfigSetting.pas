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
    AdvOfficePager1: TAdvOfficePager;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvPanelStyler1: TAdvPanelStyler;
    AdvOfficePage3: TAdvOfficePage;
    AdvSmoothPanel1: TAdvSmoothPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_CardRegistportSaveClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
  private
    { Private declarations }
  private
    { Private declarations }
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
  uMain;

{$R *.dfm}


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

procedure TfmConfigSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(con_FormAFSConfig);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;

  Action := caFree;
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
