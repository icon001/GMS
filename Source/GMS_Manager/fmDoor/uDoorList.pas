﻿unit uDoorList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, AdvOfficeTabSetStylers, AdvToolBar,
  AdvToolBarStylers, AdvCombo, AdvGlowButton, AdvOfficePager, AdvAppStyler,
  AdvOfficePagerStylers, Vcl.Imaging.pngimage, Vcl.ExtCtrls, AdvEdBtn, Vcl.Mask,
  AdvSpin;

const
  con_LocalBuildingImageIndex = 1;
  con_LocalDoorImageIndex = 7;
  con_LocalDoorSelectImageIndex = 8;

type
  TfmDoorList = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    pm_Work: TPopupMenu;
    pm_UpdateCode: TMenuItem;
    MenuImageList16: TImageList;
    pm_Building: TPopupMenu;
    pm_BuildingPast: TMenuItem;
    N2: TMenuItem;
    mn_ScheduleUse: TMenuItem;
    pm_SchedulUse: TMenuItem;
    pm_SchedulNotUse: TMenuItem;
    mn_DeviceInfo: TMenuItem;
    N4: TMenuItem;
    mn_TimecodeUse: TMenuItem;
    pm_TimeCodeNotUse: TMenuItem;
    pm_TimeCodeUse: TMenuItem;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_List: TLabel;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    sg_Door: TAdvStringGrid;
    btn_Antipass: TAdvGlowButton;
    btn_SelectBuildingPosition: TAdvGlowButton;
    btn_SelectDoorGubun: TAdvGlowButton;
    Pan_Workcode: TAdvSmoothPanel;
    lb_WorkType: TLabel;
    lb_Name: TAdvSmoothLabel;
    lb_EtcCode: TAdvSmoothLabel;
    lb_DoorMemo: TAdvSmoothLabel;
    ed_Name: TAdvEdit;
    ed_SelectNode: TAdvEdit;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    mem_DoorMemo: TMemo;
    ed_RelayCode: TAdvEdit;
    pan_AntiGroup: TAdvSmoothPanel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    Label1: TLabel;
    cmb_AntipassGroup: TAdvComboBox;
    btn_AntipassSave: TAdvGlowButton;
    btn_AntipassCancel: TAdvGlowButton;
    btn_AntiGroupAdd: TAdvGlowButton;
    pan_DoorGubun: TAdvSmoothPanel;
    lb_DoorGubun1: TAdvSmoothLabel;
    lb_DoorGubun: TLabel;
    cmb_DoorGubun: TAdvComboBox;
    btn_DoorGubunApply: TAdvGlowButton;
    btn_DoorGubunCancel: TAdvGlowButton;
    pan_Building: TAdvSmoothPanel;
    lb_Building: TLabel;
    tv_buildingName: TTreeView;
    btn_BuildingSelect: TAdvGlowButton;
    btn_BuildingCancel: TAdvGlowButton;
    tv_buildingCode: TTreeView;
    lb_SearchBuildingName: TAdvSmoothLabel;
    eb_SearchBuildingName: TAdvEditBtn;
    ed_BuildingCode: TAdvEdit;
    lb_SearchNodeName: TAdvSmoothLabel;
    ed_SearchName: TAdvEdit;
    tv_SearchbuildingName: TTreeView;
    tv_SearchbuildingCode: TTreeView;
    ed_SelectEcuID: TAdvEdit;
    ed_SelectDoorNo: TAdvEdit;
    se_ViewSeq: TAdvSpinEdit;
    lb_ViewSeq: TAdvSmoothLabel;
    btn_Excel: TAdvGlowButton;
    btn_Search: TAdvGlowButton;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tv_ListClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure pm_UpdateCodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_NameKeyPress(Sender: TObject; var Key: Char);
    procedure pm_DeleteCodeClick(Sender: TObject);
    procedure tv_ListDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg_DoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_SelectBuildingPositionClick(Sender: TObject);
    procedure btn_BuildingCancelClick(Sender: TObject);
    procedure btn_BuildingSelectClick(Sender: TObject);
    procedure btn_SelectDoorGubunClick(Sender: TObject);
    procedure btn_DoorGubunCancelClick(Sender: TObject);
    procedure btn_DoorGubunApplyClick(Sender: TObject);
    procedure pm_SchedulNotUseClick(Sender: TObject);
    procedure pm_TimeCodeNotUseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_AntipassClick(Sender: TObject);
    procedure btn_AntipassCancelClick(Sender: TObject);
    procedure btn_AntipassSaveClick(Sender: TObject);
    procedure btn_AntiGroupAddClick(Sender: TObject);
    procedure eb_SearchBuildingNameClickBtn(Sender: TObject);
    procedure tv_SearchbuildingNameDblClick(Sender: TObject);
    procedure ListResize(Sender: TObject);
    procedure sg_DoorResize(Sender: TObject);
    procedure sg_DoorDblClick(Sender: TObject);
    procedure ed_SearchNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
  private
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stAllName : string;
    L_stOrgRelayCode : string;
    L_stWork : string;
    L_stMoveCode : string;
    L_stUseName : string;
    L_stNotUseName : string;
    L_nDoorCheckCount : integer;
    L_nPageListMaxCount : integer;
    NodeCodeList : TStringList;
    AntipassCodeList : TStringList;
    DoorGubunCodeList : TStringList;
    procedure FormNameSetting;
    procedure FontSetting;
    procedure SearchList(aCode:string;aTopRow:integer=0);
  private
    { Private declarations }
    procedure MoveDoorViewSeq(aTargetCode,aOrgCode:string);
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmDoorList: TfmDoorList;

