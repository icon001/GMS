unit uCertificatePlan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ExtCtrls, AdvSplitter, AdvPanel, Vcl.ImgList,
  AdvOfficeButtons, AdvGroupBox,Data.DB,Vcl.Imaging.jpeg, AdvSmoothTabPager,
  ToolPanels, AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers,
  AdvGlowButton, AdvOfficePager, AdvAppStyler, AdvOfficePagerStylers,
  Vcl.Imaging.pngimage,DateUtils, AdvProgressBar,Winapi.ShellAPI, AdvCombo,
  AdvEdBtn, Vcl.Buttons;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmCertificatePlan = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    pm_Work: TPopupMenu;
    MenuImageList16: TImageList;
    pm_EmployeeAdd: TMenuItem;
    OpenDialog1: TOpenDialog;
    pm_Employee: TPopupMenu;
    pm_EmUpdate: TMenuItem;
    pm_EmDelete: TMenuItem;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    SaveDialog1: TSaveDialog;
    ProgressBar2: TProgressBar;
    pan_Message: TAdvSmoothPanel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    AdvProgressBar1: TAdvProgressBar;
    btn_AccessConfirm: TAdvGlassButton;
    SearchTimer: TTimer;
    pan_Year: TAdvPanel;
    SpeedButton2: TSpeedButton;
    lb_Year: TLabel;
    SpeedButton1: TSpeedButton;
    sg_Plan: TAdvStringGrid;
    Pan_MonthPlan: TAdvSmoothPanel;
    lb_AddAmt: TAdvSmoothLabel;
    lb_CertificateCaption: TLabel;
    lb_Month: TAdvSmoothLabel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    ed_CertificateCode: TAdvEdit;
    ed_CertificateSeq: TAdvEdit;
    pan_AddWork: TAdvSmoothPanel;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    btn_PanClose: TAdvGlowButton;
    AdvSmoothLabel1: TAdvSmoothLabel;
    ed_AddMonth: TAdvEdit;
    cmb_AddDate: TAdvComboBox;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    dt_ResultDate: TDateTimePicker;
    AdvSmoothLabel4: TAdvSmoothLabel;
    sg_PlanMonth: TAdvStringGrid;
    btn_Add: TAdvGlowButton;
    btn_Delete: TAdvGlowButton;
    ed_OldDate: TAdvEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sg_PermitDoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure Pan_MonthPlanMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pan_MonthPlanMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pan_MonthPlanMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sg_EmployeeListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pan_emPermitAdminMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pan_PositionInfoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn_AccessConfirmClick(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure sg_TuitionCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure ListResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sg_PlanDblClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure sg_PlanMonthClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    DragOrigin: TPoint;
    MouseDowning : BOOLEAN;
  private
    L_stMenuID : string;
    L_stAllName : string;
    L_stButtonCloseCaption : string;
    L_stDeleteCaption : string;
    L_stEmCodeCaption : string;
    L_stEmCompanyPhoneCaption : string;
    L_stEmEtcCaption : string;
    L_stEmHandPhoneCaption : string;
    L_stEmNameCaption : string;
    L_stCardNoCaption : string;
    L_stFingerTemplate1_1 : string;
    L_stFingerTemplate1_2 : string;
    L_stWork : string;
    L_nSelectCol : integer;
    L_nPageListMaxCount : integer;
    L_nBuildingNotPermitDoorCount : integer;     //빌딩별 미등록 권한 출입문
    L_nBuildingPermitDoorCount : integer;        //빌딩별 등록 권한 출입문
    L_nBuildingNotPermitArmAreaCount : integer;  //빌딩별 미등록 권한 방범구역
    L_nBuildingPermitArmAreaCount : integer;
    L_nUpdateEmStateIndex : integer;
    L_nPermitArmAreaCheckCount : integer;           //삭제시 방범구역 선택 갯수
    L_nNotPermitArmAreaCheckCount : integer;        //등록시 방범구역 선택 갯수
    L_nPermitDoorCheckCount : integer;           //삭제시 출입문 선택 갯수
    L_nNotPermitDoorCheckCount : integer;        //등록시 출입문 선택 갯수
    L_nEmployeeCheckCount : integer;             //
    L_bVisitEditMode : Boolean;
    L_bEmployeeGradeChange : Boolean;
    L_bFingerImageUpdate : Boolean;
    L_bFingerUse : Boolean;
    CeritficateIDList : TStringList;
    procedure FormNameSetting;
  private
    L_bFormClose : Boolean;
    L_bSearchBreak : Boolean;
    L_bSearchEnd : Boolean;
    FYear: integer;
    { Private declarations }

    function JpegStartsInBlob(PicField:TBlobField):integer;
    procedure AddFormClear;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure SetYear(const Value: integer);
    procedure SearchCertificateMonthPlan(aDate:string);
    procedure SearchCertificatePlan;
  public
    { Public declarations }
    procedure FormSearchEnable(aEnabled:Boolean);
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  public
    property Year:integer read FYear write SetYear;
  end;

var
  fmCertificatePlan: TfmCertificatePlan;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uEmployeeRelay,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uDBDelete,
  uDBCardPermit,
  uDBSelect,
  uSupremaFinger,
  uFingerVariable,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmCertificatePlan.AddFormClear;
begin
  cmb_AddDate.ItemIndex := strtoint(FormatDateTime('dd',now)) - 1;
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;
  dt_ResultDate.Date := Now;
  ed_CertificateSeq.Text := '';
  btn_Save.Enabled := False;
end;

procedure TfmCertificatePlan.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmCertificatePlan.btn_AccessConfirmClick(Sender: TObject);
begin
  inherited;
  L_bSearchBreak := True;
  Pan_Message.Visible := False;

end;

procedure TfmCertificatePlan.btn_AddClick(Sender: TObject);
begin
  inherited;
  AddFormClear;
  L_stWork := 'ADD';
  ed_CertificateSeq.Text := dmDBFunction.GetNextTB_CertificatePlan_SEQ(ed_CertificateCode.Text);
  if sg_PlanMonth.Cells[0,1] <> '' then
  begin
    sg_PlanMonth.RowCount := sg_PlanMonth.RowCount + 1;
    sg_PlanMonth.SelectRows(sg_PlanMonth.RowCount - 1,1);
  end;
  btn_Save.Enabled := True;

end;

procedure TfmCertificatePlan.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_MonthPlan.Visible := False;
  SearchCertificatePlan;
end;

procedure TfmCertificatePlan.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmCertificatePlan.btn_DeleteClick(Sender: TObject);
var
  stDate : string;
begin
  inherited;
  stDate := ed_AddMonth.Text + cmb_AddDate.Text;
  stDate := stringReplace(stDate,'-','',[rfReplaceAll]);
  dmDBDelete.DeleteTB_CertificatePlan_Key(ed_CertificateCode.Text,stDate);
  SearchCertificateMonthPlan(stDate);
end;

procedure TfmCertificatePlan.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;

end;

procedure TfmCertificatePlan.btn_SaveClick(Sender: TObject);
var
  stDate : string;
begin
  inherited;
  stDate := ed_AddMonth.Text + cmb_AddDate.Text;
  stDate := stringReplace(stDate,'-','',[rfReplaceAll]);
  if Not isDigit(ed_CertificateSeq.Text) then
  begin
    showmessage('회차는 숫자만 입력 가능합니다.');
    Exit;
  end;


  if L_stWork = 'ADD' then
  begin
    if Not dmDBInsert.InsertIntoTB_CertificatePlan_Value(ed_CertificateCode.Text,stDate,ed_CertificateSeq.Text,
               FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_ToDate.Date),FormatDateTime('yyyymmdd',dt_ResultDate.Date)) then
    begin
      showmessage('저장에 실패하였습니다.');
      Exit;
    end;
  end else
  begin
    if Not dmDBUpdate.UpdateTB_CertificatePlan_Value(ed_CertificateCode.Text,ed_OldDate.Text,ed_CertificateSeq.Text,stDate,
               FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_ToDate.Date),FormatDateTime('yyyymmdd',dt_ResultDate.Date)) then
    begin
      showmessage('저장에 실패하였습니다.');
      Exit;
    end;
  end;
  SearchCertificateMonthPlan(stDate);
