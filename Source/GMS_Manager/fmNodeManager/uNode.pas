unit uNode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uSubForm, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, CommandArray, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, AdvSmoothLabel, AdvSmoothPanel, W7Classes,
  W7Panels, AdvGlassButton,ADODB,ActiveX, frmshape, Vcl.Mask, AdvSpin,
  DBAdvSmoothLabel, AdvSmoothProgressBar, Vcl.ExtCtrls, AdvCombo, AdvGlowButton,
  AdvOfficePager, Vcl.Imaging.pngimage, Vcl.Menus, AdvOfficePagerStylers,
  AdvAppStyler;

type
  TfmNode = class(TfmASubForm)
    BodyPanel: TAdvSmoothPanel;
    lb_SearchName: TAdvSmoothLabel;
    ed_SearchName: TAdvEdit;
    sg_List: TAdvStringGrid;
    btn_Search: TAdvGlassButton;
    Add: TAdvSmoothPanel;
    lb_AddNodeIP: TAdvSmoothLabel;
    ed_NodeIp: TAdvEdit;
    lb_AddNodeName: TAdvSmoothLabel;
    ed_NodeName: TAdvEdit;
    ed_NodeNo: TAdvEdit;
    TimerProgress: TTimer;
    se_EcuCount: TAdvSpinEdit;
    lb_AddEcuCount: TAdvSmoothLabel;
    pan_FireGroup: TAdvSmoothPanel;
    cmb_FireGroup: TAdvComboBox;
    AdvSmoothLabel1: TAdvSmoothLabel;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_List: TLabel;
    btn_Add: TAdvGlowButton;
    btn_Update: TAdvGlowButton;
    btn_Delete: TAdvGlowButton;
    btn_FireGroup: TAdvGlowButton;
    pm_Work: TPopupMenu;
    pm_CodeAdd: TMenuItem;
    pm_UpdateCode: TMenuItem;
    pm_DeleteCode: TMenuItem;
    lb_WorkType: TLabel;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    pan_Progress: TPanel;
    Lb_SaveMessage: TDBAdvSmoothLabel;
    AdvSmoothProgressBar1: TAdvSmoothProgressBar;
    btn_FireGroupSelect: TAdvGlowButton;
    btn_FireGroupCancel: TAdvGlowButton;
    btn_FireGroupAdd: TAdvGlowButton;
    AdvSmoothLabel2: TAdvSmoothLabel;
    cmb_DeviceType: TAdvComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_AddClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg_ListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_ListDblClick(Sender: TObject);
    procedure ed_SearchNameChange(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure CommandArrayCommandsTGRADEREFRESHExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTMENUIDExecute(Command: TCommand;
      Params: TStringList);
    procedure ed_NodeIpChange(Sender: TObject);
    procedure ed_NodeIpKeyPress(Sender: TObject; var Key: Char);
    procedure TimerProgressTimer(Sender: TObject);
    procedure CommandArrayCommandsTFORMNAMEExecute(Command: TCommand;
      Params: TStringList);
    procedure btn_FireGroupClick(Sender: TObject);
    procedure btn_FireGroupCancelClick(Sender: TObject);
    procedure btn_FireGroupAddClick(Sender: TObject);
    procedure btn_FireGroupSelectClick(Sender: TObject);
    procedure pm_CodeAddClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure pm_UpdateCodeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
  private
    L_nPageListMaxCount : integer;
    L_nCheckCount : integer;
    L_nProgress : integer;
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stButtonPreCaption : string;
    L_stNodeAddCaption : string;
    L_stNodeUpdateCaption : string;
    L_stWork : string;
    L_bNodeChange : Boolean;
    FireGroupCodeList : TStringList;
    NodeDeviceTypeCodeList : TStringList;
    { Private declarations }
    Function FormNameSetting:Boolean;
    Function SearchList(aCurrentCode:string;aTopRow:integer = 0):Boolean;
    Function AddNodeWork : Boolean;
    Function UpdateNodeWork : Boolean;
  private
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);

  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
  end;

