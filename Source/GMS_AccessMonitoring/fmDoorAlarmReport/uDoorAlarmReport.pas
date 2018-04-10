unit uDoorAlarmReport;

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
  TfmDoorAlarmReport = class(TfmASubForm)
    Image1: TImage;
    BodyPanel: TAdvSmoothPanel;
    ImageList1: TImageList;
    pop_PermitAdd: TAdvPopupMenu;
    mn_addpermitListDelete: TMenuItem;
    toolslist: TImageList;
    SaveDialog1: TSaveDialog;
    pan_Option: TAdvSmoothPanel;
    eb_BuildingName: TAdvEditBtn;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    Panel1: TPanel;
    Label3: TLabel;
    Gauge2: TGauge;
    sg_report: TAdvStringGrid;
    btn_Search: TAdvGlowButton;
    btn_Option: TAdvGlowButton;
    btn_Print: TAdvGlowButton;
    btn_Excel: TAdvGlowButton;
    lb_SearchDate: TAdvSmoothLabel;
    lb_BuildingName: TAdvSmoothLabel;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    tv_buildingCode: TTreeView;
    tv_buildingName: TTreeView;
    MenuImageList16: TImageList;
    gb_SearchOption: TAdvOfficeCheckGroup;
    lb_SearchOption: TLabel;
    btn_OptionSave: TAdvGlowButton;
    btn_OptionCancel: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_list: TAdvSmoothLabel;
    lb_Time: TAdvSmoothLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_AddNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ed_nameKeyPress(Sender: TObject; var Key: Char);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_OptionClick(Sender: TObject);
    procedure btn_OptionCancelClick(Sender: TObject);
    procedure btn_OptionSaveClick(Sender: TObject);
    procedure sg_reportColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure btn_SearchClick(Sender: TObject);
    procedure eb_BuildingNameClickBtn(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure cmb_ArmAreaChange(Sender: TObject);
  private
    L_stMenuID : string;
    L_stFormType : string;
    L_stSearchID : string;
    L_stCloseCaption : string;
    L_stAllName : string;
    BuildingCodeList : TStringList;
    ArmModeList : TStringList;
    AlarmEventGroupList : TStringList;
    AlarmEventPCCodeList : TStringList;
    ArmAreaCodeList : TStringList;
    AlarmDeviceCodeList : TStringList;
    ReportHeaderNameList : TStringList;
    ReportFieldNameList : TStringList;
    L_nMaxReportColCount : integer;
    L_nShowCount : integer;
    L_arrReportIndexArray:Array of integer; //이벤트 리스트 순서 배열
    L_arrRelReportIndexArray:Array of integer; //이벤트 실제 위치
    L_arrReportShowTable : Array of integer;  //이벤트 조회 항목테이블
    L_arrReportSizeTable : Array of integer;
    FBuildingCode: string;
    FReportType: integer;
    FReportName: String;
    FBuildingName: string;  //이벤트 Cell Size
    { Private declarations }
    function AlarmReportHeaderNameSetting(aList: TAdvStringGrid):Boolean;
    function AlarmReportFieldNameSetting:Boolean;
    procedure ChangeReportIndex(FromIndex,ToIndex:integer);
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
    procedure SetReportName(const Value: String);
    procedure SetBuildingName(const Value: string);

  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
    procedure FORMREPORT(aFormID,aFormType:string);
  public
    property BuildingCode : string read FBuildingCode Write FBuildingCode;
    property BuildingName : string read FBuildingName write SetBuildingName;
    property ReportName : String read FReportName Write SetReportName;
    property ReportType : integer read FReportType Write FReportType;   //0.네트웍 단선,1.출입문열림상태,2.출입문장시간열림
  end;

var
  fmDoorAlarmReport: TfmDoorAlarmReport;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uComboBoxCodeLoad,
  uDataBase,
  uDBFunction,
  uDBSelect,
  uFormFunction,
  uFormVariable,
  uFormUtil,
  uMain;

{$R *.dfm}


function TfmDoorAlarmReport.AlarmReportFieldNameSetting: Boolean;
begin
  ReportFieldNameList.Clear;
  ReportFieldNameList.Add('BUILDINGNAME1');
  ReportFieldNameList.Add('BUILDINGNAME2');
  ReportFieldNameList.Add('BUILDINGNAME3');
  ReportFieldNameList.Add('DO_DOORNAME');
  ReportFieldNameList.Add('ND_NODEIP');
  ReportFieldNameList.Add('DO_LASTACCESSCARD');
  ReportFieldNameList.Add('EM_NAME');
  ReportFieldNameList.Add('EM_HANDPHONE');
  ReportFieldNameList.Add('DO_LASTACCESSTIME');
  ReportFieldNameList.Add('LASTTIME');

end;

function TfmDoorAlarmReport.AlarmReportHeaderNameSetting(aList: TAdvStringGrid): Boolean;
var
  i : integer;
begin
  aList.ColCount := ReportHeaderNameList.Count;
  for i := LOW(L_arrReportIndexArray) to HIGH(L_arrReportIndexArray) do
  begin
    if (aList.ColCount - 1) < i then Exit;
    if (ReportHeaderNameList.Count - 1) < i then Exit;

    aList.cells[L_arrReportIndexArray[i],0] := ReportHeaderNameList[i];
  end;

end;

procedure TfmDoorAlarmReport.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmDoorAlarmReport.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
  btn_Excel.Enabled := False;
  aFileName:=Caption;
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      //sg_Report.SaveToXLS(stSaveFileName,True);
      if fileexists(stSaveFileName) then
        deletefile(stSaveFileName);
      Try
        sg_Report.SaveToXLS(stSaveFileName);
      Except
        showmessage('Excel 저장에 실패 하여 CSV 포맷으로 저장 합니다.');
        sg_Report.SaveToCSV(stSaveFileName);
      End;
//      advgridexcelio1.XLSExport(stSaveFileName);
    end;
  end;
  btn_Excel.Enabled := True;

end;

procedure TfmDoorAlarmReport.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmDoorAlarmReport.btn_OptionCancelClick(Sender: TObject);
begin
  inherited;
  Pan_Option.Visible := False;
end;

procedure TfmDoorAlarmReport.btn_OptionClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for i := LOW(L_arrReportShowTable) to HIGH(L_arrReportShowTable) do
  begin
    if i < gb_SearchOption.Items.Count then
    begin
      if L_arrReportShowTable[i] = 1 then gb_SearchOption.Checked[i] := True
      else gb_SearchOption.Checked[i] := False;
    end;
  end;
  Pan_Option.Visible := True;
end;

procedure TfmDoorAlarmReport.btn_OptionSaveClick(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringDoorEventReport.INI');
    with ini_fun do
    begin
      for i := 0 to gb_SearchOption.Items.Count - 1 do
      begin
        if gb_SearchOption.Checked[i] then
        begin
          L_arrReportShowTable[i] := 1;
          WriteInteger('REPORT','RelShowArray'+inttostr(i),1);
        end else
        begin
          L_arrReportShowTable[i] := 0;
          WriteInteger('REPORT','RelShowArray'+inttostr(i),0);
        end;
      end;
    end;
  Finally
    ini_fun.Free;
  End;
  Pan_Option.Visible := False;
  ReportCellHide(sg_Report);
end;

procedure TfmDoorAlarmReport.btn_PrintClick(Sender: TObject);
begin
  sg_Report.Print;
end;

procedure TfmDoorAlarmReport.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchReport;
end;

procedure TfmDoorAlarmReport.ChangeReportIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelReportIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelReportIndexArray[i] := L_arrRelReportIndexArray[i - 1];
    end;
    L_arrRelReportIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelReportIndexArray[i] := L_arrRelReportIndexArray[i + 1];
    end;
    L_arrRelReportIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelReportIndexArray) to HIGH(L_arrRelReportIndexArray) do
  begin
    L_arrReportIndexArray[L_arrRelReportIndexArray[i]] := i;
  end;

end;

procedure TfmDoorAlarmReport.cmb_ArmAreaChange(Sender: TObject);
begin
  inherited;
  if G_nReportSearchType = 1 then  SearchReport;
end;

procedure TfmDoorAlarmReport.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Top := eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := eb_BuildingName.Left;
  if G_nReportSearchType = 1 then  SearchReport;
end;

procedure TfmDoorAlarmReport.ed_AddNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfmDoorAlarmReport.ed_nameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
  end;

end;

procedure TfmDoorAlarmReport.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1); *)
end;

