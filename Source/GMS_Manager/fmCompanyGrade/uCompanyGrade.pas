﻿unit uCompanyGrade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ExtCtrls, AdvSmoothTabPager, Vcl.ImgList,
  AdvSplitter, AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers,
  AdvGlowButton, AdvOfficePager, AdvOfficePagerStylers, AdvAppStyler,
  AdvPageControl, Vcl.Imaging.pngimage;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmCompanyGrade = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    tv_CompanyList: TTreeView;
    tv_CompanyCode: TTreeView;
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
    lb_List: TLabel;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_BuildingName: TAdvSmoothLabel;
    ed_SelectBuildingName: TAdvEdit;
    btn_BuildingNameSelect: TAdvGlowButton;
    ed_GradeCompanyName: TAdvEdit;
    ed_GradeCompanyCode: TAdvEdit;
    btn_emGradeComplete: TAdvGlassButton;
    lb_CompanyName: TAdvSmoothLabel;
    ed_SelectBuildingCode: TAdvEdit;
    lb_EmployeeList: TLabel;
    tp_Grade: TPageControl;
    tab_Doorgrade: TTabSheet;
    pan_NotPermitDoor: TAdvSmoothPanel;
    lb_NotDoorPermit: TLabel;
    pan_NotPermitDoorCount: TAdvSmoothPanel;
    sg_NotPermitDoor: TAdvStringGrid;
    pan_PermitAction: TAdvSmoothPanel;
    pan_PermitDoor: TAdvSmoothPanel;
    lb_PermitDoor: TLabel;
    pan_DoorPermitCount: TAdvSmoothPanel;
    sg_PermitDoor: TAdvStringGrid;
    tab_ArmAreagrade: TTabSheet;
    pan_NotPermitAlarmArea: TAdvSmoothPanel;
    lb_NotPermitAlarmArea: TLabel;
    AdvSmoothPanel5: TAdvSmoothPanel;
    sg_NotPermitAlarm: TAdvStringGrid;
    AdvSmoothPanel6: TAdvSmoothPanel;
    pan_PermitAlarmArea: TAdvSmoothPanel;
    lb_PermitAlarmArea: TLabel;
    AdvSmoothPanel8: TAdvSmoothPanel;
    sg_PermitAlarm: TAdvStringGrid;
    tv_buildingName: TTreeView;
    btn_PermitDoorAdd: TAdvGlowButton;
    btn_PermitDoorDelete: TAdvGlowButton;
    btn_PermitArmAreaAdd: TAdvGlowButton;
    btn_PermitArmAreaDelete: TAdvGlowButton;
    lb_DoorNotPermitCountName: TAdvSmoothLabel;
    lb_NotPermitDoorCount: TAdvSmoothLabel;
    lb_Count1: TAdvSmoothLabel;
    lb_DoorPermitCountName: TAdvSmoothLabel;
    lb_PermitDoorCount: TAdvSmoothLabel;
    lb_Count2: TAdvSmoothLabel;
    lb_ArmAreaNotPermitCountName: TAdvSmoothLabel;
    lb_NotPermitArmAreaCount: TAdvSmoothLabel;
    lb_Count3: TAdvSmoothLabel;
    lb_ArmAreaPermitCountName: TAdvSmoothLabel;
    lb_PermitArmAreaCount: TAdvSmoothLabel;
    lb_Count4: TAdvSmoothLabel;
    pan_progress: TAdvSmoothPanel;
    lb_ProgressCount: TAdvSmoothLabel;
    ProgressBar1: TProgressBar;
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
    procedure sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitDoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_PermitDoorAddClick(Sender: TObject);
    procedure btn_PermitArmAreaAddClick(Sender: TObject);
    procedure btn_PermitArmAreaDeleteClick(Sender: TObject);
    procedure btn_PermitDoorDeleteClick(Sender: TObject);
    procedure pm_ParentCompanyGradeClick(Sender: TObject);
    procedure ListResize(Sender: TObject);
    procedure pan_emPermitAdminResize(Sender: TObject);
    procedure tp_GradeResize(Sender: TObject);
    procedure pm_CompanyGradeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
  private
//    BuildingArmAreaCodeList : TStringList; //빌딩별 방범구역 코드 리스트를 가지고 있자.
//    BuildingDoorCodeList : TStringList; //빌딩별 출입문 코드 리스트를 가지고 있자.
//    GradeArmAreaCodeList : TStringList;
//    GradeDoorCodeList : TStringList;
//    NotGradeArmAreaCodeList : TStringList; //방범권한이 없는 방범리스트
//    NotGradeDoorCodeList : TStringList;  //출입권한이 없는 리스트
    L_nPermitArmAreaCheckCount : integer;           //삭제시 방범구역 선택 갯수
    L_nNotPermitArmAreaCheckCount : integer;        //등록시 방범구역 선택 갯수
    L_nPermitDoorCheckCount : integer;           //삭제시 출입문 선택 갯수
    L_nNotPermitDoorCheckCount : integer;        //등록시 출입문 선택 갯수
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
  private