var
  fmNode: TfmNode;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBDelete,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uDBSelect,
  uDBVariable,
  uFormFunction,
  uFormVariable,
  uComboBoxCodeLoad,
  uFireGroup;
{$R *.dfm}

function TfmNode.AddNodeWork: Boolean;
var
  stNodeNo : string;
  stEcuID : string;
  stMessage : string;
  i,j,k : integer;
  stDate : string;
  stDeviceID : string;
begin
  inherited;
  stNodeNo := dmDBFunction.GetNextNodeNo;
  stDeviceID := FillZeroNumber(0,G_nIDLength);
  if cmb_DeviceType.ItemIndex < 0 then cmb_DeviceType.ItemIndex := 0;

  if dmDBFunction.CheckTB_NODE_NodeIP(ed_NodeIp.Text,stNodeNo) = 1 then
  begin
    stMessage := dmFormMessage.GetMessage('DBDATADUP');
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  if Not dmDBInsert.InsertIntoTB_NODE_NodeIp(stNodeNo,'1',stDeviceID,ed_NodeIp.Text,ed_NodeName.Text,inttostr(cmb_DeviceType.ItemIndex)) then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('DBSAVEERROR'),'$WORK',btn_Save.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;
  dmDBInsert.InsertIntoTB_NODERCV_NodeIp(stNodeNo);

  for i := 0 to G_nDefaultECUCount do
  begin
    stEcuID := FillZeroNumber(i,2);
    for j := 1 to G_nDefaultDoorCount do
    begin
      dmDBInsert.InsertIntoTB_DOOR_DeviceDoorInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text + '_' + stEcuID + '_' + inttostr(j) );
      dmDBInsert.InsertIntoTB_DOORRCV_DeviceDoorInit(stNodeNo,stEcuID,inttostr(j));

      Application.ProcessMessages;
    end;
    for j := 0 to G_nDefaultArmAreaCount do
    begin
      dmDBInsert.InsertIntoTB_ARMAREA_DeviceArmAreaInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text + '_' + stEcuID + '_' + inttostr(j) );
      Application.ProcessMessages;
    end;
    for j := 0 to G_nDefaultExtentionCount do
    begin
      for k := 1 to G_nDefaultZoneCount do
      begin
        dmDBInsert.InsertIntoTB_ZONE_ZoneInit(stNodeNo,stEcuID,inttostr(j),inttostr(k),ed_NodeName.Text + '_' + stEcuID + '_' + inttostr(j)+ '_' + inttostr(k));
        dmDBInsert.InsertIntoTB_ZONERCV_ZoneInit(stNodeNo,stEcuID,inttostr(j),inttostr(k));
        Application.ProcessMessages;
      end;
      if j = 0 then
        dmDBInsert.InsertIntoTB_ZONEEXTENTION_ZoneInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text + '_' + stEcuID + '_' + inttostr(j),'1')
      else dmDBInsert.InsertIntoTB_ZONEEXTENTION_ZoneInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text + '_' + stEcuID + '_' + inttostr(j),'0');
    end;
    for j := 1 to G_nDefaultReaderCount do
    begin
      dmDBInsert.InsertIntoTB_READER_ReaderInit(stNodeNo,stEcuID,inttostr(j));
      dmDBInsert.InsertIntoTB_READERRCV_ReaderInit(stNodeNo,stEcuID,inttostr(j));
      Application.ProcessMessages;
    end;

    for j := 0 to G_nDefaultExtentionCount do
    begin
      dmDBInsert.InsertIntoTB_DEVICE_DeviceInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text + '_' + stEcuID + '_' + inttostr(j));
      dmDBInsert.InsertIntoTB_DEVICERCV_DeviceInit(stNodeNo,stEcuID,inttostr(j));
      Application.ProcessMessages;
    end;

    dmDBFunction.copyHoliDayToDevice(stNodeNo,stEcuID);
  end;
  dmDBUpdate.UpdateTB_DEVICE_DeviceUse(stNodeNo,'00','0','1'); //메인은 무조건 사용으로 하자.
  if se_EcuCount.Value > 1 then
  begin
    for i := 1 to se_EcuCount.Value do
    begin
      stEcuID := FillZeroNumber(i,2);
      dmDBUpdate.UpdateTB_DEVICE_DeviceUse(stNodeNo,stEcuID,'0','1'); //해당 컨트롤러 Count를 사용으로 처리 하자.
      dmDBDelete.DeleteTB_CARDPERMITEMPLOYEECODE_ECUAll(stNodeNo,stEcuID);
      for j := 1 to G_nDefaultDoorCount do //전체 출입문 권한 부여
      begin
        if G_nCardDefaultDoorPermitType = 1 then //전체 권한을 가지고 시작 하는 타입이면
        begin
          dmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE('0',stNodeNo,stEcuID,'0','1',inttostr(j),'1','0','Y');
          dmDBFunction.CopyDeviceToCardPermitEmployeeCode(stNodeNo,stEcuID,'0','1',inttostr(j),'1','N');
          dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE('0',stNodeNo,stEcuID,'0','1',inttostr(j),'1','0','Y');
        end else
        begin
         if G_nProgramGrade <> 0 then
         begin
            dmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE('0',stNodeNo,stEcuID,'0','1',inttostr(j),'0','0','Y');
            dmDBFunction.CopyDeviceToCardPermitEmployeeCode(stNodeNo,stEcuID,'0','1',inttostr(j),'0','Y');
            dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE('0',stNodeNo,stEcuID,'0','1',inttostr(j),'0','0','Y');
         end;
        end;
        Application.ProcessMessages;
      end;
      for j := 0 to G_nDefaultArmAreaCount do //전체 방범구역 권한 부여
      begin
        if G_nCardDefaultArmPermitType =  1 then
        begin
          dmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE('0',stNodeNo,stEcuID,'0','2',inttostr(j),'1','0','Y');
          dmDBFunction.CopyDeviceToCardPermitEmployeeCode(stNodeNo,stEcuID,'0','2',inttostr(j),'1','N');
          dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE('0',stNodeNo,stEcuID,'0','2',inttostr(j),'1','0','Y');
        end else
        begin
         if G_nProgramGrade <> 0 then
         begin
            dmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE('0',stNodeNo,stEcuID,'0','2',inttostr(j),'0','0','Y');
            dmDBFunction.CopyDeviceToCardPermitEmployeeCode(stNodeNo,stEcuID,'0','2',inttostr(j),'0','Y');
            dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE('0',stNodeNo,stEcuID,'0','2',inttostr(j),'0','0','Y');
         end;
        end;
        Application.ProcessMessages;
      end;
      if (G_nProgramGrade <> 0) or (G_nCardDefaultDoorPermitType = 1) or (G_nCardDefaultArmPermitType = 1) then
      begin
        dmDBDelete.DeleteTB_CARDPERMIT_NodeAll(stNodeNo);
        dmDBInsert.InsertIntoTB_CARDPERMIT_DeviceAddCardNo(stNodeNo,stEcuID,G_nCardDefaultDoorPermitType,G_nCardDefaultArmPermitType);
      end;

      //타임코드 -> 타임코드기기테이블 복사
      dmDBInsert.InsertIntoTB_TIMECODEDEVICE_TimeCodeToDevice(stNodeNo,stEcuID,'0');
    end;
    dmDBUpdate.UpdateTB_NODERCV_Field_StringValue(stNodeNo,'ND_ECUUSE','U');
  end;

  dmDBDelete.DeleteTB_CARDPERMITEMPLOYEECODE_ECUAll(stNodeNo,'00');
  for i := 1 to G_nDefaultDoorCount do //전체 출입문 권한 부여
  begin
    if G_nCardDefaultDoorPermitType = 1 then //전체 권한을 가지고 시작 하는 타입이면
    begin
      dmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE('0',stNodeNo,'00','0','1',inttostr(i),'1','0','Y');
      dmDBFunction.CopyDeviceToCardPermitEmployeeCode(stNodeNo,'00','0','1',inttostr(i),'1','N');
      dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE('0',stNodeNo,'00','0','1',inttostr(i),'1','0','Y');
    end else
    begin
      if G_nProgramGrade <> 0 then
      begin
        dmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE('0',stNodeNo,'00','0','1',inttostr(i),'0','0','Y');
        dmDBFunction.CopyDeviceToCardPermitEmployeeCode(stNodeNo,'00','0','1',inttostr(i),'0','Y');
        dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE('0',stNodeNo,'00','0','1',inttostr(i),'0','0','Y');
      end;
    end;
    Application.ProcessMessages;
  end;
  for i := 0 to G_nDefaultArmAreaCount do //전체 방범구역 권한 부여
  begin
    if G_nCardDefaultArmPermitType =  1 then
    begin
      dmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE('0',stNodeNo,'00','0','2',inttostr(i),'1','0','Y');
      dmDBFunction.CopyDeviceToCardPermitEmployeeCode(stNodeNo,'00','0','2',inttostr(i),'1','N');
      dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE('0',stNodeNo,'00','0','2',inttostr(i),'1','0','Y');
    end else
    begin
      if G_nProgramGrade <> 0 then
      begin
        dmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE('0',stNodeNo,'00','0','2',inttostr(i),'0','0','Y');
        dmDBFunction.CopyDeviceToCardPermitEmployeeCode(stNodeNo,'00','0','2',inttostr(i),'0','Y');
        dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE('0',stNodeNo,'00','0','2',inttostr(i),'0','0','Y');
      end;
    end;
    Application.ProcessMessages;
  end;
  //타임코드 -> 타임코드기기테이블 복사
  dmDBInsert.InsertIntoTB_TIMECODEDEVICE_TimeCodeToDevice(stNodeNo,'00','0');

  stDate := FormatDateTime('yyyymmddhhnnss',now);
  dmDBInsert.InsertIntoTB_ADMINWORKLOG_All(copy(stDate,1,8), copy(stDate,9,6), GetLocalIPAddr, G_stAdminUserID,L_stMenuID, '1', stNodeNo, '00', '0', '0', '','Node Add');