procedure TfmDoorAlarmReport.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
  SearchReport;
end;

procedure TfmDoorAlarmReport.FormChangeEvent(aFormName: integer);
begin
end;

procedure TfmDoorAlarmReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteIniConfig;

  MemoryFree;
  Action := caFree;
end;

function TfmDoorAlarmReport.FormComboBoxInitialize: Boolean;
begin


end;

procedure TfmDoorAlarmReport.FormCreate(Sender: TObject);
begin


  MemoryCreate;
  FontSetting;
end;


procedure TfmDoorAlarmReport.FormGradeRefresh;
begin

end;

function TfmDoorAlarmReport.FormGridInitialize: Boolean;
begin
  GridInitialize(sg_Report);
  ReportCellHide(sg_Report);
end;

procedure TfmDoorAlarmReport.FormIDSetting(aID: string);
var
  nIndex : integer;
begin
  L_stMenuID := aID;

end;

function TfmDoorAlarmReport.FormNameSetting: Boolean;
var
  i : integer;
begin
  ReportHeaderNameSetting;

  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','COMMONREPORT');
  //List.Caption.Text := dmFormFunction.GetFormName('2','1','BM4_013');
  //lb_SearchDate.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHDATE');

  lb_BuildingName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');

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

procedure TfmDoorAlarmReport.FORMREPORT(aFormID,aFormType: string);
begin
  inherited;