//    procedure CompanyGradeToEmployeeGrade;
//    Function CompanyGradeToEmployeeEachApply(aCompanyCode:string):Boolean;

//    procedure LoadBuildingAlarmAll(aBuildingCode:string;sgList:TAdvStringGrid); //전체 출입문을 리스트에 추가 하자
    procedure LoadBuildingNotPermitArmArea(aBuildingCode,aCompanyCode:string;sgList:TAdvStringGrid); //미등록 출입문을 리스트에 추가하자.
    procedure LoadBuildingNotPermitDoor(aBuildingCode,aCompanyCode:string;sgList:TAdvStringGrid); //미등록 출입문을 리스트에 추가하자.
//    procedure LoadBuildingDoorAll(aBuildingCode:string;sgList:TAdvStringGrid); //전체 출입문을 리스트에 추가 하자
//    procedure LoadPermitAlarm(aBuildingCode,aCompanyCode:string);
    procedure LoadPermitAlarm_II(aBuildingCode,aCompanyCode:string;sgList:TAdvStringGrid);
//    procedure LoadPermitCompanyArmArea(aBuildingCode,aCompanyCode:string);
//    procedure LoadPermitCompanyDoor(aBuildingCode,aCompanyCode:string);
//    procedure LoadPermitDoor(aBuildingCode,aCompanyCode:string);
    procedure LoadPermitDoor_II(aBuildingCode,aCompanyCode:string;sgList:TAdvStringGrid);

//    procedure NotPermitArmAreaListAdd(aArmAreaName,aNodeNo,aEcuID,aExtendID,aArmAreaNo,aArmAreaCode,aArmAreaView:string);
//    procedure NotPermitArmAreaListDelete(aArmAreaCode:string);
//    procedure NotPermitDoorListAdd(aDoorName,aNodeNo,aEcuID,aExtendID,aDoorNo,aDoorCode,aDoorView:string);
//    procedure NotPermitDoorListDelete(aDoorCode:string);

//    procedure PermitArmAreaListAdd(aArmAreaName,aNodeNo,aEcuID,aExtendID,aArmAreaNo,aArmAreaCode,aArmAreaView:string);
//    procedure PermitArmAreaListDelete(aArmAreaCode:string);
//    procedure PermitDoorListAdd(aDoorName,aNodeNo,aEcuID,aExtendID,aDoorNo,aDoorCode,aDoorView:string);
//    procedure PermitDoorListDelete(aDoorCode:string);

    procedure FormNameSetting;
    procedure FontSetting;
    function ChangeCompanyCode(aOrgCode,aCode,aDeepSeq,aViewSeq:string):Boolean;
    function GetCurrentCompanyDeepSeq(aOrgCode:string):string;
    function GetNextChildCompanyCode(aParentCode:string;var aCode,aDeepSeq,aViewSeq:string):Boolean;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CardPermitProcessEvent(aType,aCode:string;aTotCount,aCurCount:integer);
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmCompanyGrade: TfmCompanyGrade;

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