implementation
uses
  uAntiGroupCode,
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uFormUtil,
  uMain,
  uPCClient,
  uServerClientVariable;
{$R *.dfm}

procedure TfmDoorList.AdvStrinGridSetAllCheck(Sender: TObject; bchkState: Boolean);
var
  i : integer;
begin
  for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmDoorList.btn_AntiGroupAddClick(Sender: TObject);
var
  nIndex : integer;
begin
  inherited;
  fmAntiGroupcode := TfmAntiGroupcode.Create(nil);
  fmAntiGroupcode.ShowModal;
  fmAntiGroupcode.Free;
  nIndex := cmb_AntipassGroup.ItemIndex;
  LoadAntipassGroupCode(AntipassCodeList,TcomboBox(cmb_AntipassGroup),True,'사용안함');
  if cmb_AntipassGroup.Items.Count > nIndex  then cmb_AntipassGroup.ItemIndex := nIndex;

end;

procedure TfmDoorList.btn_AntipassCancelClick(Sender: TObject);
begin
  inherited;
  pan_AntiGroup.Visible := False;
  sg_Door.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  btn_SelectDoorGubun.Enabled := True;
end;

procedure TfmDoorList.btn_AntipassClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if L_nDoorCheckCount < 1 then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_Antipass.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  pan_AntiGroup.Visible := True;
  sg_Door.Enabled := False;
  btn_SelectBuildingPosition.Enabled := False;
  btn_SelectDoorGubun.Enabled := False;
  LoadAntipassGroupCode(AntipassCodeList,TcomboBox(cmb_AntipassGroup),True,'사용안함');
end;

procedure TfmDoorList.btn_AntipassSaveClick(Sender: TObject);
var
  stMessage : string;
  stAntipassCode : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  if cmb_AntipassGroup.ItemIndex < 0 then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_AntipassSave.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  stAntipassCode := AntipassCodeList.Strings[cmb_AntipassGroup.ItemIndex];
  with sg_Door do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        dmDBUpdate.UpdateTB_DOOR_Field_IntValue(cells[9,i],cells[10,i],cells[11,i],cells[12,i],'AG_CODE',stAntipassCode);
        dmDBUpdate.UpdateTB_DOOR_Field_StringValue(Cells[9,i],Cells[10,i],Cells[11,i],Cells[12,i],'DO_MEMLOAD','N');
      end;
    end;
  end;

  pan_AntiGroup.Visible := False;
  sg_Door.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  btn_SelectDoorGubun.Enabled := True;
  SearchList('');
end;

procedure TfmDoorList.btn_BuildingCancelClick(Sender: TObject);
begin
  inherited;

  pan_Building.Visible := False;
  sg_Door.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  btn_SelectDoorGubun.Enabled := True;
