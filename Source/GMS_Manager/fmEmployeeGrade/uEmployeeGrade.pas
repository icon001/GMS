unit uEmployeeGrade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ExtCtrls, AdvSmoothTabPager, Vcl.ImgList,
  AdvSplitter, AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers,
  AdvGlowButton, AdvOfficePager, AdvOfficePagerStylers, AdvAppStyler,
  AdvPageControl, Vcl.Imaging.pngimage, AdvOfficeButtons;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmEmployeeGrade = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    pm_Work: TPopupMenu;
    pm_CompanyGrade: TMenuItem;
    pan_emPermitAdmin: TAdvSmoothPanel;
    tv_buildingCode: TTreeView;
    MenuImageList16: TImageList;
    pm_ParentCompanyGrade: TMenuItem;
    N2: TMenuItem;
    AdvSplitter1: TAdvSplitter;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_BuildingName: TAdvSmoothLabel;
    ed_SelectBuildingName: TAdvEdit;
    btn_BuildingNameSelect: TAdvGlowButton;
    btn_emGradeComplete: TAdvGlassButton;
    ed_SelectBuildingCode: TAdvEdit;
    tp_Grade: TPageControl;
    tab_Doorgrade: TTabSheet;
    pan_NotPermitDoor: TAdvSmoothPanel;
    lb_DoorList: TLabel;
    pan_NotPermitDoorCount: TAdvSmoothPanel;
    sg_DoorList: TAdvStringGrid;
    pan_PermitAction: TAdvSmoothPanel;
    pan_PermitDoor: TAdvSmoothPanel;
    lb_PermitDoor: TLabel;
    pan_DoorPermitCount: TAdvSmoothPanel;
    sg_PermitDoor: TAdvStringGrid;
    tab_ArmAreagrade: TTabSheet;
    pan_NotPermitAlarmArea: TAdvSmoothPanel;
    lb_ArmAreaList: TLabel;
    AdvSmoothPanel5: TAdvSmoothPanel;
    sg_ArmArea: TAdvStringGrid;
    AdvSmoothPanel6: TAdvSmoothPanel;
    pan_PermitAlarmArea: TAdvSmoothPanel;
    lb_PermitAlarmArea: TLabel;
    AdvSmoothPanel8: TAdvSmoothPanel;
    sg_PermitArmArea: TAdvStringGrid;
    tv_buildingName: TTreeView;
    btn_PermitDoorAdd: TAdvGlowButton;
    btn_PermitDoorDelete: TAdvGlowButton;
    btn_PermitArmAreaAdd: TAdvGlowButton;
    btn_PermitArmAreaDelete: TAdvGlowButton;
    lb_DoorNotPermitCountName: TAdvSmoothLabel;
    lb_DoorCount: TAdvSmoothLabel;
    lb_Count1: TAdvSmoothLabel;
    lb_DoorPermitCountName: TAdvSmoothLabel;
    lb_PermitDoorCount: TAdvSmoothLabel;
    lb_Count2: TAdvSmoothLabel;
    lb_ArmAreaNotPermitCountName: TAdvSmoothLabel;
    lb_ArmAreaCount: TAdvSmoothLabel;
    lb_Count3: TAdvSmoothLabel;
    lb_ArmAreaPermitCountName: TAdvSmoothLabel;
    lb_PermitArmAreaCount: TAdvSmoothLabel;
    lb_Count4: TAdvSmoothLabel;
    pan_progress: TAdvSmoothPanel;
    lb_ProgressCount: TAdvSmoothLabel;
    ProgressBar1: TProgressBar;
    lb_CompanyName: TAdvSmoothLabel;
    ed_CompanyName: TAdvEdit;
    btn_CompanySelect: TAdvGlowButton;
    lb_EmployeeList: TLabel;
    tv_AddCompanyCode: TTreeView;
    tv_AddCompanyName: TTreeView;
    ed_CompanyCode: TAdvEdit;
    sg_EmployeeList: TAdvStringGrid;
    lb_PositionSearch: TAdvSmoothLabel;
    cmb_PositionSearch: TComboBox;
    lb_EmployeeGubunSearch: TAdvSmoothLabel;
    cmb_EmpGubunSearch: TComboBox;
    lb_EtcSearch: TAdvSmoothLabel;
    cmb_EtcSearch: TComboBox;
    lb_EtcDetail: TAdvSmoothLabel;
    ed_etcSearch: TAdvEdit;
    btn_Search: TAdvGlowButton;
    lb_selectEmployee: TAdvSmoothLabel;
    ed_SelectEmployeeName: TAdvEdit;
    lb_Grade: TLabel;
    ed_SelectEmployeeSeq: TAdvEdit;
    lb_SearchName: TAdvSmoothLabel;
    ed_SearchName: TAdvEdit;
    btn_GradeSearch: TAdvGlowButton;
    lb_CardGrade: TAdvSmoothLabel;
    cmb_gradeType: TComboBox;
    SearchTimer: TTimer;
    PermitDoorSearchTimer: TTimer;
    chk_CompanyGrade: TAdvOfficeCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tv_CompanyListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tv_CompanyListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btn_emGradeCompleteClick(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure btn_BuildingNameSelectClick(Sender: TObject);
    procedure sg_DoorListCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitDoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_ArmAreaCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitArmAreaCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_PermitDoorAddClick(Sender: TObject);
    procedure btn_PermitArmAreaAddClick(Sender: TObject);
    procedure btn_PermitArmAreaDeleteClick(Sender: TObject);
    procedure btn_PermitDoorDeleteClick(Sender: TObject);
    procedure ListResize(Sender: TObject);
    procedure pan_emPermitAdminResize(Sender: TObject);
    procedure tp_GradeResize(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CompanySelectClick(Sender: TObject);
    procedure tv_AddCompanyNameDblClick(Sender: TObject);
    procedure cmb_PositionSearchChange(Sender: TObject);
    procedure cmb_EmpGubunSearchChange(Sender: TObject);
    procedure sg_EmployeeListResize(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure sg_EmployeeListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_EmployeeListClick(Sender: TObject);
    procedure btn_GradeSearchClick(Sender: TObject);
    procedure tp_GradeChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure PermitDoorSearchTimerTimer(Sender: TObject);
  private
//    BuildingArmAreaCodeList : TStringList; //빌딩별 방범구역 코드 리스트를 가지고 있자.
//    BuildingDoorCodeList : TStringList; //빌딩별 출입문 코드 리스트를 가지고 있자.
//    GradeArmAreaCodeList : TStringList;
//    GradeDoorCodeList : TStringList;
//    NotGradeArmAreaCodeList : TStringList; //방범권한이 없는 방범리스트
//    NotGradeDoorCodeList : TStringList;  //출입권한이 없는 리스트
    EmployeeGubunSearchCodeList : TStringList;
    PosiSearchCodeList : TStringList;
    L_bSearchBreak : Boolean;
    L_bSearchEnd : Boolean;
    L_bPermitDoorSearchBreak : Boolean;
    L_bPermitDoorSearchEnd : Boolean;
    L_nEmployeeCheckCount : integer;
    L_nPermitArmAreaCheckCount : integer;           //삭제시 방범구역 선택 갯수
    L_nArmAreaCheckCount : integer;        //등록시 방범구역 선택 갯수
    L_nPermitDoorCheckCount : integer;           //삭제시 출입문 선택 갯수
    L_nDoorCheckCount : integer;        //등록시 출입문 선택 갯수
    L_nPageListMaxCount : integer;
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
    L_stAllName : string;
    L_stEmCodeCaption : string;
    L_stEmNameCaption : string;
    L_stEmHandPhoneCaption : string;
    L_stEmCompanyPhoneCaption : string;
    L_stEmEtcCaption : string;
    L_stCardNoCaption : string;
  private
//    procedure CompanyGradeToEmployeeGrade;
//    Function CompanyGradeToEmployeeEachApply(aCompanyCode:string):Boolean;

    procedure LoadBuildingAlarmAll(aBuildingCode,aSearchName:string;sgList:TAdvStringGrid); //전체 출입문을 리스트에 추가 하자
    procedure LoadBuildingDoorAll(aBuildingCode,aSearchName:string;sgList:TAdvStringGrid); //전체 출입문을 리스트에 추가 하자
    procedure LoadPermitArmArea(aBuildingCode,aEmSeq,aSearchName:string;sgList: TAdvStringGrid);
    procedure LoadPermitDoor(aBuildingCode,aEmSeq,aSearchName:string;sgList:TAdvStringGrid);


    procedure FormNameSetting;
    procedure FontSetting;
    function ChangeCompanyCode(aOrgCode,aCode,aDeepSeq,aViewSeq:string):Boolean;
    function GetCurrentCompanyDeepSeq(aOrgCode:string):string;
    function GetNextChildCompanyCode(aParentCode:string;var aCode,aDeepSeq,aViewSeq:string):Boolean;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  private
    { Private declarations }
    procedure SearchEmployee(aCode:string;aTopRow:integer=0);
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
    procedure FormSearchEnable(aEnabled:Boolean);
    procedure RecvCardNO(aCardNo:string);
  end;

var
  fmEmployeeGrade: TfmEmployeeGrade;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBCardPermit,
  uDBDelete,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBSelect,
  uDBUpdate,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmEmployeeGrade.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmEmployeeGrade.btn_BuildingNameSelectClick(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Left := btn_BuildingNameSelect.Left;
  tv_buildingName.Top := btn_BuildingNameSelect.Top + btn_BuildingNameSelect.Height;
end;

procedure TfmEmployeeGrade.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmEmployeeGrade.btn_CompanySelectClick(Sender: TObject);
begin
  inherited;
  tv_AddCompanyName.Visible := Not tv_AddCompanyName.Visible;
  tv_AddCompanyName.Top := btn_CompanySelect.Top + btn_CompanySelect.Height;
  tv_AddCompanyName.Left := btn_CompanySelect.Left + btn_CompanySelect.Width - tv_AddCompanyName.Width;
end;

procedure TfmEmployeeGrade.btn_emGradeCompleteClick(Sender: TObject);
begin
  inherited;
  pan_emPermitAdmin.Visible := False;
end;

procedure TfmEmployeeGrade.btn_GradeSearchClick(Sender: TObject);
begin
  inherited;
  if tp_Grade.ActivePage = tab_Doorgrade then LoadBuildingDoorAll(ed_SelectBuildingCode.Text,ed_SearchName.Text,sg_DoorList) //전체 출입문을 리스트에 추가 하자
  else LoadBuildingAlarmAll(ed_SelectBuildingCode.Text,ed_SearchName.Text,sg_ArmArea); //전체 방범구역을 리스트에 추가 하자

  if tp_Grade.ActivePage = tab_Doorgrade then LoadPermitDoor(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text,sg_PermitDoor)
  else LoadPermitArmArea(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text,sg_PermitArmArea);
end;

procedure TfmEmployeeGrade.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmEmployeeGrade.btn_PermitArmAreaAddClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
  UserLoop : integer;
  stEmSeq : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_PermitArmAreaAdd.Caption,[rfReplaceAll]);
  if L_nArmAreaCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  Try
    sg_EmployeeList.Enabled := False;
    btn_Close.Enabled := False;
    pan_progress.Visible := True;
    for UserLoop := 1 to sg_EmployeeList.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
    begin
      sg_EmployeeList.GetCheckBoxState(0,UserLoop, bCheckState);
      if bCheckState then  //체크 되어 있으면 권한 등록
      begin
        stEmSeq := sg_EmployeeList.Cells[16,UserLoop];
        with sg_ArmArea do
        begin
          ProgressBar1.Max := RowCount - 1;
          ProgressBar1.Position := 0;
          for i := RowCount - 1 downto 1 do
          begin
            ProgressBar1.Position := ProgressBar1.Position + 1;
            GetCheckBoxState(0,i, bCheckState);
            if bCheckState then
            begin
              dmDBCardPermit.EmployeeArmAreaPermitAdd(stEmSeq,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
              dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'E' + stEmSeq,Cells[5,i],con_ComLogTYPE_ARMAREA,L_stMenuID + '(' + Caption + '):Permit Add');
            end;
            lb_ProgressCount.Caption.Text := '(' + inttostr(UserLoop) + '/' + inttostr(sg_EmployeeList.RowCount - 1) + ')' + sg_EmployeeList.Cells[2,UserLoop] + ':' + inttostr(ProgressBar1.Position) + '/' + inttostr(ProgressBar1.Max);
            application.ProcessMessages;
          end;
          dmDBCardPermit.EmployeePermitToCardLoad(stEmSeq);
          if sg_EmployeeList.Cells[21,UserLoop] <> '3' then dmDBUpdate.UpdateTB_EMPLOYEE_Field_IntValue(stEmSeq,'EM_GRADETYPE','3');

        end;
      end;
    end;
    //lb_ProgressCount.Caption.Text := '출입 권한 적용중...' ;
    LoadPermitArmArea(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text, sg_PermitArmArea);
    fmMain.FORMCARDDOWNLOADExecute;
  Finally
    sg_EmployeeList.Enabled := True;
    btn_Close.Enabled := True;
    pan_progress.Visible := False;
  End;

end;

procedure TfmEmployeeGrade.btn_PermitArmAreaDeleteClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
  UserLoop : integer;
  stEmSeq : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_PermitArmAreaDelete.Caption,[rfReplaceAll]);
  if L_nPermitArmAreaCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  Try
    sg_EmployeeList.Enabled := False;
    btn_Close.Enabled := False;
    pan_progress.Visible := True;
    for UserLoop := 1 to sg_EmployeeList.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
    begin
      sg_EmployeeList.GetCheckBoxState(0,UserLoop, bCheckState);
      if bCheckState then  //체크 되어 있으면 권한 등록
      begin
        stEmSeq := sg_EmployeeList.Cells[16,UserLoop];
        with sg_PermitArmArea do
        begin
          ProgressBar1.Max := RowCount - 1;
          ProgressBar1.Position := 0;
          for i := RowCount - 1 downto 1 do
          begin
            ProgressBar1.Position := ProgressBar1.Position + 1;
            GetCheckBoxState(0,i, bCheckState);
            if bCheckState then
            begin
              dmDBCardPermit.EmployeeArmAreaPermitDelete(stEmSeq,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
              dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'E' + stEmSeq,Cells[5,i],con_ComLogTYPE_ARMAREA,L_stMenuID + '(' + Caption + '):Permit Delete');
            end;
            lb_ProgressCount.Caption.Text := '(' + inttostr(UserLoop) + '/' + inttostr(sg_EmployeeList.RowCount - 1) + ')' + sg_EmployeeList.Cells[2,UserLoop] + ':' + inttostr(ProgressBar1.Position) + '/' + inttostr(ProgressBar1.Max);
            application.ProcessMessages;
          end;
          dmDBCardPermit.EmployeePermitToCardLoad(stEmSeq);
          if sg_EmployeeList.Cells[21,UserLoop] <> '3' then dmDBUpdate.UpdateTB_EMPLOYEE_Field_IntValue(stEmSeq,'EM_GRADETYPE','3');

        end;
      end;
    end;
    //lb_ProgressCount.Caption.Text := '출입 권한 적용중...' ;
    LoadPermitArmArea(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text, sg_PermitArmArea);
    fmMain.FORMCARDDOWNLOADExecute;
  Finally
    sg_EmployeeList.Enabled := True;
    btn_Close.Enabled := True;
    pan_progress.Visible := False;
  End;

end;

procedure TfmEmployeeGrade.btn_PermitDoorAddClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
  UserLoop : integer;
  stEmSeq : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_PermitDoorAdd.Caption,[rfReplaceAll]);
  if L_nDoorCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  Try
    sg_EmployeeList.Enabled := False;
    btn_Close.Enabled := False;
    pan_progress.Visible := True;
    for UserLoop := 1 to sg_EmployeeList.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
    begin
      sg_EmployeeList.GetCheckBoxState(0,UserLoop, bCheckState);
      if bCheckState then  //체크 되어 있으면 권한 등록
      begin
        stEmSeq := sg_EmployeeList.Cells[16,UserLoop];
        with sg_DoorList do
        begin
          ProgressBar1.Max := RowCount - 1;
          ProgressBar1.Position := 0;
          for i := RowCount - 1 downto 1 do
          begin
            ProgressBar1.Position := ProgressBar1.Position + 1;
            GetCheckBoxState(0,i, bCheckState);
            if bCheckState then
            begin
              dmDBCardPermit.EmployeeDoorPermitAdd(stEmSeq,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
              dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'E' + stEmSeq,Cells[5,i],con_ComLogTYPE_DOOR,L_stMenuID + '(' + Caption + '):Permit Add');
            end;
            lb_ProgressCount.Caption.Text := '(' + inttostr(UserLoop) + '/' + inttostr(sg_EmployeeList.RowCount - 1) + ')' + sg_EmployeeList.Cells[2,UserLoop] + ':' + inttostr(ProgressBar1.Position) + '/' + inttostr(ProgressBar1.Max);
            application.ProcessMessages;
          end;
        end;
        dmDBCardPermit.EmployeePermitToCardLoad(stEmSeq);
        if sg_EmployeeList.Cells[21,UserLoop] <> '3' then dmDBUpdate.UpdateTB_EMPLOYEE_Field_IntValue(stEmSeq,'EM_GRADETYPE','3');

      end;
    end;
    //lb_ProgressCount.Caption.Text := '출입 권한 적용중...' ;
    LoadPermitDoor(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text, sg_PermitDoor);
    fmMain.FORMCARDDOWNLOADExecute;
  Finally
    sg_EmployeeList.Enabled := True;
    btn_Close.Enabled := True;
    pan_progress.Visible := False;
  End;

end;

procedure TfmEmployeeGrade.btn_PermitDoorDeleteClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
  UserLoop : integer;
  stEmSeq : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_PermitDoorDelete.Caption,[rfReplaceAll]);
  if L_nPermitDoorCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  Try
    sg_EmployeeList.Enabled := False;
    btn_Close.Enabled := False;
    pan_progress.Visible := True;
    for UserLoop := 1 to sg_EmployeeList.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
    begin
      sg_EmployeeList.GetCheckBoxState(0,UserLoop, bCheckState);
      if bCheckState then  //체크 되어 있으면 권한 등록
      begin
        stEmSeq := sg_EmployeeList.Cells[16,UserLoop];
        with sg_PermitDoor do
        begin
          ProgressBar1.Max := RowCount - 1;
          ProgressBar1.Position := 0;
          for i := RowCount - 1 downto 1 do
          begin
            ProgressBar1.Position := ProgressBar1.Position + 1;
            GetCheckBoxState(0,i, bCheckState);
            if bCheckState then
            begin
              dmDBCardPermit.EmployeeDoorPermitDelete(stEmSeq,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
              dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'E' + stEmSeq,Cells[5,i],con_ComLogTYPE_DOOR,L_stMenuID + '(' + Caption + '):Permit Delete');
            end;
            lb_ProgressCount.Caption.Text := '(' + inttostr(UserLoop) + '/' + inttostr(sg_EmployeeList.RowCount - 1) + ')' + sg_EmployeeList.Cells[2,UserLoop] + ':' + inttostr(ProgressBar1.Position) + '/' + inttostr(ProgressBar1.Max);
            application.ProcessMessages;
          end;
          dmDBCardPermit.EmployeePermitToCardLoad(stEmSeq);
          if sg_EmployeeList.Cells[21,UserLoop] <> '3' then dmDBUpdate.UpdateTB_EMPLOYEE_Field_IntValue(stEmSeq,'EM_GRADETYPE','3');
        end;
      end;
    end;
    //lb_ProgressCount.Caption.Text := '출입 권한 적용중...' ;
    LoadPermitDoor(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text, sg_PermitDoor);
    fmMain.FORMCARDDOWNLOADExecute;
  Finally
    sg_EmployeeList.Enabled := True;
    btn_Close.Enabled := True;
    pan_progress.Visible := False;
  End;
