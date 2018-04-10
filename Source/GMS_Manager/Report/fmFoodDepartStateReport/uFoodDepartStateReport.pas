﻿unit uFoodDepartStateReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, W7Classes, W7Panels, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvSmoothPanel, Vcl.ExtCtrls, AdvSmoothLabel,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvToolBtn,ADODB,ActiveX, uSubForm, CommandArray, AdvCombo, AdvGroupBox,
  Vcl.Mask, AdvSpin, AdvOfficeButtons, AdvPanel, Vcl.ComCtrls, AdvListV,
  Vcl.ImgList, Vcl.Menus, AdvMenus, AdvExplorerTreeview, paramtreeview,
  System.iniFiles, Vcl.Samples.Gauges,
  AdvSmoothTabPager, AdvGlassButton, AdvEdBtn, AdvToolBar, AdvToolBarStylers,
  Vcl.Imaging.pngimage, AdvGlowButton, AdvOfficePager, AdvOfficePagerStylers,
  AdvAppStyler;


const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmFoodDepartStateReport = class(TfmASubForm)
    Image1: TImage;
    BodyPanel: TAdvSmoothPanel;
    lb_SearchETCName: TAdvSmoothLabel;
    ImageList1: TImageList;
    pop_PermitAdd: TAdvPopupMenu;
    mn_addpermitListDelete: TMenuItem;
    toolslist: TImageList;
    ed_name: TAdvEdit;
    sg_report: TAdvStringGrid;
    SaveDialog1: TSaveDialog;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    AdvSmoothLabel2: TAdvSmoothLabel;
    dt_endDate: TDateTimePicker;
    dt_StartDate: TDateTimePicker;
    lb_PosiName: TAdvSmoothLabel;
    cmb_Posi: TAdvComboBox;
    lb_empType: TAdvSmoothLabel;
    cmb_EmpGubun: TAdvComboBox;
    lb_EtcSearch: TAdvSmoothLabel;
    cmb_ETC: TAdvComboBox;
    eb_CompanyName: TAdvEditBtn;
    ed_CompanyCode: TAdvEdit;
    ed_BuildingCode: TAdvEdit;
    cmb_FoodType: TAdvComboBox;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_SearchDate: TAdvSmoothLabel;
    lb_FoodType: TAdvSmoothLabel;
    lb_CompanyName: TAdvSmoothLabel;
    btn_Search: TAdvGlowButton;
    btn_Option: TAdvGlowButton;
    btn_Print: TAdvGlowButton;
    btn_Excel: TAdvGlowButton;
    pan_Option: TAdvSmoothPanel;
    lb_SearchOption: TLabel;
    gb_SearchOption: TAdvOfficeCheckGroup;
    btn_OptionSave: TAdvGlowButton;
    btn_OptionCancel: TAdvGlowButton;
    tv_AddCompanyCode: TTreeView;
    tv_AddCompanyName: TTreeView;
    MenuImageList16: TImageList;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_list: TAdvSmoothLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_AddNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ed_nameKeyPress(Sender: TObject; var Key: Char);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure cmb_ETCChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_OptionClick(Sender: TObject);
    procedure btn_OptionCancelClick(Sender: TObject);
    procedure btn_OptionSaveClick(Sender: TObject);
    procedure sg_reportColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure btn_SearchClick(Sender: TObject);
    procedure eb_CompanyNameClickBtn(Sender: TObject);
    procedure tv_AddCompanyNameDblClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
  private
    L_stMenuID : string;
    L_stCloseCaption : string;
    L_stAllName : string;
    BuildingCodeList : TStringList;
    CardStateList : TStringList;
    CompanyCodeList : TStringList;
    DoorCodeList : TStringList;
    PosiCodeList : TStringList;
    EmployeeGubunCodeList : TStringList;
    ReportHeaderNameList : TStringList;
    ReportFieldNameList : TStringList;
    FoodCodeList : TStringList;
    L_nMaxReportColCount : integer;
    L_nShowCount : integer;
    L_arrFoodEventReportIndexArray:Array of integer; //출입이벤트 리스트 순서 배열
    L_arrRelFoodEventReportIndexArray:Array of integer; //출입이벤트 실제 위치
    L_arrFoodEventReportShowTable : Array of integer;  //출입이벤트 조회 항목테이블
    L_arrFoodEventReportSizeTable : Array of integer;  //출입이벤트 Cell Size
    { Private declarations }
    function AttendReportHeaderNameSetting(aList: TAdvStringGrid):Boolean;
    function AttendReportFieldNameSetting:Boolean;
    procedure ChangeFoodEventReportIndex(FromIndex,ToIndex:integer);
    Function FormComboBoxInitialize:Boolean;
    Function FormGridInitialize:Boolean;
    Function FormNameSetting:Boolean;
    procedure FontSetting;
    Function MemoryCreate : Boolean;
    Function MemoryFree:Boolean;
    Function SearchReport:Boolean;
    function ReportCellHide(aList:TAdvStringGrid):Boolean;
    function ReportConfigRead:Boolean;
    function ReportHeaderNameSetting:Boolean;
    function WriteIniConfig:Boolean;

  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmFoodDepartStateReport: TfmFoodDepartStateReport;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uComboBoxCodeLoad,
  uDataBase,
  uFormFunction,
  uDBFunction,
  uDBSelect,
  uFormVariable,
  uFormUtil,
  uMain;

