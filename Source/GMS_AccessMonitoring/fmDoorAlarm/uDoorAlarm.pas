unit uDoorAlarm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, Vcl.StdCtrls, Vcl.ComCtrls,System.IniFiles,ADODB,ActiveX,
  AdvGlowButton;

type
  TfmDoorAlarm = class(TForm)
    GroupBox1: TGroupBox;
    lb_SearchDate: TLabel;
    dtStartDate: TDateTimePicker;
    dtEndDate: TDateTimePicker;
    Label2: TLabel;
    chk_NetFaile: TCheckBox;
    chk_DoorLongTimeOpen: TCheckBox;
    sg_Report: TAdvStringGrid;
    btn_Search: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    chk_AllAlarm: TCheckBox;
    btn_Excel: TAdvGlowButton;
    SaveDialog1: TSaveDialog;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure chk_NetFaileMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chk_AllAlarmMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn_ExcelClick(Sender: TObject);
  private
    L_arrReportIndexArray:Array of integer; //이벤트 리스트 순서 배열
    L_arrRelReportIndexArray:Array of integer; //이벤트 실제 위치
    L_arrReportShowTable : Array of integer;  //이벤트 조회 항목테이블
    L_arrReportSizeTable : Array of integer;  //이벤트 Cell Size
    L_nMaxReportColCount : integer;
    L_nShowCount : integer;
    ReportHeaderNameList : TStringList;
    ReportFieldNameList : TStringList;
    FECUID: string;
    FNodeNo: integer;
    FDoorNo: string;
    { Private declarations }
    function AlarmReportHeaderNameSetting(aList: TAdvStringGrid):Boolean;
    function AlarmReportFieldNameSetting:Boolean;
    procedure ChangeReportIndex(FromIndex,ToIndex:integer);
    Function FormGridInitialize:Boolean;
    Function FormNameSetting:Boolean;
    function ReportCellHide(aList:TAdvStringGrid):Boolean;
    function ReportConfigRead:Boolean;
    function ReportHeaderNameSetting:Boolean;
    Function SearchReport:Boolean;
  public
    { Public declarations }
    property NodeNo : integer read FNodeNo write FNodeNo;
    property EcuID : string read FECUID write FECUID;
    property DoorNo : string read FDoorNo write FDoorNo;
  end;

var
  fmDoorAlarm: TfmDoorAlarm;

implementation

uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBSelect,
  uFormFunction;

{$R *.dfm}

function TfmDoorAlarm.AlarmReportFieldNameSetting: Boolean;
begin
  ReportFieldNameList.Clear;
  ReportFieldNameList.Add('AE_DATE');
  ReportFieldNameList.Add('AE_TIME');
  ReportFieldNameList.Add('BUILDINGNAME1');
  ReportFieldNameList.Add('BUILDINGNAME2');
  ReportFieldNameList.Add('BUILDINGNAME3');
  ReportFieldNameList.Add('AR_ARMAREANAME');
  ReportFieldNameList.Add('AE_EVENTSTATECODE');
  ReportFieldNameList.Add('EVENTSTATEPCCODENAME');
end;

function TfmDoorAlarm.AlarmReportHeaderNameSetting(
  aList: TAdvStringGrid): Boolean;
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

procedure TfmDoorAlarm.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDoorAlarm.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
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
      if fileexists(stSaveFileName) then
        deletefile(stSaveFileName);
      Try
        sg_Report.SaveToXLS(stSaveFileName);
      Except
        sg_Report.SaveToCSV(stSaveFileName);
      End;
    end;
  end;
  btn_Excel.Enabled := True;
end;

procedure TfmDoorAlarm.btn_SearchClick(Sender: TObject);
begin
  SearchReport;
end;

procedure TfmDoorAlarm.ChangeReportIndex(FromIndex, ToIndex: integer);
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

procedure TfmDoorAlarm.chk_AllAlarmMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    chk_NetFaile.Checked := Not chk_AllAlarm.Checked;
    chk_DoorLongTimeOpen.Checked := Not chk_AllAlarm.Checked;
end;

procedure TfmDoorAlarm.chk_NetFaileMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Not chk_NetFaile.Checked and Not chk_DoorLongTimeOpen.Checked  then chk_AllAlarm.Checked := True
  else chk_AllAlarm.Checked := False;
end;

procedure TfmDoorAlarm.FormCreate(Sender: TObject);
begin
  L_nMaxReportColCount := 30;
  dtStartDate.Date := Now;
  dtEndDate.Date := Now;
  ReportHeaderNameList := TStringList.Create;
  ReportFieldNameList := TStringList.Create;

  SetLength(L_arrReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrRelReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrReportShowTable,L_nMaxReportColCount + 1);
  SetLength(L_arrReportSizeTable,L_nMaxReportColCount + 1);

  ReportConfigRead;
  FormNameSetting;
  FormGridInitialize;
  AlarmReportHeaderNameSetting(sg_Report);
  AlarmReportFieldNameSetting;

  //  dmFormFunction.GridInit(TargetGrid,1,1);
  SearchReport;
