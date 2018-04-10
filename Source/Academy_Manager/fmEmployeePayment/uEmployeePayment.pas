﻿unit uEmployeePayment;

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
  TfmEmployeePayment = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    AdvSplitter1: TAdvSplitter;
    AdvSmoothPanel1: TAdvSmoothPanel;
    MenuImageList16: TImageList;
    OpenDialog1: TOpenDialog;
    pm_Employee: TPopupMenu;
    pm_EmUpdate: TMenuItem;
    pm_EmDelete: TMenuItem;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_EmployeeClass: TLabel;
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
    AdvPanel2: TAdvPanel;
    AdvSmoothLabel12: TAdvSmoothLabel;
    ed_Name1: TAdvEdit;
    AdvSmoothLabel13: TAdvSmoothLabel;
    ed_CompanyPhone1: TAdvEdit;
    AdvSmoothLabel14: TAdvSmoothLabel;
    ed_Emstate: TAdvEdit;
    AdvSmoothLabel15: TAdvSmoothLabel;
    ed_Indate: TAdvEdit;
    Panel2: TPanel;
    Image2: TImage;
    ed_emSeq: TAdvEdit;
    AdvSmoothPanel2: TAdvSmoothPanel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    sg_EmployeeLectureList: TAdvStringGrid;
    Panel1: TPanel;
    AdvSmoothLabel4: TAdvSmoothLabel;
    AdvSmoothLabel5: TAdvSmoothLabel;
    AdvSmoothLabel6: TAdvSmoothLabel;
    AdvSmoothLabel8: TAdvSmoothLabel;
    ed_TutituionOffAmt: TAdvEdit;
    ed_PaymentAmt: TAdvEdit;
    rg_PayType: TAdvOfficeRadioGroup;
    btn_Save: TAdvGlowButton;
    mem_text: TMemo;
    Panel3: TPanel;
    rg_tuitionOff: TAdvOfficeRadioGroup;
    AdvSmoothLabel3: TAdvSmoothLabel;
    ed_LectureAmt: TAdvEdit;
    AdvSmoothLabel7: TAdvSmoothLabel;
    ed_PayMonth: TAdvEditBtn;
    MonthCalendar1: TMonthCalendar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pan_EmployeeListResize(Sender: TObject);
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
    procedure pm_EmDeleteClick(Sender: TObject);
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
    procedure btn_EmployeeDeleteClick(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sg_LectureCodeCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure tv_EmployeeClassListDblClick(Sender: TObject);
    procedure ListResize(Sender: TObject);
    procedure sg_EmployeeListClick(Sender: TObject);
    procedure btn_EmployeeClassSelectClick(Sender: TObject);
    procedure sg_EmployeeLectureListGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure AdvSmoothPanel2Resize(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_PayMonthClickBtn(Sender: TObject);
    procedure sg_EmployeeLectureListCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure rg_tuitionOffClick(Sender: TObject);
    procedure MonthCalendar1DblClick(Sender: TObject);
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
    procedure SearchEmployeeList(aCode:string;aTopRow:integer = 0);
    procedure SearchTB_EMPLOYEELecture(aCode:string;aTopRow:integer = 0);
    procedure LoadTuitionOffCode;
    procedure TuitionOffCalc;
    procedure EmployeeLectureRegist(aEmSeq:string);
    procedure paymentCalc;
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
  fmEmployeePayment: TfmEmployeePayment;

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

procedure TfmEmployeePayment.AdvSmoothPanel2Resize(Sender: TObject);
begin
  inherited;
  sg_EmployeeLectureList.Width := AdvSmoothPanel2.Width - (sg_EmployeeLectureList.Left * 2);
  sg_EmployeeLectureList.Height := AdvSmoothPanel2.Height - sg_EmployeeLectureList.Top - Panel3.Height - Panel1.Height;
  if sg_EmployeeLectureList.Height < 80 then sg_EmployeeLectureList.Height := 80;

end;

procedure TfmEmployeePayment.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmEmployeePayment.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmEmployeePayment.btn_EmployeeClassSelectClick(Sender: TObject);
begin
  inherited;
  tv_EmployeeClassList.Visible := Not tv_EmployeeClassList.Visible;
  tv_EmployeeClassList.Top := btn_EmployeeClassSelect.Top + btn_EmployeeClassSelect.Height;
  tv_EmployeeClassList.Left := btn_EmployeeClassSelect.Left + btn_EmployeeClassSelect.Width - tv_EmployeeClassList.Width;

end;

procedure TfmEmployeePayment.btn_EmployeeDeleteClick(Sender: TObject);
begin
  inherited;
  pm_EmDeleteClick(pm_EmDelete);

end;

procedure TfmEmployeePayment.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;

end;

procedure TfmEmployeePayment.btn_SaveClick(Sender: TObject);
var
  stPayMonth : string;
begin
  inherited;
  btn_Save.Enabled := False;
  stPayMonth := ed_PayMonth.Text;
  stPayMonth := stringReplace(stPayMonth,'년','',[rfReplaceAll]);
  stPayMonth := stringReplace(stPayMonth,'월','',[rfReplaceAll]);
  stPayMonth := stringReplace(stPayMonth,' ','',[rfReplaceAll]);
  if rg_tuitionOff.ItemIndex <0 then rg_tuitionOff.ItemIndex := 0;

  if dmDBFunction.CheckTB_LecturePaymentSummary_Key(stPayMonth,ed_emSeq.Text) = 1 then
  begin
    if Application.MessageBox('이미 납부한 내역이 있습니다. 납부내역을 수정하시겠습니까?','확인',MB_OKCANCEL)= IDCANCEL  then Exit;

    dmDBUpdate.UpdateTB_LecturePaymentSummary_Field_IntValue(stPayMonth,ed_emSeq.Text,'LP_PaymentType','1');
    dmDBUpdate.UpdateTB_LecturePaymentSummary_Field_IntValue(stPayMonth,ed_emSeq.Text,'LP_PayDate',formatDateTime('yyyymmdd',now));
  end else
  begin
    dmDBInsert.InsertIntoTB_LecturePaymentSummary_Value(stPayMonth,ed_emSeq.Text,'1',formatDateTime('yyyymmdd',now));
  end;
  dmDBInsert.InsertIntoTB_LecturePayment(ed_emSeq.Text,stPayMonth,ed_LectureAmt.Text,TuitionOffCodeList.Strings[rg_tuitionOff.ItemIndex],ed_TutituionOffAmt.Text,inttostr(rg_PayType.ItemIndex), ed_PaymentAmt.Text,formatDateTime('yyyymmdd',now),mem_text.Text);
  dmDBUPdate.UpdateTB_EMPLOYEE_Field_StringValue(ed_emSeq.Text,'EM_LASTPAYMONTH',stPayMonth);

  sg_EmployeeListClick(sg_EmployeeList);

end;

procedure TfmEmployeePayment.btn_SaveMouseEnter(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clYellow;
end;

procedure TfmEmployeePayment.btn_SaveMouseLeave(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clGray;
end;

function TfmEmployeePayment.Check_FormCritical(var aBlankName: string): Boolean;
begin

end;

procedure TfmEmployeePayment.ed_PayMonthClickBtn(Sender: TObject);
begin
  inherited;
  MonthCalendar1.Visible := Not MonthCalendar1.Visible;
  MonthCalendar1.Left := ed_PayMonth.Left + ed_PayMonth.Width - MonthCalendar1.Width;
  MonthCalendar1.Top := Panel3.Top + ed_PayMonth.Top + ed_PayMonth.Height;
end;

procedure TfmEmployeePayment.EmployeeLectureRegist(aEmSeq: string);
begin
  inherited;


end;



procedure TfmEmployeePayment.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmEmployeePayment.FormChangeEvent(aNumber: integer);
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

procedure TfmEmployeePayment.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TfmEmployeePayment.FormCreate(Sender: TObject);
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
  //dmSupremaFinger := TdmSupremaFinger.Create(nil);

end;

procedure TfmEmployeePayment.FormGradeRefresh;
begin
  pm_EmDelete.Enabled := IsDeleteGrade;
  pm_EmUpdate.Enabled := IsUpdateGrade;
end;

procedure TfmEmployeePayment.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmEmployeePayment.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    //if op_Work.ActivePage = op_employeeInfo then rg_tuitionOff.ItemIndex := -1;
  end;

end;

procedure TfmEmployeePayment.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  pm_EmDelete.Caption := dmFormFunction.GetFormName('0','2','COMMONDELETE');


  L_stDeleteCaption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stCardNoCaption := dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER');
  pm_EmUpdate.Caption := dmFormFunction.GetFormName('0','2','COMMONUPDATE');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');

  sg_EmployeeList.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  sg_EmployeeList.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');
  sg_EmployeeList.Cells[2,0] := '생년월일';
  sg_EmployeeList.Cells[3,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  sg_EmployeeList.Cells[4,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  sg_EmployeeList.Cells[5,0]:= '이메일';
  sg_EmployeeList.Cells[6,0]:= '학교명';
  sg_EmployeeList.Cells[7,0]:= '학년';
  sg_EmployeeList.Cells[8,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  sg_EmployeeList.Cells[9,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEINDATE');
  sg_EmployeeList.Cells[10,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEOUTDATE');
  sg_EmployeeList.Cells[11,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEESTATE');
  sg_EmployeeList.Cells[12,0] := '할인코드';
  sg_EmployeeList.Cells[13,0] := '학생순번';
  sg_EmployeeList.Cells[14,0]:= '분류코드';
  L_stEmCodeCaption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  L_stEmNameCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  L_stEmHandPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  L_stEmCompanyPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  L_stEmEtcCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
end;

procedure TfmEmployeePayment.FormResize(Sender: TObject);
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

procedure TfmEmployeePayment.FormSearchEnable(aEnabled: Boolean);
begin
  tv_EmployeeClassList.Enabled := aEnabled;
  ed_SearchName.Enabled := aEnabled;
end;

procedure TfmEmployeePayment.FormShow(Sender: TObject);
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

  Image2.Align := alClient;

  L_bVisitEditMode := True;
  ed_PayMonth.Text := formatDateTime('yyyy년 mm월',now);
  MonthCalendar1.Date := now;
  nFormDefaultHeight := Panel3.Height;
  if (rg_tuitionOff.Height > 40) then
  begin
    Panel3.Height := nFormDefaultHeight + rg_tuitionOff.Height - 40;
  end;
end;

procedure TfmEmployeePayment.Form_Close;
begin
  Close;
end;

function TfmEmployeePayment.JpegStartsInBlob(PicField: TBlobField): integer;
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


procedure TfmEmployeePayment.ListResize(Sender: TObject);
begin
  inherited;
  btn_EmployeeClassSelect.Left := List.Width - 10 - btn_EmployeeClassSelect.Width;
  ed_SearchEmployeeClassName.Width := btn_EmployeeClassSelect.Left - 10 - ed_SearchEmployeeClassName.Left;
  ed_SearchPhone.Width := ed_SearchEmployeeClassName.Width;
  ed_SearchName.Width := ed_SearchEmployeeClassName.Width;
  sg_EmployeeList.Width := List.Width - 20;
  sg_EmployeeList.ColWidths[0] := sg_EmployeeList.Width - 10;
  sg_EmployeeList.Height := List.Height - sg_EmployeeList.Top - 40;

end;


procedure TfmEmployeePayment.LoadTuitionOffCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  rg_tuitionOff.Items.Clear;
  TuitionOffCodeList.Clear;
  rg_tuitionOff.Items.Add('사용안함');
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
        rg_tuitionOff.Items.Add(FindField('TO_NAME').AsString);
        TuitionOffCodeList.Add(FindField('TO_CODE').AsString);
        TuitionOffGubunList.Add(FindField('TO_GUBUN').AsString);
        TuitionOffValueList.Add(FindField('TO_VALUE').AsString);
        Next;
      end;

      rg_tuitionOff.Height := ((recordcount div 4) + 1) * 40;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmEmployeePayment.MonthCalendar1DblClick(Sender: TObject);
begin
  inherited;
  ed_PayMonth.Text := FormatDateTime('yyyy년 mm월',MonthCalendar1.Date);
  MonthCalendar1.Visible := False;
end;

procedure TfmEmployeePayment.Pan_EmcodeMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfmEmployeePayment.Pan_EmcodeMouseMove(Sender: TObject; Shift: TShiftState;
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

procedure TfmEmployeePayment.Pan_EmcodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    // MOUSE DOWN = FALSE 설정
//    MouseDowning := False;
end;

procedure TfmEmployeePayment.pan_emPermitAdminMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);

end;

procedure TfmEmployeePayment.pan_EmployeeListResize(Sender: TObject);
begin
  inherited;
//  sg_EmployeeList.Width := pan_EmployeeList.Width - sg_EmployeeList.Left - 20;
//  sg_EmployeeList.Height := pan_EmployeeList.Height - sg_EmployeeList.Top - 50;

end;

procedure TfmEmployeePayment.pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
end;

procedure TfmEmployeePayment.paymentCalc;
begin
  if Not isDigit(ed_LectureAmt.Text) then ed_LectureAmt.Text := '0';
  if Not isDigit(ed_TutituionOffAmt.Text) then ed_TutituionOffAmt.Text := '0';
  ed_PaymentAmt.Text := inttostr( strtoint(ed_LectureAmt.Text) - strtoint(ed_TutituionOffAmt.Text));
end;

procedure TfmEmployeePayment.pm_EmDeleteClick(Sender: TObject);
var
  stMessage : string;
  stEmSeq : string;
  stSql : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  stMessage := sg_EmployeeList.Cells[0,sg_EmployeeList.Row] + '을(를) 삭제 하시겠습니까?';
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  stEmSeq := sg_EmployeeList.Cells[13,sg_EmployeeList.Row];
  if isDigit(stEmSeq) then
  begin
    dmDBCardPermit.EmployeePermitAllDelete(stEmSeq); //사원 전체권한 삭제
    dmDBDelete.DeleteTB_EMPLOYEE_EmSeq(stEmSeq);
    dmDBDelete.DeleteTB_EMPLOYEEDEVICETIMECODE_EmSeq(stEmSeq);
    dmDBDelete.DeleteTB_EMPLOYEEFINGER_EmSeq(stEmSeq);
    dmDBUpdate.UpdateTB_FINGERDEVICECARD_EmSeqStop(stEmSeq);
    dmDBDelete.DeleteTB_CARD_EmSeq(stEmSeq);
    dmDBCardPermit.EmployeePermitToCardLoad(stEmSeq);
  end;

  SearchEmployeeList('');
end;

procedure TfmEmployeePayment.rg_tuitionOffClick(Sender: TObject);
begin
  inherited;
  TuitionOffCalc;
end;

procedure TfmEmployeePayment.SearchEmployeeList(aCode: string; aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stCompanyCode : string;
  stPosiCode : string;
  stEmployeeGubun : string;
  stEmCode : string;
  stEmName : string;
  stEmHandPhone : string;
  stEmCompanyPhone : string;
  stEtcInfo : string;
  stCardNo : string;
  stCardState : string;
begin
  L_nEmployeeCheckCount := 0;
  L_bSearchBreak := True;
  FingerUserID := '';

  while Not L_bSearchEnd do
  begin
    SearchTimer.Enabled := True;
    Exit;
  end;
  L_bSearchBreak := False;
  L_bSearchEnd := False;

  GridInit(sg_EmployeeList,1,2,False);

  stCompanyCode := ed_SerchSelectCompanyCode.Text;
  if stCompanyCode = '' then stCompanyCode := '0';



  stSql := ' Select a.EM_FINGERUSE,a.EM_CARDUSE,a.EM_SEQ,a.EM_CODE,a.EM_NAME,a.CO_COMPANYCODE,a.PO_POSICODE,a.EM_EMAIL,a.Cg_Num,a.EM_KEY,';
  stSql := stSql + ' a.EM_GUBUNCODE,a.EM_COMPANYPHONE,a.EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_EMINFO,a.EM_BIRTHDAY,a.EM_SCHOOL,a.EM_PAYMENTDAY,';
  stSql := stSql + ' a.EM_REGDATE,a.EM_ENDDATE,a.EM_ACUSE,a.EM_ATUSE,a.EM_FDUSE,a.EM_GROUPCODE,a.EM_STATECODE,a.TO_CODE,a.EM_GRADE,';
  stSql := stSql + ' a.EM_GRADETYPE,a.AW_CODE,b.CO_COMPANYNAME,c.PO_POSICODENAME,d.EM_GUBUNCODENAME,e.EM_GROUPCODENAME ';
  stSql := stSql + ' , g.CO_COMPANYNAME as COMPANYNAME1,h.CO_COMPANYNAME as COMPANYNAME2,i.CO_COMPANYNAME as COMPANYNAME3 ';
  stSql := stSql + ' From TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_COMPANYCODE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ) ';
  stSql := stSql + ' Left Join TB_POSICODE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.PO_POSICODE = c.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEEGUBUN d ';
  stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_GUBUNCODE = d.EM_GUBUNCODE ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEEGROUPCODE e ';
  stSql := stSql + ' ON (a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_GROUPCODE = e.EM_GROUPCODE ) ';
  stSql := stSql + ' Left Join (select * from TB_COMPANYCODE where CO_DEEPSEQ = 1) g ';
  stSql := stSql + ' ON (a.GROUP_CODE = g.GROUP_CODE ) ';
  stSql := stSql + ' AND ( SUBSTRING(a.CO_COMPANYCODE,1,' + inttostr(1 + G_nCompanyCodeLength) + ') = SUBSTRING(g.CO_COMPANYCODE ,1,' + inttostr(1 + G_nCompanyCodeLength) + ') ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join (select * from TB_COMPANYCODE where CO_DEEPSEQ = 2) h ';
  stSql := stSql + ' ON (a.GROUP_CODE = h.GROUP_CODE ) ';
  stSql := stSql + ' AND ( SUBSTRING(a.CO_COMPANYCODE,1,' + inttostr(1 + (G_nCompanyCodeLength * 2)) + ') = SUBSTRING(h.CO_COMPANYCODE ,1,' + inttostr(1 + (G_nCompanyCodeLength * 2)) + ') ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join (select * from TB_COMPANYCODE where CO_DEEPSEQ = 3) i ';
  stSql := stSql + ' ON (a.GROUP_CODE = i.GROUP_CODE ) ';
  stSql := stSql + ' AND ( SUBSTRING(a.CO_COMPANYCODE,1,' + inttostr(1 + (G_nCompanyCodeLength * 3)) + ') = SUBSTRING(i.CO_COMPANYCODE ,1,' + inttostr(1 + (G_nCompanyCodeLength * 3)) + ') ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE Like ''' + stCompanyCode + '%'' ';
  if ed_SearchName.Text <> '' then
    stSql := stSql + ' AND a.EM_NAME Like N''%' + ed_SearchName.Text + '%'' ';
  if ed_SearchPhone.Text <> '' then
    stSql := stSql + ' AND (a.EM_HANDPHONE Like ''%' + ed_SearchPhone.Text + '%'' OR a.EM_COMPANYPHONE Like ''%' + ed_SearchPhone.Text + '%'' ) ';

  Try
    if (G_nFormEnable = 1) then FormSearchEnable(False);
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

          cells[0,nRow] := FindField('EM_NAME').AsString;        //학생 이름
          cells[1,nRow] := FindField('CO_COMPANYNAME').AsString; //학생 분류
          cells[2,nRow] := FindField('EM_BIRTHDAY').AsString;    //생년월일
          cells[3,nRow] := FindField('EM_HANDPHONE').AsString;   //핸드폰
          cells[4,nRow] := FindField('EM_COMPANYPHONE').AsString;//부모핸드폰
          cells[5,nRow] := FindField('EM_EMAIL').AsString;//이메일
          cells[6,nRow] := FindField('EM_SCHOOL').AsString;//학교명
          cells[7,nRow] := FindField('EM_GRADE').AsString;//학년
          cells[8,nRow] := FindField('EM_EMINFO').AsString;//주소
          cells[9,nRow] := FindField('EM_REGDATE').AsString;  //등록일
          cells[10,nRow] := FindField('EM_ENDDATE').AsString;  //퇴원일
          cells[11,nRow] := FindField('EM_STATECODE').AsString; //재원상태코드
          cells[12,nRow] := FindField('TO_CODE').AsString;      //할인코드
          cells[13,nRow] := FindField('EM_SEQ').AsString;       //사원코드
          cells[14,nRow] := FindField('CO_COMPANYCODE').AsString;  //분류코드
          cells[15,nRow] := FindField('EM_FINGERUSE').AsString;    //지문사용유무
          cells[16,nRow] := FindField('EM_PAYMENTDAY').AsString;    //결제일
          cells[17,nRow] := FindField('Cg_Num').AsString;    //전화그룹
          cells[18,nRow] := MimeDecodeString(FindField('EM_KEY').AsString);    //전화그룹


          if FindField('EM_SEQ').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;

          if FindField('EM_STATECODE').AsString <> '1' then RowColor[nRow] := clRed; //퇴사 또는 휴직 처리 된 인원

          nRow := nRow + 1;
          Application.ProcessMessages;
          Next;
        end;
        if aTopRow = 0 then
        begin
          if Row > (L_nPageListMaxCount - 1) then TopRow := Row - L_nPageListMaxCount;
        end else
        begin
          TopRow := aTopRow;
        end;
      end;

    end;
  Finally
    L_bSearchEnd := True;
    FormSearchEnable(True);
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_EmployeeListClick(sg_EmployeeList);
end;


procedure TfmEmployeePayment.SearchTB_EMPLOYEELecture(aCode: string;
  aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stEmCode : string;
  stTemp : string;
  nTemp : integer;
  bCheckState : Boolean;
  i : integer;
  nTotAmt : integer;
begin
  stEmCode := ed_emSeq.Text;
  GridInit(sg_EmployeeLectureList,7,2,True);
  stSql := ' Select a.*,b.CC_NAME,b.CC_BOOKNAME,b.CC_MONTH,c.EM_PAYMENTDAY,c.TO_CODE,c.EM_LASTPAYMONTH,d.TO_GUBUN,d.TO_VALUE,e.TU_VALUE ';
  stSql := stSql + ' From TB_EMPLOYEELecture a ';
  stSql := stSql + ' Left Join TB_CurriculumCode b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CC_CODE = b.CC_CODE ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON(a.EM_SEQ = c.EM_SEQ) ';
  stSql := stSql + ' Left Join TB_TuitionOFF d ';
  stSql := stSql + ' ON(c.TO_CODE = d.TO_CODE) ';
  stSql := stSql + ' Left Join TB_Tuition e ';
  stSql := stSql + ' ON(a.CC_CODE = e.CC_CODE ';
  stSql := stSql + ' AND substring(c.CO_COMPANYCODE,1,len(e.CO_COMPANYCODE))= e.CO_COMPANYCODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.EM_SEQ = ' + stEmCode + ' ';
  stSql := stSql + ' AND a.EL_STATE = 1 ';

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
      btn_Save.Enabled := True;

      with sg_EmployeeLectureList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
(*

과정명
등록기간
교재
결제일
수납월
수강료
수납현황
종강처리
수강취소
*)

          cells[1,nRow] := FindField('CC_NAME').AsString;        //과정명
          stTemp := FindField('EL_REGDATE').AsString;
          stTemp := MakeDatetimeStr(stTemp);
          cells[2,nRow] := stTemp + '~' + FormatDateTime('yyyy-mm-dd',IncMonth(strtodate(stTemp),FindField('CC_MONTH').AsInteger)); //등록기간
          cells[3,nRow] := FindField('CC_BOOKNAME').AsString;    //교재
          cells[4,nRow] := FindField('EM_PAYMENTDAY').AsString;   //결재일
          cells[5,nRow] := FindField('EM_LASTPAYMONTH').AsString;//수납월
          cells[6,nRow] := FindField('TU_VALUE').AsString ;
          if( cells[5,nRow] = '' ) then cells[7,nRow] := '미수납'
          else if( cells[5,nRow] + formatdatetime('dd',now) < formatdatetime('yyyymmdd',IncMonth(strtodate(formatdatetime('yyyy-mm-',now) + FillzeroNumber(FindField('EL_PAYDATE').AsInteger,2)),-1))) then cells[7,nRow] := '미수납'
          else cells[7,nRow] := '수납완료';

          cells[8,nRow] := FindField('EM_SEQ').AsString;
          cells[9,nRow] := FindField('CC_CODE').AsString;
          cells[10,nRow] := FindField('EL_REGDATE').AsString;

          if cells[7,nRow] = '수납완료' then AddCheckBox(0,nRow,False,False)
          else AddCheckBox(0,nRow,True,False);

          if FindField('CC_CODE').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Application.ProcessMessages;
          Next;
        end;
        if aTopRow = 0 then
        begin
          if Row > (L_nPageListMaxCount - 1) then TopRow := Row - L_nPageListMaxCount;
        end else
        begin
          TopRow := aTopRow;
        end;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  with sg_EmployeeLectureList do
  begin
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          nTotAmt := nTotAmt + strtoint(cells[6,i]);
        end;
        Application.ProcessMessages;
      end;
  end;
  ed_LectureAmt.Text := inttostr(nTotAmt);
  TuitionOffCalc;
end;

procedure TfmEmployeePayment.SearchTimerTimer(Sender: TObject);
begin
  inherited;
  SearchTimer.Enabled := False;
  SearchEmployeeList('');
end;

procedure TfmEmployeePayment.sg_CardCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  if Not L_bVisitEditMode then Exit;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;

end;

procedure TfmEmployeePayment.sg_EmployeeLectureListCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
var
  i : integer;
  bCheckState : Boolean;
  nTotAmt : integer;
begin
  inherited;
  nTotAmt := 0;
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;

  with TAdvStringGrid(Sender) do
  begin
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          nTotAmt := nTotAmt + strtoint(cells[6,i]);
        end;
        Application.ProcessMessages;
      end;
  end;
  ed_LectureAmt.Text := inttostr(nTotAmt);
  TuitionOffCalc;

end;

procedure TfmEmployeePayment.sg_EmployeeLectureListGetCellColor(Sender: TObject; ARow,
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

procedure TfmEmployeePayment.sg_EmployeeListCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployeePayment.sg_EmployeeListClick(Sender: TObject);
var
  stMessage : string;
  nIndex : integer;
  stTemp : string;
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stDate : string;
  stEmCodeImage : string;
begin
  inherited;
  if sg_EmployeeList.SelectedRowCount = 0 then sg_EmployeeList.SelectRows(1,1);

  if sg_EmployeeList.Cells[13,sg_EmployeeList.Row] = '' then Exit;
  with sg_EmployeeList do
  begin
    ed_emSeq.Text := Cells[13,Row];
    ed_Name1.Text := Cells[0,Row];
    ed_CompanyPhone1.Text := MakePhoneNumber(Cells[4,Row]);

    stDate := Cells[9,Row];
    stDate := stringReplace(stDate,'-','',[rfReplaceAll]);
    stDate := stringReplace(stDate,':','',[rfReplaceAll]);
    stDate := stringReplace(stDate,'','',[rfReplaceAll]);
    ed_Indate.Text := MakeDateTimeStr(stDate);
    rg_tuitionOff.ItemIndex := strtoint(Cells[12,Row]);
    mem_text.Text := '';

  end;
  //여기서 이미지 로딩 하자.
    Try
      MapJpg := TJpegImage.Create;
      MapStream := TMemoryStream.Create;
      if G_nDBType = POSTGRESQL then
      begin
        DeleteFile(G_stExeFolder + '\1.jpg');
        stSql := ' SELECT lo_export(TB_EMPLOYEE.EM_IMAGE, ' + G_stExeFolder + '\1.jpg' + ') From TB_EMPLOYEE ' ;
        stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
        stSql := stSql + ' AND EM_SEQ = ' + ed_emSeq.Text + ' ';
      end else
      begin
        stSql := ' select * from TB_EMPLOYEE ' ;
        stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
        stSql := stSql + ' AND EM_SEQ = ' + ed_emSeq.Text + ' ';
      end;

      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      with TempAdoQuery do
      begin
        Close;
        Sql.Clear;
        Sql.Text := stSql;
        Try
          Open;
        Except
          dmDataBase.DBConnected := False;
          Exit;
        End;

        if RecordCount > 0 then
        begin
          if Not FindField('EM_IMAGE').IsNull then
          begin
            if G_nDBType = POSTGRESQL then
            begin
              if FileExists(G_stExeFolder + '\1.jpg') then
              begin
                Image2.Picture.LoadFromFile(G_stExeFolder + '\1.jpg');
              end;
            end else
            begin
              JPEGLoadFromDB(FieldByName('EM_IMAGE'), Image2);
            end;

          end;
        end;
      end;
    Finally
      TempAdoQuery.Free;
      CoUninitialize;
      MapJpg.Free;
      MapStream.Free;
    End;
  SearchTB_EMPLOYEELecture('');
end;

procedure TfmEmployeePayment.sg_EmployeeListResize(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := sg_EmployeeList.Height div sg_EmployeeList.DefaultRowHeight;
end;

procedure TfmEmployeePayment.sg_LectureCodeCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployeePayment.sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployeePayment.sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployeePayment.sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployeePayment.sg_PermitDoorCheckBoxClick(Sender: TObject; ACol,
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


procedure TfmEmployeePayment.TuitionOffCalc;
var
  nTemp : integer;
begin
  if (rg_tuitionOff.ItemIndex < 1) or Not isDigit(ed_LectureAmt.Text) then
  begin
    ed_TutituionOffAmt.Text := '0';
    paymentCalc;
    Exit;
  end;

  if TuitionOffGubunList.strings[rg_tuitionOff.ItemIndex] = '0' then
  begin
    nTemp := strtoint(ed_LectureAmt.Text) * strToint(TuitionOffValueList.Strings[rg_tuitionOff.ItemIndex]) div 100;
    nTemp := (nTemp div 1000) * 1000;
    ed_TutituionOffAmt.Text := inttostr(nTemp);
  end else if TuitionOffGubunList.strings[rg_tuitionOff.ItemIndex] = '1' then
  begin
    ed_TutituionOffAmt.Text := TuitionOffValueList.Strings[rg_tuitionOff.ItemIndex];
  end else
  begin
    ed_TutituionOffAmt.Text := '0';
  end;

  paymentCalc;

end;

procedure TfmEmployeePayment.tv_EmployeeClassListDblClick(Sender: TObject);
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
    SearchEmployeeList('');
  end;
  tv_EmployeeClassList.Visible := False;

end;


initialization
  RegisterClass(TfmEmployeePayment);
Finalization
  UnRegisterClass(TfmEmployeePayment);

end.