end;

procedure TfmNode.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmNode.btn_AddClick(Sender: TObject);
begin
  inherited;
  pm_CodeAddClick(pm_CodeAdd);
end;

procedure TfmNode.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Add.Visible := False;
end;

procedure TfmNode.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmNode.btn_DeleteClick(Sender: TObject);
var
  i : integer;
  bChkState : Boolean;
  stMessage : string;
  stClientIP : string;
  stTime : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  stMessage := stringReplace(dmFormMessage.GetMessage('SELECTERROR'),'$WORK',btn_Delete.Caption,[rfReplaceAll]);
  if L_nCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  stMessage := stringReplace(dmFormMessage.GetMessage('WORKCOUNTINFO'),'$WORK',btn_Delete.Caption,[rfReplaceAll]);
  stMessage := stringReplace(stMessage,'$COUNT',inttostr(L_nCheckCount),[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  stMessage := stringReplace(dmFormMessage.GetMessage('NODEDELETEMESSAGE'),'$WORK',btn_Delete.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  With sg_List do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bChkState);
      if bChkState then
      begin
        dmDBDelete.DeleteTB_ARMAREA_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_CARDPERMIT_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_CARDPERMITCOMPANYGROUP_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_CARDPERMITEMPLOYEECODE_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_CARDPERMITEMPLOYEEGROUP_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_DEVICE_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_DEVICERCV_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_DOOR_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_DOORRCV_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_HOLIDAYDEVICE_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_NODE_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_NODERCV_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_READER_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_READERRCV_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_TIMECODEDEVICE_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_ZONE_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_ZONERCV_NodeAll(cells[4,i]);
        dmDBDelete.DeleteTB_ZONEEXTENTION_NodeAll(cells[4,i]);
        Application.ProcessMessages;
      end;
    end;
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,'SERVER','0','00','','0',con_ComLogTYPE_PROGRAM,cells[1,Row] + ' : NODE DELETE');
  end;
  SearchList('');
end;

procedure TfmNode.btn_FireGroupAddClick(Sender: TObject);
var
  nIndex : integer;
begin
  inherited;
  fmFireGroup := TfmFireGroup.Create(nil);
  fmFireGroup.ShowModal;
  fmFireGroup.Free;
  nIndex := cmb_FireGroup.ItemIndex;
  LoadFireGroupCode(FireGroupCodeList,TComboBox(cmb_FireGroup),True,'사용안함');
  if cmb_FireGroup.Items.Count > nIndex  then cmb_FireGroup.ItemIndex := nIndex;

end;

procedure TfmNode.btn_FireGroupCancelClick(Sender: TObject);
begin
  inherited;
  sg_List.Enabled := True;
  pan_FireGroup.Visible := False;

end;

procedure TfmNode.btn_FireGroupClick(Sender: TObject);
var
  i : integer;
  bChkState : Boolean;
  stMessage : string;
begin
  inherited;
  stMessage := stringReplace(dmFormMessage.GetMessage('SELECTERROR'),'$WORK',btn_FireGroup.Caption,[rfReplaceAll]);
  if L_nCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  sg_List.Enabled := True;
  pan_FireGroup.Visible := True;
  LoadFireGroupCode(FireGroupCodeList,TComboBox(cmb_FireGroup),True,'사용안함');
  if cmb_FireGroup.Items.Count > 1 then cmb_FireGroup.ItemIndex := 1;

end;

procedure TfmNode.btn_FireGroupSelectClick(Sender: TObject);
var
  i : integer;
  bChkState : Boolean;
  stFireGroupCode : string;
begin
  inherited;
  stFireGroupCode := '';
  if cmb_FireGroup.ItemIndex > -1 then
    stFireGroupCode := FireGroupCodeList.Strings[cmb_FireGroup.ItemIndex];

  With sg_List do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bChkState);
      if bChkState then
      begin
        dmDBUpdate.UpdateTB_NODE_Field_StringValue(cells[4,i],'FG_GROUPCODE',stFireGroupCode);
      end;
    end;
  end;
  L_bNodeChange := True;
  sg_List.Enabled := True;
  pan_FireGroup.Visible := False;
  SearchList('');