end;

procedure TfmDoorList.btn_BuildingSelectClick(Sender: TObject);
var
  stMessage : string;
  stBuildingCode : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  if tv_buildingName.Selected = nil then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_BuildingSelect.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  stBuildingCode := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  with sg_Door do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        dmDBUpdate.UpdateTB_DOOR_Field_StringValue(Cells[9,i],Cells[10,i],Cells[11,i],Cells[12,i],'BC_BUILDINGCODE',stBuildingCode);
        dmDBUpdate.UpdateTB_DOOR_Field_StringValue(Cells[9,i],Cells[10,i],Cells[11,i],Cells[12,i],'DO_NAMECHANGE','1');
      end;
    end;
  end;

  pan_Building.Visible := False;
  sg_Door.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  btn_SelectDoorGubun.Enabled := True;
  SearchList('');
end;

procedure TfmDoorList.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_Workcode.Visible := False;
end;

procedure TfmDoorList.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmDoorList.btn_DoorGubunApplyClick(Sender: TObject);
var
  stMessage : string;
  stDoorGubunCode : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  if cmb_DoorGubun.ItemIndex < 0 then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_DoorGubunApply.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  stDoorGubunCode := DoorGubunCodeList.Strings[cmb_DoorGubun.ItemIndex];
  with sg_Door do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        dmDBUpdate.UpdateTB_DOOR_Field_StringValue(Cells[9,i],Cells[10,i],Cells[11,i],Cells[12,i],'DG_CODE',stDoorGubunCode);
      end;
    end;
  end;

  pan_DoorGubun.Visible := False;
  sg_Door.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  btn_SelectDoorGubun.Enabled := True;
  SearchList('');
end;

procedure TfmDoorList.btn_DoorGubunCancelClick(Sender: TObject);
begin
  inherited;

  pan_DoorGubun.Visible := False;
  sg_Door.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  btn_SelectDoorGubun.Enabled := True;

end;

procedure TfmDoorList.btn_ExcelClick(Sender: TObject);
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
      //sg_Report.SaveToXLS(stSaveFileName,True);
      if fileexists(stSaveFileName) then
        deletefile(stSaveFileName);
      Try
        sg_door.SaveToXLS(stSaveFileName);
      Except
        sg_door.SaveToCSV(stSaveFileName);
      End;
//      advgridexcelio1.XLSExport(stSaveFileName);
    end;
  end;
  btn_Excel.Enabled := True;
end;

procedure TfmDoorList.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmDoorList.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  stParentCode : string;
  stCode : string;
  stNodeNo,stEcuID,stExtendID,stDoorNo: string;
  stTime : string;
  stClientIP : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  if Trim(ed_Name.Text) = '' then
  begin
    stMessage := dmFormMessage.GetMessage('BLANKFIELD');
    stMessage := StringReplace(stMessage,'$WORK',lb_Name.Caption.Text,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  if L_stWork = 'SELECTCODEUPDATE' then
  begin
    stNodeNo := ed_SelectNode.text;
    stEcuID := ed_SelectEcuID.text;
    stExtendID := '0';
    stDoorNo := ed_SelectDoorNo.text;
    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_DOORNAME',ed_Name.Text);
    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_MEMO',mem_DoorMemo.Text);
    dmDBUpdate.UpdateTB_DOOR_Field_IntValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_VIEWSEQ',inttostr(se_ViewSeq.Value));
    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_NAMECHANGE','1');
    if L_stOrgRelayCode <> ed_RelayCode.Text then
    begin
      dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_RELAYID',ed_RelayCode.Text);
      dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_RELAYIDCHANGE','Y');
    end;

    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo, stEcuID, '', stDoorNo, con_ComLogTYPE_DOOR, L_stMenuID + '(' + Caption + '): Change');
    fmMain.FORMCHANGE(con_FormBMOSDOORCODE,'');
  end;
  SearchList(FillZeroStrNum(stNodeNo,G_nNodeCodeLength) + stEcuID + stDoorNo,sg_Door.TopRow);


  Pan_Workcode.Visible := False;
end;