end;

procedure TfmDoorAlarmReport.FormResize(Sender: TObject);
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

procedure TfmDoorAlarmReport.FormShow(Sender: TObject);
begin
  FormNameSetting;
  FormComboBoxInitialize;
  ReportConfigRead;
  FormGridInitialize;
  AlarmReportHeaderNameSetting(sg_Report);
  AlarmReportFieldNameSetting;

  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');

end;


function TfmDoorAlarmReport.MemoryCreate: Boolean;
begin
  L_nMaxReportColCount := 30;
  L_nShowCount := 0;

  BuildingCodeList := TStringList.Create;
  ArmModeList := TStringList.Create;
  AlarmEventGroupList := TStringList.Create;
  ArmAreaCodeList := TStringList.Create;
  AlarmDeviceCodeList := TStringList.Create;
  AlarmEventPCCodeList := TStringList.Create;
  ReportHeaderNameList := TStringList.Create;
  ReportFieldNameList := TStringList.Create;

  SetLength(L_arrReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrRelReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrReportShowTable,L_nMaxReportColCount + 1);
  SetLength(L_arrReportSizeTable,L_nMaxReportColCount + 1);
end;

function TfmDoorAlarmReport.MemoryFree: Boolean;
begin
  BuildingCodeList.Free;
  ArmModeList.Free;
  AlarmEventGroupList.Free;
  ArmAreaCodeList.Free;
  AlarmDeviceCodeList.Free;
  AlarmEventPCCodeList.Free;
  ReportHeaderNameList.Free;
  ReportFieldNameList.Free;

  L_arrReportIndexArray := nil;
  Finalize(L_arrReportIndexArray);
  L_arrRelReportIndexArray := nil;
  Finalize(L_arrRelReportIndexArray);
  L_arrReportShowTable := nil;
  Finalize(L_arrReportShowTable);
  L_arrReportSizeTable := nil;
  Finalize(L_arrReportSizeTable);
end;

function TfmDoorAlarmReport.ReportCellHide(aList: TAdvStringGrid): Boolean;
var
  i : integer;
begin
  for i := 0 to aList.ColCount - 1 do
  begin
    if L_arrReportShowTable[i] = 0 then
    begin
      aList.ColWidths[L_arrReportIndexArray[i]] := 0;
    end else
    begin
      if L_arrReportSizeTable[L_arrReportIndexArray[i]] <> 0 then aList.ColWidths[L_arrReportIndexArray[i]] := L_arrReportSizeTable[L_arrReportIndexArray[i]]
      else aList.ColWidths[L_arrReportIndexArray[i]] := 90;
    end;
  end;
end;

function TfmDoorAlarmReport.ReportConfigRead: Boolean;
var
  ini_fun : TiniFile;
  nShowCount : integer;
  nSize : integer;
  i : integer;
begin
  L_nShowCount := 0;
  ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringDoorEventReport.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrReportIndexArray) to HIGH(L_arrReportIndexArray) do
      begin
        L_arrReportIndexArray[i] := ReadInteger('REPORT','IndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelReportIndexArray) to HIGH(L_arrRelReportIndexArray) do
      begin
        L_arrRelReportIndexArray[i] := ReadInteger('REPORT','RelIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrReportShowTable) to HIGH(L_arrReportShowTable) do
      begin
        L_arrReportShowTable[i] := ReadInteger('REPORT','RelShowArray'+inttostr(i),1);
        L_nShowCount := L_nShowCount + L_arrReportShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrReportSizeTable) to HIGH(L_arrReportSizeTable) do
      begin
        L_arrReportSizeTable[i] := ReadInteger('REPORT','RelSizeArray'+inttostr(i),nSize);
      end;
    end;
  Finally
    ini_fun.Free;
  End;

end;

function TfmDoorAlarmReport.ReportHeaderNameSetting: Boolean;
begin
  ReportHeaderNameList.Clear;
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '1');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '2');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '3');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONDOORNAME'));           //분기국사명
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODEIP01'));           //분기국사IP
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONLASTCARD'));           //최종출입카드
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONLASTEMNAME'));         //최종출입자
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE'));  //핸드폰
  ReportHeaderNameList.Add('최종출입시간');           //최종출입카드
  ReportHeaderNameList.Add('최종발생시간');

  result := True;