{$R *.dfm}


function TfmFoodDepartStateReport.AttendReportFieldNameSetting: Boolean;
begin
  ReportFieldNameList.Clear;
  ReportFieldNameList.Add('RE_FDTYPENAME');
  ReportFieldNameList.Add('COMPANYNAME1');
  //ReportFieldNameList.Add('COMPANYNAME2');
  //ReportFieldNameList.Add('COMPANYNAME3');
  //ReportFieldNameList.Add('PO_POSICODENAME');
  //ReportFieldNameList.Add('EM_CODE');
  //ReportFieldNameList.Add('EM_NAME');
  ReportFieldNameList.Add('FO_BREAK');
  ReportFieldNameList.Add('FO_LUNCH');
  ReportFieldNameList.Add('FO_DINNER');
  ReportFieldNameList.Add('FO_MIDNIGHT');
  ReportFieldNameList.Add('TOT');
  ReportFieldNameList.Add('FO_FOODAMT');
end;

function TfmFoodDepartStateReport.AttendReportHeaderNameSetting(
  aList: TAdvStringGrid): Boolean;
var
  i : integer;
begin
  aList.ColCount := ReportHeaderNameList.Count;
  for i := LOW(L_arrFoodEventReportIndexArray) to HIGH(L_arrFoodEventReportIndexArray) do
  begin
    if (aList.ColCount - 1) < i then Exit;
    if (ReportHeaderNameList.Count - 1) < i then Exit;

    aList.cells[L_arrFoodEventReportIndexArray[i],0] := ReportHeaderNameList[i];
  end;

end;

procedure TfmFoodDepartStateReport.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmFoodDepartStateReport.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
  btn_Excel.Enabled := False;
  aFileName:=dmFormFunction.GetFormName('4','1','BM3_031');
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      //sg_Report.SaveToXLS(stSaveFileName,True);
      if fileexists(stSaveFileName) then
        deletefile(stSaveFileName);
      if G_nReportFileFormat = 0 then sg_Report.SaveToXLS(stSaveFileName)
      else sg_Report.SaveToCSV(stSaveFileName);
//      sg_Report.SaveToXLS(stSaveFileName);
//      advgridexcelio1.XLSExport(stSaveFileName);
    end;
  end;
  btn_Excel.Enabled := IsUpdateGrade;

end;

procedure TfmFoodDepartStateReport.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmFoodDepartStateReport.btn_OptionCancelClick(Sender: TObject);
begin
  inherited;
  Pan_Option.Visible := False;
end;

procedure TfmFoodDepartStateReport.btn_OptionClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for i := LOW(L_arrFoodEventReportShowTable) to HIGH(L_arrFoodEventReportShowTable) do
  begin
    if i < gb_SearchOption.Items.Count then
    begin
      if L_arrFoodEventReportShowTable[i] = 1 then gb_SearchOption.Checked[i] := True
      else gb_SearchOption.Checked[i] := False;
    end;
  end;
  Pan_Option.Visible := True;