end;


procedure TfmEmployeeGrade.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchEmployee('');
end;

function TfmEmployeeGrade.ChangeCompanyCode(aOrgCode, aCode, aDeepSeq,
  aViewSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stChildCode,stDeepSeq,stViewSeq : string;
  stOrgDeepSeq : string;
begin
  stOrgDeepSeq := GetCurrentCompanyDeepSeq(aOrgCode);
  stSql := ' Update TB_COMPANYCODE Set ';
  stSql := stSql + ' CO_COMPANYCODE = ''' + aCode + ''',';
  stSql := stSql + ' CO_DEEPSEQ = ' + aDeepSeq + ',';
  stSql := stSql + ' CO_VIEWSEQ = ' + aViewSeq + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aOrgCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

  //여기서 회사코드별 카드권한 테이블 변경
  stSql := ' Update TB_CARDPERMITCOMPANYGROUP set CO_COMPANYCODE = ''' + aCode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aOrgCode + ''' ';
  result := dmDataBase.ProcessExecSQL(stSql);

  //여기서 사원테이블 정보를 변경 하자
  stSql := ' Update TB_EMPLOYEE set CO_COMPANYCODE = ''' + aCode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aOrgCode + ''' ';
  result := dmDataBase.ProcessExecSQL(stSql);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'Select * from TB_COMPANYCODE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND CO_COMPANYCODE Like ''' + aOrgCode + '%'' ';
    stSql := stSql + ' AND CO_DEEPSEQ = ' + inttostr(strtoint(stOrgDeepSeq) + 1) + '';
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
      while Not Eof do
      begin
        GetNextChildCompanyCode(aCode,stChildCode,stDeepSeq,stViewSeq); //신규 코드가 부모가 됨
        ChangeCompanyCode(FindField('CO_COMPANYCODE').AsString,stChildCode,stDeepSeq,stViewSeq);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;
procedure TfmEmployeeGrade.cmb_EmpGubunSearchChange(Sender: TObject);
begin
  inherited;
  if G_nEmployeeSearchType = 1 then SearchEmployee('');
end;

procedure TfmEmployeeGrade.cmb_PositionSearchChange(Sender: TObject);
begin
  inherited;
  if G_nEmployeeSearchType = 1 then SearchEmployee('');
end;


(*
function TfmCompanyGrade.CompanyGradeToEmployeeEachApply(
  aCompanyCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  stSql := ' Select * from tb_employee ';
  stSql := stSql + ' where CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
  stSql := stSql + ' AND EM_ACUSE = ''1'' ';
  stSql := stSql + ' AND EM_GRADETYPE = 1 ';

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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','CompanyGradeToEmployeeEachApply');
        result := False;
        Exit;
      End;
      result := True;
      if Recordcount < 1 then Exit;

      ProgressBar1.Max := Recordcount;
      ProgressBar1.Position := 0;
      While Not Eof do
      begin
        ProgressBar1.Position := ProgressBar1.Position + 1;
        lb_ProgressCount.Caption.Text := inttostr(ProgressBar1.Position) + '/' + inttostr(ProgressBar1.Max);
        dmDBCardPermit.EmSeqCompanyGradeToEmployeeCopyLikeUpdate(FindField('EM_SEQ').asstring,aCompanyCode);
        dmDBCardPermit.EmSeqCompanyGradeToEmployeeCopyLikeAdd(FindField('EM_SEQ').asstring,aCompanyCode);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;
*)
(*
procedure TfmCompanyGrade.CompanyGradeToEmployeeGrade;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stCompanyCode : string;
begin
  stSql := ' Select CO_DEEPSEQ,CO_COMPANYCODE ';
  stSql := stSql + ' from TB_CARDPERMITCOMPANYGROUP ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CP_APPLY <> ''Y'' ';
  stSql := stSql + ' GROUP BY CO_DEEPSEQ,CO_COMPANYCODE ';
  stSql := stSql + ' Order by CO_DEEPSEQ,CO_COMPANYCODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        stCompanyCode := FindField('CO_COMPANYCODE').AsString;
        dmDBCardPermit.CompanyGradeToNotEmployeeDelete(stCompanyCode);   //소속권한에는 없고 사원권한에만 있는경우 권한 삭제하자.
        dmDBCardPermit.CompanyGradeToEmployeeCopyEqualUpdate(stCompanyCode);  //해당 회사코드의 권한 부분만 업데이트 하자.
        dmDBCardPermit.CompanyGradeToEmployeeCopyEqualAdd(stCompanyCode);
        {
        //if dmDBCardPermit.CompanyGradeToEmployeeEachApply(stCompanyCode) then
        if CompanyGradeToEmployeeEachApply(stCompanyCode) then      }

           dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyCodeApply(stCompanyCode,'Y');
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

*)

procedure TfmEmployeeGrade.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);  *)
end;