end;

procedure TfmNode.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmNode.btn_SaveClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stMessage : string;
  i,j,k : integer;
begin
  inherited;
  btn_Add.Enabled := False;
  btn_Save.Enabled := False;
  pan_Progress.Visible := True;
  if Not IsIPTypeCheck(ed_NodeIp.Text) then
  begin
    stMessage := dmFormMessage.GetMessage('DATATYPEFAIL');
    showmessage(stMessage);
    Exit;
  end;

  L_nProgress := 0;
  TimerProgress.Enabled := True;
  Lb_SaveMessage.Caption.Text := dmFormMessage.GetMessage('SAVINGMESSAGE');
  if L_stWork = 'ADD' then AddNodeWork
  else if L_stWork = 'UPDATE' then UpdateNodeWork;
  TimerProgress.Enabled := False;

  L_bNodeChange := True;

  btn_Save.Enabled := True;
  btn_Add.Enabled := True;
  pan_Progress.Visible := False;
  Add.Visible := False;
  SearchList(stNodeNo,sg_List.TopRow);
end;

procedure TfmNode.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmNode.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  sg_ListDblClick(sg_List);
end;

procedure TfmNode.CommandArrayCommandsTFORMNAMEExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  Caption := Params.Values['CAPTION'];

end;

procedure TfmNode.CommandArrayCommandsTGRADEREFRESHExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
(*  btn_Add.Enabled := IsInsertGrade;
  pm_CodeAdd.Enabled := IsInsertGrade;
  btn_Delete.Enabled := IsDeleteGrade;
  pm_DeleteCode.Enabled := IsDeleteGrade;
  btn_Update.Enabled
*)
end;