end;

procedure TfmCertificatePlan.FormChangeEvent(aNumber: integer);
var
  stSelectCode1 : string;
  stSelectCode2 : string;
  nIndex : integer;
begin
end;

procedure TfmCertificatePlan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if dmSupremaFinger.Connected then
  begin
    dmSupremaFinger.SocketOPEN := False;
  end;
  //dmSupremaFinger.Free;
  L_bFormClose := True;
  L_bSearchBreak := True;
  Delay(1000);

  CeritficateIDList.Free;

  fmMain.FORMENABLE(con_FormBMOSEMPLOYEE,'FALSE');

  Action := caFree;
end;

procedure TfmCertificatePlan.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  CeritficateIDList := TStringList.Create;
  Year := strtoint(formatdateTime('yyyy',now));
  cmb_AddDate.Items.Clear;
  for i := 1 to 31 do  cmb_AddDate.Items.Add(inttostr(i));
  AddFormClear;
end;

procedure TfmCertificatePlan.FormGradeRefresh;
begin

end;

procedure TfmCertificatePlan.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmCertificatePlan.FormNameSetting;
begin
end;

procedure TfmCertificatePlan.FormResize(Sender: TObject);
begin
  inherited;

  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;

  pan_Message.Left := (Width div 2) - (pan_Message.Width div 2);
  pan_Message.Top := (Height div 2) - (pan_Message.Height div 2);

  Pan_MonthPlan.Left := (Width div 2) - (Pan_MonthPlan.Width div 2);
  Pan_MonthPlan.Top := (Height div 2) - (Pan_MonthPlan.Height div 2);

  btn_Save.Left := (pan_AddWork.Width div 2) - btn_Save.Width - 5;
  btn_Add.Left := btn_Save.Left - btn_Add.Width - 10;
  btn_Delete.Left := btn_Save.Left + btn_Save.Width + 10;
  btn_Cancel.Left := btn_Delete.Left + btn_Delete.Width + 10;

