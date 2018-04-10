﻿unit uCertificateCode;

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
  AdvEdBtn;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmCertificateCode = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    tv_List: TTreeView;
    tv_Code: TTreeView;
    pm_Work: TPopupMenu;
    AdvSplitter1: TAdvSplitter;
    AdvSmoothPanel1: TAdvSmoothPanel;
    pan_EmployeeList: TAdvSmoothPanel;
    AdvSmoothPanel2: TAdvSmoothPanel;
    sg_EmployeeList: TAdvStringGrid;
    MenuImageList16: TImageList;
    pm_EmployeeAdd: TMenuItem;
    Pan_Emcode: TAdvSmoothPanel;
    lb_AddClassName: TAdvSmoothLabel;
    ed_CertificateClassName: TAdvEdit;
    ed_CertificateSeq: TAdvEdit;
    lb_AddCertificateName: TAdvSmoothLabel;
    ed_Name: TAdvEdit;
    ed_CertificateAmt: TAdvEdit;
    lb_AddAmt: TAdvSmoothLabel;
    pan_AddWork: TAdvSmoothPanel;
    OpenDialog1: TOpenDialog;
    pm_Employee: TPopupMenu;
    pm_EmUpdate: TMenuItem;
    pm_EmDelete: TMenuItem;
    ed_SerchSelectCertificatdClassCode: TAdvEdit;
    ed_OldEmCode: TAdvEdit;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_List: TLabel;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_EmployeeList: TLabel;
    btn_EmployeeAdd: TAdvGlowButton;
    lb_EmployeeCaption: TLabel;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    btn_CompanyNameSelect: TAdvGlowButton;
    lb_SearchCount1: TAdvSmoothLabel;
    lb_SearchCount: TAdvSmoothLabel;
    lb_Count1: TAdvSmoothLabel;
    pan_progress: TAdvSmoothPanel;
    ProgressBar1: TProgressBar;
    lb_ProgressCount: TAdvSmoothLabel;
    btn_Excel: TAdvGlowButton;
    SaveDialog1: TSaveDialog;
    ProgressBar2: TProgressBar;
    pan_Message: TAdvSmoothPanel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    AdvProgressBar1: TAdvProgressBar;
    btn_AccessConfirm: TAdvGlassButton;
    btn_EmployeeDelete: TAdvGlowButton;
    SearchTimer: TTimer;
    lb_HH: TAdvSmoothLabel;
    ed_MasterAmt: TAdvEdit;
    lb_Month: TAdvSmoothLabel;
    ed_IssuAmt: TAdvEdit;
    tv_AddCode: TTreeView;
    ed_CertificateClassCode: TAdvEdit;
    AdvSmoothLabel3: TAdvSmoothLabel;
    ed_Organize: TAdvEdit;
    tv_AddName: TTreeView;
    AdvSmoothLabel1: TAdvSmoothLabel;
    ed_hompage: TAdvEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tv_ListClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_CompanyNameKeyPress(Sender: TObject; var Key: Char);
    procedure tv_ListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tv_ListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure pan_EmployeeListResize(Sender: TObject);
    procedure pm_EmployeeAddClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pan_AddWorkResize(Sender: TObject);
    procedure btn_SaveMouseEnter(Sender: TObject);
    procedure btn_SaveMouseLeave(Sender: TObject);
    procedure btn_CompanyNameSelectClick(Sender: TObject);
    procedure tv_AddNameDblClick(Sender: TObject);
    procedure dt_IndateChange(Sender: TObject);
    procedure dt_OutDateChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure sg_EmployeeListResize(Sender: TObject);
    procedure pm_EmUpdateClick(Sender: TObject);
    procedure sg_EmployeeListDblClick(Sender: TObject);
    procedure sg_PermitDoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure pm_EmDeleteClick(Sender: TObject);
    procedure btn_EmployeeAddClick(Sender: TObject);
    procedure Pan_EmcodeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pan_EmcodeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pan_EmcodeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sg_EmployeeListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_CompanyManageClick(Sender: TObject);
    procedure btn_BuildingCancelClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pan_emPermitAdminMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pan_PositionInfoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_AccessConfirmClick(Sender: TObject);
    procedure btn_EmployeeDeleteClick(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure ListResize(Sender: TObject);
    procedure sg_TuitionCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure btn_CancelClick(Sender: TObject);
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
    AdminUserIDList : TStringList;
    CardGubunCodeList :TStringList;
    CardSearchStateCodeList :TStringList;
    CardStateCodeList :TStringList;
    EmployeeGubunCodeList : TStringList;
    EmployeeGubunSearchCodeList : TStringList;
    EmployeeStateCodeList : TStringList;
    PosiCodeList : TStringList;
    PosiSearchCodeList : TStringList;
    WorkCardGubunCodeList :TStringList;
    WorkCardStateCodeList :TStringList;
    TuitionOffCodeList : TStringList;
    procedure FormNameSetting;
    procedure SearchCertificateList(aCode:string;aTopRow:integer = 0);
  private
    L_bFormClose : Boolean;
    L_bSearchBreak : Boolean;
    L_bSearchEnd : Boolean;
    { Private declarations }
    procedure employeePanelClear;

    procedure ViewTimeGroupCode(aTimeGroup:string);
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
    procedure RegistTempDB(G_stCardRegisterIP:string);
  end;

var
  fmCertificateCode: TfmCertificateCode;

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

procedure TfmCertificateCode.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmCertificateCode.btn_AccessConfirmClick(Sender: TObject);
begin
  inherited;
  L_bSearchBreak := True;
  Pan_Message.Visible := False;

end;

procedure TfmCertificateCode.btn_BuildingCancelClick(Sender: TObject);
begin
  inherited;
  AdvSmoothPanel2.Enabled := True;
  List.Enabled := True;
end;

procedure TfmCertificateCode.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_Emcode.Visible := False;
end;

procedure TfmCertificateCode.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmCertificateCode.btn_CompanyManageClick(Sender: TObject);
begin
  inherited;
  if L_nEmployeeCheckCount < 1 then
  begin
    showmessage(dmFormMessage.GetMessage('NOTSELECTEMPLOYEE'));
    Exit;
  end;

  AdvSmoothPanel2.Enabled := False;
  List.Enabled := False;
end;

procedure TfmCertificateCode.btn_CompanyNameSelectClick(Sender: TObject);
begin
  inherited;
  tv_AddName.Visible := Not tv_AddName.Visible;
  tv_AddName.Top := btn_CompanyNameSelect.Top + btn_CompanyNameSelect.Height;
  L_bEmployeeGradeChange := True;
end;

procedure TfmCertificateCode.btn_EmployeeAddClick(Sender: TObject);
begin
  inherited;
  pm_EmployeeAddClick(pm_EmployeeAdd);
end;

procedure TfmCertificateCode.btn_EmployeeDeleteClick(Sender: TObject);
begin
  inherited;
  pm_EmDeleteClick(pm_EmDelete);

end;

procedure TfmCertificateCode.btn_ExcelClick(Sender: TObject);
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
        sg_EmployeeList.SaveToXLS(stSaveFileName);
      Except
        sg_EmployeeList.SaveToCSV(stSaveFileName);
      End;
    end;
  end;
  btn_Excel.Enabled := True;

end;

procedure TfmCertificateCode.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;

end;

procedure TfmCertificateCode.btn_SaveClick(Sender: TObject);
begin
  inherited;
  if L_stWork = 'ADD' then
  begin
    dmDBInsert.InsertIntoTB_CertificateCode_Value(ed_CertificateSeq.Text,ed_Name.Text,ed_CertificateClassCode.Text,ed_CertificateAmt.Text,ed_Organize.Text,ed_IssuAmt.Text,ed_MasterAmt.Text,ed_hompage.Text);
  end else
  begin
    dmDBUpdate.UpdateTB_CertificateCode_Value(ed_CertificateSeq.Text,ed_Name.Text,ed_CertificateClassCode.Text,ed_CertificateAmt.Text,ed_Organize.Text,ed_IssuAmt.Text,ed_MasterAmt.Text,ed_hompage.Text);
  end;
  Pan_Emcode.Visible := False;
  SearchCertificateList(ed_CertificateSeq.Text);
end;

procedure TfmCertificateCode.btn_SaveMouseEnter(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clYellow;
end;

procedure TfmCertificateCode.btn_SaveMouseLeave(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clGray;
end;

procedure TfmCertificateCode.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchCertificateList('');
end;


procedure TfmCertificateCode.dt_IndateChange(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True;  //유효기간 변경시 카드데이터 재전송
end;

procedure TfmCertificateCode.dt_OutDateChange(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True; //유효기간 변경시 카드데이터 재전송
end;

procedure TfmCertificateCode.ed_CompanyNameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    btn_SaveClick(self);
  end;
end;

procedure TfmCertificateCode.employeePanelClear;
begin
  L_bEmployeeGradeChange := False;
  L_bFingerImageUpdate := False;

  ed_CertificateSeq.Text := '';
  ed_CertificateClassName.Text := '';
  ed_OldEmCode.Text := '';
  ed_Name.Text := '';
  ed_CertificateAmt.Text := '';
  ed_Organize.Text := '';
  ed_IssuAmt.Text := '';
  ed_MasterAmt.Text := '';
end;


procedure TfmCertificateCode.FontSetting;
begin

end;

procedure TfmCertificateCode.FormChangeEvent(aNumber: integer);
var
  stSelectCode1 : string;
  stSelectCode2 : string;
  nIndex : integer;
begin
end;

procedure TfmCertificateCode.FormClose(Sender: TObject; var Action: TCloseAction);
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

  AdminUserIDList.Free;
  PosiCodeList.Free;
  PosiSearchCodeList.Free;
  EmployeeGubunCodeList.Free;
  EmployeeGubunSearchCodeList.Free;
  EmployeeStateCodeList.Free;
  CardGubunCodeList.Free;
  WorkCardGubunCodeList.Free;
  WorkCardStateCodeList.Free;
  CardStateCodeList.Free;
  CardSearchStateCodeList.Free;
  TuitionOffCodeList.Free;

  fmMain.FORMENABLE(con_FormBMOSEMPLOYEE,'FALSE');

  Action := caFree;
end;

procedure TfmCertificateCode.FormCreate(Sender: TObject);
begin
  inherited;
  AdminUserIDList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  PosiSearchCodeList := TStringList.Create;
  EmployeeGubunCodeList:= TStringList.Create;
  EmployeeGubunSearchCodeList := TStringList.Create;
  EmployeeStateCodeList := TStringList.Create;
  CardGubunCodeList := TStringList.Create;
  WorkCardGubunCodeList := TStringList.Create;
  WorkCardStateCodeList := TStringList.Create;
  CardStateCodeList := TStringList.Create;
  CardSearchStateCodeList := TStringList.Create;

  TuitionOffCodeList := TStringList.Create;
  FontSetting;
  L_bSearchEnd := True;
  //dmSupremaFinger := TdmSupremaFinger.Create(nil);

end;

procedure TfmCertificateCode.FormGradeRefresh;
begin
  if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then tv_List.PopupMenu := pm_Work
  else tv_List.PopupMenu := nil;
  if IsUpdateGrade or IsDeleteGrade then sg_EmployeeList.PopupMenu := pm_Employee
  else sg_EmployeeList.PopupMenu := nil;
  pm_EmployeeAdd.Enabled := IsInsertGrade;
  btn_EmployeeAdd.Enabled := IsInsertGrade;
  pm_EmDelete.Enabled := IsDeleteGrade;
  pm_EmUpdate.Enabled := IsUpdateGrade;
end;

procedure TfmCertificateCode.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmCertificateCode.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  pm_EmployeeAdd.Caption := dmFormFunction.GetFormName('0','2','COMMONADD');
  btn_EmployeeAdd.Caption := dmFormFunction.GetFormName('0','2','COMMONADD');
  btn_Excel.Caption := dmFormFunction.GetFormName('0','2','BUTTONFILESAVE002');
  btn_EmployeeDelete.Caption := dmFormFunction.GetFormName('0','2','COMMONDELETE');
  pm_EmDelete.Caption := dmFormFunction.GetFormName('0','2','COMMONDELETE');


  lb_EmployeeList.Caption := dmFormFunction.GetFormName('2','2','BM3_011List');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  L_stDeleteCaption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stCardNoCaption := dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER');
  pm_EmUpdate.Caption := dmFormFunction.GetFormName('0','2','COMMONUPDATE');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_CompanyNameSelect.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH002');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');

  L_stEmCodeCaption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  L_stEmNameCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  L_stEmHandPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  L_stEmCompanyPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  L_stEmEtcCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  lb_Count1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');
  lb_SearchCount1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
end;

procedure TfmCertificateCode.FormResize(Sender: TObject);
begin
  inherited;
  Pan_Emcode.Left := (Width div 2) - (Pan_Emcode.Width div 2);
  Pan_Emcode.top := (Height div 2) - (Pan_Emcode.Height div 2) - 30;

  pan_progress.Left := (Width div 2) - (pan_progress.Width div 2);
  pan_progress.Top := (Height div 2) - (pan_progress.Height div 2);

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

  pan_EmployeeListResize(pan_EmployeeList);

end;

procedure TfmCertificateCode.FormSearchEnable(aEnabled: Boolean);
begin
  tv_List.Enabled := aEnabled;
end;

procedure TfmCertificateCode.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSEMPLOYEE,'TRUE');

  LoadCertificateClassTreeView('',tv_List,tv_Code,con_LocalCompanyImageIndex);
  LoadCertificateClassTreeView('',tv_AddName,tv_AddCode,con_LocalCompanyImageIndex);
  tv_List.Items[0].Selected := True;
  tv_ListClick(self);

  if L_bFormClose or G_bApplicationTerminate then Exit;

  pan_AddWorkResize(self);
  tv_AddName.Left := btn_CompanyNameSelect.Left + btn_CompanyNameSelect.Width - tv_AddName.Width;

  L_bVisitEditMode := True;



  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Enabled := False;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');
//  if G_nReportSearchType = 1 then SearchEmployeeList('');  //tv_ListClick 에서 먼저 조회 함
end;

procedure TfmCertificateCode.Form_Close;
begin
  Close;
end;

function TfmCertificateCode.JpegStartsInBlob(PicField: TBlobField): integer;
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

procedure TfmCertificateCode.ListResize(Sender: TObject);
begin
  inherited;
  tv_List.Height := List.Height - tv_List.Top - 30;
  tv_List.Width := List.Width - (tv_List.Left * 2);

end;



procedure TfmCertificateCode.pan_AddWorkResize(Sender: TObject);
begin
  inherited;
  btn_Save.Left := (pan_AddWork.Width div 2) - btn_Save.Width - 5;
  btn_Save.Top := (pan_AddWork.Height div 2) - (btn_Save.Height div 2);
  btn_Cancel.Left := (pan_AddWork.Width div 2) + 5;
  btn_Cancel.Top := (pan_AddWork.Height div 2) - (btn_Cancel.Height div 2);
end;

procedure TfmCertificateCode.Pan_EmcodeMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfmCertificateCode.Pan_EmcodeMouseMove(Sender: TObject; Shift: TShiftState;
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

procedure TfmCertificateCode.Pan_EmcodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    // MOUSE DOWN = FALSE 설정
//    MouseDowning := False;
end;

procedure TfmCertificateCode.pan_emPermitAdminMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);

end;

procedure TfmCertificateCode.pan_EmployeeListResize(Sender: TObject);
begin
  inherited;
  sg_EmployeeList.Width := pan_EmployeeList.Width - sg_EmployeeList.Left - 20;
  sg_EmployeeList.Height := pan_EmployeeList.Height - sg_EmployeeList.Top - 50;

end;

procedure TfmCertificateCode.pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
end;

procedure TfmCertificateCode.pan_PositionInfoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
(* ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
 *)
end;


procedure TfmCertificateCode.pm_EmDeleteClick(Sender: TObject);
var
  stMessage : string;
  stCertificateSeq : string;
  stSql : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  if L_nEmployeeCheckCount < 1 then
  begin
    showmessage('삭제할 자격증이 선택되지 않았습니다.');
    Exit;
  end;
  stMessage := stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',pm_EmDelete.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  Try
    pan_progress.Visible := True;
    with sg_EmployeeList do
    begin
      ProgressBar1.Max := RowCount - 1;
      ProgressBar1.Position := 0;
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          stCertificateSeq := Cells[7,i];
          if isDigit(stCertificateSeq) then
          begin
            dmDBDelete.DeleteTB_CertificateCode_Key(stCertificateSeq);
          end;
        end;
        ProgressBar1.Position := i;
        lb_ProgressCount.Caption.Text := inttostr(i) + '/' + inttostr(Rowcount - 1);
        Application.ProcessMessages;
      end;
    end;

  Finally
    pan_progress.Visible := False;
  End;
  SearchCertificateList('');
end;

procedure TfmCertificateCode.pm_EmployeeAddClick(Sender: TObject);
var
  stMessage : string;
  nIndex : integer;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_EmployeeAdd.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  employeePanelClear;
  Pan_Emcode.Visible := True;
  lb_EmployeeCaption.Caption := pm_EmployeeAdd.Caption;
  ed_CertificateClassCode.Text := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  ed_CertificateClassName.Text := tv_List.Selected.Text;
  ed_CertificateSeq.Text := dmDBFunction.GetNextTB_CertificateCode_Seq;

  L_stWork := 'ADD';
end;

procedure TfmCertificateCode.pm_EmUpdateClick(Sender: TObject);
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
  if sg_EmployeeList.Cells[7,sg_EmployeeList.Row] = '' then Exit;
  employeePanelClear;
  Pan_Emcode.Visible := True;
  lb_EmployeeCaption.Caption := pm_EmUpdate.Caption;
  with sg_EmployeeList do
  begin
(*
          cells[1,nRow] := FindField('CC_CODENAME').AsString;        //분류명
          cells[2,nRow] := FindField('CF_NAME').AsString;        //자격증명
          cells[3,nRow] := FindField('CF_AMT').AsString; //응시료
          cells[4,nRow] := FindField('CF_ORGANIZER').AsString;    //시행사
          cells[5,nRow] := FindField('CF_CERTIISSUAMT').AsString;   //자격증발급비
          cells[6,nRow] := FindField('CF_MASTERAMT').AsString;//마스터자격증발급비

          cells[7,nRow] := FindField('CF_CODE').AsString;//강사
          cells[8,nRow] := FindField('CC_CODE').AsString;//강사
*)
    ed_CertificateSeq.Text := Cells[7,Row];
    ed_CertificateClassCode.Text := Cells[8,Row];
    ed_CertificateClassName.Text := Cells[1,Row];
    ed_Name.Text := Cells[2,Row];
    ed_CertificateAmt.Text := Cells[3,Row];
    ed_Organize.Text := Cells[4,Row];
    ed_IssuAmt.Text := cells[5,Row];
    ed_MasterAmt.Text := cells[6,Row];
    ed_hompage.Text := cells[9,Row];


    L_nUpdateEmStateIndex := nIndex;
  end;

  //여기서 카드 데이터 로딩 하자.
  L_stWork := 'UPDATE';
end;

procedure TfmCertificateCode.RegistTempDB(G_stCardRegisterIP: string);
var
  stSql : string;
begin
  stSql := ' Delete From TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''TEMP'' ';
  stSql := stSql + ' and CO_CONFIGCODE = ''FINGERIP'' ';
  dmDataBase.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_CONFIG( CO_CONFIGGROUP,CO_CONFIGCODE,CO_CONFIGVALUE ) ';
  stSql := stSql + ' Values(''TEMP'',''FINGERIP'','''+ G_stCardRegisterIP + ''')';
  dmDataBase.ProcessExecSQL(stSql);

end;



procedure TfmCertificateCode.SearchCertificateList(aCode: string; aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stCertificateClassCode : string;
begin
  btn_Excel.Enabled := False;
  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');

  GridInit(sg_EmployeeList,7,2,True);

  stCertificateClassCode := ed_SerchSelectCertificatdClassCode.Text;
  if stCertificateClassCode = '' then stCertificateClassCode := '0';



  stSql := ' Select a.*,b.CC_CODENAME ';
  stSql := stSql + ' From TB_CertificateCode a';
  stSql := stSql + ' Left Join TB_CERTIFICATECLASSCODE b ';
  stSql := stSql + ' ON(a.CC_CODE = b.CC_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.CC_CODE Like ''' + stCertificateClassCode + '%'' ';


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
      lb_SearchCount.Caption.Text := FormatFloat('#,##0',recordCount);
      if recordcount < 1 then Exit;

      btn_Excel.Enabled := True;
      if Not FileExists(G_stExeFolder + '\Excel-a.png') then
      begin
        ExcelEnImage.Picture.SaveToFile(G_stExeFolder + '\Excel-a.png');
      end;
      btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-a.png');

      pan_Message.Visible := G_bDataLoadingView;
      AdvProgressBar1.Max := recordcount;
      AdvProgressBar1.Position := 0;
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

          AddCheckBox(0,nRow,False,False);
(*분류
자격증
응시료
시행사
자격증발급비
마스터자격증발급비
*)
          cells[1,nRow] := FindField('CC_CODENAME').AsString;        //분류명
          cells[2,nRow] := FindField('CF_NAME').AsString;        //자격증명
          cells[3,nRow] := FindField('CF_AMT').AsString; //응시료
          cells[4,nRow] := FindField('CF_ORGANIZER').AsString;    //시행사
          cells[5,nRow] := FindField('CF_CERTIISSUAMT').AsString;   //자격증발급비
          cells[6,nRow] := FindField('CF_MASTERAMT').AsString;//마스터자격증발급비

          cells[7,nRow] := FindField('CF_CODE').AsString;//강사
          cells[8,nRow] := FindField('CC_CODE').AsString;//강사
          cells[9,nRow] := FindField('CF_HOMEPAGE').AsString;//강사


          if FindField('CF_CODE').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          if G_bDataLoadingView then AdvProgressBar1.Position := nRow;
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
    pan_Message.Visible := False;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCertificateCode.SearchTimerTimer(Sender: TObject);
begin
  inherited;
  SearchTimer.Enabled := False;
  SearchCertificateList('');
end;

procedure TfmCertificateCode.sg_EmployeeListCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCertificateCode.sg_EmployeeListDblClick(Sender: TObject);
begin
  inherited;
  pm_EmUpdateClick(self);
end;

procedure TfmCertificateCode.sg_EmployeeListResize(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := sg_EmployeeList.Height div sg_EmployeeList.DefaultRowHeight;
end;

procedure TfmCertificateCode.sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCertificateCode.sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCertificateCode.sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCertificateCode.sg_PermitDoorCheckBoxClick(Sender: TObject; ACol,
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


procedure TfmCertificateCode.sg_TuitionCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if Not L_bVisitEditMode then Exit;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;
end;


procedure TfmCertificateCode.tv_AddNameDblClick(Sender: TObject);
begin
  inherited;
  ed_CertificateClassCode.Text := tv_AddCode.Items.Item[tv_AddName.Selected.AbsoluteIndex].Text;
  ed_CertificateClassName.Text := tv_AddName.Selected.Text;
  tv_AddName.Visible := False;
end;

procedure TfmCertificateCode.tv_ListClick(Sender: TObject);
var
  stCode : string;
begin
  inherited;
  if tv_List.Selected = nil then Exit;

  tv_List.PopupMenu := pm_Work;

  lb_EmployeeList.Caption := tv_List.Selected.Text;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;

  if ed_SerchSelectCertificatdClassCode.Text <> stCode then
  begin
    ed_SerchSelectCertificatdClassCode.Text := stCode;
    SearchCertificateList('');
  end;
end;

procedure TfmCertificateCode.tv_ListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  currentItem, dropItem : TTreeNode;
  stOrgCode : string;
  stCompanyCode : string;
  stEmSeq : string;
  stDeepSeq,stViewSeq : string;
  stSql : string;
begin
  inherited;
  if Sender = Source then
  begin
    with TTreeView(Sender) do
    begin
      dropItem :=GetNodeAt(X,Y);
      currentItem := Selected;
      if currentItem.AbsoluteIndex = 0 then Exit;   //루트디렉토리가 움직일수는 없다
      stCompanyCode := tv_Code.Items[dropItem.AbsoluteIndex].Text;
      if copy(stCompanyCode,1,1) = 'E' then Exit; //옮기려는 위치가 사원정보이면 빠져 나가자
      stOrgCode := tv_Code.Items[currentItem.AbsoluteIndex].Text;
      if copy(stOrgCode,1,1) <> 'E' then Exit;
      stEmSeq := stOrgCode;
      Delete(stEmSeq,1,1);
      dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'CO_COMPANYCODE',stCompanyCode);
      dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_MEMLOAD','N');  //서버에서 메모리 로딩하자.
    end;
  end;
  LoadCertificateClassTreeView('',tv_List,tv_Code,con_LocalCompanyImageIndex);
  LoadCertificateClassTreeView('',tv_AddName,tv_AddCode,con_LocalCompanyImageIndex);

end;

procedure TfmCertificateCode.tv_ListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Sender = tv_List;

end;

procedure TfmCertificateCode.ViewTimeGroupCode(aTimeGroup: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'Select * from TB_TIMECODE ';
  stSql := stSql + ' Where TC_GROUP = ''' + aTimeGroup + ''' ';
  Try
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
      if recordcount < 1 then Exit;
{      chk_TimeGroup.Items.Clear;
      chk_TimeGroup.Items.Add(copy(FindField('TC_TIME1').AsString,1,2) + ':' + copy(FindField('TC_TIME1').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME1').AsString,5,2) + ':' + copy(FindField('TC_TIME1').AsString,7,2));
      chk_TimeGroup.Items.Add(copy(FindField('TC_TIME2').AsString,1,2) + ':' + copy(FindField('TC_TIME2').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME2').AsString,5,2) + ':' + copy(FindField('TC_TIME2').AsString,7,2));
      chk_TimeGroup.Items.Add(copy(FindField('TC_TIME3').AsString,1,2) + ':' + copy(FindField('TC_TIME3').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME3').AsString,5,2) + ':' + copy(FindField('TC_TIME3').AsString,7,2));
      chk_TimeGroup.Items.Add(copy(FindField('TC_TIME4').AsString,1,2) + ':' + copy(FindField('TC_TIME4').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME4').AsString,5,2) + ':' + copy(FindField('TC_TIME4').AsString,7,2));

}
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

initialization
  RegisterClass(TfmCertificateCode);
Finalization
  UnRegisterClass(TfmCertificateCode);

end.