procedure TfmEmployeeGrade.FormChangeEvent(aNumber: integer);
begin
  case aNumber of
    con_FormBMOSBUILDINGCODE : begin
      LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
    end;
  end;

end;

procedure TfmEmployeeGrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  BuildingDoorCodeList.Free;
//  BuildingArmAreaCodeList.Free;
//  GradeArmAreaCodeList.Free;
//  GradeDoorCodeList.Free;
//  NotGradeArmAreaCodeList.Free; //방범권한이 없는 방범리스트
//  NotGradeDoorCodeList.Free;  //출입권한이 없는 리스트
  L_bSearchBreak := True;
  Delay(1000);

  EmployeeGubunSearchCodeList.Free;
  PosiSearchCodeList.Free;

  fmMain.FORMENABLE(con_FormBMOSEMPLOYEEGRADE,'FALSE');

  Action := caFree;
end;

procedure TfmEmployeeGrade.FormCreate(Sender: TObject);
begin
  inherited;
//  BuildingDoorCodeList := TStringList.Create;
//  BuildingArmAreaCodeList := TStringList.Create;
//  GradeArmAreaCodeList := TStringList.Create;
//  GradeDoorCodeList := TStringList.Create;
//  NotGradeArmAreaCodeList := TStringList.Create; //방범권한이 없는 방범리스트
//  NotGradeDoorCodeList := TStringList.Create;  //출입권한이 없는 리스트
  EmployeeGubunSearchCodeList := TStringList.Create;
  PosiSearchCodeList := TStringList.Create;
  FontSetting;
  L_nEmployeeCheckCount := 0;
  L_bSearchEnd := True;
  L_bPermitDoorSearchEnd := True;

