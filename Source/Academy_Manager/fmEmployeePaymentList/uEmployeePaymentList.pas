unit uEmployeePaymentList;

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
  Vcl.Imaging.pngimage,DateUtils, AdvProgressBar,Winapi.ShellAPI, AdvCombo,JclMime,
  ComObj, AdvEdBtn;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmEmployeePaymentList = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    MenuImageList16: TImageList;
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
    SearchTimer: TTimer;
    ed_SearchEmployeeClassName: TAdvEdit;
    btn_EmployeeClassSelect: TAdvGlowButton;
    AdvSmoothLabel1: TAdvSmoothLabel;
    ed_SearchPhone: TAdvEdit;
    lb_EtcDetail: TAdvSmoothLabel;
    ed_SearchName: TAdvEdit;
    sg_EmployeeList: TAdvStringGrid;
    tv_EmployeeClassCode: TTreeView;
    ed_SerchSelectCompanyCode: TAdvEdit;
    tv_EmployeeClassList: TTreeView;
    pm_Hompage: TPopupMenu;
    mn_Homepage: TMenuItem;
    AdvSmoothLabel2: TAdvSmoothLabel;
    lb_EmployeeClass: TLabel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    dt_Fromdate: TDateTimePicker;
    dt_Todate: TDateTimePicker;
    AdvSmoothLabel4: TAdvSmoothLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_SaveMouseEnter(Sender: TObject);
    procedure btn_SaveMouseLeave(Sender: TObject);
    procedure sg_CardCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sg_EmployeeListResize(Sender: TObject);
    procedure sg_PermitDoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure Pan_EmcodeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pan_EmcodeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pan_EmcodeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sg_EmployeeListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pan_emPermitAdminMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SearchTimerTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sg_LectureCodeCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure tv_EmployeeClassListDblClick(Sender: TObject);
    procedure ListResize(Sender: TObject);
    procedure btn_EmployeeClassSelectClick(Sender: TObject);
    procedure sg_EmployeeLectureListGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure dt_FromdateChange(Sender: TObject);
    procedure ed_SearchPhoneKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    L_nLecturePageListMaxCount : integer;
    L_nPageListMaxCount : integer;
    L_nBuildingNotPermitDoorCount : integer;     //빌딩별 미등록 권한 출입문
    L_nBuildingPermitDoorCount : integer;        //빌딩별 등록 권한 출입문
    L_nBuildingNotPermitArmAreaCount : integer;  //빌딩별 미등록 권한 방범구역
    L_nBuildingPermitArmAreaCount : integer;
    L_nUpdateEmStateIndex : integer;
    L_nPermitArmAreaCheckCount : integer;           //삭제시 방범구역 선택 갯수
    L_nLectureCodeCheckCount : integer;
    L_nNotPermitArmAreaCheckCount : integer;        //등록시 방범구역 선택 갯수
    L_nPermitDoorCheckCount : integer;           //삭제시 출입문 선택 갯수
    L_nNotPermitDoorCheckCount : integer;        //등록시 출입문 선택 갯수
    L_nEmployeeCheckCount : integer;             //
    L_bVisitEditMode : Boolean;
    L_bEmployeeGradeChange : Boolean;
    L_bFingerImageUpdate : Boolean;
    L_bFingerUse : Boolean;
    CardGubunCodeList :TStringList;
    CardSearchStateCodeList :TStringList;
    CardStateCodeList :TStringList;
    CertificateCodeList : TStringList;
    Certificate1CodeList : TStringList;
    EmployeeGubunCodeList : TStringList;
    EmployeeGubunSearchCodeList : TStringList;
    EmployeeStateCodeList : TStringList;
    PosiCodeList : TStringList;
    PosiSearchCodeList : TStringList;
    WorkCardGubunCodeList :TStringList;
    WorkCardStateCodeList :TStringList;
    AddCardNoList : TStringList; //추가되는 카드번호 리스트를 가지고 있자
    ChangeCardNoList : TStringList; //변경되는 카드번호 리스트를 가지고 있자
    DeleteCardNoList : TStringList; //삭제 카드 리스트를 가지고 있자
    BuildingArmAreaCodeList : TStringList; //빌딩별 방범구역 코드 리스트를 가지고 있자.
    BuildingDoorCodeList : TStringList; //빌딩별 출입문 코드 리스트를 가지고 있자.
    TuitionOffCodeList : TStringList;
    TuitionOffGubunList : TStringList;
    TuitionOffValueList : TStringList;
    function Check_FormCritical(var aBlankName:string):Boolean;
    procedure FormNameSetting;
    procedure SearchTB_EMPLOYEELecture(aCode:string;aTopRow:integer = 0);
    procedure LoadTuitionOffCode;
    procedure EmployeeLectureRegist(aEmSeq:string);
  private
    L_bFormClose : Boolean;
    L_bSearchBreak : Boolean;
    L_bSearchEnd : Boolean;
    FFingerDeviceType: Boolean;
    FFingerDeviceID: integer;
    FFingerUserID: String;
    FFingerEMSeq: integer;
    FFingerDeviceSeq: integer;
    FFingerDeviceIP: string;
    { Private declarations }

    function JpegStartsInBlob(PicField:TBlobField):integer;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    { Public declarations }
    procedure FormSearchEnable(aEnabled:Boolean);
    procedure Form_Close;
    procedure FontSetting;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  public
    property FingerDeviceID : integer read FFingerDeviceID write FFingerDeviceID;
    property FingerDeviceSeq : integer read FFingerDeviceSeq write FFingerDeviceSeq;
    property FingerDeviceIP : string read FFingerDeviceIP write FFingerDeviceIP;
    property FingerUserID : String read FFingerUserID write FFingerUserID;
    property FingerEMSeq : integer read FFingerEMSeq write FFingerEMSeq;
  end;