end;

function TfmDoorAlarm.FormGridInitialize: Boolean;
begin
  dmFormFunction.GridInitialize(sg_Report);
  ReportCellHide(sg_Report);
end;

function TfmDoorAlarm.FormNameSetting: Boolean;
var
  i : integer;
begin
  ReportHeaderNameSetting;

  lb_SearchDate.Caption := dmFormFunction.GetFormName('0','2','COMMONSEARCHDATE');

  btn_Search.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');

  for i := 0 to ReportHeaderNameList.Count - 1 do
  begin
//    gb_SearchOption.Items.Add(ReportHeaderNameList.Strings[i]);
  end;
end;

function TfmDoorAlarm.ReportCellHide(aList: TAdvStringGrid): Boolean;
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
      else aList.ColWidths[L_arrReportIndexArray[i]] := 150;
    end;
  end;
end;

function TfmDoorAlarm.ReportConfigRead: Boolean;
var
  ini_fun : TiniFile;
  nShowCount : integer;
  nSize : integer;
  i : integer;
begin
  L_nShowCount := 0;
  ini_fun := TiniFile.Create(G_stExeFolder + '\DoorAlarmEvent.INI');
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
      nSize := 130;
      for i := LOW(L_arrReportSizeTable) to HIGH(L_arrReportSizeTable) do
      begin
        L_arrReportSizeTable[i] := ReadInteger('REPORT','RelSizeArray'+inttostr(i),nSize);
      end;
    end;
  Finally
    ini_fun.Free;
  End;

end;

function TfmDoorAlarm.ReportHeaderNameSetting: Boolean;
begin
  ReportHeaderNameList.Clear;
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDATE'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMTIME'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '1');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '2');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '3');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMAREANAME'));     //방범구역명
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMCODE'));       //알람코드
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMCODENAME'));   //알람내용

  result := True;

end;

function TfmDoorAlarm.SearchReport: Boolean;
var
  stStartDate : string;
  stStartTime : string;
  stEndDate : string;
  stEndTime : string;
  stBuildingCode : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stArmAreaCode : string;
  stArmMode : string;
  stAlarmEventGroup : string;
  stAlarmEventPCCode : string;
  stAlarmDeviceType : string;
  stAlarmConfirm : string;
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  i : integer;
  stTemp : string;
begin
  stStartDate := FormatDateTime('yyyymmdd',dtStartDate.Date);
  stEndDate := FormatDateTime('yyyymmdd',dtEndDate.Date);
  stStartTime := '0000';
  stEndTime := '2400';
  stBuildingCode := '0';
  stNodeNo := inttostr(NodeNo);
  stEcuID := EcuID;
  stArmAreaNo := '';
  stArmMode := '';
  stAlarmEventGroup := '';
  stAlarmEventPCCode := '';
  stAlarmDeviceType := '';
  stAlarmConfirm := '';


  stSql :=  dmDBSelect.SelectTB_ALARMEVENT_AlarmReport(stStartDate, stStartTime,
            stEndDate, stEndTime, stBuildingCode, stNodeNo, stEcuID, stArmAreaNo, Uppercase(stArmMode),
            stAlarmEventGroup, stAlarmEventPCCode, stAlarmDeviceType, stAlarmConfirm ,1);

  if chk_NetFaile.Checked and chk_DoorLongTimeOpen.Checked then
  begin
    stSql := stSql + ' AND (a.AE_EVENTSTATECODE = ''NF'' OR a.AE_EVENTSTATECODE = ''NR'' OR a.AE_EVENTSTATECODE = ''LT'' OR a.AE_EVENTSTATECODE = ''LR'') ';
  end else if chk_NetFaile.Checked then
  begin
    stSql := stSql + ' AND (a.AE_EVENTSTATECODE = ''NF'' OR a.AE_EVENTSTATECODE = ''NR'' ) ';
  end else if chk_DoorLongTimeOpen.Checked then
  begin
    stSql := stSql + ' AND (a.AE_EVENTSTATECODE = ''LT'' OR a.AE_EVENTSTATECODE = ''LR'') ';
  end;




  dmFormFunction.GridInitialize(sg_Report);
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
      with sg_Report do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          for i := 0 to ReportFieldNameList.Count - 1 do
          begin
            stTemp := FindField(ReportFieldNameList.Strings[i]).AsString;
            if ReportFieldNameList.Strings[i] = 'AE_DATE' then stTemp := MakeDatetimeStr(stTemp)
            else if ReportFieldNameList.Strings[i] = 'AE_TIME' then stTemp := MaketimeStr(stTemp)
            else if ReportFieldNameList.Strings[i] = 'AE_CHECKTIME' then stTemp := MakeDatetimeStr(stTemp);
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

end.