end;

procedure TfmEmployeeGrade.FormGradeRefresh;
begin
  if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
  pm_CompanyGrade.Enabled := IsInsertGrade;
  pm_ParentCompanyGrade.Enabled := IsDeleteGrade;
end;

procedure TfmEmployeeGrade.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmEmployeeGrade.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_EmployeeList.Caption := dmFormFunction.GetFormName('2','2','BM3_011List');
  lb_CompanyName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  sg_DoorList.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
  sg_PermitDoor.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
  sg_ArmArea.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONARMAREANAME');
  sg_PermitArmArea.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONARMAREANAME');
  lb_BuildingName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  btn_BuildingNameSelect.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH002');
  tab_Doorgrade.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORPERMITADMIN');
  tab_ArmAreagrade.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREAPERMITADMIN');
  lb_DoorPermitCountName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
  lb_DoorNotPermitCountName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
  lb_ArmAreaNotPermitCountName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
  lb_ArmAreaPermitCountName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
  lb_Count1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');
  lb_Count2.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');
  lb_Count3.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');
  lb_Count4.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');
  lb_DoorList.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORLIST');
  lb_PermitDoor.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORREGPERMIT');
  lb_ArmAreaList.Caption := dmFormFunction.GetFormName('2','2','BM2_022List');
  lb_PermitAlarmArea.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREAREPERMIT');
  btn_PermitDoorAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITADD001');
  btn_PermitArmAreaAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITADD001');
  btn_PermitDoorDelete.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITDELETE001');
  btn_PermitArmAreaDelete.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITDELETE001');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');
  L_stEmCodeCaption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  L_stEmNameCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  L_stEmHandPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  L_stEmCompanyPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  L_stEmEtcCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  L_stCardNoCaption := dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER');
  lb_Grade.Caption := dmFormFunction.GetFormName('2','2','BM3_011pm002');
  lb_selectEmployee.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSELECTEMP');
  lb_CardGrade.Caption.Text :=  dmFormFunction.GetFormName('0','2','COMMONCARDGRADE');
  lb_PositionSearch.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEPOSI');
  lb_EmployeeGubunSearch.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGUBUN');
  lb_EtcSearch.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONETCNAME');
  btn_CompanySelect.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH002');
  btn_Search.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');
  btn_GradeSearch.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');
  chk_CompanyGrade.Caption := dmFormFunction.GetFormName('0','2','NONCOMPANYEMPLOYEE');

  sg_EmployeeList.Cells[1,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  sg_EmployeeList.Cells[2,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  sg_EmployeeList.Cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');
  sg_EmployeeList.Cells[4,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEPOSI');
  sg_EmployeeList.Cells[7,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGUBUN');
  sg_EmployeeList.Cells[8,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  sg_EmployeeList.Cells[9,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  sg_EmployeeList.Cells[10,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  sg_EmployeeList.Cells[11,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEINDATE');
  sg_EmployeeList.Cells[12,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEOUTDATE');
  sg_EmployeeList.Cells[13,0] := dmFormFunction.GetFormName('0','2','COMMONATTEND');
  sg_EmployeeList.Cells[14,0] := dmFormFunction.GetFormName('0','2','COMMONFOODNAME');
  sg_EmployeeList.Cells[15,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGROUP');
  sg_EmployeeList.Cells[30,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEESTATE');
  sg_EmployeeList.Cells[32,0] := dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER'); //카드번호

  cmb_EtcSearch.Items.Clear;
  cmb_EtcSearch.Items.Add(L_stEmCodeCaption);
  cmb_EtcSearch.Items.Add(L_stEmNameCaption);
  cmb_EtcSearch.Items.Add(L_stEmHandPhoneCaption);
  cmb_EtcSearch.Items.Add(L_stEmCompanyPhoneCaption);
  cmb_EtcSearch.Items.Add(L_stEmEtcCaption);
  cmb_EtcSearch.Items.Add(L_stCardNoCaption);
  cmb_EtcSearch.ItemIndex := 1;
  lb_EtcDetail.Caption.Text := cmb_EtcSearch.Text;
end;

procedure TfmEmployeeGrade.FormResize(Sender: TObject);
begin
  inherited;

  pan_emPermitAdmin.Left := (Width div 2) - (pan_emPermitAdmin.Width div 2);
  pan_emPermitAdmin.top := (Height div 2) - (pan_emPermitAdmin.Height div 2);

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
  pan_progress.Left := (Width div 2) - (pan_progress.Width div 2);
  pan_progress.Top := (Height div 2) - (pan_progress.Height div 2);

  sg_EmployeeList.Height := List.Height - (sg_EmployeeList.Top  + 20);
  ListResize(List);
end;

procedure TfmEmployeeGrade.FormSearchEnable(aEnabled: Boolean);
begin
  cmb_PositionSearch.Enabled := aEnabled;
  cmb_EtcSearch.Enabled := aEnabled;
  sg_EmployeeList.Enabled := aEnabled;
  cmb_EmpGubunSearch.Enabled := aEnabled;
  ed_etcSearch.Enabled := aEnabled;
  btn_Search.Enabled := aEnabled;
end;

procedure TfmEmployeeGrade.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSEMPLOYEEGRADE,'TRUE');

  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  LoadCompanyTreeView('',tv_AddCompanyName,tv_AddCompanyCode,con_LocalCompanyImageIndex);
  tv_AddCompanyNameDblClick(Self);
  tv_buildingNameDblClick(self);

  LoadEmployeeGubunCode(EmployeeGubunSearchCodeList,cmb_EmpGubunSearch,True,L_stAllName);
  LoadPosiCode('0',PosiSearchCodeList,cmb_PositionSearch,True,L_stAllName);
  LoadCardGrade(cmb_GradeType,True,L_stAllName);
  cmb_GradeType.ItemIndex := 3;

  tab_ArmAreagrade.TabVisible := G_bAlarmMonitoringUse;
  tp_Grade.ActivePage := tab_Doorgrade;
  tp_GradeChange(tp_Grade);
end;

procedure TfmEmployeeGrade.Form_Close;
begin
  Close;
end;

function TfmEmployeeGrade.GetCurrentCompanyDeepSeq(aOrgCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'Select * from TB_COMPANYCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aOrgCode + ''' ';
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

      while Not Eof do
      begin
        result := FindField('CO_DEEPSEQ').AsString;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmEmployeeGrade.GetNextChildCompanyCode(aParentCode: string; var aCode, aDeepSeq,
  aViewSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nDeepSeq : integer;
  nViewSeq : integer;
  stTemp : string;
  nChildCode : integer;
begin
  aCode := '';
  aDeepSeq := '0';
  aViewSeq := '0';
  nViewSeq := 0;
  nChildCode := 0;

  stSql := 'Select * from TB_COMPANYCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE Like ''' + aParentCode + '%'' ';
  stSql := stSql + ' Order by CO_DEEPSEQ,CO_VIEWSEQ ';
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

      while Not Eof do
      begin
        if FindField('CO_COMPANYCODE').AsString = aParentCode then
        begin
          nDeepSeq := FindField('CO_DEEPSEQ').AsInteger;
          aDeepSeq := inttostr(nDeepSeq + 1);
        end;
        if FindField('CO_DEEPSEQ').AsInteger = (nDeepSeq + 1) then
        begin
          if nViewSeq < FindField('CO_VIEWSEQ').AsInteger  then nViewSeq := FindField('CO_VIEWSEQ').AsInteger;
          stTemp := FindField('CO_COMPANYCODE').AsString;
          stTemp := copy(stTemp,1 + (((nDeepSeq) * G_nCompanyCodeLength) + 1 ),G_nCompanyCodeLength);
          if nChildCode < strtoint(stTemp)  then nChildCode := strtoint(stTemp);
        end;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  aViewSeq := inttostr(nViewSeq + 1);
  aCode := aParentCode + FillZeroNumber(nChildCode + 1,G_nCompanyCodeLength);
end;

procedure TfmEmployeeGrade.ListResize(Sender: TObject);
begin
  inherited;
  sg_EmployeeList.Width := List.Width - (sg_EmployeeList.Left * 2);
end;


procedure TfmEmployeeGrade.LoadBuildingAlarmAll(aBuildingCode,aSearchName: string;
  sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stAlarmAreaCode : string;
begin
  GridInit(sgList,2,2,true);
  lb_ArmAreaCount.Caption.Text := FormatFloat('#,##0',0);

  stSql := dmDBSelect.SelectTB_ARMAREA_BuildingCode(aBuildingCode,aSearchName);
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
      if recordcount < 1 then Exit;
      with sgList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('AR_ARMAREANAME').AsString;
          cells[2,nRow] := FindField('ND_NODENO').AsString;
          cells[3,nRow] := FindField('DE_ECUID').AsString;
          cells[4,nRow] := FindField('DE_EXTENDID').AsString;
          cells[5,nRow] := FindField('AR_ARMAREANO').AsString;
          stAlarmAreaCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('AR_ARMAREANO').AsString;
          cells[6,nRow] := stAlarmAreaCode;
          cells[7,nRow] := FindField('AR_VIEWSEQ').AsString;

          nRow := nRow + 1;
          Next;
        end;
        lb_ArmAreaCount.Caption.Text := FormatFloat('#,##0',RecordCount);
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;



procedure TfmEmployeeGrade.LoadBuildingDoorAll(aBuildingCode,aSearchName: string;
  sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDoorCode : string;
begin
  GridInit(sgList,2,2,true);
  lb_DoorCount.Caption.Text := FormatFloat('#,##0',0);

  stSql := dmDBSelect.SelectTB_DOOR_BuildingCode(aBuildingCode,True,aSearchName);
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
      if recordcount < 1 then Exit;
      with sgList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('DO_DOORNAME').AsString;
          cells[2,nRow] := FindField('ND_NODENO').AsString;
          cells[3,nRow] := FindField('DE_ECUID').AsString;
          cells[4,nRow] := FindField('DE_EXTENDID').AsString;
          cells[5,nRow] := FindField('DO_DOORNO').AsString;
          stDoorCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('DO_DOORNO').AsString;
          cells[6,nRow] := stDoorCode;
          cells[7,nRow] := FindField('DO_VIEWSEQ').AsString;

          nRow := nRow + 1;
          Next;
        end;
        lb_DoorCount.Caption.Text := FormatFloat('#,##0',recordcount);
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure TfmEmployeeGrade.LoadPermitArmArea(aBuildingCode, aEmSeq,aSearchName: string;sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stAlarmAreaCode : string;
begin
  GridInit(sgList,2,2,true);
  lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',0);
  if aEmSeq = '' then Exit;

  stSql := dmDBSelect.SelectTB_ARMAREA_EmployeePermit(aBuildingCode,aEmSeq,aSearchName);
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
      if recordcount < 1 then
      begin
        Exit;
      end;
      nRow := 1;
      with sgList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('AR_ARMAREANAME').AsString;
          cells[2,nRow] := FindField('ND_NODENO').AsString;
          cells[3,nRow] := FindField('DE_ECUID').AsString;
          cells[4,nRow] := FindField('DE_EXTENDID').AsString;
          cells[5,nRow] := FindField('AR_ARMAREANO').AsString;
          stAlarmAreaCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('AR_ARMAREANO').AsString;
          //if BuildingArmAreaCodeList.IndexOf(stAlarmAreaCode) < 0 then BuildingArmAreaCodeList.Add(stAlarmAreaCode);
          //if NotGradeArmAreaCodeList.IndexOf(stAlarmAreaCode) < 0 then NotGradeArmAreaCodeList.Add(stAlarmAreaCode);

          cells[6,nRow] := stAlarmAreaCode;
          cells[7,nRow] := FindField('AR_VIEWSEQ').AsString;

          nRow := nRow + 1;
          Application.ProcessMessages;
          Next;
        end;
        lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',RecordCount);
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmEmployeeGrade.LoadPermitDoor(aBuildingCode, aEmSeq,aSearchName: string;
  sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDoorCode : string;
begin
  L_bPermitDoorSearchBreak := True;
  while Not L_bPermitDoorSearchEnd do
  begin
    PermitDoorSearchTimer.Enabled := True;
    Exit;
  end;
  lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',0);
  if aEmSeq = '' then Exit;
  L_bPermitDoorSearchBreak := False;
  L_bPermitDoorSearchEnd := False;

  GridInit(sgList,2,2,true);

  stSql := dmDBSelect.SelectTB_Door_EmployeePermit(aBuildingCode,aEmSeq,aSearchName);
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
      if recordcount < 1 then
      begin
        Exit;
      end;
      nRow := 1;
      Try
        with sgList do
        begin
          nRow := 1;
          RowCount := RecordCount + 1;
          while Not Eof do
          begin
            if L_bSearchBreak then Exit;

            AddCheckBox(0,nRow,False,False);
            if G_bApplicationTerminate then Exit;

            stDoorCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('DO_DOORNO').AsString;
            cells[1,nRow] := FindField('DO_DOORNAME').AsString;
            cells[2,nRow] := FindField('ND_NODENO').AsString;
            cells[3,nRow] := FindField('DE_ECUID').AsString;
            cells[4,nRow] := FindField('DE_EXTENDID').AsString;
            cells[5,nRow] := FindField('DO_DOORNO').AsString;
            cells[6,nRow] := stDoorCode;
            cells[7,nRow] := FindField('DO_VIEWSEQ').AsString;

            nRow := nRow + 1;
            Application.ProcessMessages;
            Next;
          end;
          lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',RecordCount);
        end;
      Except
        Exit;
      End;
    end;
  Finally
    L_bPermitDoorSearchEnd := True;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

(*
procedure TfmCompanyGrade.NotPermitArmAreaListAdd(aArmAreaName, aNodeNo, aEcuID,
  aExtendID, aArmAreaNo, aArmAreaCode, aArmAreaView: string);
var
  i : integer;
  bAdd : Boolean;
  nRow : integer;
  nIndex : integer;
begin
  bAdd := False;
  with sg_NotPermitAlarm do
  begin
    if RowCount = 2 then
    begin
      if Cells[6,Row] = '' then
      begin
        nRow := 1;
        AddCheckBox(0,nRow,False,False);
        cells[1,nRow] := aArmAreaName;
        cells[2,nRow] := aNodeNo;
        cells[3,nRow] := aEcuID;
        cells[4,nRow] := aExtendID;
        cells[5,nRow] := aArmAreaNo;
        cells[6,nRow] := aArmAreaCode;
        cells[7,nRow] := aArmAreaView;
        bAdd := True;
      end;
    end;
    if Not bAdd then
    begin
      for i := 1 to RowCount - 1 do
      begin
        if strtoint(cells[7,i]) = strtoint(aArmAreaView) then
        begin
          if cells[6,i] > aArmAreaCode then
          begin
            InsertRows(i,1);
            AddCheckBox(0,i,False,False);
            cells[1,i] := aArmAreaName;
            cells[2,i] := aNodeNo;
            cells[3,i] := aEcuID;
            cells[4,i] := aExtendID;
            cells[5,i] := aArmAreaNo;
            cells[6,i] := aArmAreaCode;
            cells[7,i] := aArmAreaView;
            bAdd := True;
            break;
          end;
        end else if strtoint(cells[7,i]) > strtoint(aArmAreaView) then
        begin
          InsertRows(i,1);
          AddCheckBox(0,i,False,False);
          cells[1,i] := aArmAreaName;
          cells[2,i] := aNodeNo;
          cells[3,i] := aEcuID;
          cells[4,i] := aExtendID;
          cells[5,i] := aArmAreaNo;
          cells[6,i] := aArmAreaCode;
          cells[7,i] := aArmAreaView;
          bAdd := True;
          break;
         end;
      end;
    end;
    if Not bAdd then
    begin
      //중간에 삽입 하지 못한 경우 마지막에 추가
      AddRow;
      nRow := RowCount - 1;
      AddCheckBox(0,nRow,False,False);
      cells[1,nRow] := aArmAreaName;
      cells[2,nRow] := aNodeNo;
      cells[3,nRow] := aEcuID;
      cells[4,nRow] := aExtendID;
      cells[5,nRow] := aArmAreaNo;
      cells[6,nRow] := aArmAreaCode;
      cells[7,nRow] := aArmAreaView;
    end;
  end;
  if NotGradeArmAreaCodeList.IndexOf(aArmAreaCode) < 0 then NotGradeArmAreaCodeList.Add(aArmAreaCode);
  lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',NotGradeArmAreaCodeList.Count);
end;
*)
(*
procedure TfmCompanyGrade.NotPermitArmAreaListDelete(aArmAreaCode: string);
var
  i : integer;
  nIndex : integer;
begin
  for i := 1 to sg_NotPermitAlarm.RowCount - 1 do
  begin
    if sg_NotPermitAlarm.Cells[6,i] = aArmAreaCode then
    begin
      if sg_NotPermitAlarm.RowCount > 2 then sg_NotPermitAlarm.RemoveRows(i,1)
      else GridInit(sg_NotPermitAlarm,2,2,True);
      break;
    end;
  end;

  nIndex := NotGradeArmAreaCodeList.IndexOf(aArmAreaCode);
  if nIndex > -1 then NotGradeArmAreaCodeList.Delete(nIndex);
  lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',NotGradeArmAreaCodeList.Count);
end;
*)
(*
procedure TfmCompanyGrade.NotPermitDoorListAdd(aDoorName, aNodeNo, aEcuID, aExtendID,
  aDoorNo, aDoorCode, aDoorView: string);
var
  i : integer;
  bAdd : Boolean;
  nRow : integer;
begin
  bAdd := False;
  with sg_NotPermitDoor do
  begin
    if RowCount = 2 then
    begin
      if Cells[6,Row] = '' then
      begin
        nRow := 1;
        AddCheckBox(0,nRow,False,False);
        cells[1,nRow] := aDoorName;
        cells[2,nRow] := aNodeNo;
        cells[3,nRow] := aEcuID;
        cells[4,nRow] := aExtendID;
        cells[5,nRow] := aDoorNo;
        cells[6,nRow] := aDoorCode;
        cells[7,nRow] := aDoorView;
        bAdd := True;
      end;
    end;
    if Not bAdd then
    begin
      for i := 1 to RowCount - 1 do
      begin
        if strtoint(cells[7,i]) = strtoint(aDoorView) then
        begin
          if cells[6,i] > aDoorCode then
          begin
            InsertRows(i,1);
            AddCheckBox(0,i,False,False);
            cells[1,i] := aDoorName;
            cells[2,i] := aNodeNo;
            cells[3,i] := aEcuID;
            cells[4,i] := aExtendID;
            cells[5,i] := aDoorNo;
            cells[6,i] := aDoorCode;
            cells[7,i] := aDoorView;
            bAdd := True;
            break;
          end;
        end else if strtoint(cells[7,i]) > strtoint(aDoorView) then
        begin
          InsertRows(i,1);
          AddCheckBox(0,i,False,False);
          cells[1,i] := aDoorName;
          cells[2,i] := aNodeNo;
          cells[3,i] := aEcuID;
          cells[4,i] := aExtendID;
          cells[5,i] := aDoorNo;
          cells[6,i] := aDoorCode;
          cells[7,i] := aDoorView;
          bAdd := True;
          break;
         end;
      end;
    end;
    if Not bAdd then
    begin
      //중간에 삽입 하지 못한 경우 마지막에 추가
      AddRow;
      nRow := RowCount - 1;
      AddCheckBox(0,nRow,False,False);
      cells[1,nRow] := aDoorName;
      cells[2,nRow] := aNodeNo;
      cells[3,nRow] := aEcuID;
      cells[4,nRow] := aExtendID;
      cells[5,nRow] := aDoorNo;
      cells[6,nRow] := aDoorCode;
      cells[7,nRow] := aDoorView;
    end;
  end;
  if NotGradeDoorCodeList.IndexOf(aDoorCode) < 0 then NotGradeDoorCodeList.Add(aDoorCode);
  lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',NotGradeDoorCodeList.Count);
end;
*)
(*
procedure TfmCompanyGrade.NotPermitDoorListDelete(aDoorCode: string);
var
  i : integer;
  nIndex : integer;
begin
  for i := 1 to sg_NotPermitDoor.RowCount - 1 do
  begin
    if sg_NotPermitDoor.Cells[6,i] = aDoorCode then
    begin
      if sg_NotPermitDoor.RowCount > 2 then sg_NotPermitDoor.RemoveRows(i,1)
      else GridInit(sg_NotPermitDoor,2,2,True);
      break;
    end;
  end;

  nIndex := NotGradeDoorCodeList.IndexOf(aDoorCode);
  if nIndex > -1 then NotGradeDoorCodeList.Delete(nIndex);
  lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',NotGradeDoorCodeList.Count);
end;
*)

procedure TfmEmployeeGrade.pan_emPermitAdminResize(Sender: TObject);
begin
  inherited;
  tp_Grade.Height := pan_emPermitAdmin.Height - (lb_BuildingName.Top + lb_BuildingName.Height) - 40;
  tp_Grade.Width :=  pan_emPermitAdmin.Width - 20;
end;

procedure TfmEmployeeGrade.PermitDoorSearchTimerTimer(Sender: TObject);
begin
  inherited;
  PermitDoorSearchTimer.Enabled := False;
  LoadPermitDoor(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text, sg_PermitDoor);
end;

procedure TfmEmployeeGrade.RecvCardNO(aCardNo: string);
begin
  ed_etcSearch.Text := aCardNo;
  cmb_EtcSearch.ItemIndex := 5;
  cmb_GradeType.ItemIndex := 0;
  SearchEmployee('');
end;

procedure TfmEmployeeGrade.SearchEmployee(aCode: string; aTopRow: integer);
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
begin
  L_bSearchBreak := True;
  while Not L_bSearchEnd do
  begin
    SearchTimer.Enabled := True;
    Exit;
  end;

  GridInit(sg_EmployeeList,4,2,True);
  L_bSearchBreak := False;
  L_bSearchEnd := False;

  stCompanyCode := ed_CompanyCode.Text;
  if stCompanyCode = '' then stCompanyCode := '0';

  stPosiCode := '';
  if cmb_PositionSearch.ItemIndex > 0 then stPosiCode := PosiSearchCodeList.Strings[cmb_PositionSearch.ItemIndex];

  stEmployeeGubun := '';
  if cmb_EmpGubunSearch.ItemIndex > 0 then stEmployeeGubun := EmployeeGubunSearchCodeList.Strings[cmb_EmpGubunSearch.ItemIndex];

  stEmCode := '';
  if cmb_EtcSearch.Text = L_stEmCodeCaption  then stEmCode := ed_etcSearch.Text;

  stEmName := '';
  if cmb_EtcSearch.Text = L_stEmNameCaption  then stEmName := ed_etcSearch.Text;

  stEmHandPhone := '';
  if cmb_EtcSearch.Text = L_stEmHandPhoneCaption  then stEmHandPhone := ed_etcSearch.Text;

  stEmCompanyPhone := '';
  if cmb_EtcSearch.Text = L_stEmCompanyPhoneCaption  then stEmCompanyPhone := ed_etcSearch.Text;

  stEtcInfo := '';
  if cmb_EtcSearch.Text = L_stEmEtcCaption  then stEtcInfo := ed_etcSearch.Text;

  stCardNo := '';
  if cmb_EtcSearch.Text = L_stCardNoCaption  then stCardNo := ed_etcSearch.Text;

  stSql := dmDBSelect.SelectTB_EMPLOYE_Value(stCompanyCode,stPosiCode,'',stEmCode,stEmName,stEmployeeGubun,stEmHandPhone,stEmCompanyPhone,stEtcInfo,'','','1','','',False,'','',stCardNo,'',inttostr(cmb_gradeType.ItemIndex),'',Not chk_CompanyGrade.Checked);  //출입타입;
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
      if recordcount < 1 then Exit;

      with sg_EmployeeList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          if L_bSearchBreak then Exit;
          if G_bApplicationTerminate then Exit;

          AddCheckBox(0,nRow,False,False);

          //cells[0,nRow] := '  ' + FindField('COMPANYNAME1').AsString;
          //cells[1,nRow] := FindField('COMPANYNAME2').AsString;
          //cells[2,nRow] := FindField('COMPANYNAME3').AsString;
          cells[1,nRow] := FindField('EM_CODE').AsString;
          cells[2,nRow] := FindField('EM_NAME').AsString;
          cells[3,nRow] := FindField('CO_COMPANYNAME').AsString;
          cells[4,nRow] := FindField('PO_POSICODENAME').AsString;
          cells[7,nRow] := FindField('EM_GUBUNCODENAME').AsString;
          cells[8,nRow] := FindField('EM_HANDPHONE').AsString;
          cells[9,nRow] := FindField('EM_COMPANYPHONE').AsString;
          cells[10,nRow] := FindField('EM_EMINFO').AsString;
          cells[11,nRow] := FindField('EM_REGDATE').AsString;
          cells[12,nRow] := FindField('EM_ENDDATE').AsString;
          cells[13,nRow] := FindField('EM_ATUSE').AsString;
          cells[14,nRow] := FindField('EM_FDUSE').AsString;
          cells[15,nRow] := FindField('EM_GROUPCODENAME').AsString;
          cells[16,nRow] := FindField('EM_SEQ').AsString;
          cells[17,nRow] := FindField('CO_COMPANYCODE').AsString;
          cells[18,nRow] := FindField('PO_POSICODE').AsString;
          cells[19,nRow] := FindField('EM_GUBUNCODE').AsString;
          cells[20,nRow] := FindField('EM_GROUPCODE').AsString;
          cells[21,nRow] := FindField('EM_GRADETYPE').AsString;
{          cells[19,nRow] := FindField('EM_TIMECODEUSE').AsString;
          cells[20,nRow] := FindField('TC_GROUP').AsString;
          cells[21,nRow] := FindField('TC_TIME1').AsString;
          cells[22,nRow] := FindField('TC_TIME2').AsString;
          cells[23,nRow] := FindField('TC_TIME3').AsString;
          cells[24,nRow] := FindField('TC_TIME4').AsString;
          cells[25,nRow] := FindField('TC_WEEKCODE').AsString;   }
          cells[29,nRow] := FindField('EM_FINGERUSE').AsString;
          cells[30,nRow] := FindField('EM_STATECODE').AsString;
          cells[31,nRow] := FindField('AW_CODE').AsString;
          if FindField('EM_SEQ').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;
          //if FindField('EM_GRADETYPE').AsString = '3' then RowColor[nRow] := G_nColorEmployee //$00EACAB6     //개인별
          //else if FindField('EM_GRADETYPE').AsString = '2' then RowColor[nRow] := G_nColorEmGroup //$00EACAB6  //그룹별
          //else RowColor[nRow] := G_nColorCompany;

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
    if (G_nFormEnable = 1) then FormSearchEnable(True);
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmEmployeeGrade.SearchTimerTimer(Sender: TObject);
begin
  inherited;
  SearchTimer.Enabled := False;
  SearchEmployee('');
end;

(*
procedure TfmCompanyGrade.PermitArmAreaListAdd(aArmAreaName, aNodeNo, aEcuID,
  aExtendID, aArmAreaNo, aArmAreaCode, aArmAreaView: string);
var
  i : integer;
  bAdd : Boolean;
  nRow : integer;
  nIndex : integer;
begin
  bAdd := False;
  with sg_PermitAlarm do
  begin
    if RowCount = 2 then
    begin
      if Cells[6,Row] = '' then
      begin
        nRow := 1;
        AddCheckBox(0,nRow,False,False);
        cells[1,nRow] := aArmAreaName;
        cells[2,nRow] := aNodeNo;
        cells[3,nRow] := aEcuID;
        cells[4,nRow] := aExtendID;
        cells[5,nRow] := aArmAreaNo;
        cells[6,nRow] := aArmAreaCode;
        cells[7,nRow] := aArmAreaView;
        bAdd := True;
      end;
    end;
    if Not bAdd then
    begin
      for i := 1 to RowCount - 1 do
      begin
        if strtoint(cells[7,i]) = strtoint(aArmAreaView) then
        begin
          if cells[6,i] > aArmAreaCode then
          begin
            InsertRows(i,1);
            AddCheckBox(0,i,False,False);
            cells[1,i] := aArmAreaName;
            cells[2,i] := aNodeNo;
            cells[3,i] := aEcuID;
            cells[4,i] := aExtendID;
            cells[5,i] := aArmAreaNo;
            cells[6,i] := aArmAreaCode;
            cells[7,i] := aArmAreaView;
            bAdd := True;
            break;
          end;
        end else if strtoint(cells[7,i]) > strtoint(aArmAreaView) then
        begin
          InsertRows(i,1);
          AddCheckBox(0,i,False,False);
          cells[1,i] := aArmAreaName;
          cells[2,i] := aNodeNo;
          cells[3,i] := aEcuID;
          cells[4,i] := aExtendID;
          cells[5,i] := aArmAreaNo;
          cells[6,i] := aArmAreaCode;
          cells[7,i] := aArmAreaView;
          bAdd := True;
          break;
         end;
      end;
    end;
    if Not bAdd then
    begin
      //중간에 삽입 하지 못한 경우 마지막에 추가
      AddRow;
      nRow := RowCount - 1;
      AddCheckBox(0,nRow,False,False);
      cells[1,nRow] := aArmAreaName;
      cells[2,nRow] := aNodeNo;
      cells[3,nRow] := aEcuID;
      cells[4,nRow] := aExtendID;
      cells[5,nRow] := aArmAreaNo;
      cells[6,nRow] := aArmAreaCode;
      cells[7,nRow] := aArmAreaView;
    end;
  end;
  if GradeArmAreaCodeList.IndexOf(aArmAreaCode) < 0 then GradeArmAreaCodeList.Add(aArmAreaCode);
  lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',GradeArmAreaCodeList.Count);
end;
*)
(*
procedure TfmCompanyGrade.PermitArmAreaListDelete(aArmAreaCode: string);
var
  i : integer;
  nIndex : integer;
begin
  for i := 1 to sg_PermitAlarm.RowCount - 1 do
  begin
    if sg_PermitAlarm.Cells[6,i] = aArmAreaCode then
    begin
      if sg_PermitAlarm.RowCount > 2 then sg_PermitAlarm.RemoveRows(i,1)
      else GridInit(sg_PermitAlarm,2,2,True);
      break;
    end;
  end;

  nIndex := GradeArmAreaCodeList.IndexOf(aArmAreaCode);
  if nIndex > -1 then GradeArmAreaCodeList.Delete(nIndex);
  lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',GradeArmAreaCodeList.Count);
end;
*)
(*
procedure TfmCompanyGrade.PermitDoorListAdd(aDoorName, aNodeNo, aEcuID, aExtendID,
  aDoorNo, aDoorCode, aDoorView: string);
var
  i : integer;
  bAdd : Boolean;
  nRow : integer;
begin
  bAdd := False;
  with sg_PermitDoor do
  begin
    if RowCount = 2 then
    begin
      if Cells[6,Row] = '' then
      begin
        nRow := 1;
        AddCheckBox(0,nRow,False,False);
        cells[1,nRow] := aDoorName;
        cells[2,nRow] := aNodeNo;
        cells[3,nRow] := aEcuID;
        cells[4,nRow] := aExtendID;
        cells[5,nRow] := aDoorNo;
        cells[6,nRow] := aDoorCode;
        cells[7,nRow] := aDoorView;
        bAdd := True;
      end;
    end;
    if Not bAdd then
    begin
      for i := 1 to RowCount - 1 do
      begin
        if strtoint(cells[7,i]) = strtoint(aDoorView) then
        begin
          if cells[6,i] > aDoorCode then
          begin
            InsertRows(i,1);
            AddCheckBox(0,i,False,False);
            cells[1,i] := aDoorName;
            cells[2,i] := aNodeNo;
            cells[3,i] := aEcuID;
            cells[4,i] := aExtendID;
            cells[5,i] := aDoorNo;
            cells[6,i] := aDoorCode;
            cells[7,i] := aDoorView;
            bAdd := True;
            break;
          end;
        end else if strtoint(cells[7,i]) > strtoint(aDoorView) then
        begin
          InsertRows(i,1);
          AddCheckBox(0,i,False,False);
          cells[1,i] := aDoorName;
          cells[2,i] := aNodeNo;
          cells[3,i] := aEcuID;
          cells[4,i] := aExtendID;
          cells[5,i] := aDoorNo;
          cells[6,i] := aDoorCode;
          cells[7,i] := aDoorView;
          bAdd := True;
          break;
         end;
      end;
    end;
    if Not bAdd then
    begin
      //중간에 삽입 하지 못한 경우 마지막에 추가
      AddRow;
      nRow := RowCount - 1;
      AddCheckBox(0,nRow,False,False);
      cells[1,nRow] := aDoorName;
      cells[2,nRow] := aNodeNo;
      cells[3,nRow] := aEcuID;
      cells[4,nRow] := aExtendID;
      cells[5,nRow] := aDoorNo;
      cells[6,nRow] := aDoorCode;
      cells[7,nRow] := aDoorView;
    end;
  end;
  if GradeDoorCodeList.IndexOf(aDoorCode) < 0 then GradeDoorCodeList.Add(aDoorCode);
  lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',GradeDoorCodeList.Count);
end;
*)
(*
procedure TfmCompanyGrade.PermitDoorListDelete(aDoorCode: string);
var
  i : integer;
  nIndex : integer;
begin
  for i := 1 to sg_PermitDoor.RowCount - 1 do
  begin
    if sg_PermitDoor.Cells[6,i] = aDoorCode then
    begin
      if sg_PermitDoor.RowCount > 2 then sg_PermitDoor.RemoveRows(i,1)
      else GridInit(sg_PermitDoor,2,2,True);
      break;
    end;
  end;

  nIndex := GradeDoorCodeList.IndexOf(aDoorCode);
  if nIndex > -1 then GradeDoorCodeList.Delete(nIndex);
  lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',GradeDoorCodeList.Count);
end;
*)

procedure TfmEmployeeGrade.sg_EmployeeListCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployeeGrade.sg_EmployeeListClick(Sender: TObject);
var
  bchkState : Boolean;
begin
  with (Sender as TAdvStringGrid) do
  begin
    GetCheckBoxState(0,Row, bchkState);
    if bchkState then
    begin
      ed_SelectEmployeeSeq.Text := Cells[16,Row];
      ed_SelectEmployeeName.Text := Cells[2,Row];
    end
    else
    begin
      ed_SelectEmployeeSeq.Text := '' ; //GetFirstCheckListData(sg_Card,3);
      ed_SelectEmployeeName.Text := '';
    end;
  end;
  LoadPermitDoor(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text,sg_PermitDoor);
  LoadPermitArmArea(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text,sg_PermitArmArea);

end;

procedure TfmEmployeeGrade.sg_EmployeeListResize(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := sg_EmployeeList.Height div sg_EmployeeList.DefaultRowHeight;
end;

procedure TfmEmployeeGrade.sg_ArmAreaCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nArmAreaCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nArmAreaCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nArmAreaCheckCount := L_nArmAreaCheckCount + 1
    else L_nArmAreaCheckCount := L_nArmAreaCheckCount - 1 ;
  end;

end;

procedure TfmEmployeeGrade.sg_DoorListCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nDoorCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nDoorCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nDoorCheckCount := L_nDoorCheckCount + 1
    else L_nDoorCheckCount := L_nDoorCheckCount - 1 ;
  end;

end;

procedure TfmEmployeeGrade.sg_PermitArmAreaCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployeeGrade.sg_PermitDoorCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployeeGrade.tp_GradeChange(Sender: TObject);
begin
  inherited;
  if tp_Grade.ActivePage = tab_Doorgrade then lb_SearchName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOOR')
  else lb_SearchName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONARMAREA');

  if tp_Grade.ActivePage = tab_Doorgrade then LoadBuildingDoorAll(ed_SelectBuildingCode.Text,ed_SearchName.Text, sg_DoorList) //전체 출입문을 리스트에 추가 하자
  else LoadBuildingAlarmAll(ed_SelectBuildingCode.Text,ed_SearchName.Text,sg_ArmArea); //전체 방범구역을 리스트에 추가 하자

  if tp_Grade.ActivePage = tab_Doorgrade then LoadPermitDoor(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text,sg_PermitDoor)
  else LoadPermitArmArea(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text,sg_PermitArmArea);
end;

procedure TfmEmployeeGrade.tp_GradeResize(Sender: TObject);
begin
  inherited;
  pan_NotPermitDoor.Width := (tp_Grade.Width - pan_PermitAction.Width) div 2;
  pan_NotPermitAlarmArea.Width := (tp_Grade.Width - AdvSmoothPanel6.Width) div 2;

  sg_DoorList.Width := pan_NotPermitDoor.Width - (sg_DoorList.Left * 2);
  sg_PermitDoor.Width := pan_NotPermitDoor.Width - (sg_PermitDoor.Left * 2);
  sg_ArmArea.Width := pan_NotPermitAlarmArea.Width - (sg_ArmArea.Left * 2);
  sg_PermitArmArea.Width := pan_NotPermitAlarmArea.Width - (sg_PermitArmArea.Left * 2);

  sg_DoorList.Height := pan_NotPermitDoor.Height - pan_NotPermitDoorCount.Height - sg_DoorList.top - 10;
  sg_PermitDoor.Height := pan_NotPermitDoor.Height - pan_NotPermitDoorCount.Height - sg_PermitDoor.top - 10;
  sg_ArmArea.Height := pan_NotPermitDoor.Height - pan_NotPermitDoorCount.Height - sg_ArmArea.top - 10;
  sg_PermitArmArea.Height := pan_NotPermitDoor.Height - pan_NotPermitDoorCount.Height - sg_PermitArmArea.top - 10;

  sg_DoorList.ColWidths[1] := sg_DoorList.Width - sg_DoorList.ColWidths[0] ;
  sg_PermitDoor.ColWidths[1] := sg_PermitDoor.Width - sg_PermitDoor.ColWidths[0] ;
  sg_ArmArea.ColWidths[1] := sg_ArmArea.Width - sg_ArmArea.ColWidths[0] ;
  sg_PermitArmArea.ColWidths[1] := sg_PermitArmArea.Width - sg_PermitArmArea.ColWidths[0] ;

  btn_PermitDoorAdd.Top := (pan_PermitAction.Height div 2) - btn_PermitDoorAdd.Height - 5;
  btn_PermitDoorDelete.Top := (pan_PermitAction.Height div 2) + 5;
  btn_PermitArmAreaAdd.Top := (pan_PermitAction.Height div 2) - btn_PermitArmAreaAdd.Height - 5;
  btn_PermitArmAreaDelete.Top := (pan_PermitAction.Height div 2) + 5;

end;

procedure TfmEmployeeGrade.tv_AddCompanyNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_AddCompanyName.Selected = nil then tv_AddCompanyName.Items[0].Selected := True;

  ed_CompanyCode.Text := tv_AddCompanyCode.Items.Item[tv_AddCompanyName.Selected.AbsoluteIndex].Text;
  ed_CompanyName.Text := tv_AddCompanyName.Selected.Text;
  tv_AddCompanyName.Visible := False;
  //if G_nReportSearchType = 1 then
  if G_nEmployeeSearchType = 1 then SearchEmployee('');
end;

procedure TfmEmployeeGrade.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_SelectBuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  ed_SelectBuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  L_nPermitArmAreaCheckCount := 0;           //삭제시 방범구역 선택 갯수
  L_nArmAreaCheckCount := 0;        //등록시 방범구역 선택 갯수
  L_nPermitDoorCheckCount := 0;           //삭제시 출입문 선택 갯수
  L_nDoorCheckCount := 0;        //등록시 출입문 선택 갯수

  GridInit(sg_DoorList,2,2,true);
  GridInit(sg_PermitDoor,2,2,true);
  GridInit(sg_ArmArea,2,2,true);   //그리드 초기화
  GridInit(sg_PermitArmArea,2,2,true);

  if tp_Grade.ActivePage = tab_Doorgrade then LoadBuildingDoorAll(ed_SelectBuildingCode.Text,ed_SearchName.Text,sg_DoorList) //전체 출입문을 리스트에 추가 하자
  else LoadBuildingAlarmAll(ed_SelectBuildingCode.Text,ed_SearchName.Text,sg_ArmArea); //전체 방범구역을 리스트에 추가 하자

  if tp_Grade.ActivePage = tab_Doorgrade then LoadPermitDoor(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text,sg_PermitDoor)
  else LoadPermitArmArea(ed_SelectBuildingCode.Text,ed_SelectEmployeeSeq.Text,ed_SearchName.Text,sg_PermitArmArea);

end;

procedure TfmEmployeeGrade.tv_CompanyListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  currentItem, dropItem : TTreeNode;
  stOrgCode : string;
  stTargetParentCode : string;
  stCode : string;
  stDeepSeq,stViewSeq : string;
  stSql : string;
begin
  inherited;
(*  if Sender = Source then
  begin
    with TTreeView(Sender) do
    begin
      dropItem :=GetNodeAt(X,Y);
      currentItem := Selected;
      if currentItem.AbsoluteIndex = 0 then Exit;
      stTargetParentCode := tv_CompanyCode.Items[dropItem.AbsoluteIndex].Text;
      stOrgCode := tv_CompanyCode.Items[currentItem.AbsoluteIndex].Text;
      if copy(stTargetParentCode,1,Length(stOrgCode)) = stOrgCode then Exit; //자신의 하위디렉토리로 갈수는 없다
      GetNextChildCompanyCode(stTargetParentCode,stCode,stDeepSeq,stViewSeq);
      ChangeCompanyCode(stOrgCode,stCode,stDeepSeq,stViewSeq);
    end;
  end;
  LoadCompanyTreeView(stCode,tv_CompanyList,tv_CompanyCode,con_LocalCompanyImageIndex);
  *)
end;

procedure TfmEmployeeGrade.tv_CompanyListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
//  Accept := Sender = tv_CompanyList;

end;

initialization
  RegisterClass(TfmEmployeeGrade);
Finalization
  UnRegisterClass(TfmEmployeeGrade);

end.