procedure TfmDoorList.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmDoorList.btn_SelectBuildingPositionClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if L_nDoorCheckCount < 1 then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_SelectBuildingPosition.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  pan_Building.Visible := True;
  lb_Building.Caption := btn_SelectBuildingPosition.Caption;
  sg_Door.Enabled := False;
  btn_SelectBuildingPosition.Enabled := False;
  btn_SelectDoorGubun.Enabled := False;
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
end;

procedure TfmDoorList.btn_SelectDoorGubunClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if L_nDoorCheckCount < 1 then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_SelectBuildingPosition.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  pan_DoorGubun.Visible := True;
  lb_DoorGubun.Caption := btn_SelectDoorGubun.Caption;
  sg_Door.Enabled := False;
  btn_SelectBuildingPosition.Enabled := False;
  btn_SelectDoorGubun.Enabled := False;
  LoadDoorGubun(DoorGubunCodeList,TcomboBox(cmb_DoorGubun),False);
end;

procedure TfmDoorList.eb_SearchBuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_SearchbuildingName.Visible := Not tv_SearchbuildingName.Visible;
  tv_SearchbuildingName.Top := tv_SearchbuildingName.Top + eb_SearchBuildingName.Height;
  tv_SearchbuildingName.Left := eb_SearchBuildingName.Left;
end;

procedure TfmDoorList.ed_NameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl,True,True);
    Key := #0;
    //btn_SaveClick(self);
  end;
end;

procedure TfmDoorList.ed_SearchNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  SearchList('');
end;

procedure TfmDoorList.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
  *)
end;

procedure TfmDoorList.FormChangeEvent(aNumber: integer);
begin

end;

procedure TfmDoorList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  NodeCodeList.Free;
  DoorGubunCodeList.Free;
  AntipassCodeList.Free;
  fmMain.FORMENABLE(con_FormBMOSDOORCODE,'FALSE');

  Action := caFree;
end;

procedure TfmDoorList.FormCreate(Sender: TObject);
begin
  inherited;
  if G_nFormLanguageType = 1 then
  begin
    ed_name.ImeMode := imSHanguel; // imHanguel;
    ed_name.ImeName := '';
  end else if G_nFormLanguageType = 2 then
  begin
    ed_name.ImeMode := imAlpha;
    ed_name.ImeName := '';
  end;
  NodeCodeList := TStringList.Create;
  DoorGubunCodeList := TStringList.Create;
  AntipassCodeList := TStringList.Create;
  FontSetting;
  if ( G_nSystmRelayUse = 1 ) and (G_nSystmRelayCustomerNo = 2) then //증평인 경우 연동 코드를 입력 하자.
  begin
    lb_EtcCode.Visible := True;
    ed_RelayCode.Visible := True;
  end else
  begin
    lb_EtcCode.Visible := False;
    ed_RelayCode.Visible := False;
  end;
end;

procedure TfmDoorList.FormGradeRefresh;
begin
  if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
//  pm_DeleteCode.Enabled := IsDeleteGrade;
  pm_UpdateCode.Enabled := IsUpdateGrade;
end;