end;

procedure TfmCertificatePlan.FormSearchEnable(aEnabled: Boolean);
begin
end;

procedure TfmCertificatePlan.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSEMPLOYEE,'TRUE');

  if L_bFormClose or G_bApplicationTerminate then Exit;

  L_bVisitEditMode := True;



  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
//  if G_nReportSearchType = 1 then SearchEmployeeList('');  //tv_ListClick 에서 먼저 조회 함
end;

procedure TfmCertificatePlan.Form_Close;
begin
  Close;
end;

function TfmCertificatePlan.JpegStartsInBlob(PicField: TBlobField): integer;
var
  bS : TADOBlobStream;
  buffer : Word;
  hx : string;
begin
  Result := -1;
  bS := TADOBlobStream.Create(PicField, bmRead);
  try
    while (Result = -1) and
      (bS.Position + 1 < bS.Size) do
    begin
      bS.ReadBuffer(buffer, 1);
      hx:=IntToHex(buffer, 2);
      if hx = 'FF' then begin
        bS.ReadBuffer(buffer, 1);
        hx:=IntToHex(buffer, 2);
        if hx = 'D8' then Result := bS.Position - 2
        else if hx = 'FF' then
        bS.Position := bS.Position-1;
      end; //if
    end; //while
  finally
    bS.Free
  end; //try
end;

procedure TfmCertificatePlan.ListResize(Sender: TObject);
begin
  inherited;
  pan_Year.Top := 10;
  pan_Year.Left := List.Width div 2 - pan_Year.Width div 2;
  sg_Plan.Top := pan_Year.Top + pan_Year.Height + 10;
  sg_Plan.Left := 10;
  sg_Plan.Width := List.Width - 20;
  sg_Plan.Height := List.Height - sg_Plan.Top - 10;
  sg_Plan.DefaultColWidth := (sg_Plan.Width - 10) div 13;
end;

procedure TfmCertificatePlan.Pan_MonthPlanMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
(*    if (Button = mbLeft) and (MouseDowning = False) then
    begin
        // DRAG POINT 저장
        DragOrigin := Point (X,Y);
        // MOUSE DOWN = TRUE 설정
        MouseDowning := True;
    end;
*)
end;

