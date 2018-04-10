unit uFormUtil;

interface

uses
  System.SysUtils, System.Classes,Vcl.Forms,uSubForm,AdvGlowButton,AdvToolBar,AdvPreviewMenu,
  AdvToolBarStylers,AdvPreviewMenuStylers,Vcl.ComCtrls,AdvOfficeTabSetStylers,AdvOfficeTabSet,
  W7Panels,AdvSmoothPanel,AdvSmoothLabel,AdvEdit,AdvGlassButton,AdvSmoothTabPager,AdvGrid,CurvyControls,
  Vcl.StdCtrls,Vcl.ExtCtrls,AdvPageControl,AdvPanel;

type
  TdmFormUtil = class(TDataModule)
  private
    { Private declarations }
    procedure TravelAdvEditStyleSetting(oControl:TAdvEdit;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelAdvGlassButtonStyleSetting(oControl:TAdvGlassButton;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelAdvPageControlStyleSetting(oControl:TAdvPageControl;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelAdvPageStyleSetting(oControl:TAdvPage;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelAdvPanelStyleSetting(oControl:TAdvPanel;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelAdvSmoothLabelStyleSetting(oControl:TAdvSmoothLabel;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelAdvSmoothPanelStyleSetting(oControl:TAdvSmoothPanel;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelAdvSmoothTabPagerStyleSetting(oControl:TAdvSmoothTabPager;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelAdvSmoothTabPageStyleSetting(oControl:TAdvSmoothTabPage;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelAdvStringGridStyleSetting(oControl:TAdvStringGrid;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelAdvTabSheetStyleSetting(oControl:TAdvTabSheet;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelAdvToolBarPagerStyleSetting(oControl : TAdvToolBarPager;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelAdvToolBarStyleSetting(oControl:TAdvToolBar;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelPanelStyleSetting(oControl:TPanel;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelTreeViewStyleSetting(oControl:TTreeView;oStyler:TAdvToolBarOfficeStyler);
    procedure TravelW7PanelStyleSetting(oControl :TW7Panel;oStyler:TAdvToolBarOfficeStyler);

  private
    { Public declarations }
    procedure TravelAdvEditFontSetting(oControl:TAdvEdit;aFontName,aFontSize:string);
    procedure TravelAdvGlassButtonFontSetting(oControl:TAdvGlassButton;aFontName,aFontSize:string);
    procedure TravelAdvPageFontSetting(oControl :TAdvPage; aFontName,aFontSize:string);
    procedure TravelAdvPanelFontSetting(oControl:TAdvPanel; aFontName,aFontSize:string);
    procedure TravelAdvSmoothLabelFontSetting(oControl:TAdvSmoothLabel;aFontName, aFontSize:string);
    procedure TravelAdvSmoothPanelFontSetting(oControl:TAdvSmoothPanel;aFontName,aFontSize:string);
    procedure TravelAdvSmoothTabPageFontSetting(oControl:TAdvSmoothTabPage;aFontName,aFontSize:string);
    procedure TravelAdvSmoothTabPagerFontSetting(oControl:TAdvSmoothTabPager;aFontName,aFontSize:string);
    procedure TravelAdvStringGridFontSetting(oControl:TAdvStringGrid;aFontName,aFontSize:string);
    procedure TravelAdvToolBarFontSetting(oControl:TAdvToolBar;aFontName,aFontSize:string);
    procedure TravelAdvToolBarPagerFontSetting(oControl:TAdvToolBarPager; aFontName,aFontSize:string);
    procedure TravelCurvyPanelFontSetting(oControl:TCurvyPanel;aFontName,aFontSize:string);
    procedure TravelPageControlFontSetting(oControl:TPageControl;aFontName,aFontSize:string);
    procedure TravelPanelFontSetting(oControl:TPanel;aFontName,aFontSize:string);
    procedure TravelTabSheetFontSetting(oControl:TTabSheet;aFontName,aFontSize:string);
    procedure TravelTreeViewFontSetting(oControl:TTreeView;aFontName, aFontSize:string);
    procedure TravelW7PanelFontSetting(oControl:TW7Panel; aFontName,aFontSize:string);
  public
    procedure TravelAdvPreviewMenuFontSetting(oControl:TAdvPreviewMenu; aFontName,aFontSize:string);
    procedure TravelAdvOfficeTabSetOfficeStylerFontSetting(oControl:TAdvOfficeTabSetOfficeStyler; aFontName,aFontSize:string);
    procedure TravelFormFontSetting(oControl:TfmASubForm;aFontName,aFontSize:string);
  public
    procedure TravelAdvToolBarPagerBitMapSetting(oControl:TAdvToolBarPager;aImageDir:string);
    procedure TravelAdvPreviewMenuBitMapSetting(oControl:TAdvPreviewMenu;aImageDir:string);
    procedure TravelAdvToolBarBitMapSetting(oControl:TAdvToolBar;aImageDir:string);
    procedure TravelAdvPageBitMapSetting(oControl:TAdvPage; aImageDir:string);
  public
    procedure FormAdvOfficeTabSetOfficeStylerSetting(oControl:TAdvOfficeTabSetOfficeStyler;aFormStyle:string);
    procedure FormAdvToolBarOfficeStylerSetting(oControl:TAdvToolBarOfficeStyler;aFormStyle:string);
    procedure FormAdvPreviewMenuOfficeStylerSetting(oControl:TAdvPreviewMenuOfficeStyler;aFormStyle:string);
    procedure FormStyleSetting(oControl:TfmASubForm;oStyler:TAdvToolBarOfficeStyler);
  end;

var
  dmFormUtil: TdmFormUtil;

implementation
uses
  uCommonFunction;
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmFormUtil }

procedure TdmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(
  oControl: TAdvOfficeTabSetOfficeStyler; aFormStyle: string);
var
  stFormStyle : string;
begin
  stFormStyle := UpperCase(aFormStyle);
  if stFormStyle = UpperCase('bsCustom') then oControl.Style := tsCustom
  else if stFormStyle = UpperCase('bsOffice2003Blue') then oControl.Style := tsOffice2003Blue
  else if stFormStyle = UpperCase('bsOffice2003Classic') then oControl.Style := tsOffice2003Classic
  else if stFormStyle = UpperCase('bsOffice2003Olive') then oControl.Style := tsOffice2003Olive
  else if stFormStyle = UpperCase('bsOffice2003Silver') then oControl.Style := tsOffice2003Silver
  else if stFormStyle = UpperCase('bsOffice2007Luna') then oControl.Style := tsOffice2007Luna
  else if stFormStyle = UpperCase('bsOffice2007Obsidian') then oControl.Style := tsOffice2007Obsidian
  else if stFormStyle = UpperCase('bsOffice2007Silver') then oControl.Style := tsOffice2007Silver
  else if stFormStyle = UpperCase('bsOffice2010Black') then oControl.Style := tsOffice2010Black
  else if stFormStyle = UpperCase('bsOffice2010Blue') then oControl.Style := tsOffice2010Blue
  else if stFormStyle = UpperCase('bsOffice2010Silver') then oControl.Style := tsOffice2010Silver
  else if stFormStyle = UpperCase('bsOfficeXP') then oControl.Style := tsWindowsXP
  else if stFormStyle = UpperCase('bsTerminal') then oControl.Style := tsTerminal
  else if stFormStyle = UpperCase('bsWhidbeyStyle') then oControl.Style := tsWindows7
  else if stFormStyle = UpperCase('bsWindows7') then oControl.Style := tsWindows7
  else if stFormStyle = UpperCase('bsWindowsVista') then oControl.Style := tsWindowsVista
  else if stFormStyle = UpperCase('bsWindowsXP') then oControl.Style := tsWindowsXP
  ;
end;

procedure TdmFormUtil.FormAdvPreviewMenuOfficeStylerSetting(
  oControl:TAdvPreviewMenuOfficeStyler;aFormStyle: string);
var
  stFormStyle : string;
begin
  stFormStyle := UpperCase(aFormStyle);
  if stFormStyle = UpperCase('bsCustom') then oControl.Style := TPreviewMenuStyle(psCustom)
  else if stFormStyle = UpperCase('bsOffice2003Blue') then oControl.Style := TPreviewMenuStyle(psOffice2003Blue)
  else if stFormStyle = UpperCase('bsOffice2003Classic') then oControl.Style := TPreviewMenuStyle(psOffice2003Classic)
  else if stFormStyle = UpperCase('bsOffice2003Olive') then oControl.Style := TPreviewMenuStyle(psOffice2003Olive)
  else if stFormStyle = UpperCase('bsOffice2003Silver') then oControl.Style := TPreviewMenuStyle(psOffice2003Silver)
  else if stFormStyle = UpperCase('bsOffice2007Luna') then oControl.Style := TPreviewMenuStyle(psOffice2007Luna)
  else if stFormStyle = UpperCase('bsOffice2007Obsidian') then oControl.Style := TPreviewMenuStyle(psOffice2007Obsidian)
  else if stFormStyle = UpperCase('bsOffice2007Silver') then oControl.Style := TPreviewMenuStyle(psOffice2007Silver)
  else if stFormStyle = UpperCase('bsOffice2010Black') then oControl.Style := TPreviewMenuStyle(psOffice2010Black)
  else if stFormStyle = UpperCase('bsOffice2010Blue') then oControl.Style := TPreviewMenuStyle(psOffice2010Blue)
  else if stFormStyle = UpperCase('bsOffice2010Silver') then oControl.Style := TPreviewMenuStyle(psOffice2010Silver)
  else if stFormStyle = UpperCase('bsOfficeXP') then oControl.Style := TPreviewMenuStyle(psOfficeXP)
  else if stFormStyle = UpperCase('bsTerminal') then oControl.Style := TPreviewMenuStyle(psTerminal)
  else if stFormStyle = UpperCase('bsWhidbeyStyle') then oControl.Style := TPreviewMenuStyle(psWhidbeyStyle)
  else if stFormStyle = UpperCase('bsWindows7') then oControl.Style := TPreviewMenuStyle(psWindows7)
  else if stFormStyle = UpperCase('bsWindowsVista') then oControl.Style := TPreviewMenuStyle(psWindowsVista)
  else if stFormStyle = UpperCase('bsWindowsXP') then oControl.Style := TPreviewMenuStyle(psWindowsXP)
  ;
end;

procedure TdmFormUtil.FormAdvToolBarOfficeStylerSetting(oControl:TAdvToolBarOfficeStyler;aFormStyle: string);
var
  stFormStyle : string;
begin
  stFormStyle := UpperCase(aFormStyle);
  if stFormStyle = UpperCase('bsCustom') then oControl.Style := bsCustom
  else if stFormStyle = UpperCase('bsOffice2003Blue') then oControl.Style := bsOffice2003Blue
  else if stFormStyle = UpperCase('bsOffice2003Classic') then oControl.Style := bsOffice2003Classic
  else if stFormStyle = UpperCase('bsOffice2003Olive') then oControl.Style := bsOffice2003Olive
  else if stFormStyle = UpperCase('bsOffice2003Silver') then oControl.Style := bsOffice2003Silver
  else if stFormStyle = UpperCase('bsOffice2007Luna') then oControl.Style := bsOffice2007Luna
  else if stFormStyle = UpperCase('bsOffice2007Obsidian') then oControl.Style := bsOffice2007Obsidian
  else if stFormStyle = UpperCase('bsOffice2007Silver') then oControl.Style := bsOffice2007Silver
  else if stFormStyle = UpperCase('bsOffice2010Black') then oControl.Style := bsOffice2010Black
  else if stFormStyle = UpperCase('bsOffice2010Blue') then oControl.Style := bsOffice2010Blue
  else if stFormStyle = UpperCase('bsOffice2010Silver') then oControl.Style := bsOffice2010Silver
  else if stFormStyle = UpperCase('bsOfficeXP') then oControl.Style := bsOfficeXP
  else if stFormStyle = UpperCase('bsTerminal') then oControl.Style := bsTerminal
  else if stFormStyle = UpperCase('bsWhidbeyStyle') then oControl.Style := bsWhidbeyStyle
  else if stFormStyle = UpperCase('bsWindows7') then oControl.Style := bsWindows7
  else if stFormStyle = UpperCase('bsWindowsVista') then oControl.Style := bsWindowsVista
  else if stFormStyle = UpperCase('bsWindowsXP') then oControl.Style := bsWindowsXP
  ;
end;


procedure TdmFormUtil.FormStyleSetting(oControl: TfmASubForm;
  oStyler: TAdvToolBarOfficeStyler);
var
  Loop : Integer;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageStyleSetting(TAdvPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerStyleSetting(TAdvToolBarPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelStyleSetting(TW7Panel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelStyleSetting(TAdvSmoothPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelStyleSetting(TAdvSmoothLabel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarStyleSetting(TAdvToolBar(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewStyleSetting(TTreeView(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditStyleSetting(TAdvEdit(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonStyleSetting(TAdvGlassButton(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerStyleSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageStyleSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridStyleSetting(TAdvStringGrid(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelStyleSetting(TPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPageControl then
      begin
        TravelAdvPageControlStyleSetting(TAdvPageControl(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvTabSheet then
      begin
        TravelAdvTabSheetStyleSetting(TAdvTabSheet(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelStyleSetting(TAdvPanel(oControl.Controls[Loop]),oStyler);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvEditFontSetting(oControl: TAdvEdit; aFontName,
  aFontSize: string);
begin
  if aFontName <> '' then
    oControl.Font.Name := aFontName;
  if isDigit(aFontSize) then
    oControl.Font.Size := strtoint(aFontSize);

end;

procedure TdmFormUtil.TravelAdvEditStyleSetting(oControl: TAdvEdit;
  oStyler: TAdvToolBarOfficeStyler);
begin

end;

procedure TdmFormUtil.TravelAdvGlassButtonFontSetting(oControl: TAdvGlassButton;
  aFontName, aFontSize: string);
begin
  if aFontName <> '' then
    oControl.Font.Name := aFontName;
  if isDigit(aFontSize) then
    oControl.Font.Size := strtoint(aFontSize);
end;

procedure TdmFormUtil.TravelAdvGlassButtonStyleSetting(
  oControl: TAdvGlassButton; oStyler: TAdvToolBarOfficeStyler);
begin

end;

procedure TdmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(
  oControl: TAdvOfficeTabSetOfficeStyler; aFontName, aFontSize: string);
var
  Loop : Integer;
begin
  if aFontName <> '' then
    oControl.TabAppearance.Font.Name := aFontName;
  if isDigit(aFontSize) then
    oControl.TabAppearance.Font.Size := strtoint(aFontSize);

end;

procedure TdmFormUtil.TravelAdvPageBitMapSetting(oControl: TAdvPage;
  aImageDir: string);
var
  Loop : Integer;
  stName : string;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    stName := oControl.Controls[Loop].Name;
    if oControl.Controls[Loop] is TAdvGlowButton then
    begin
      stName := aImageDir + '\M' + FillZeroNumber(TAdvGlowButton(oControl.Controls[Loop]).ImageIndex,2) + '.bmp' ;
      if FileExists(stName) then
         TAdvGlowButton(oControl.Controls[Loop]).Picture.LoadFromFile(stName);
    end else if oControl.Controls[Loop] is TAdvToolBar then
    begin
      TravelAdvToolBarBitMapSetting(TAdvToolBar(oControl.Controls[Loop]),aImageDir);
    end else if oControl.Controls[Loop] is TAdvPage then
    begin
      stName := TAdvPage(oControl.Controls[Loop]).Name ;
      TravelAdvPageBitMapSetting(TAdvPage(oControl.Controls[Loop]), aImageDir);
    end;
  end;
end;

procedure TdmFormUtil.TravelAdvPageControlStyleSetting(
  oControl: TAdvPageControl; oStyler: TAdvToolBarOfficeStyler);
var
  Loop : integer;
  stName : string;
begin
  oControl.TabBackGroundColor := oStyler.GlowButtonAppearance.Color;

  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageStyleSetting(TAdvPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerStyleSetting(TAdvToolBarPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelStyleSetting(TW7Panel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelStyleSetting(TAdvSmoothPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelStyleSetting(TAdvSmoothLabel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarStyleSetting(TAdvToolBar(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewStyleSetting(TTreeView(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditStyleSetting(TAdvEdit(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonStyleSetting(TAdvGlassButton(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerStyleSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageStyleSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridStyleSetting(TAdvStringGrid(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelStyleSetting(TPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPageControl then
      begin
        TravelAdvPageControlStyleSetting(TAdvPageControl(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvTabSheet then
      begin
        TravelAdvTabSheetStyleSetting(TAdvTabSheet(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelStyleSetting(TAdvPanel(oControl.Controls[Loop]),oStyler);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvPageFontSetting(oControl: TAdvPage; aFontName,
  aFontSize: string);
var
  Loop : Integer;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvPageStyleSetting(oControl: TAdvPage;
  oStyler: TAdvToolBarOfficeStyler);
begin

end;

procedure TdmFormUtil.TravelAdvPanelFontSetting(oControl: TAdvPanel; aFontName,
  aFontSize: string);
var
  Loop : Integer;
begin
  if aFontName <> '' then
    oControl.Font.Name := aFontName;
  if isDigit(aFontSize) then
    oControl.Font.Size := strtoint(aFontSize);

  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvPanelStyleSetting(oControl: TAdvPanel;
  oStyler: TAdvToolBarOfficeStyler);
var
  Loop : Integer;
begin
  oControl.Color := oStyler.GlowButtonAppearance.Color;
  oControl.ColorTo := oStyler.GlowButtonAppearance.ColorTo;
  oControl.ColorMirror := oStyler.GlowButtonAppearance.ColorMirror;
  oControl.ColorMirrorTo := oStyler.GlowButtonAppearance.ColorMirrorTo;

  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageStyleSetting(TAdvPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerStyleSetting(TAdvToolBarPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelStyleSetting(TW7Panel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelStyleSetting(TAdvSmoothPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelStyleSetting(TAdvSmoothLabel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarStyleSetting(TAdvToolBar(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewStyleSetting(TTreeView(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditStyleSetting(TAdvEdit(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonStyleSetting(TAdvGlassButton(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerStyleSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageStyleSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridStyleSetting(TAdvStringGrid(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelStyleSetting(TPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPageControl then
      begin
        TravelAdvPageControlStyleSetting(TAdvPageControl(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvTabSheet then
      begin
        TravelAdvTabSheetStyleSetting(TAdvTabSheet(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelStyleSetting(TAdvPanel(oControl.Controls[Loop]),oStyler);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvPreviewMenuBitMapSetting(
  oControl: TAdvPreviewMenu; aImageDir: string);
var
  Loop : Integer;
  stName : string;
begin
  For Loop:=0 to oControl.MenuItems.Count - 1 do
  begin
    stName := aImageDir + '\M' + FillZeroNumber(oControl.MenuItems[Loop].ImageIndex,2) + '.bmp' ;
    if FileExists(stName) then
       oControl.MenuItems[Loop].Picture.LoadFromFile(stName);

  end;
end;

procedure TdmFormUtil.TravelAdvPreviewMenuFontSetting(oControl: TAdvPreviewMenu;
  aFontName, aFontSize: string);
begin
  if aFontName <> '' then
    TAdvPreviewMenu(oControl).MenuFont.Name := aFontName;
  if IsDigit(aFontSize) then
    TAdvPreviewMenu(oControl).MenuFont.Size := strtoint(aFontSize);
end;

procedure TdmFormUtil.TravelAdvSmoothLabelFontSetting(oControl: TAdvSmoothLabel;
  aFontName, aFontSize: string);
begin
  if aFontName <> '' then
    TAdvSmoothLabel(oControl).Caption.Font.Name := aFontName;
  if IsDigit(aFontSize) then
    TAdvSmoothLabel(oControl).Caption.Font.Size := strtoint(aFontSize);

end;

procedure TdmFormUtil.TravelAdvSmoothLabelStyleSetting(
  oControl: TAdvSmoothLabel; oStyler: TAdvToolBarOfficeStyler);
begin

end;

procedure TdmFormUtil.TravelAdvSmoothPanelFontSetting(oControl: TAdvSmoothPanel;
  aFontName, aFontSize: string);
var
  Loop : Integer;
  stName : string;
begin
  if aFontName <> '' then
    TAdvSmoothPanel(oControl).Caption.Font.Name := aFontName;
  if IsDigit(aFontSize) then
    TAdvSmoothPanel(oControl).Caption.Font.Size := strtoint(aFontSize);

  if oControl.Name = 'pan_emPermitAdmin' then
  begin
    stName := oControl.Name;
  end;

  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvSmoothPanelStyleSetting(
  oControl: TAdvSmoothPanel; oStyler: TAdvToolBarOfficeStyler);
var
  Loop : Integer;
begin
  oControl.Fill.Color := oStyler.GlowButtonAppearance.Color;
  oControl.Fill.ColorTo := oStyler.GlowButtonAppearance.ColorTo;
  oControl.Fill.FocusColor := oStyler.GlowButtonAppearance.ColorHot;
  oControl.Fill.ColorMirror := oStyler.GlowButtonAppearance.ColorMirror;
  oControl.Fill.ColorMirrorTo := oStyler.GlowButtonAppearance.ColorMirrorTo;

  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageStyleSetting(TAdvPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerStyleSetting(TAdvToolBarPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelStyleSetting(TW7Panel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelStyleSetting(TAdvSmoothPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelStyleSetting(TAdvSmoothLabel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarStyleSetting(TAdvToolBar(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewStyleSetting(TTreeView(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditStyleSetting(TAdvEdit(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonStyleSetting(TAdvGlassButton(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerStyleSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageStyleSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridStyleSetting(TAdvStringGrid(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelStyleSetting(TPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPageControl then
      begin
        TravelAdvPageControlStyleSetting(TAdvPageControl(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvTabSheet then
      begin
        TravelAdvTabSheetStyleSetting(TAdvTabSheet(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelStyleSetting(TAdvPanel(oControl.Controls[Loop]),oStyler);
      end;
    Except
      continue;
    End;
  end;

end;

procedure TdmFormUtil.TravelAdvSmoothTabPageFontSetting(
  oControl: TAdvSmoothTabPage; aFontName, aFontSize: string);
var
  Loop : Integer;
begin
  if aFontName <> '' then
    oControl.TabAppearance.Appearance.Font.Name := aFontName;
  if isDigit(aFontSize) then
    oControl.TabAppearance.Appearance.Font.Size := strtoint(aFontSize);

  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;

end;

procedure TdmFormUtil.TravelAdvSmoothTabPagerFontSetting(
  oControl: TAdvSmoothTabPager; aFontName, aFontSize: string);
var
  Loop : integer;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvSmoothTabPagerStyleSetting(
  oControl: TAdvSmoothTabPager; oStyler: TAdvToolBarOfficeStyler);
var
  Loop : Integer;
begin
  oControl.Fill.Color := oStyler.GlowButtonAppearance.Color;
  oControl.Fill.ColorTo := oStyler.GlowButtonAppearance.ColorTo;
  oControl.Fill.FocusColor := oStyler.GlowButtonAppearance.ColorHot;
  oControl.Fill.ColorMirror := oStyler.GlowButtonAppearance.ColorMirror;
  oControl.Fill.ColorMirrorTo := oStyler.GlowButtonAppearance.ColorMirrorTo;
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageStyleSetting(TAdvPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerStyleSetting(TAdvToolBarPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelStyleSetting(TW7Panel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelStyleSetting(TAdvSmoothPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelStyleSetting(TAdvSmoothLabel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarStyleSetting(TAdvToolBar(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewStyleSetting(TTreeView(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditStyleSetting(TAdvEdit(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonStyleSetting(TAdvGlassButton(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerStyleSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageStyleSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridStyleSetting(TAdvStringGrid(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelStyleSetting(TPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPageControl then
      begin
        TravelAdvPageControlStyleSetting(TAdvPageControl(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvTabSheet then
      begin
        TravelAdvTabSheetStyleSetting(TAdvTabSheet(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelStyleSetting(TAdvPanel(oControl.Controls[Loop]),oStyler);
      end;
    Except
      continue;
    End;
  end;

end;

procedure TdmFormUtil.TravelAdvSmoothTabPageStyleSetting(
  oControl: TAdvSmoothTabPage; oStyler: TAdvToolBarOfficeStyler);
var
  Loop : Integer;
begin
  oControl.PageAppearance.Color := oStyler.GlowButtonAppearance.Color;
  oControl.PageAppearance.ColorTo := oStyler.GlowButtonAppearance.ColorTo;
  oControl.PageAppearance.FocusColor := oStyler.GlowButtonAppearance.ColorHot;
  oControl.PageAppearance.ColorMirror := oStyler.GlowButtonAppearance.ColorMirror;
  oControl.PageAppearance.ColorMirrorTo := oStyler.GlowButtonAppearance.ColorMirrorTo;
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageStyleSetting(TAdvPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerStyleSetting(TAdvToolBarPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelStyleSetting(TW7Panel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelStyleSetting(TAdvSmoothPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelStyleSetting(TAdvSmoothLabel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarStyleSetting(TAdvToolBar(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewStyleSetting(TTreeView(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditStyleSetting(TAdvEdit(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonStyleSetting(TAdvGlassButton(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerStyleSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageStyleSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridStyleSetting(TAdvStringGrid(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelStyleSetting(TPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPageControl then
      begin
        TravelAdvPageControlStyleSetting(TAdvPageControl(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvTabSheet then
      begin
        TravelAdvTabSheetStyleSetting(TAdvTabSheet(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelStyleSetting(TAdvPanel(oControl.Controls[Loop]),oStyler);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvStringGridFontSetting(oControl: TAdvStringGrid;
  aFontName, aFontSize: string);
begin
  if aFontName <> '' then
  begin
    oControl.Font.Name := aFontName;
    oControl.FixedFont.Name := aFontName;
  end;
  if isDigit(aFontSize) then
  begin
    oControl.Font.Size := strtoint(aFontSize);
    oControl.FixedFont.Size := strtoint(aFontSize);
  end;
end;

procedure TdmFormUtil.TravelAdvStringGridStyleSetting(oControl: TAdvStringGrid;
  oStyler: TAdvToolBarOfficeStyler);
begin

end;

procedure TdmFormUtil.TravelAdvTabSheetStyleSetting(oControl: TAdvTabSheet;
  oStyler: TAdvToolBarOfficeStyler);
var
  Loop : integer;
begin
  TAdvTabSheet(oControl).Color := oStyler.GlowButtonAppearance.Color;
  TAdvTabSheet(oControl).ColorTo := oStyler.GlowButtonAppearance.ColorTo;
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageStyleSetting(TAdvPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerStyleSetting(TAdvToolBarPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelStyleSetting(TW7Panel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelStyleSetting(TAdvSmoothPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelStyleSetting(TAdvSmoothLabel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarStyleSetting(TAdvToolBar(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewStyleSetting(TTreeView(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditStyleSetting(TAdvEdit(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonStyleSetting(TAdvGlassButton(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerStyleSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageStyleSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridStyleSetting(TAdvStringGrid(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelStyleSetting(TPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPageControl then
      begin
        TravelAdvPageControlStyleSetting(TAdvPageControl(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvTabSheet then
      begin
        TravelAdvTabSheetStyleSetting(TAdvTabSheet(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelStyleSetting(TAdvPanel(oControl.Controls[Loop]),oStyler);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvToolBarBitMapSetting(oControl: TAdvToolBar;
  aImageDir: string);
var
  Loop : Integer;
  stName : string;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        stName := aImageDir + '\M' + FillZeroNumber(TAdvGlowButton(oControl.Controls[Loop]).ImageIndex,2) + '.bmp' ;
        if FileExists(stName) then
           TAdvGlowButton(oControl.Controls[Loop]).Picture.LoadFromFile(stName);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarBitMapSetting(TAdvToolBar(oControl.Controls[Loop]),aImageDir);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvToolBarFontSetting(oControl: TAdvToolBar;
  aFontName, aFontSize: string);
var
  Loop : Integer;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvToolBarPagerBitMapSetting(
  oControl: TAdvToolBarPager; aImageDir: string);
var
  Loop : Integer;
  stName : string;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        stName := aImageDir + '\M' + FillZeroNumber(TAdvGlowButton(oControl.Controls[Loop]).ImageIndex,2) + '.bmp' ;
        if FileExists(stName) then
           TAdvGlowButton(oControl.Controls[Loop]).Picture.LoadFromFile(stName);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        stName := TAdvPage(oControl.Controls[Loop]).Name ;
        TravelAdvPageBitMapSetting(TAdvPage(oControl.Controls[Loop]), aImageDir);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerBitMapSetting(TAdvToolBarPager(oControl.Controls[Loop]), aImageDir);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvToolBarPagerFontSetting(
  oControl: TAdvToolBarPager; aFontName, aFontSize: string);
var
  Loop : Integer;
  i : integer;
begin
  for i := 0 to TAdvToolBarPager(oControl).TabGroups.Count - 1 do
  begin
    if aFontName <> '' then
    begin
      TAdvToolBarPager(oControl).TabGroups.Items[i].GroupAppearance.Font.Name := aFontName;
      TAdvToolBarPager(oControl).TabGroups.Items[i].GroupAppearance.TabAppearance.Font.Name := aFontName;
    end;
    if IsDigit(aFontSize) then
    begin
      TAdvToolBarPager(oControl).TabGroups.Items[i].GroupAppearance.Font.Size := strtoint(aFontSize);
      TAdvToolBarPager(oControl).TabGroups.Items[i].GroupAppearance.TabAppearance.Font.Size := strtoint(aFontSize);
    end;

  end;
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelAdvToolBarPagerStyleSetting(
  oControl: TAdvToolBarPager; oStyler: TAdvToolBarOfficeStyler);
begin

end;

procedure TdmFormUtil.TravelAdvToolBarStyleSetting(oControl: TAdvToolBar;
  oStyler: TAdvToolBarOfficeStyler);
begin

end;

procedure TdmFormUtil.TravelCurvyPanelFontSetting(oControl: TCurvyPanel;
  aFontName, aFontSize: string);
var
  Loop : Integer;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelFormFontSetting(oControl: TfmASubForm; aFontName,
  aFontSize: string);
var
  Loop : Integer;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;
end;


procedure TdmFormUtil.TravelPageControlFontSetting(oControl: TPageControl;
  aFontName, aFontSize: string);
var
  Loop : Integer;
begin
  if aFontName <> ''  then
    TPageControl(oControl).Font.Name := aFontName;
  if isDigit(aFontSize) then TPageControl(oControl).Font.Size := strtoint(aFontSize);

  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelPanelFontSetting(oControl: TPanel; aFontName,
  aFontSize: string);
var
  Loop : Integer;
begin
  if aFontName <> '' then
    oControl.Font.Name := aFontName;
  if isDigit(aFontSize) then
    oControl.Font.Size := strtoint(aFontSize);

  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelPanelStyleSetting(oControl: TPanel;
  oStyler: TAdvToolBarOfficeStyler);
var
  Loop : Integer;
begin
  TPanel(oControl).Color := oStyler.GlowButtonAppearance.Color;
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageStyleSetting(TAdvPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerStyleSetting(TAdvToolBarPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelStyleSetting(TW7Panel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelStyleSetting(TAdvSmoothPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelStyleSetting(TAdvSmoothLabel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarStyleSetting(TAdvToolBar(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewStyleSetting(TTreeView(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditStyleSetting(TAdvEdit(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonStyleSetting(TAdvGlassButton(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerStyleSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageStyleSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridStyleSetting(TAdvStringGrid(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelStyleSetting(TPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPageControl then
      begin
        TravelAdvPageControlStyleSetting(TAdvPageControl(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvTabSheet then
      begin
        TravelAdvTabSheetStyleSetting(TAdvTabSheet(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelStyleSetting(TAdvPanel(oControl.Controls[Loop]),oStyler);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelTabSheetFontSetting(oControl: TTabSheet; aFontName,
  aFontSize: string);
var
  Loop : Integer;
begin
  if aFontName <> '' then
    oControl.Font.Name := aFontName;
  if isDigit(aFontSize) then
    oControl.Font.Size := strtoint(aFontSize);
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;
end;

procedure TdmFormUtil.TravelTreeViewFontSetting(oControl: TTreeView; aFontName,
  aFontSize: string);
begin
  if aFontName <> '' then
    oControl.Font.Name := aFontName;
  if isDigit(aFontSize) then
    oControl.Font.Size := strtoint(aFontSize);
end;

procedure TdmFormUtil.TravelTreeViewStyleSetting(oControl: TTreeView;
  oStyler: TAdvToolBarOfficeStyler);
begin

end;

procedure TdmFormUtil.TravelW7PanelFontSetting(oControl: TW7Panel; aFontName,
  aFontSize: string);
var
  Loop : Integer;
  stName : string;
begin
  if aFontName <> '' then
    oControl.Font.Name := aFontName;
  if isDigit(aFontSize) then
    oControl.Font.Size := strtoint(aFontSize);

  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvGlowButton then
      begin
        if aFontName <> '' then
           TAdvGlowButton(oControl.Controls[Loop]).Font.Name := aFontName;
        if IsDigit(aFontSize) then
          TAdvGlowButton(oControl.Controls[Loop]).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageFontSetting(TAdvPage(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerFontSetting(TAdvToolBarPager(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelFontSetting(TW7Panel(oControl.Controls[Loop]), aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelFontSetting(TAdvSmoothPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelFontSetting(TAdvSmoothLabel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarFontSetting(TAdvToolBar(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewFontSetting(TTreeView(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditFontSetting(TAdvEdit(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonFontSetting(TAdvGlassButton(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerFontSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageFontSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridFontSetting(TAdvStringGrid(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TCurvyPanel then
      begin
        TravelCurvyPanelFontSetting(TCurvyPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TLabel then
      begin
        if aFontName <> ''  then
          TLabel(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TLabel(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPageControl then
      begin
        TravelPageControlFontSetting(TPageControl(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TTabSheet then
      begin
        TravelTabSheetFontSetting(TTabSheet(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TEdit then
      begin
        if aFontName <> ''  then
          TEdit(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TEdit(oControl).Font.Size := strtoint(aFontSize);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelFontSetting(TPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end else if oControl.Controls[Loop] is TListView then
      begin
        stName := TListView(oControl.Controls[Loop]).Name;
        if aFontName <> ''  then
          TListView(oControl).Font.Name := aFontName;
        if isDigit(aFontSize) then TListView(oControl).Font.Size := strtoint(aFontSize);
        TListView(oControl).Refresh;
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelFontSetting(TAdvPanel(oControl.Controls[Loop]),aFontName,aFontSize);
      end;
    Except
      continue;
    End;
  end;

end;

procedure TdmFormUtil.TravelW7PanelStyleSetting(oControl: TW7Panel;
  oStyler: TAdvToolBarOfficeStyler);
var
  Loop : Integer;
begin
  oControl.ColorA := oStyler.GlowButtonAppearance.Color;
  //oControl.ColorB := oStyler.GlowButtonAppearance.Color;
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    Try
      if oControl.Controls[Loop] is TAdvPage then
      begin
        TravelAdvPageStyleSetting(TAdvPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBarPager then
      begin
        TravelAdvToolBarPagerStyleSetting(TAdvToolBarPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TW7Panel then
      begin
        TravelW7PanelStyleSetting(TW7Panel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothPanel then
      begin
        TravelAdvSmoothPanelStyleSetting(TAdvSmoothPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothLabel then
      begin
        TravelAdvSmoothLabelStyleSetting(TAdvSmoothLabel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvToolBar then
      begin
        TravelAdvToolBarStyleSetting(TAdvToolBar(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TTreeView then
      begin
        TravelTreeViewStyleSetting(TTreeView(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvEdit then
      begin
        TravelAdvEditStyleSetting(TAdvEdit(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvGlassButton then
      begin
        TravelAdvGlassButtonStyleSetting(TAdvGlassButton(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPager then
      begin
        TravelAdvSmoothTabPagerStyleSetting(TAdvSmoothTabPager(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvSmoothTabPage then
      begin
        TravelAdvSmoothTabPageStyleSetting(TAdvSmoothTabPage(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvStringGrid then
      begin
        TravelAdvStringGridStyleSetting(TAdvStringGrid(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TPanel then
      begin
        TravelPanelStyleSetting(TPanel(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPageControl then
      begin
        TravelAdvPageControlStyleSetting(TAdvPageControl(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvTabSheet then
      begin
        TravelAdvTabSheetStyleSetting(TAdvTabSheet(oControl.Controls[Loop]),oStyler);
      end else if oControl.Controls[Loop] is TAdvPanel then
      begin
        TravelAdvPanelStyleSetting(TAdvPanel(oControl.Controls[Loop]),oStyler);
      end;
    Except
      continue;
    End;
  end;
end;

end.