procedure TfmDoorList.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmDoorList.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_List.Caption := dmFormFunction.GetFormName('2','1','BM2_021');//dmFormFunction.GetFormName('0','2','COMMONLIST01');
  pm_UpdateCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_Name.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
  lb_EtcCode.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORRELAYCODE');
  lb_DoorMemo.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORMEMO');

  lb_ViewSeq.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONVIEWSEQ');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');
  with sg_Door do
  begin
    cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '1';
    cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '2';
    cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '3';
    cells[4,0] := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
    //cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
    cells[5,0] := dmFormFunction.GetFormName('0','2','COMMONDOORGUBUN');
    cells[6,0] := 'AntiPass';
    cells[7,0] := dmFormFunction.GetFormName('0','2','COMDOORSCHUSE');
    cells[8,0] := dmFormFunction.GetFormName('0','2','COMMONTIMEDOORUSE');
  end;
  btn_SelectBuildingPosition.Caption := dmFormFunction.GetFormName('2','2','BM2_021_01');
  btn_SelectDoorGubun.Caption := dmFormFunction.GetFormName('2','2','BM2_021_02');
  lb_DoorGubun1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORGUBUN');
  btn_DoorGubunApply.Caption := dmFormFunction.GetFormName('0','2','BUTTONAPPLY');
  btn_BuildingSelect.Caption := dmFormFunction.GetFormName('0','2','BUTTONAPPLY');
  btn_DoorGubunCancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  btn_BuildingCancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');

  mn_ScheduleUse.Caption := dmFormFunction.GetFormName('0','2','COMDOORSCHUSE');
  pm_SchedulNotUse.Caption := dmFormFunction.GetFormName('0','2','COMNOTUSE');
  pm_SchedulUse.Caption := dmFormFunction.GetFormName('0','2','COMUSE');
  L_stUseName := dmFormFunction.GetFormName('0','2','COMUSE');
  L_stNotUseName := dmFormFunction.GetFormName('0','2','COMNOTUSE');
  mn_TimecodeUse.Caption := dmFormFunction.GetFormName('0','2','COMMONTIMEDOORUSE');
  pm_TimeCodeNotUse.Caption := dmFormFunction.GetFormName('0','2','COMNOTUSE');
  pm_TimeCodeUse.Caption := dmFormFunction.GetFormName('0','2','COMUSE');
  mn_DeviceInfo.Caption := dmFormFunction.GetFormName('0','2','COMDEVICEINFO');
  pm_BuildingPast.Caption := dmFormFunction.GetFormName('0','2','COMPASTE');
end;

procedure TfmDoorList.FormResize(Sender: TObject);
begin
  inherited;

  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  Pan_Workcode.Left := (Width div 2) - (Pan_Workcode.Width div 2);
  Pan_Workcode.top := (Height div 2) - (Pan_Workcode.Height div 2);

  pan_AntiGroup.Left := (Width div 2) - (pan_AntiGroup.Width div 2);
  pan_AntiGroup.top := (Height div 2) - (pan_AntiGroup.Height div 2);

  pan_DoorGubun.Left := (Width div 2) - (pan_DoorGubun.Width div 2);
  pan_DoorGubun.top := (Height div 2) - (pan_DoorGubun.Height div 2);

  pan_Building.Left := (Width div 2) - (pan_Building.Width div 2);
  pan_Building.top := (Height div 2) - (pan_Building.Height div 2);


  if Windowstate = wsMaximized then
  begin
    //btn_minimize.Visible := True;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;


end;

procedure TfmDoorList.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSDOORCODE,'TRUE');

  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');

  LoadBuildingTreeView('',tv_SearchbuildingName,tv_SearchbuildingCode,con_LocalBuildingImageIndex);
  tv_SearchbuildingNameDblClick(Self);

end;

procedure TfmDoorList.Form_Close;
begin
  Close;
end;

procedure TfmDoorList.ListResize(Sender: TObject);
begin
  inherited;
  sg_Door.Left := 10;
  sg_Door.Top := btn_Antipass.Top + btn_Antipass.Height + 10;
  sg_Door.Width := List.Width - sg_Door.Left - 10;
  sg_Door.Height := List.Height - sg_Door.Top - 10;

//  if( sg_Door.Width > (sg_Door.ColWidths[0] + sg_Door.ColWidths[1] + sg_Door.ColWidths[2] + sg_Door.ColWidths[3] + sg_Door.ColWidths[4] + sg_Door.ColWidths[5] + 30)) then
    sg_Door.ColWidths[8] := sg_Door.Width - sg_Door.ColWidths[0] - sg_Door.ColWidths[1]- sg_Door.ColWidths[2]- sg_Door.ColWidths[3] - sg_Door.ColWidths[4]- sg_Door.ColWidths[5] - sg_Door.ColWidths[6]- sg_Door.ColWidths[7];

end;

procedure TfmDoorList.MoveDoorViewSeq(aTargetCode, aOrgCode: string);
var
  stTargetNodeNo : string;
  stTargetEcuID : string;
  stTargetExtendID : string;
  stTargetDoorNo : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDoorNo : string;
  stBuildingCode : string;
  stViewSeq : string;