var
  fmEmployeePaymentList: TfmEmployeePaymentList;

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
  uLecturePayment,
  uMain;
{$R *.dfm}

procedure TfmEmployeePaymentList.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmEmployeePaymentList.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmEmployeePaymentList.btn_EmployeeClassSelectClick(Sender: TObject);
begin
  inherited;
  tv_EmployeeClassList.Visible := Not tv_EmployeeClassList.Visible;
  tv_EmployeeClassList.Top := btn_EmployeeClassSelect.Top + btn_EmployeeClassSelect.Height;
  tv_EmployeeClassList.Left := btn_EmployeeClassSelect.Left + btn_EmployeeClassSelect.Width - tv_EmployeeClassList.Width;

end;

procedure TfmEmployeePaymentList.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;

end;

procedure TfmEmployeePaymentList.btn_SaveMouseEnter(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clYellow;
end;

procedure TfmEmployeePaymentList.btn_SaveMouseLeave(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clGray;
end;

function TfmEmployeePaymentList.Check_FormCritical(var aBlankName: string): Boolean;
begin

end;

procedure TfmEmployeePaymentList.dt_FromdateChange(Sender: TObject);
begin
  inherited;
  SearchTB_EMPLOYEELecture('');
end;

procedure TfmEmployeePaymentList.ed_SearchPhoneKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  SearchTB_EMPLOYEELecture('');

end;

procedure TfmEmployeePaymentList.EmployeeLectureRegist(aEmSeq: string);
begin
  inherited;


end;



procedure TfmEmployeePaymentList.FontSetting;
begin
end;

procedure TfmEmployeePaymentList.FormChangeEvent(aNumber: integer);
var
  stSelectCode1 : string;
  stSelectCode2 : string;
  nIndex : integer;
begin
  case aNumber of
    con_FormBMOSCOMPANYCODE : begin
        LoadCompanyTreeView('',tv_EmployeeClassList,tv_EmployeeClassCode,con_LocalCompanyImageIndex,'',True);
    end;
    con_FormBMOSBUILDINGCODE : begin
//      LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
    end;
    con_FormBMOSPOSICODE : begin

    end;
    con_FormBMOSEMPLOYEEGUBUN : begin
    end;

  end;
end;

procedure TfmEmployeePaymentList.FormClose(Sender: TObject; var Action: TCloseAction);
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

  CertificateCodeList.Free;
  Certificate1CodeList.Free;
  PosiCodeList.Free;
  PosiSearchCodeList.Free;
  EmployeeGubunCodeList.Free;
  EmployeeGubunSearchCodeList.Free;
  EmployeeStateCodeList.Free;
  CardGubunCodeList.Free;
  WorkCardGubunCodeList.Free;
  WorkCardStateCodeList.Free;
  AddCardNoList.Free;
  ChangeCardNoList.Free;
  CardStateCodeList.Free;
  CardSearchStateCodeList.Free;
  DeleteCardNoList.Free;
  BuildingDoorCodeList.Free;
  BuildingArmAreaCodeList.Free;
  TuitionOffCodeList.Free;
  TuitionOffGubunList.Free;
  TuitionOffValueList.Free;

  fmMain.FORMENABLE(con_FormBMOSEMPLOYEE,'FALSE');

  Action := caFree;
end;

procedure TfmEmployeePaymentList.FormCreate(Sender: TObject);
begin
  inherited;
  CertificateCodeList := TStringList.Create;
  Certificate1CodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  PosiSearchCodeList := TStringList.Create;
  EmployeeGubunCodeList:= TStringList.Create;
  EmployeeGubunSearchCodeList := TStringList.Create;
  EmployeeStateCodeList := TStringList.Create;
  CardGubunCodeList := TStringList.Create;
  WorkCardGubunCodeList := TStringList.Create;
  WorkCardStateCodeList := TStringList.Create;
  AddCardNoList := TStringList.Create;
  ChangeCardNoList:= TStringList.Create;
  CardStateCodeList := TStringList.Create;
  CardSearchStateCodeList := TStringList.Create;
  DeleteCardNoList := TStringList.Create;
  BuildingDoorCodeList := TStringList.Create;
  BuildingArmAreaCodeList := TStringList.Create;

  TuitionOffCodeList := TStringList.Create;
  TuitionOffGubunList := TStringList.Create;
  TuitionOffValueList := TStringList.Create;

  FontSetting;
  L_bSearchEnd := True;

  dt_Fromdate.Date := Now - 30;
  dt_Todate.Date := Now;
  //dmSupremaFinger := TdmSupremaFinger.Create(nil);

end;

procedure TfmEmployeePaymentList.FormGradeRefresh;
begin
  pm_EmDelete.Enabled := IsDeleteGrade;
  pm_EmUpdate.Enabled := IsUpdateGrade;
end;

procedure TfmEmployeePaymentList.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmEmployeePaymentList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    //if op_Work.ActivePage = op_employeeInfo then rg_tuitionOff.ItemIndex := -1;
  end;

end;

procedure TfmEmployeePaymentList.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  pm_EmDelete.Caption := dmFormFunction.GetFormName('0','2','COMMONDELETE');


  L_stDeleteCaption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stCardNoCaption := dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER');
  pm_EmUpdate.Caption := dmFormFunction.GetFormName('0','2','COMMONUPDATE');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');

  L_stEmCodeCaption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  L_stEmNameCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  L_stEmHandPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  L_stEmCompanyPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  L_stEmEtcCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
end;

procedure TfmEmployeePaymentList.FormResize(Sender: TObject);
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
end;

procedure TfmEmployeePaymentList.FormSearchEnable(aEnabled: Boolean);
begin
  tv_EmployeeClassList.Enabled := aEnabled;
  ed_SearchName.Enabled := aEnabled;
end;

procedure TfmEmployeePaymentList.FormShow(Sender: TObject);
var
  nFormDefaultHeight : integer;
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSEMPLOYEE,'TRUE');


  LoadTuitionOffCode;
  LoadCompanyTreeView('',tv_EmployeeClassList,tv_EmployeeClassCode,con_LocalCompanyImageIndex,'',True);
  tv_EmployeeClassList.Items[0].Selected := True;
  tv_EmployeeClassListDblClick(self);
  if L_bFormClose or G_bApplicationTerminate then Exit;

  L_bVisitEditMode := True;
end;

procedure TfmEmployeePaymentList.Form_Close;
begin
  Close;
end;

function TfmEmployeePaymentList.JpegStartsInBlob(PicField: TBlobField): integer;
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


procedure TfmEmployeePaymentList.ListResize(Sender: TObject);
begin
  inherited;
  sg_EmployeeList.Width := List.Width - 20;
  sg_EmployeeList.Height := List.Height - sg_EmployeeList.Top - 40;
  sg_EmployeeList.ColWidths[7] := sg_EmployeeList.Width - sg_EmployeeList.ColWidths[0] - sg_EmployeeList.ColWidths[1] - sg_EmployeeList.ColWidths[2]
                                  - sg_EmployeeList.ColWidths[3] - sg_EmployeeList.ColWidths[4] - sg_EmployeeList.ColWidths[5] - sg_EmployeeList.ColWidths[6] - 20;
  if sg_EmployeeList.ColWidths[7] < 100 then sg_EmployeeList.ColWidths[7] := 100;


end;


procedure TfmEmployeePaymentList.LoadTuitionOffCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  TuitionOffCodeList.Clear;
  TuitionOffCodeList.Add('0');
  TuitionOffGubunList.Add('');
  TuitionOffValueList.Add('');
  stSql := 'Select * from TB_TuitionOFF ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      while Not Eof do
      begin
        TuitionOffCodeList.Add(FindField('TO_CODE').AsString);
        TuitionOffGubunList.Add(FindField('TO_GUBUN').AsString);
        TuitionOffValueList.Add(FindField('TO_VALUE').AsString);
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmEmployeePaymentList.Pan_EmcodeMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfmEmployeePaymentList.Pan_EmcodeMouseMove(Sender: TObject; Shift: TShiftState;
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

procedure TfmEmployeePaymentList.Pan_EmcodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    // MOUSE DOWN = FALSE 설정
//    MouseDowning := False;
end;

procedure TfmEmployeePaymentList.pan_emPermitAdminMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);

end;

procedure TfmEmployeePaymentList.pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
end;

procedure TfmEmployeePaymentList.SearchTB_EMPLOYEELecture(aCode: string;
  aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  i : integer;
  nTotAmt : integer;

  stCompanyCode : string;
begin
  GridInit(sg_EmployeeList,8,2,False);

  stCompanyCode := ed_SerchSelectCompanyCode.Text;
  if stCompanyCode = '' then stCompanyCode := '0';

  stSql := ' Select a.*,c.EM_NAME,c.EM_PAYMENTDAY,c.TO_CODE,c.EM_LASTPAYMONTH,d.TO_NAME ';
  stSql := stSql + ' From TB_LecturePayment a ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON(a.EM_SEQ = c.EM_SEQ) ';
  stSql := stSql + ' Left Join TB_TuitionOFF d ';
  stSql := stSql + ' ON(c.TO_CODE = d.TO_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND LP_PayDate BETWEEN ''' + FormatDateTime('yyyymmdd',dt_Fromdate.Date) + ''' AND ''' + FormatDateTime('yyyymmdd',dt_Todate.Date) + ''' ';
  stSql := stSql + ' AND c.CO_COMPANYCODE Like ''' + stCompanyCode + '%'' ';
  if ed_SearchName.Text <> '' then
    stSql := stSql + ' AND c.EM_NAME Like N''%' + ed_SearchName.Text + '%'' ';
  if ed_SearchPhone.Text <> '' then
    stSql := stSql + ' AND (c.EM_HANDPHONE Like ''%' + ed_SearchPhone.Text + '%'' OR c.EM_COMPANYPHONE Like ''%' + ed_SearchPhone.Text + '%'' ) ';
  stSql := stSql + ' Order by a.LP_PayDate ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

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
      //lb_SearchCount.Caption.Text := FormatFloat('#,##0',recordCount);
      if recordcount < 1 then Exit;


      with sg_EmployeeList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          if L_bSearchBreak then
          begin
            Exit;
          end;
          if L_bFormClose or G_bApplicationTerminate then Exit;

          cells[0,nRow] := MakeDateTimeStr(FindField('LP_PayDate').AsString);        //납부일
          cells[1,nRow] := FindField('EM_NAME').AsString; //학생명
          cells[2,nRow] := copy(FindField('LP_MONTH').AsString,1,4) + '년 ' + copy(FindField('LP_MONTH').AsString,5,2)+'월';    //수납월
          cells[3,nRow] := FormatFloat('#,', FindField('LP_LECTUREAMT').AsInteger);   //수강료
          cells[4,nRow] := FindField('TO_NAME').AsString;//할인타입
          cells[5,nRow] := FormatFloat('#,', FindField('TO_AMT').AsInteger);   //할인금액
          cells[6,nRow] := FormatFloat('#,', FindField('LP_AMT').AsInteger);//납부금액
          cells[7,nRow] := FindField('LP_MEMO').AsString;//비고


          nRow := nRow + 1;
          Application.ProcessMessages;
          Next;
        end;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmEmployeePaymentList.SearchTimerTimer(Sender: TObject);
begin
  inherited;
  SearchTimer.Enabled := False;
  SearchTB_EMPLOYEELecture('');
end;

procedure TfmEmployeePaymentList.sg_CardCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  if Not L_bVisitEditMode then Exit;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;

end;

procedure TfmEmployeePaymentList.sg_EmployeeLectureListGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var
    s_temp: String;
begin

  if (ARow > 0) and (ACol = 5) then begin
      s_temp  :=  TAdvStringGrid(Sender).Cells[ACol, ARow];

      if s_temp = '수납완료' then begin
          ABrush.Color :=  clWhite;
          AFont.Color :=  clBlack;
      end else begin
          ABrush.Color :=  $0080FFFF;
          AFont.Color :=  clBlack;
      end;

  end;
end;

procedure TfmEmployeePaymentList.sg_EmployeeListCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if Not L_bSearchEnd then
  begin
    sg_EmployeeList.SetCheckBoxState(ACol,ARow,Not State);
    Exit;
  end;
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

procedure TfmEmployeePaymentList.sg_EmployeeListResize(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := sg_EmployeeList.Height div sg_EmployeeList.DefaultRowHeight;
end;

procedure TfmEmployeePaymentList.sg_LectureCodeCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nLectureCodeCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nLectureCodeCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nLectureCodeCheckCount := L_nLectureCodeCheckCount + 1
    else L_nLectureCodeCheckCount := L_nLectureCodeCheckCount - 1 ;
  end;

end;

procedure TfmEmployeePaymentList.sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployeePaymentList.sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployeePaymentList.sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployeePaymentList.sg_PermitDoorCheckBoxClick(Sender: TObject; ACol,
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



procedure TfmEmployeePaymentList.tv_EmployeeClassListDblClick(Sender: TObject);
var
  stCode : string;
begin
  inherited;
  if tv_EmployeeClassList.Selected = nil then tv_EmployeeClassList.Items[0].Selected := True;

  ed_SearchEmployeeClassName.Text := tv_EmployeeClassList.Selected.Text;
  stCode := tv_EmployeeClassCode.Items.Item[tv_EmployeeClassList.Selected.AbsoluteIndex].Text;

  if ed_SerchSelectCompanyCode.Text <> stCode then
  begin
    ed_SerchSelectCompanyCode.Text := stCode;
    SearchTB_EMPLOYEELecture('');
  end;
  tv_EmployeeClassList.Visible := False;

end;


initialization
  RegisterClass(TfmEmployeePaymentList);
Finalization
  UnRegisterClass(TfmEmployeePaymentList);

end.