procedure TfmNode.CommandArrayCommandsTMENUIDExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  L_stMenuID := Params.Values['ID'];
end;

procedure TfmNode.ed_NodeIpChange(Sender: TObject);
begin
  inherited;
  if L_stWork = 'ADD' then ed_NodeName.Text := ed_NodeIp.Text;

end;

procedure TfmNode.ed_NodeIpKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Char(VK_RETURN) then
      Perform(WM_NEXTDLGCTL,0,0);

end;

procedure TfmNode.ed_SearchNameChange(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmNode.FormChangeEvent(aFormName: integer);
begin
//  case aFormName of
//  end;
end;

procedure TfmNode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if L_bNodeChange then
  begin
    self.FindSubForm('Main').FindCommand('CHANGE').Params.Values['NAME'] := inttostr(conFORMNODEADMIN);
    self.FindSubForm('Main').FindCommand('CHANGE').Execute;
  end;
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(conFORMNODEADMIN);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;

  NodeDeviceTypeCodeList.Free;
  FireGroupCodeList.Free;
  Action := caFree;
end;

procedure TfmNode.FormCreate(Sender: TObject);
begin
  inherited;
  FireGroupCodeList := TStringList.Create;
  NodeDeviceTypeCodeList := TStringList.Create;

  L_nPageListMaxCount := 17;
  pan_Progress.Left := 10;
end;

function TfmNode.FormNameSetting: Boolean;
begin

  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
//  lb_List.Caption := dmFormFunction.GetFormName('2','1','BM2_011');//dmFormFunction.GetFormName('0','2','COMMONLIST01');
  pm_CodeAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  btn_Add.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  pm_DeleteCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  btn_Delete.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  pm_UpdateCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Update.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_SearchName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  lb_AddNodeName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  sg_List.Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  lb_AddEcuCount.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDEVICECOUNT');
  lb_AddNodeIP.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONNODEIP01');
  sg_List.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONNODEIP01');
  L_stNodeAddCaption := dmFormFunction.GetFormName('0','2','COMMONNODELIST02');
  L_stNodeUpdateCaption := dmFormFunction.GetFormName('0','2','COMMONNODELIST03');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stButtonPreCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU004');
  btn_Search.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');

end;

procedure TfmNode.FormResize(Sender: TObject);
begin
  inherited;
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

  sg_List.Left := 10;
  sg_List.Width := BodyPanel.Width - (sg_List.Left * 2);
  sg_List.Height := BodyPanel.Height - (sg_List.Top + 10);
  sg_List.ColWidths[3] := sg_List.Width - (sg_List.ColWidths[0] + sg_List.ColWidths[1] + sg_List.ColWidths[2]);
  btn_FireGroup.Left := sg_List.Left + sg_List.Width - btn_FireGroup.Width;

  Add.Left := (BodyPanel.Width div 2) - (Add.Width div 2);
  Add.Top := (BodyPanel.Height div 2) - (Add.Height div 2);

  pan_FireGroup.Left := (BodyPanel.Width div 2) - (pan_FireGroup.Width div 2);
  pan_FireGroup.Top := (BodyPanel.Height div 2) - (pan_FireGroup.Height div 2);

end;

procedure TfmNode.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(conFORMNODEADMIN);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;

  LoadNodeDeviceType(NodeDeviceTypeCodeList,TComboBox(cmb_DeviceType),False,'');
  SearchList('');
end;

procedure TfmNode.pm_CodeAddClick(Sender: TObject);
begin
  inherited;
  lb_WorkType.Caption := L_stNodeAddCaption;
  Add.Visible := True;
  L_stWork := 'ADD';
  ed_NodeIp.Text := '';
  ed_NodeName.Text := '';
  ed_NodeNo.Text := '';
  cmb_DeviceType.ItemIndex := 0;
end;

procedure TfmNode.pm_UpdateCodeClick(Sender: TObject);
begin
  inherited;
  sg_ListDblClick(sg_List);
end;

function TfmNode.SearchList(aCurrentCode:string;aTopRow:integer = 0): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_List,4,2,true);
  stSql := dmDBSelect.SelectTB_NODE_Name(ed_SearchName.Text);
  L_nCheckCount := 0;

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
      with sg_List do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('ND_NODEIP').AsString;
          cells[2,nRow] := FindField('ND_NODENAME').AsString;
          cells[3,nRow] := FindField('FG_GROUPCODENAME').AsString;
          cells[4,nRow] := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength);
          cells[5,nRow] := FindField('ND_NODEPORT').AsString;
          cells[6,nRow] := FindField('FG_GROUPCODE').AsString;
          cells[7,nRow] := FindField('ND_DEVICETYPE').AsString;
          if cells[4,nRow] = aCurrentCode then
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
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure TfmNode.sg_ListCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nCheckCount := L_nCheckCount + 1
    else L_nCheckCount := L_nCheckCount - 1 ;
  end;