begin
  stTargetNodeNo := copy(aTargetCode,2,G_nNodeCodeLength);
  stTargetEcuID := copy(aTargetCode,2 + G_nNodeCodeLength,2);
  stTargetExtendID := copy(aTargetCode,2 + G_nNodeCodeLength + 2,2);
  stTargetExtendID := inttostr(strtoint(stTargetExtendID));
  stTargetDoorNo := copy(aTargetCode,2 + G_nNodeCodeLength + 2 + 2,1);

  stBuildingCode := dmDBFunction.GetTB_Door_BuildingCode(stTargetNodeNo,stTargetEcuID,stTargetDoorNo);

  stNodeNo := sg_Door.Cells[9,sg_Door.Row];
  stEcuID := sg_Door.Cells[10,sg_Door.Row];
  stExtendID := sg_Door.Cells[11,sg_Door.Row];
  stDoorNo := sg_Door.Cells[12,sg_Door.Row];
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'BC_BUILDINGCODE',stBuildingCode); //빌딩코드 변경처리
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_NAMECHANGE','1');

  stViewSeq := dmDBFunction.GetTB_Door_ViewSeq(stTargetNodeNo,stTargetEcuID,stTargetDoorNo);
  dmDBUpdate.UpdateTB_DOOR_ViewSeqInc(stViewSeq);   //현재 조회순서에서 증가 시킴
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_VIEWSEQ',stViewSeq); //출입문변경처리
end;

procedure TfmDoorList.pm_DeleteCodeClick(Sender: TObject);
var
  stMessage : string;
  stCode : string;
  stSql : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDoorNo : string;
  stTime : string;
  stClientIP : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  stNodeNo := copy(stCode,2,G_nNodeCodeLength);
  stEcuID := copy(stCode,2 + G_nNodeCodeLength,2);
  stExtendID := copy(stCode,2 + G_nNodeCodeLength + 2,2);
  stDoorNo := copy(stCode,2 + G_nNodeCodeLength + 2 + 2,1);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_DOORUSE','0');
  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo, stEcuID, '', stDoorNo, con_ComLogTYPE_DOOR, L_stMenuID + '(' + Caption + '): Delete');
  SearchList(stCode);
end;

procedure TfmDoorList.pm_SchedulNotUseClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  stCode : string;
  stMessage : string;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

    stNodeNo := sg_Door.Cells[9,sg_Door.Row];
    stEcuID := sg_Door.Cells[10,sg_Door.Row];
    stExtendID := sg_Door.Cells[11,sg_Door.Row];
    stDoorNo := sg_Door.Cells[12,sg_Door.Row];

    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_SCHEDULEUSE',inttostr(TMenuItem(Sender).Tag));
    dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_DOORSCHUSE','N');
    dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_SETTINGINFO','N');   //이건 굳이 처리 할 필요 없다.  'N'으로 변경시 컨트롤러에서 출입문 정보를 수신하여 전송
    //stDoorNo := FillZeroNumber(strtoint(stDoorNo),2);
    //stSendData := stDoorNo + inttostr(TMenuItem(Sender).Tag);
    //dmPCClient.SendPacket('C',SCDOOR,'S',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,'스케줄' + TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
  SearchList(FillZeroStrNum(stNodeNo,G_nNodeCodeLength) + stEcuID + stDoorNo,sg_Door.TopRow);

end;

procedure TfmDoorList.pm_TimeCodeNotUseClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  stCode : string;
  stMessage : string;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

    stNodeNo := sg_Door.Cells[9,sg_Door.Row];
    stEcuID := sg_Door.Cells[10,sg_Door.Row];
    stExtendID := sg_Door.Cells[11,sg_Door.Row];
    stDoorNo := sg_Door.Cells[12,sg_Door.Row];
    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_TIMECODEUSE',inttostr(TMenuItem(Sender).Tag));
    dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(stNodeNo,stEcuID,'0','DE_TIMECODEUSE','U');
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,'타임코드' + TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
  SearchList(FillZeroStrNum(stNodeNo,G_nNodeCodeLength) + stEcuID + stDoorNo,sg_Door.TopRow);
end;

procedure TfmDoorList.pm_UpdateCodeClick(Sender: TObject);
var
  stMessage : string;
  stTemp : string;
  stNodeNo : string;
  stExtendID : string;
  stEcuID : string;
  stDoorNo : string;