procedure TfmCertificatePlan.Pan_MonthPlanMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
(*  inherited;
    // MOUSE DOWN = TRUE CHECK
    if (MouseDowning = True) then
    begin
        // IMAGE TOP 위치 설정
        (Sender as TAdvSmoothPanel).Top := (Sender as TAdvSmoothPanel).Top + Y - DragOrigin.Y;
        // IMAGE LEFT 위치 설정
        (Sender as TAdvSmoothPanel).Left := (Sender as TAdvSmoothPanel).Left + X - DragOrigin.X;
    end;
 *)
end;

procedure TfmCertificatePlan.Pan_MonthPlanMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    // MOUSE DOWN = FALSE 설정
//    MouseDowning := False;
end;

procedure TfmCertificatePlan.pan_emPermitAdminMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);

end;

procedure TfmCertificatePlan.pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
end;

procedure TfmCertificatePlan.pan_PositionInfoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
(* ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
 *)
end;


procedure TfmCertificatePlan.SearchCertificateMonthPlan(aDate:string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDate : string;
  stCertificateCode:string;
  stTemp : string;
  nIndex : integer;
begin
  GridInit(sg_PlanMonth,2);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      stSql := ' Select * From TB_CertificatePlan ';
      stSql := stSql + ' Where CF_CODE = ' + ed_CertificateCode.Text + ' ';
      stSql := stSql + ' AND CP_DATE Like ''' + StringReplace(ed_AddMonth.Text,'-','',[rfReplaceAll]) + '%'' ';
      sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;


      with sg_PlanMonth do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          cells[0,nRow] := MakeDateTimeStr(FindField('CP_DATE').AsString);
          cells[1,nRow] := FindField('CP_SEQ').AsString;
          cells[2,nRow] := MakeDateTimeStr(FindField('CP_RECEIPTFROM').AsString);
          cells[3,nRow] := MakeDateTimeStr(FindField('CP_RECEIPTTO').AsString);
          cells[4,nRow] := MakeDateTimeStr(FindField('CP_RESULTDATE').AsString);

          if aDate = FindField('CP_DATE').AsString then SelectRows(nRow,1);

          inc(nRow);
          Application.ProcessMessages;
          Next;
        end;

      end;
      sg_PlanMonthClick(sg_PlanMonth);
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmCertificatePlan.SearchCertificatePlan;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDate : string;
  stCertificateCode:string;
  stTemp : string;
  nIndex : integer;
begin
  RowGridInitialize(sg_Plan);
  CeritficateIDList.Clear;
  CeritficateIDList.Add('');

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      stSql := ' Select a.*,b.CC_CODENAME From TB_CertificateCode a';
      stSql := stSql + ' Left Join TB_CERTIFICATECLASSCODE b';
      stSql := stSql + ' ON(a.CC_CODE = b.CC_CODE) ';
      stSql := stSql + ' order by a.CF_NAME';
      sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;


      pan_Message.Visible := G_bDataLoadingView;
      AdvProgressBar1.Max := recordcount;
      AdvProgressBar1.Position := 0;
      with sg_Plan do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('CC_CODENAME').AsString + '-' + FindField('CF_NAME').AsString;
          CeritficateIDList.Add(FindField('CF_CODE').AsString);
          inc(nRow);
          Application.ProcessMessages;
          Next;
        end;
      end;
      Close;
      stSql := ' Select * From TB_CertificatePlan ';
      stSql := stSql + ' Where substring(CP_DATE,1,4) = ''' + FillZeroNumber(Year,4) + ''' ';
      stSql := stSql + ' order by CF_CODE';
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;

      while Not Eof do
      begin
        with sg_Plan do
        begin
          stDate := FindField('CP_DATE').AsString;
          nIndex := CeritficateIDList.IndexOf(FindField('CF_CODE').AsString);
          if nIndex > 0 then
          begin
            stTemp := Cells[strtoint(copy(stDate,5,2)),nIndex];
            if stTemp = '' then stTemp := MakeDatetimeStr(stDate) + ':' + FindField('CP_SEQ').AsString + '회차'
            else stTemp := stTemp + '/ ' + MakeDatetimeStr(stDate) + ':' + FindField('CP_SEQ').AsString + '회차';
            Cells[strtoint(copy(stDate,5,2)),nIndex] := stTemp;
          end;
        end;
        Application.ProcessMessages;
        Next;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmCertificatePlan.SearchTimerTimer(Sender: TObject);
begin
  inherited;
  SearchTimer.Enabled := False;
  SearchCertificatePlan;
end;

procedure TfmCertificatePlan.SetYear(const Value: integer);
begin
  if FYear = Value then Exit;

  FYear := Value;
  lb_Year.Caption := inttostr(Value);
  SearchCertificatePlan;
end;

procedure TfmCertificatePlan.sg_EmployeeListCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nEmployeeCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nEmployeeCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nEmployeeCheckCount := L_nEmployeeCheckCount + 1
    else L_nEmployeeCheckCount := L_nEmployeeCheckCount - 1 ;
  end;

end;

procedure TfmCertificatePlan.sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nNotPermitArmAreaCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nNotPermitArmAreaCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nNotPermitArmAreaCheckCount := L_nNotPermitArmAreaCheckCount + 1
    else L_nNotPermitArmAreaCheckCount := L_nNotPermitArmAreaCheckCount - 1 ;
  end;
end;

procedure TfmCertificatePlan.sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nNotPermitDoorCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nNotPermitDoorCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nNotPermitDoorCheckCount := L_nNotPermitDoorCheckCount + 1
    else L_nNotPermitDoorCheckCount := L_nNotPermitDoorCheckCount - 1 ;
  end;
end;

procedure TfmCertificatePlan.sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nPermitArmAreaCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nPermitArmAreaCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nPermitArmAreaCheckCount := L_nPermitArmAreaCheckCount + 1
    else L_nPermitArmAreaCheckCount := L_nPermitArmAreaCheckCount - 1 ;
  end;
end;

procedure TfmCertificatePlan.sg_PermitDoorCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nPermitDoorCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nPermitDoorCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nPermitDoorCheckCount := L_nPermitDoorCheckCount + 1
    else L_nPermitDoorCheckCount := L_nPermitDoorCheckCount - 1 ;
  end;

end;


procedure TfmCertificatePlan.sg_PlanDblClick(Sender: TObject);
begin
  inherited;
  ed_CertificateCode.Text := CeritficateIDList.Strings[sg_Plan.Row];
  lb_CertificateCaption.Caption := sg_Plan.Cells[0,sg_Plan.Row];
  ed_AddMonth.Text := FillzeroNumber(Year,4) + '-' + FillzeroNumber(sg_Plan.Col,2);
//  AddFormClear;
  Pan_MonthPlan.Visible := True;
  SearchCertificateMonthPlan('');
end;

procedure TfmCertificatePlan.sg_PlanMonthClick(Sender: TObject);
begin
  inherited;
  if sg_PlanMonth.SelectedRowCount = 0 then sg_PlanMonth.SelectRows(1,1);
  AddFormClear;
  with sg_PlanMonth do
  begin
    if cells[0,row] = '' then Exit;
    ed_OldDate.Text := StringReplace(cells[0,row],'-','',[rfReplaceAll]);
    ed_OldDate.Text := StringReplace(ed_OldDate.Text,' ','',[rfReplaceAll]);
    cmb_AddDate.ItemIndex := strtoint(copy(cells[0,row],9,2)) - 1;
    ed_CertificateSeq.Text := cells[1,row];
    dt_FromDate.Date := strtoDate(cells[2,row]);
    dt_ToDate.Date := strtoDate(cells[3,row]);
    dt_ResultDate.Date := strtoDate(cells[4,row]);
  end;
  btn_Save.Enabled := True;
  L_stWork := 'UPDATE';
end;

procedure TfmCertificatePlan.sg_TuitionCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if Not L_bVisitEditMode then Exit;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;
end;


procedure TfmCertificatePlan.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Year := Year + 1;

end;

procedure TfmCertificatePlan.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Year := Year - 1;
end;

initialization
  RegisterClass(TfmCertificatePlan);
Finalization
  UnRegisterClass(TfmCertificatePlan);

end.