end;

procedure TfmFoodDepartStateReport.btn_OptionSaveClick(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\FoodDepartStateReport.INI');
    with ini_fun do
    begin
      for i := 0 to gb_SearchOption.Items.Count - 1 do
      begin
        if gb_SearchOption.Checked[i] then
        begin
          L_arrFoodEventReportShowTable[i] := 1;
          WriteInteger('FoodEventREPORT','RelAccessShowArray'+inttostr(i),1);
        end else
        begin
          L_arrFoodEventReportShowTable[i] := 0;
          WriteInteger('FoodEventREPORT','RelAccessShowArray'+inttostr(i),0);
        end;
      end;
    end;
  Finally
    ini_fun.Free;
  End;
  Pan_Option.Visible := False;
  ReportCellHide(sg_Report);
end;

procedure TfmFoodDepartStateReport.btn_PrintClick(Sender: TObject);
begin
  sg_Report.Print;
end;

procedure TfmFoodDepartStateReport.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchReport;
end;

procedure TfmFoodDepartStateReport.ChangeFoodEventReportIndex(FromIndex,
  ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelFoodEventReportIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelFoodEventReportIndexArray[i] := L_arrRelFoodEventReportIndexArray[i - 1];
    end;
    L_arrRelFoodEventReportIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelFoodEventReportIndexArray[i] := L_arrRelFoodEventReportIndexArray[i + 1];
    end;
    L_arrRelFoodEventReportIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelFoodEventReportIndexArray) to HIGH(L_arrRelFoodEventReportIndexArray) do
  begin
    L_arrFoodEventReportIndexArray[L_arrRelFoodEventReportIndexArray[i]] := i;
  end;

end;

procedure TfmFoodDepartStateReport.cmb_ETCChange(Sender: TObject);
begin
  inherited;
  lb_SearchETCName.Caption.Text := cmb_ETC.Text;
end;

procedure TfmFoodDepartStateReport.eb_CompanyNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_AddCompanyName.Visible := True;
  tv_AddCompanyName.Top := eb_CompanyName.Top + eb_CompanyName.Height;
  tv_AddCompanyName.Left := eb_CompanyName.Left;

end;

procedure TfmFoodDepartStateReport.ed_AddNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfmFoodDepartStateReport.ed_nameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
  end;

end;

procedure TfmFoodDepartStateReport.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1); *)

end;

procedure TfmFoodDepartStateReport.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfmFoodDepartStateReport.FormChangeEvent(aFormName: integer);
begin
end;

procedure TfmFoodDepartStateReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteIniConfig;

  fmMain.FORMENABLE(con_FormBMOSFOODSTATEREPORT,'FALSE');

  MemoryFree;
  Action := caFree;
end;

function TfmFoodDepartStateReport.FormComboBoxInitialize: Boolean;
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
begin
  stCompanyCode := copy(ed_CompanyCode.Text,1,1 + G_nCompanyCodeLength);
  LoadPosiCode(stCompanyCode,PosiCodeList,TComboBox(cmb_Posi),True,L_stAllName);
  LoadEmployeeGubunCode(EmployeeGubunCodeList,TComboBox(cmb_EmpGubun),True,L_stAllName);
  LoadSearchETC(cmb_ETC);

  cmb_ETC.ItemIndex := 0;
  lb_SearchETCName.Caption.Text := cmb_ETC.Text;

end;

procedure TfmFoodDepartStateReport.FormCreate(Sender: TObject);
begin
  dt_StartDate.Date := Now;
  dt_endDate.Date := now;

  MemoryCreate;
  FontSetting;
end;


procedure TfmFoodDepartStateReport.FormGradeRefresh;
begin

end;

function TfmFoodDepartStateReport.FormGridInitialize: Boolean;
begin
  GridInitialize(sg_Report);
  ReportCellHide(sg_Report);
end;

procedure TfmFoodDepartStateReport.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmFoodDepartStateReport.FormNameSetting: Boolean;
var
  i : integer;