begin
  inherited;
  //ed_SelectCode.Text := sg_door.Cells
  //if copy(ed_SelectCode.Text,1,1) <> 'D' then Exit;
  //stTemp := ed_SelectCode.Text;
  //Delete(stTemp,1,1);
  stNodeNo := sg_Door.Cells[9,sg_Door.Row];
  stEcuID := sg_Door.Cells[10,sg_Door.Row];
  stExtendID := sg_Door.Cells[11,sg_Door.Row];
  stDoorNo := sg_Door.Cells[12,sg_Door.Row];
  se_ViewSeq.Value := strtoint(sg_Door.Cells[14,sg_Door.Row]);
  ed_SelectNode.Text := stNodeNo;
  ed_SelectEcuID.Text := stEcuID;
  ed_SelectDoorNo.Text := stDoorNo;

  Pan_Workcode.Visible := True;
  lb_WorkType.Caption := pm_UpdateCode.Caption;
  ed_Name.Text := sg_Door.Cells[4,sg_Door.Row];
  mem_DoorMemo.Text := dmDBFunction.GetTB_Door_DoorMemo(stNodeNo,stEcuID,stDoorNo);
  ed_RelayCode.Text := dmDBFunction.GetTB_Door_RelayNo(stNodeNo,stEcuID,stDoorNo);
  L_stOrgRelayCode := ed_RelayCode.Text;
  L_stWork := 'SELECTCODEUPDATE';
  ed_Name.SetFocus;
end;


procedure TfmDoorList.SearchList(aCode: string;aTopRow:integer=0);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stBuildingCode : string;
begin
  GridInit(sg_Door,9,2,true);
  L_nDoorCheckCount := 0;
  btn_Excel.Enabled := False;
  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');

  stSql := ' Select a.*,c.BC_BUILDINGNAME as BUILDINGNAME1,d.BC_BUILDINGNAME as BUILDINGNAME2,e.BC_BUILDINGNAME as BUILDINGNAME3,f.DG_NAME,g.AG_NAME from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';   //컨트롤러 사용중인거에서
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND b.DE_EXTENDID = 0 ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE ';
  stSql := stSql + ' AND c.BC_DEEPSEQ = 1 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE ';
  stSql := stSql + ' AND d.BC_DEEPSEQ = 2 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE e ';
  stSql := stSql + ' ON(a.GROUP_CODE = e.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE ';
  stSql := stSql + ' AND e.BC_DEEPSEQ = 3 ) ';
  stSql := stSql + ' Left Join TB_DOORGUBUN f ';
  stSql := stSql + ' ON(a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.DG_CODE = f.DG_CODE ) ';
  stSql := stSql + ' Left Join TB_ANTIGROUPCODE g ';
  stSql := stSql + ' ON(a.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND a.AG_CODE = g.AG_CODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
  if ed_SearchName.Text <> '' then stSql := stSql + ' and a.DO_DOORNAME Like ''' + ed_SearchName.Text + '%'' ';
  if ed_BuildingCode.Text <> '' then stSql := stSql + ' and a.BC_BUILDINGCODE Like ''' + ed_BuildingCode.Text + '%'' ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ ';
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
      btn_Excel.Enabled := True;
      if Not FileExists(G_stExeFolder + '\Excel-a.png') then
      begin
        ExcelEnImage.Picture.SaveToFile(G_stExeFolder + '\Excel-a.png');
      end;
      btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-a.png');

      with sg_Door do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('BUILDINGNAME1').AsString;
          cells[2,nRow] := FindField('BUILDINGNAME2').AsString;
          cells[3,nRow] := FindField('BUILDINGNAME3').AsString;
          cells[4,nRow] := FindField('DO_DOORNAME').AsString;
          cells[5,nRow] := FindField('DG_NAME').AsString;
          cells[6,nRow] := FindField('AG_NAME').AsString;
          if FindField('DO_SCHEDULEUSE').AsString = '1' then  cells[7,nRow] := L_stUseName
          else cells[7,nRow] := L_stNotUseName;
          if FindField('DO_TIMECODEUSE').AsString = '1' then  cells[8,nRow] := L_stUseName
          else cells[8,nRow] := L_stNotUseName;

          cells[9,nRow] := FindField('ND_NODENO').AsString;
          cells[10,nRow] := FindField('DE_ECUID').AsString;
          cells[11,nRow] := FindField('DE_EXTENDID').AsString;
          cells[12,nRow] := FindField('DO_DOORNO').AsString;
          cells[13,nRow] := FindField('AG_CODE').AsString;
          cells[14,nRow] := FindField('DO_VIEWSEQ').AsString;
          cells[15,nRow] := FindField('DO_MEMO').AsString;
          cells[16,nRow] := FindField('DO_RELAYID').AsString;

          if (FillZeroStrNum(FindField('ND_NODENO').AsString,G_nNodeCodeLength)+FindField('DE_ECUID').AsString+FindField('DO_DOORNO').AsString = aCode) then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
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