procedure TfmCompanyGrade.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmCompanyGrade.btn_BuildingNameSelectClick(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Left := btn_BuildingNameSelect.Left;
  tv_buildingName.Top := btn_BuildingNameSelect.Top + btn_BuildingNameSelect.Height;
end;

procedure TfmCompanyGrade.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmCompanyGrade.btn_emGradeCompleteClick(Sender: TObject);
begin
  inherited;
  pan_emPermitAdmin.Visible := False;
end;

procedure TfmCompanyGrade.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmCompanyGrade.btn_PermitArmAreaAddClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_PermitArmAreaAdd.Caption,[rfReplaceAll]);
  if L_nNotPermitArmAreaCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  Try
    tv_CompanyList.Enabled := False;
    btn_Close.Enabled := False;
    pan_progress.Visible := True;
    with sg_NotPermitAlarm do
    begin
      ProgressBar1.Max := RowCount - 1;
      ProgressBar1.Position := 0;
      for i := RowCount - 1 downto 1 do
      begin
        ProgressBar1.Position := ProgressBar1.Position + 1;
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          if G_bChildGradeSync then
          begin
            dmDBCardPermit.CompanyArmAreaPermitLikeAdd(ed_GradeCompanyCode.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
          end else
          begin
            dmDBCardPermit.CompanyArmAreaPermitAdd(ed_GradeCompanyCode.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
          end;
          dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'O' + ed_GradeCompanyCode.Text,Cells[5,i],con_ComLogTYPE_ARMAREA,L_stMenuID + '(' + Caption + '):Permit Add');

          //PermitArmAreaListAdd(Cells[1,i],Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],Cells[7,i]);
          //NotPermitArmAreaListDelete(Cells[6,i]);
        end;
        lb_ProgressCount.Caption.Text := inttostr(ProgressBar1.Position) + '/' + inttostr(ProgressBar1.Max);
        application.ProcessMessages;
      end;
    end;
    lb_ProgressCount.Caption.Text := '방범 권한 적용중...' ;
    //dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyLikeApply(ed_GradeCompanyCode.Text,'N'); //자회사 코드의 데이터도 모두 적용 'N' 상태로 해야 됨
    if G_bChildGradeSync then dmDBCardPermit.CompanyGradeToEmployeeGradeLike(ed_GradeCompanyCode.Text)
    else dmDBCardPermit.CompanyGradeToEmployeeGrade(ed_GradeCompanyCode.Text);
    //    dmDBCardPermit.CompanyGradeToEmployeeGrade;
    LoadBuildingNotPermitArmArea(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text,sg_NotPermitAlarm); //미등록 권한을 조회 하자.
    LoadPermitAlarm_II(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text,sg_PermitAlarm);
    fmMain.FORMCARDDOWNLOADExecute;
  Finally
    tv_CompanyList.Enabled := True;
    btn_Close.Enabled := True;
    pan_progress.Visible := False;
  End;
end;

procedure TfmCompanyGrade.btn_PermitArmAreaDeleteClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
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
    tv_CompanyList.Enabled := False;
    btn_Close.Enabled := False;
    pan_progress.Visible := True;
    with sg_PermitAlarm do
    begin
      ProgressBar1.Max := RowCount - 1;
      ProgressBar1.Position := 0;
      for i := RowCount - 1 downto 1 do
      begin
        ProgressBar1.Position := ProgressBar1.Position + 1;
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          if G_bChildGradeSync then
          begin
            dmDBCardPermit.CompanyArmAreaPermitLikeDelete(ed_GradeCompanyCode.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
          end else
          begin
            dmDBCardPermit.CompanyArmAreaPermitDelete(ed_GradeCompanyCode.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
          end;
          dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'O' + ed_GradeCompanyCode.Text,Cells[5,i],con_ComLogTYPE_ARMAREA,L_stMenuID + '(' + Caption + '):Permit Delete');

          //NotPermitArmAreaListAdd(Cells[1,i],Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],Cells[7,i]);
          //PermitArmAreaListDelete(Cells[6,i]);
        end;
        lb_ProgressCount.Caption.Text := inttostr(ProgressBar1.Position) + '/' + inttostr(ProgressBar1.Max);
        application.ProcessMessages;
      end;
    end;
    lb_ProgressCount.Caption.Text := '방범 권한 삭제 적용중...' ;
    //dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyLikeApply(ed_GradeCompanyCode.Text,'N'); //자회사 코드의 데이터도 모두 적용 'N' 상태로 해야 됨
    if G_bChildGradeSync then dmDBCardPermit.CompanyGradeToEmployeeGradeLike(ed_GradeCompanyCode.Text)
    else dmDBCardPermit.CompanyGradeToEmployeeGrade(ed_GradeCompanyCode.Text);
    //dmDBCardPermit.CompanyGradeToEmployeeGrade;
    LoadBuildingNotPermitArmArea(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text,sg_NotPermitAlarm); //미등록 권한을 조회 하자.
    LoadPermitAlarm_II(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text,sg_PermitAlarm);
    fmMain.FORMCARDDOWNLOADExecute;
  Finally
    tv_CompanyList.Enabled := True;
    btn_Close.Enabled := True;
    pan_progress.Visible := False;
  End;

end;

procedure TfmCompanyGrade.btn_PermitDoorAddClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_PermitDoorAdd.Caption,[rfReplaceAll]);
  if L_nNotPermitDoorCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  Try
    tv_CompanyList.Enabled := False;
    btn_Close.Enabled := False;
    pan_progress.Visible := True;
    with sg_NotPermitDoor do
    begin
      ProgressBar1.Max := RowCount - 1;
      ProgressBar1.Position := 0;
      for i := RowCount - 1 downto 1 do
      begin
        ProgressBar1.Position := ProgressBar1.Position + 1;
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          if G_bChildGradeSync then
          begin
            dmDBCardPermit.CompanyDoorPermitLikeAdd(ed_GradeCompanyCode.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
          end else
          begin
            dmDBCardPermit.CompanyDoorPermitAdd(ed_GradeCompanyCode.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
          end;
          dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'O' + ed_GradeCompanyCode.Text,Cells[5,i],con_ComLogTYPE_DOOR,L_stMenuID + '(' + Caption + '):Permit Add');

          //PermitDoorListAdd(Cells[1,i],Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],Cells[7,i]);
          //NotPermitDoorListDelete(Cells[6,i]);
        end;
        lb_ProgressCount.Caption.Text := inttostr(ProgressBar1.Position) + '/' + inttostr(ProgressBar1.Max);
        application.ProcessMessages;
      end;
    end;
    lb_ProgressCount.Caption.Text := '출입 권한 적용중...' ;
    //dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyLikeApply(ed_GradeCompanyCode.Text,'N'); //자회사 코드의 데이터도 모두 적용 'N' 상태로 해야 됨
    //dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyCodeApply(ed_GradeCompanyCode.Text,'N'); //현재코드의 데이터만  'N' 상태로 해야 됨
    if G_bChildGradeSync then dmDBCardPermit.CompanyGradeToEmployeeGradeLike(ed_GradeCompanyCode.Text)
    else dmDBCardPermit.CompanyGradeToEmployeeGrade(ed_GradeCompanyCode.Text);
    LoadBuildingNotPermitDoor(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text,sg_NotPermitDoor); //미등록 권한을 조회 하자.
    LoadPermitDoor_II(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text,sg_PermitDoor);
    fmMain.FORMCARDDOWNLOADExecute;
  Finally
    tv_CompanyList.Enabled := True;
    btn_Close.Enabled := True;
    pan_progress.Visible := False;
  End;
end;

procedure TfmCompanyGrade.btn_PermitDoorDeleteClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
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
    tv_CompanyList.Enabled := False;
    btn_Close.Enabled := False;
    pan_progress.Visible := True;
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
          if G_bChildGradeSync then
          begin
            dmDBCardPermit.CompanyDoorPermitLikeDelete(ed_GradeCompanyCode.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
          end else
          begin
            dmDBCardPermit.CompanyDoorPermitDelete(ed_GradeCompanyCode.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
          end;

          dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'O' + ed_GradeCompanyCode.Text,Cells[5,i],con_ComLogTYPE_DOOR,L_stMenuID + '(' + Caption + '):Permit Delete');

          //NotPermitDoorListAdd(Cells[1,i],Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],Cells[7,i]);
          //PermitDoorListDelete(Cells[6,i]);
        end;
        lb_ProgressCount.Caption.Text := inttostr(ProgressBar1.Position) + '/' + inttostr(ProgressBar1.Max);
        application.ProcessMessages;
      end;
    end;
    lb_ProgressCount.Caption.Text := '출입 권한 삭제 적용중...' ;
    //dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyLikeApply(ed_GradeCompanyCode.Text,'N'); //자회사 코드의 데이터도 모두 적용 'N' 상태로 해야 됨
    //dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyCodeApply(ed_GradeCompanyCode.Text,'N'); //현재 코드의 데이터만 'N' 상태로 해야 됨
    if G_bChildGradeSync then dmDBCardPermit.CompanyGradeToEmployeeGradeLike(ed_GradeCompanyCode.Text)
    else dmDBCardPermit.CompanyGradeToEmployeeGrade(ed_GradeCompanyCode.Text);
    //dmDBCardPermit.CompanyGradeToEmployeeGrade;
    LoadBuildingNotPermitDoor(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text,sg_NotPermitDoor); //미등록 권한을 조회 하자.
    LoadPermitDoor_II(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text,sg_PermitDoor);
    fmMain.FORMCARDDOWNLOADExecute;
  Finally
    tv_CompanyList.Enabled := True;
    btn_Close.Enabled := True;
    pan_progress.Visible := False;
  End;

end;

procedure TfmCompanyGrade.CardPermitProcessEvent(aType, aCode: string;
  aTotCount, aCurCount: integer);
begin
  if aType <> '1' then Exit; //소속별이 아니면
  if ed_GradeCompanyCode.Text <> aCode then Exit;
  ProgressBar1.Max := aTotCount;
  ProgressBar1.Position := aCurCount;

end;

function TfmCompanyGrade.ChangeCompanyCode(aOrgCode, aCode, aDeepSeq,
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

procedure TfmCompanyGrade.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);  *)
end;

procedure TfmCompanyGrade.FormChangeEvent(aNumber: integer);
begin
  case aNumber of
    con_FormBMOSBUILDINGCODE : begin
      LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
    end;
  end;

end;

procedure TfmCompanyGrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  BuildingDoorCodeList.Free;
//  BuildingArmAreaCodeList.Free;
//  GradeArmAreaCodeList.Free;
//  GradeDoorCodeList.Free;
//  NotGradeArmAreaCodeList.Free; //방범권한이 없는 방범리스트
//  NotGradeDoorCodeList.Free;  //출입권한이 없는 리스트

  fmMain.FORMENABLE(con_FormBMOSCOMPANYGRADE,'FALSE');

  Action := caFree;
end;

procedure TfmCompanyGrade.FormCreate(Sender: TObject);
begin
  inherited;
//  BuildingDoorCodeList := TStringList.Create;
//  BuildingArmAreaCodeList := TStringList.Create;
//  GradeArmAreaCodeList := TStringList.Create;
//  GradeDoorCodeList := TStringList.Create;
//  NotGradeArmAreaCodeList := TStringList.Create; //방범권한이 없는 방범리스트
//  NotGradeDoorCodeList := TStringList.Create;  //출입권한이 없는 리스트
  FontSetting;
end;

procedure TfmCompanyGrade.FormGradeRefresh;
begin
  if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
  pm_CompanyGrade.Enabled := IsInsertGrade;
  pm_ParentCompanyGrade.Enabled := IsDeleteGrade;
end;

procedure TfmCompanyGrade.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmCompanyGrade.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_List.Caption := dmFormFunction.GetFormName('0','2','COMMONCOMPANYLIST');//소속 dmFormFunction.GetFormName('0','2','COMMONLIST01');
  lb_EmployeeList.Caption := dmFormFunction.GetFormName('2','2','BM3_017_01');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  sg_NotPermitDoor.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
  sg_PermitDoor.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
  sg_NotPermitAlarm.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONARMAREANAME');
  sg_PermitAlarm.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONARMAREANAME');
  lb_BuildingName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  btn_BuildingNameSelect.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH002');
  lb_CompanyName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');
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
  lb_NotDoorPermit.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORNOTPERMIT');
  lb_PermitDoor.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORREGPERMIT');
  lb_NotPermitAlarmArea.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREANOTPERMIT');
  lb_PermitAlarmArea.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREAREPERMIT');
  btn_PermitDoorAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITADD001');
  btn_PermitArmAreaAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITADD001');
  btn_PermitDoorDelete.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITDELETE001');
  btn_PermitArmAreaDelete.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITDELETE001');
end;

procedure TfmCompanyGrade.FormResize(Sender: TObject);
begin
  inherited;

  tv_CompanyList.Height := List.Height - tv_CompanyList.Top - 30;
  tv_CompanyList.Width := List.Width - (tv_CompanyList.Left * 2);

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
end;

procedure TfmCompanyGrade.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSCOMPANYGRADE,'TRUE');

  LoadCompanyTreeView('',tv_CompanyList,tv_CompanyCode,con_LocalCompanyImageIndex);
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  pm_CompanyGradeClick(self);

  tab_ArmAreagrade.TabVisible := G_bAlarmMonitoringUse;
  tp_Grade.ActivePageIndex := 0;

end;

procedure TfmCompanyGrade.Form_Close;
begin
  Close;
end;

function TfmCompanyGrade.GetCurrentCompanyDeepSeq(aOrgCode: string): string;
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

function TfmCompanyGrade.GetNextChildCompanyCode(aParentCode: string; var aCode, aDeepSeq,
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

procedure TfmCompanyGrade.ListResize(Sender: TObject);
begin
  inherited;
  tv_CompanyList.Width := List.Width - (tv_CompanyList.Left * 2);
end;

(*
procedure TfmCompanyGrade.LoadBuildingAlarmAll(aBuildingCode: string;
  sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stAlarmAreaCode : string;
begin
  GridInit(sgList,2,2,true);
  BuildingArmAreaCodeList.Clear;
  NotGradeArmAreaCodeList.Clear;
  GradeArmAreaCodeList.Clear;
  lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',0);

  stSql := dmDBSelect.SelectTB_ARMAREA_BuildingCode(aBuildingCode);
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
          if BuildingArmAreaCodeList.IndexOf(stAlarmAreaCode) < 0 then BuildingArmAreaCodeList.Add(stAlarmAreaCode);
          if NotGradeArmAreaCodeList.IndexOf(stAlarmAreaCode) < 0 then NotGradeArmAreaCodeList.Add(stAlarmAreaCode);

          cells[6,nRow] := stAlarmAreaCode;
          cells[7,nRow] := FindField('AR_VIEWSEQ').AsString;

          nRow := nRow + 1;
          Next;
        end;
        lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',NotGradeArmAreaCodeList.Count);
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;
*)

(*
procedure TfmCompanyGrade.LoadBuildingDoorAll(aBuildingCode: string;
  sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDoorCode : string;
begin
  GridInit(sgList,2,2,true);
  BuildingDoorCodeList.Clear;
  NotGradeDoorCodeList.Clear;
  GradeDoorCodeList.Clear;
  lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',0);

  stSql := dmDBSelect.SelectTB_DOOR_BuildingCode(aBuildingCode,True);
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
          if BuildingDoorCodeList.IndexOf(stDoorCode) < 0 then BuildingDoorCodeList.Add(stDoorCode);
          if NotGradeDoorCodeList.IndexOf(stDoorCode) < 0 then NotGradeDoorCodeList.Add(stDoorCode);

          cells[6,nRow] := stDoorCode;
          cells[7,nRow] := FindField('DO_VIEWSEQ').AsString;

          nRow := nRow + 1;
          Next;
        end;
        lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',NotGradeDoorCodeList.Count);
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;
*)

procedure TfmCompanyGrade.LoadBuildingNotPermitArmArea(aBuildingCode,
  aCompanyCode: string; sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stAlarmAreaCode : string;
begin
  GridInit(sgList,2,2,true);
  lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',0);

  stSql := dmDBSelect.SelectTB_ARMAREA_CompanyNotPermitCode(aBuildingCode,aCompanyCode);

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
          //if BuildingArmAreaCodeList.IndexOf(stAlarmAreaCode) < 0 then BuildingArmAreaCodeList.Add(stAlarmAreaCode);
          //if NotGradeArmAreaCodeList.IndexOf(stAlarmAreaCode) < 0 then NotGradeArmAreaCodeList.Add(stAlarmAreaCode);

          cells[6,nRow] := stAlarmAreaCode;
          cells[7,nRow] := FindField('AR_VIEWSEQ').AsString;

          nRow := nRow + 1;
          Next;
        end;
        lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',RecordCount);
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCompanyGrade.LoadBuildingNotPermitDoor(aBuildingCode,
  aCompanyCode: string; sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDoorCode : string;
begin
  GridInit(sgList,2,2,true);
  lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',0);

  stSql := dmDBSelect.SelectTB_DOOR_CompanyNotPermitCode(aBuildingCode,aCompanyCode);

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
        lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',RecordCount);
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;
(*
procedure TfmCompanyGrade.LoadPermitAlarm(aBuildingCode, aCompanyCode: string);
var
  stCompanyCode : string;
  i : integer;
begin
  GridInit(sg_PermitAlarm,2,2,true);
  if aCompanyCode = '' then Exit;
  LoadPermitCompanyArmArea(aBuildingCode,aCompanyCode);    //전체 소속의 권한 조회
*)
(*
  stCompanyCode := '0';
  LoadPermitCompanyArmArea(aBuildingCode,stCompanyCode);    //전체 소속의 권한 조회
  if Length(aCompanyCode) < 2  then  Exit;

  i := 1;
  while stCompanyCode <> aCompanyCode do
  begin
    if Length(stCompanyCode) > Length(aCompanyCode) then Exit; //혹시 무한 루프 도는것을 방지
    stCompanyCode := copy(aCompanyCode,1,1 + (G_nCompanyCodeLength * i));
    LoadPermitCompanyArmArea(aBuildingCode,stCompanyCode);
    i := i + 1;
  end;
*)
(*
end;
*)

procedure TfmCompanyGrade.LoadPermitAlarm_II(aBuildingCode,
  aCompanyCode: string; sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stAlarmAreaCode : string;
begin
  GridInit(sgList,2,2,true);
  lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',0);
  if aCompanyCode = '' then Exit;

  stSql := dmDBSelect.SelectTB_ARMAREA_CompanyPermit_II(aBuildingCode,aCompanyCode);
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

(*
procedure TfmCompanyGrade.LoadPermitCompanyArmArea(aBuildingCode,
  aCompanyCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stArmAreaCode : string;
begin
  stSql := dmDBSelect.SelectTB_ArmArea_CompanyPermit(aCompanyCode);
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
        Exit;
      End;
      if recordcount < 1 then
      begin
        lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',0);
        Exit;
      end;
      nRow := 1;
      while Not Eof do
      begin
        stArmAreaCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('AR_ARMAREANO').AsString;
        if BuildingArmAreaCodeList.IndexOf(stArmAreaCode) > -1 then   //해당 빌딩 구역이면서
        begin
          if FindField('CP_PERMIT').AsString = '1' then
          begin
            //권한 등록
            if GradeArmAreaCodeList.IndexOf(stArmAreaCode) < 0 then
            begin
              PermitArmAreaListAdd(FindField('AR_ARMAREANAME').AsString, FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, FindField('DE_EXTENDID').AsString,
                                FindField('AR_ARMAREANO').AsString, stArmAreaCode, FindField('AR_VIEWSEQ').AsString);
            end;
            if NotGradeArmAreaCodeList.IndexOf(stArmAreaCode) > -1 then
            begin
              NotPermitArmAreaListDelete(stArmAreaCode);
            end;
          end else
          begin
            //권한 삭제
            if GradeArmAreaCodeList.IndexOf(stArmAreaCode) > -1 then
            begin
              //권한 리스트에서 삭제
              PermitArmAreaListDelete(stArmAreaCode);
            end;
            if NotGradeArmAreaCodeList.IndexOf(stArmAreaCode) < 0 then
            begin
              //미등록 권한 리스트에 Add
              NotPermitArmAreaListAdd(FindField('AR_ARMAREANAME').AsString, FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, FindField('DE_EXTENDID').AsString,
                                FindField('AR_ARMAREANO').AsString, stArmAreaCode, FindField('AR_VIEWSEQ').AsString);
            end;

          end;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;
*)
(*
procedure TfmCompanyGrade.LoadPermitCompanyDoor(aBuildingCode, aCompanyCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDoorCode : string;
begin
  stSql := dmDBSelect.SelectTB_Door_CompanyPermit(aCompanyCode);
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
        Exit;
      End;
      if recordcount < 1 then
      begin
        lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',GradeDoorCodeList.Count);
        Exit;
      end;
      nRow := 1;
      while Not Eof do
      begin
        stDoorCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('DO_DOORNO').AsString;
        if BuildingDoorCodeList.IndexOf(stDoorCode) > -1 then   //해당 빌딩 구역이면서
        begin
          if FindField('CP_PERMIT').AsString = '1' then
          begin
            //권한 등록
            if GradeDoorCodeList.IndexOf(stDoorCode) < 0 then
            begin
              PermitDoorListAdd(FindField('DO_DOORNAME').AsString, FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, FindField('DE_EXTENDID').AsString,
                                FindField('DO_DOORNO').AsString, stDoorCode, FindField('DO_VIEWSEQ').AsString);
            end;
            if NotGradeDoorCodeList.IndexOf(stDoorCode) > -1 then
            begin
              NotPermitDoorListDelete(stDoorCode);
            end;
          end else
          begin
            //권한 삭제
            if GradeDoorCodeList.IndexOf(stDoorCode) > -1 then
            begin
              //권한 리스트에서 삭제
              PermitDoorListDelete(stDoorCode);
            end;
            if NotGradeDoorCodeList.IndexOf(stDoorCode) < 0 then
            begin
              //미등록 권한 리스트에 Add
              NotPermitDoorListAdd(FindField('DO_DOORNAME').AsString, FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, FindField('DE_EXTENDID').AsString,
                                FindField('DO_DOORNO').AsString, stDoorCode, FindField('DO_VIEWSEQ').AsString);
            end;

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
*)

(*
procedure TfmCompanyGrade.LoadPermitDoor(aBuildingCode, aCompanyCode: string);
var
  stCompanyCode : string;
  i : integer;
begin
  GridInit(sg_PermitDoor,2,2,true);
  if aCompanyCode = '' then Exit;
  LoadPermitCompanyDoor(aBuildingCode,aCompanyCode);
*)
  (*

  stCompanyCode := '0';
  LoadPermitCompanyDoor(aBuildingCode,stCompanyCode);    //전체 소속의 권한 조회
  if Length(aCompanyCode) < 2  then  Exit;

  i := 1;
  while stCompanyCode <> aCompanyCode do
  begin
    if Length(stCompanyCode) > Length(aCompanyCode) then Exit; //혹시 무한 루프 도는것을 방지
    stCompanyCode := copy(aCompanyCode,1,1 + (G_nCompanyCodeLength * i));
    LoadPermitCompanyDoor(aBuildingCode,stCompanyCode);
    i := i + 1;
  end;
  *)
(*
end;
*)

procedure TfmCompanyGrade.LoadPermitDoor_II(aBuildingCode, aCompanyCode: string;
  sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDoorCode : string;
begin
  GridInit(sgList,2,2,true);
  lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',0);
  if aCompanyCode = '' then Exit;

  stSql := dmDBSelect.SelectTB_Door_CompanyPermit_II(aBuildingCode,aCompanyCode);
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

procedure TfmCompanyGrade.pan_emPermitAdminResize(Sender: TObject);
begin
  inherited;
  tp_Grade.Height := pan_emPermitAdmin.Height - (lb_BuildingName.Top + lb_BuildingName.Height) - 20;
  tp_Grade.Width :=  pan_emPermitAdmin.Width - 20;

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

procedure TfmCompanyGrade.pm_CompanyGradeClick(Sender: TObject);
begin
  inherited;
  if tv_CompanyList.Selected = nil then tv_CompanyList.Items[0].Selected := True;

  lb_EmployeeList.Caption := tv_CompanyList.Selected.Text;

  pan_emPermitAdmin.Visible := True;
  ed_GradeCompanyCode.Text := tv_CompanyCode.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text;
  ed_GradeCompanyName.Text := tv_CompanyList.Selected.Text; // tv_CompanyList.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text
  tv_buildingNameDblClick(self);

end;

procedure TfmCompanyGrade.pm_ParentCompanyGradeClick(Sender: TObject);
var
  stCompanyCode : string;
  stParentCompanyCode : string;
  stMessage : string;
begin
  inherited;
  stCompanyCode := tv_CompanyCode.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text;
  if stCompanyCode = '0' then Exit;
  stMessage := dmFormMessage.GetMessage('PARENTCOMPNYGRADE');//stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',pm_DeleteCode.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  stParentCompanyCode := copy(stCompanyCode,1,Length(stCompanyCode) - G_nCompanyCodeLength);
  dmDBDelete.DeleteTB_CARDPERMITCOMPANYGROUP_CompanyCode(stCompanyCode);
  dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyLikeApply(stParentCompanyCode,'N'); //자회사 코드의 데이터도 모두 적용 'N' 상태로 해야 됨
  dmDBCardPermit.CompanyGradeToEmployeeGrade;


end;

procedure TfmCompanyGrade.sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCompanyGrade.sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCompanyGrade.sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCompanyGrade.sg_PermitDoorCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCompanyGrade.tp_GradeResize(Sender: TObject);
begin
  inherited;
  pan_NotPermitDoor.Width := (tp_Grade.Width - pan_PermitAction.Width) div 2;
  pan_NotPermitAlarmArea.Width := (tp_Grade.Width - AdvSmoothPanel6.Width) div 2;

  sg_NotPermitDoor.Width := pan_NotPermitDoor.Width - (sg_NotPermitDoor.Left * 2);
  sg_PermitDoor.Width := pan_NotPermitDoor.Width - (sg_PermitDoor.Left * 2);
  sg_NotPermitAlarm.Width := pan_NotPermitAlarmArea.Width - (sg_NotPermitAlarm.Left * 2);
  sg_PermitAlarm.Width := pan_NotPermitAlarmArea.Width - (sg_PermitAlarm.Left * 2);

  sg_NotPermitDoor.Height := pan_NotPermitDoor.Height - pan_NotPermitDoorCount.Height - sg_NotPermitDoor.top - 10;
  sg_PermitDoor.Height := pan_NotPermitDoor.Height - pan_NotPermitDoorCount.Height - sg_PermitDoor.top - 10;
  sg_NotPermitAlarm.Height := pan_NotPermitDoor.Height - pan_NotPermitDoorCount.Height - sg_NotPermitAlarm.top - 10;
  sg_PermitAlarm.Height := pan_NotPermitDoor.Height - pan_NotPermitDoorCount.Height - sg_PermitAlarm.top - 10;

  sg_NotPermitDoor.ColWidths[1] := sg_NotPermitDoor.Width - sg_NotPermitDoor.ColWidths[0] ;
  sg_PermitDoor.ColWidths[1] := sg_PermitDoor.Width - sg_PermitDoor.ColWidths[0] ;
  sg_NotPermitAlarm.ColWidths[1] := sg_NotPermitAlarm.Width - sg_NotPermitAlarm.ColWidths[0] ;
  sg_PermitAlarm.ColWidths[1] := sg_PermitAlarm.Width - sg_PermitAlarm.ColWidths[0] ;

  btn_PermitDoorAdd.Top := (pan_PermitAction.Height div 2) - btn_PermitDoorAdd.Height - 5;
  btn_PermitDoorDelete.Top := (pan_PermitAction.Height div 2) + 5;
  btn_PermitArmAreaAdd.Top := (pan_PermitAction.Height div 2) - btn_PermitArmAreaAdd.Height - 5;
  btn_PermitArmAreaDelete.Top := (pan_PermitAction.Height div 2) + 5;

end;

procedure TfmCompanyGrade.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_SelectBuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  ed_SelectBuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  if ed_GradeCompanyCode.Text = '' then Exit;
  L_nPermitArmAreaCheckCount := 0;           //삭제시 방범구역 선택 갯수
  L_nNotPermitArmAreaCheckCount := 0;        //등록시 방범구역 선택 갯수
  L_nPermitDoorCheckCount := 0;           //삭제시 출입문 선택 갯수
  L_nNotPermitDoorCheckCount := 0;        //등록시 출입문 선택 갯수

  GridInit(sg_NotPermitDoor,2,2,true);
  GridInit(sg_PermitDoor,2,2,true);
  GridInit(sg_NotPermitAlarm,2,2,true);   //그리드 초기화
  GridInit(sg_PermitAlarm,2,2,true);

  //LoadBuildingDoorAll(ed_SelectBuildingCode.Text,sg_NotPermitDoor); //전체 출입문을 리스트에 추가 하자
  //LoadBuildingAlarmAll(ed_SelectBuildingCode.Text,sg_NotPermitAlarm); //전체 방범구역을 리스트에 추가 하자

  //LoadPermitDoor(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text);
  //LoadPermitAlarm(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text);

  LoadBuildingNotPermitDoor(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text,sg_NotPermitDoor); //미등록 권한을 조회 하자.
  if G_bAlarmMonitoringUse then LoadBuildingNotPermitArmArea(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text,sg_NotPermitAlarm); //전체 방범구역을 리스트에 추가 하자

  LoadPermitDoor_II(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text,sg_PermitDoor);
  if G_bAlarmMonitoringUse then LoadPermitAlarm_II(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text,sg_PermitAlarm);

end;

procedure TfmCompanyGrade.tv_CompanyListDragDrop(Sender, Source: TObject; X,
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

procedure TfmCompanyGrade.tv_CompanyListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
//  Accept := Sender = tv_CompanyList;

end;

initialization
  RegisterClass(TfmCompanyGrade);
Finalization
  UnRegisterClass(TfmCompanyGrade);

end.