begin
  ReportHeaderNameSetting;

  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','COMMONREPORT');
  lb_List.Caption.Text := dmFormFunction.GetFormName('2','1','BM4_020');
  lb_SearchDate.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHDATE');

  lb_CompanyName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');
  lb_PosiName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEPOSINAME');
  lb_empType.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGUBUN');
  lb_EtcSearch.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONETCNAME');

  L_stCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');

  btn_Search.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');
  btn_Option.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCHOPTION');
  lb_SearchOption.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCHOPTION');
  btn_Print.Caption := dmFormFunction.GetFormName('0','2','COMMONPRINT');
  btn_Excel.Caption := dmFormFunction.GetFormName('0','2','BUTTONFILESAVE002');
  btn_OptionSave.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_OptionCancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');

  gb_SearchOption.Items.Clear;

  for i := 0 to ReportHeaderNameList.Count - 1 do
  begin
    gb_SearchOption.Items.Add(ReportHeaderNameList.Strings[i]);
  end;
end;

procedure TfmFoodDepartStateReport.FormResize(Sender: TObject);
begin
  inherited;
  pan_Option.Left := (width div 2) - (pan_Option.Width div 2);
  pan_Option.Top := (Height div 2) - (pan_Option.Height div 2);

  btn_OptionSave.Left := pan_Option.Width div 2 - btn_OptionSave.Width  - 5;
  btn_OptionCancel.Left := pan_Option.Width div 2 + 5;

  sg_report.Height := BodyPanel.Height - (btn_Search.Top + btn_Search.Height + 10);
  sg_report.Left := 5;
  sg_report.Width := BodyPanel.Width - (sg_report.Left * 2);
  sg_report.Top := btn_Search.Top + btn_Search.Height + 10;

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

procedure TfmFoodDepartStateReport.FormShow(Sender: TObject);
begin
  fmMain.FORMENABLE(con_FormBMOSFOODDepartSTATEREPORT,'TRUE');

  FormNameSetting;
  FormComboBoxInitialize;
  ReportConfigRead;
  FormGridInitialize;
  AttendReportHeaderNameSetting(sg_Report);
  AttendReportFieldNameSetting;
  LoadFoodTypeCode(TComboBox(cmb_FoodType),True,'0.' + L_stAllName);
  cmb_FoodType.ItemIndex := 0;

  LoadCompanyTreeView('',tv_AddCompanyName,tv_AddCompanyCode,con_LocalCompanyImageIndex);

  tv_AddCompanyNameDblClick(Self);
  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');

end;


function TfmFoodDepartStateReport.MemoryCreate: Boolean;
begin
  L_nMaxReportColCount := 30;
  L_nShowCount := 0;

  BuildingCodeList := TStringList.Create;
  CardStateList := TStringList.Create;
  CompanyCodeList := TStringList.Create;
  DoorCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  EmployeeGubunCodeList := TStringList.Create;
  ReportHeaderNameList := TStringList.Create;
  ReportFieldNameList := TStringList.Create;
  FoodCodeList := TStringList.Create;

  SetLength(L_arrFoodEventReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrRelFoodEventReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrFoodEventReportShowTable,L_nMaxReportColCount + 1);
  SetLength(L_arrFoodEventReportSizeTable,L_nMaxReportColCount + 1);
end;

function TfmFoodDepartStateReport.MemoryFree: Boolean;
begin
  BuildingCodeList.Free;
  CardStateList.Free;
  CompanyCodeList.Free;
  DoorCodeList.Free;
  PosiCodeList.Free;
  EmployeeGubunCodeList.Free;
  ReportHeaderNameList.Free;
  ReportFieldNameList.Free;
  FoodCodeList.Free;

  L_arrFoodEventReportIndexArray := nil;
  Finalize(L_arrFoodEventReportIndexArray);
  L_arrRelFoodEventReportIndexArray := nil;
  Finalize(L_arrRelFoodEventReportIndexArray);
  L_arrFoodEventReportShowTable := nil;
  Finalize(L_arrFoodEventReportShowTable);
  L_arrFoodEventReportSizeTable := nil;
  Finalize(L_arrFoodEventReportSizeTable);