end;

procedure TfmDoorList.sg_DoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
  State: Boolean);
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

procedure TfmDoorList.sg_DoorDblClick(Sender: TObject);
begin
  inherited;
  pm_UpdateCodeClick(pm_UpdateCode);
end;

procedure TfmDoorList.sg_DoorResize(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := sg_Door.Height div sg_Door.DefaultRowHeight;
end;

procedure TfmDoorList.tv_SearchbuildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_SearchbuildingName.Selected = nil then tv_SearchbuildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_SearchbuildingCode.Items.Item[tv_SearchbuildingName.Selected.AbsoluteIndex].Text;
  eb_SearchBuildingName.Text := tv_SearchbuildingName.Selected.Text;
  tv_SearchbuildingName.Visible := False;

  SearchList('');

end;

procedure TfmDoorList.tv_ListClick(Sender: TObject);
var
  stCode : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDoorNo : string;
  stScheduleUse : string;
  stTimeCodeUse : string;
  stNodeName : string;
begin
  inherited;
(*  if tv_List.Selected = nil then Exit;

  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;

  if copy(stCode,1,1) = 'D' then
  begin
    popupmenu := pm_Work;
    stNodeNo := copy(stCode,2,G_nNodeCodeLength);
    stEcuID := copy(stCode,2 + G_nNodeCodeLength,2);
    stExtendID := copy(stCode,2 + G_nNodeCodeLength + 2,2);
    stDoorNo := copy(stCode,2 + G_nNodeCodeLength + 2 + 2,1);
    stScheduleUse := dmDBFunction.GetTB_DOOR_ScheduleUse(stNodeNo,stEcuID,stDoorNo);
    if stScheduleUse = '0'  then
    begin
      pm_SchedulNotUse.Checked := True;
      pm_SchedulUse.Checked := False;
    end else if stScheduleUse = '1' then
    begin
      pm_SchedulNotUse.Checked := False;
      pm_SchedulUse.Checked := True;
    end else
    begin
      pm_SchedulNotUse.Checked := False;
      pm_SchedulUse.Checked := False;
    end;
    stTimeCodeUse := dmDBFunction.GetTB_DOOR_TimeCodeUse(stNodeNo,stEcuID,stDoorNo);
    if stTimeCodeUse = '0'  then
    begin
      pm_TimeCodeNotUse.Checked := True;
      pm_TimeCodeUse.Checked := False;
    end else if stTimeCodeUse = '1' then
    begin
      pm_TimeCodeNotUse.Checked := False;
      pm_TimeCodeUse.Checked := True;
    end else
    begin
      pm_TimeCodeNotUse.Checked := False;
      pm_TimeCodeUse.Checked := False;
    end;

    stNodeName := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);
    mn_DeviceInfo.Caption := stNodeName + ':' + stEcuID + '-' + stDoorNo;
  end else
  begin
    if L_stMoveCode = '' then popupmenu := nil
    else popupmenu := pm_Building;
  end;
  *)
end;

procedure TfmDoorList.tv_ListDblClick(Sender: TObject);
begin
  inherited;
  pm_UpdateCodeClick(self);
end;

initialization
  RegisterClass(TfmDoorList);
Finalization
  UnRegisterClass(TfmDoorList);

end.