end;


function TfmDoorAlarmReport.SearchReport: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  i : integer;
  stTemp : string;
  stEmName : string;
  stEmHandphone : string;
begin
  lb_Time.Caption.Text := formatDateTime('yyyy-mm-dd hh:nn:ss',now);

  stSql :=  dmDBSelect.SelectTB_DOOR_DoorEvenetLastCard(BuildingCode, ReportType);

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
        Exit;
      End;
      if recordcount < 1 then Exit;
      btn_Excel.Enabled := True;
      if Not FileExists(G_stExeFolder + '\Excel-a.png') then
      begin
        ExcelEnImage.Picture.SaveToFile(G_stExeFolder + '\Excel-a.png');
      end;
      btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-a.png');
      btn_Print.Enabled := True;
      with sg_Report do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          stEmHandphone := FindField('EM_HANDPHONE').AsString;
          stEmName := FindField('EM_NAME').AsString;
          if Not(FindField('DO_LASTACCESSCARD').isnull) and FindField('EM_SEQ').IsNull then   //카드에 대한 정보가 없는 거다... 전화 승인 출입자를 검색하자.
          begin
            dmDBFunction.GetTB_DOORTELEVENT_LastAccessInfo(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('DO_DOORNO').AsString,FindField('DO_LASTACCESSCARD').AsString,stEmName,stEmHandphone);
          end;
          for i := 0 to ReportFieldNameList.Count - 1 do
          begin
            if ReportFieldNameList.Strings[i] = 'EM_NAME' then stTemp := stEmName
            else if ReportFieldNameList.Strings[i] = 'EM_HANDPHONE' then stTemp := stEmHandphone
            else if ReportFieldNameList.Strings[i] = 'DO_LASTACCESSTIME' then  stTemp :=  MakeDatetimeStr(FindField('DO_LASTACCESSTIME').AsString )
            else if ReportFieldNameList.Strings[i] = 'LASTTIME' then
            begin
              if FindField('ND_LASTNETSTATE').AsString = 'NF' then stTemp := MakeDatetimeStr(FindField('ND_LASTNETTIME').AsString )
              else if ReportType = 1 then stTemp := MakeDatetimeStr(FindField('DO_DOTIME').AsString)
              else stTemp := MakeDatetimeStr(FindField('DO_LASTLDTIME').AsString);
            end else stTemp := FindField(ReportFieldNameList.Strings[i]).AsString;

            cells[L_arrReportIndexArray[i],nRow] := stTemp;
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

procedure TfmDoorAlarmReport.SetBuildingName(const Value: string);
begin
  if FBuildingName = Value then Exit;

  FBuildingName := Value;
  eb_BuildingName.Text := Value;
end;

procedure TfmDoorAlarmReport.SetReportName(const Value: String);
begin
  if FReportName = Value then Exit;

  FReportName := Value;
  lb_List.Caption.Text := Value;
  Caption := Value;
end;

procedure TfmDoorAlarmReport.sg_reportColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeReportIndex(FromIndex,ToIndex);

end;

function TfmDoorAlarmReport.WriteIniConfig: Boolean;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringDoorEventReport.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrReportIndexArray) to HIGH(L_arrReportIndexArray) do
      begin
        WriteInteger('REPORT','IndexArray'+inttostr(i),L_arrReportIndexArray[i]);
      end;
      for i := LOW(L_arrRelReportIndexArray) to HIGH(L_arrRelReportIndexArray) do
      begin
        WriteInteger('REPORT','RelIndexArray'+inttostr(i),L_arrRelReportIndexArray[i]);
      end;
      for i := 0 to sg_Report.ColCount - 1 do
      begin
        if i > HIGH(L_arrReportSizeTable) then break;

        L_arrReportSizeTable[i] := sg_Report.ColWidths[i];
        WriteInteger('REPORT','RelSizeArray' + inttostr(i),sg_Report.ColWidths[i]);
      end;
    end;
  Finally
    ini_fun.Free;
  End;
end;

initialization
  RegisterClass(TfmDoorAlarmReport);
Finalization
  UnRegisterClass(TfmDoorAlarmReport);

end.