end;

function TfmFoodDepartStateReport.ReportCellHide(aList: TAdvStringGrid): Boolean;
var
  i : integer;
begin
  for i := 0 to aList.ColCount - 1 do
  begin
    if L_arrFoodEventReportShowTable[i] = 0 then
    begin
      aList.ColWidths[L_arrFoodEventReportIndexArray[i]] := 0;
    end else
    begin
      if L_arrFoodEventReportSizeTable[L_arrFoodEventReportIndexArray[i]] <> 0 then aList.ColWidths[L_arrFoodEventReportIndexArray[i]] := L_arrFoodEventReportSizeTable[L_arrFoodEventReportIndexArray[i]]
      else aList.ColWidths[L_arrFoodEventReportIndexArray[i]] := 90;
    end;
  end;
end;

function TfmFoodDepartStateReport.ReportConfigRead: Boolean;
var
  ini_fun : TiniFile;
  nShowCount : integer;
  nSize : integer;
  i : integer;
begin
  L_nShowCount := 0;
  ini_fun := TiniFile.Create(G_stExeFolder + '\FoodDepartStateReport.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrFoodEventReportIndexArray) to HIGH(L_arrFoodEventReportIndexArray) do
      begin
        L_arrFoodEventReportIndexArray[i] := ReadInteger('FoodEventReport','AccessIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelFoodEventReportIndexArray) to HIGH(L_arrRelFoodEventReportIndexArray) do
      begin
        L_arrRelFoodEventReportIndexArray[i] := ReadInteger('FoodEventReport','RelAccessIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrFoodEventReportShowTable) to HIGH(L_arrFoodEventReportShowTable) do
      begin
        L_arrFoodEventReportShowTable[i] := ReadInteger('FoodEventReport','RelAccessShowArray'+inttostr(i),1);
        L_nShowCount := L_nShowCount + L_arrFoodEventReportShowTable[i];
      end;
      nSize := 130;
      for i := LOW(L_arrFoodEventReportSizeTable) to HIGH(L_arrFoodEventReportSizeTable) do
      begin
        L_arrFoodEventReportSizeTable[i] := ReadInteger('FoodEventReport','RelAccessSizeArray'+inttostr(i),nSize);
      end;
    end;
  Finally
    ini_fun.Free;
  End;

end;

function TfmFoodDepartStateReport.ReportHeaderNameSetting: Boolean;
begin

  ReportHeaderNameList.Clear;
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONFOODTYPE'));         //식수타입
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '1');  //소속1
  //ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '2');  //소속2
  //ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '3');  //소속3
  //ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEPOSINAME'));   //직위
  //ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE'));       //사번
  //ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME'));       //이름
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONFOODBREAK'));       //조식
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONFOODLUNCH'));       //중식
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONFOODDINNER'));       //석식
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONFOODMIDNIGHT'));       //야식
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONFOODTOT'));       //합계
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONFOODAMT') );

  result := True;

end;



function TfmFoodDepartStateReport.SearchReport: Boolean;
var
  stStartDate : string;
  stEndDate : string;
  stCompanyCode : string;
  stPosiCode : string;
  stEmpGubun : string;
  stEtcType : string;
  stEtcName : string;
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  i : integer;
  stTemp : string;
  stFdType : string;
  stFoodCode : string;
begin
  stStartDate := FormatDateTime('yyyymmdd',dt_StartDate.Date);
  stEndDate := FormatDateTime('yyyymmdd',dt_EndDate.Date);
  stFdType := '';
  if cmb_FoodType.ItemIndex > 0 then
     stFdType := copy(cmb_FoodType.Text,1,1);
  stCompanyCode := ed_CompanyCode.Text;
  if cmb_Posi.ItemIndex > 0 then stPosiCode := PosiCodeList.Strings[cmb_Posi.ItemIndex]
  else stPosiCode := '';
  stEmpGubun := '';
  if cmb_EmpGubun.ItemIndex > 0 then stEmpGubun := EmployeeGubunCodeList.Strings[cmb_EmpGubun.ItemIndex];
  stEtcType := '0';
  if cmb_ETC.ItemIndex > 0 then stEtcType := inttostr(cmb_ETC.ItemIndex);
  stEtcName := Trim(ed_name.Text);
  stSql :=  dmDBSelect.SelectTB_FOODEVENT_FoodDepartStateReport(stStartDate,stEndDate, stCompanyCode,stFdType);

//  Memo1.Text := stSql;
  btn_Excel.Enabled := False;
  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');
  btn_Print.Enabled := False;
  GridInitialize(sg_Report);
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
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
      btn_Excel.Enabled := IsUpdateGrade;
      btn_Print.Enabled := IsInsertGrade;
      if Not FileExists(G_stExeFolder + '\Excel-a.png') then
      begin
        ExcelEnImage.Picture.SaveToFile(G_stExeFolder + '\Excel-a.png');
      end;
      btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-a.png');
      with sg_Report do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          for i := 0 to ReportFieldNameList.Count - 1 do
          begin
            stTemp := FindField(ReportFieldNameList.Strings[i]).AsString;

            if (ReportFieldNameList.Strings[i] = 'FO_BREAK') OR
               (ReportFieldNameList.Strings[i] = 'FO_LUNCH') OR
               (ReportFieldNameList.Strings[i] = 'FO_DINNER') OR
               (ReportFieldNameList.Strings[i] = 'FO_MIDNIGHT') OR
               (ReportFieldNameList.Strings[i] = 'TOT') OR
               (ReportFieldNameList.Strings[i] = 'FO_FOODAMT') then
            begin
              if stTemp = '' then stTemp := '0';
              if isDigit(stTemp) then stTemp := FormatFloat('#,#0',StrToFloat(stTemp));
            end;
            cells[L_arrFoodEventReportIndexArray[i],nRow] := stTemp;
          end;
          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  result := True;
end;

procedure TfmFoodDepartStateReport.sg_reportColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeFoodEventReportIndex(FromIndex,ToIndex);
end;

procedure TfmFoodDepartStateReport.tv_AddCompanyNameDblClick(Sender: TObject);
begin
  inherited;
  Try
    if tv_AddCompanyName.Selected = nil then tv_AddCompanyName.Items[0].Selected := True;

    ed_CompanyCode.Text := tv_AddCompanyCode.Items.Item[tv_AddCompanyName.Selected.AbsoluteIndex].Text;
    eb_CompanyName.Text := tv_AddCompanyName.Selected.Text;
    tv_AddCompanyName.Visible := False;
    LoadPosiCode(copy(ed_CompanyCode.Text,1,1+G_nCompanyCodeLength),PosiCodeList,TComboBox(cmb_Posi),True,L_stAllName);
  Except
    Exit;
  End;
end;

function TfmFoodDepartStateReport.WriteIniConfig: Boolean;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(G_stExeFolder + '\FoodDepartStateReport.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrFoodEventReportIndexArray) to HIGH(L_arrFoodEventReportIndexArray) do
      begin
        WriteInteger('FoodEventReport','AccessIndexArray'+inttostr(i),L_arrFoodEventReportIndexArray[i]);
      end;
      for i := LOW(L_arrRelFoodEventReportIndexArray) to HIGH(L_arrRelFoodEventReportIndexArray) do
      begin
        WriteInteger('FoodEventReport','RelAccessIndexArray'+inttostr(i),L_arrRelFoodEventReportIndexArray[i]);
      end;
      for i := 0 to sg_Report.ColCount - 1 do
      begin
        if i > HIGH(L_arrFoodEventReportSizeTable) then break;

        L_arrFoodEventReportSizeTable[i] := sg_Report.ColWidths[i];
        WriteInteger('FoodEventReport','RelAccessSizeArray' + inttostr(i),sg_Report.ColWidths[i]);
      end;
    end;
  Finally
    ini_fun.Free;
  End;
end;

initialization
  RegisterClass(TfmFoodDepartStateReport);
Finalization
  UnRegisterClass(TfmFoodDepartStateReport);

end.