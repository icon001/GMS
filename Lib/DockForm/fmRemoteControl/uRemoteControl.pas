unit uRemoteControl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, W7Classes, W7Panels, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvSmoothPanel, Vcl.ExtCtrls, AdvSmoothLabel,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvToolBtn,ADODB,ActiveX, uSubForm, CommandArray, AdvCombo, AdvGroupBox,
  Vcl.Mask, AdvSpin, AdvOfficeButtons, AdvPanel, Vcl.ComCtrls, AdvListV,
  Vcl.ImgList, Vcl.Menus, AdvMenus, AdvExplorerTreeview, paramtreeview,
  Vcl.Clipbrd, Vcl.OleCtrls, SHDocVw, AdvToolBar, AdvToolBarStylers,
  AdvAppStyler, Vcl.Imaging.pngimage;


type
  TfmRemoteControl = class(TfmASubForm)
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    Image1: TImage;
    BodyPanel: TW7Panel;
    menuTab: TAdvOfficeTabSet;
    WebBrowser1: TWebBrowser;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    procedure menuTabChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure WebBrowser1NewWindow2(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    { Private declarations }
  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
    procedure FontSetting;
  end;

var
  fmRemoteControl: TfmRemoteControl;

implementation
uses
  uCommonVariable,
  uFormVariable,
  uFormUtil,
  uMain;

{$R *.dfm}



procedure TfmRemoteControl.FontSetting;
begin
  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
end;

procedure TfmRemoteControl.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfmRemoteControl.FormChangeEvent(aFormName: integer);
begin

end;

procedure TfmRemoteControl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  fmMain.FORMENABLE(conFORMREMOTECONTROL,'FALSE');


  Action := caFree;
end;

procedure TfmRemoteControl.FormCreate(Sender: TObject);
begin

  menuTab.ActiveTabIndex := 1;
  menuTabChange(self);
  WebBrowser1.Navigate('http://zeron.co.kr/help');
  FontSetting;
end;


procedure TfmRemoteControl.FormShow(Sender: TObject);
begin
  fmMain.FORMENABLE(conFORMREMOTECONTROL,'TRUE');
end;


procedure TfmRemoteControl.menuTabChange(Sender: TObject);
var
  stBuildingCode : string;
  stAreaCode : string;
  nIndex : integer;
begin
  if menuTab.ActiveTabIndex = 0 then //Ȩ
  begin
    if menuTab.AdvOfficeTabs.Items[0].Caption = '닫기' then Close
    else
    begin
      menuTab.ActiveTabIndex := 1;
      menuTabChange(self);
    end;
  end;
end;



procedure TfmRemoteControl.WebBrowser1NewWindow2(ASender: TObject;
  var ppDisp: IDispatch; var Cancel: WordBool);
begin
  inherited;
  Cancel := True;
end;

initialization
  RegisterClass(TfmRemoteControl);
Finalization
  UnRegisterClass(TfmRemoteControl);

end.