end;

procedure TfmNode.sg_ListDblClick(Sender: TObject);
var
  nIndex : integer;
begin
  inherited;
  L_stWork := 'UPDATE';
  with sg_List do
  begin
    if Not isDigit(cells[4,Row]) then Exit;
    ed_NodeIp.Text := cells[1,Row];
    ed_NodeName.Text := cells[2,Row];
    ed_NodeNo.Text := cells[4,Row];
    if cells[7,Row] = '' then cells[7,Row] := '0';
    nIndex := NodeDeviceTypeCodeList.IndexOf(cells[7,Row]);
    cmb_DeviceType.ItemIndex := nIndex;
  end;
  lb_WorkType.Caption := L_stNodeUpdateCaption;
  Add.Visible := True;

end;

procedure TfmNode.TimerProgressTimer(Sender: TObject);
begin
  inherited;
  L_nProgress := L_nProgress + 1;
  if L_nProgress > 10 then L_nProgress := 0;

  AdvSmoothProgressBar1.Maximum := 10;
  AdvSmoothProgressBar1.Position := L_nProgress;

end;

function TfmNode.UpdateNodeWork: Boolean;
var
  stNodeNo : string;
  stMessage : string;
  stDate : string;
begin
  inherited;
  stNodeNo := ed_NodeNo.Text;

  if dmDBFunction.CheckTB_NODE_NodeIP(ed_NodeIp.Text,stNodeNo) = 1 then
  begin
    stMessage := dmFormMessage.GetMessage('DBDATADUP');
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  if Not dmDBUpdate.UpdateTB_NODE_NodeIP(stNodeNo,ed_NodeIp.Text,ed_NodeName.Text,inttostr(cmb_DeviceType.ItemIndex)) then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('DBSAVEERROR'),'$WORK',btn_Save.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;
  dmDBUpdate.UpdateTB_ARMAREA_DefaultNodeArmAreaName(stNodeNo,ed_NodeName.Text);
  dmDBUpdate.UpdateTB_DEVICE_DefaultNodeDeviceName(stNodeNo,ed_NodeName.Text);
  dmDBUpdate.UpdateTB_DOOR_DefaultNodeDoorName(stNodeNo,ed_NodeName.Text);
  //dmDBUpdate.UpdateTB_READER_DefaultNodeReaderName(stNodeNo,ed_NodeName.Text);
  dmDBUpdate.UpdateTB_ZONE_DefaultNodeZoneName(stNodeNo,ed_NodeName.Text);

  stDate := FormatDateTime('yyyymmddhhnnss',now);
  dmDBInsert.InsertIntoTB_ADMINWORKLOG_All(copy(stDate,1,8), copy(stDate,9,6), GetLocalIPAddr, G_stAdminUserID,L_stMenuID, '1', stNodeNo, '00', '0', '0', '','Node Update');

end;

initialization
  RegisterClass(TfmNode);
Finalization
  UnRegisterClass(TfmNode);

end.
