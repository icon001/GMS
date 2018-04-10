﻿unit utelephoneOfficeManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uSubForm, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, CommandArray, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, AdvSmoothLabel, AdvSmoothPanel, W7Classes,
  W7Panels, AdvGlassButton,ADODB,ActiveX, frmshape, Vcl.Mask, AdvSpin,
  DBAdvSmoothLabel, AdvSmoothProgressBar, Vcl.ExtCtrls, AdvCombo, AdvGlowButton,
  AdvOfficePager, Vcl.Imaging.pngimage, Vcl.Menus, AdvOfficePagerStylers,
  AdvAppStyler, Vcl.ComCtrls, AdvEdBtn, Vcl.ImgList,System.iniFiles;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmtelephoneOfficeManager = class(TfmASubForm)
    BodyPanel: TAdvSmoothPanel;
    ed_SearchName: TAdvEdit;
    sg_List: TAdvStringGrid;
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
    cmb_ServerNo: TAdvComboBox;
    lb_Serverno: TAdvSmoothLabel;
    eb_BuildingName: TAdvEditBtn;
    lb_BuildingName: TAdvSmoothLabel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    tv_buildingCode: TTreeView;
    MenuImageList16: TImageList;
    ed_BuildingCode: TAdvEdit;
    AdvSmoothLabel4: TAdvSmoothLabel;
    ed_TelNumber: TAdvEdit;
    AdvSmoothLabel5: TAdvSmoothLabel;
    ed_Addr: TAdvEdit;
    AdvSmoothLabel6: TAdvSmoothLabel;
    ed_AddDate: TAdvEdit;
    ed_DeviceID: TAdvEdit;
    ed_AddBuildingCode: TAdvEdit;
    AdvSmoothLabel7: TAdvSmoothLabel;
    ed_AddBuildingName: TAdvEditBtn;
    tv_AddbuildingName: TTreeView;
    tv_AddbuildingCode: TTreeView;
    AdvSmoothLabel8: TAdvSmoothLabel;
    mem_DoorMemo: TMemo;
    sg_SearchNode: TAdvStringGrid;
    ed_SearchNodeNo: TAdvEdit;
    btn_Search: TAdvGlowButton;
    btn_Excel: TAdvGlowButton;
    SaveDialog1: TSaveDialog;
    lb_Count: TAdvSmoothLabel;
    AdvSmoothLabel9: TAdvSmoothLabel;
    ed_SearchIP: TAdvEdit;
    tv_buildingName: TTreeView;
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
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure eb_BuildingNameClickBtn(Sender: TObject);
    procedure tv_AddbuildingNameDblClick(Sender: TObject);
    procedure ed_AddBuildingNameClickBtn(Sender: TObject);
    procedure ed_SearchNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_ExcelClick(Sender: TObject);
    procedure sg_ListCanClickCell(Sender: TObject; ARow, ACol: Integer;
      var Allow: Boolean);
    procedure ed_SearchIPKeyPress(Sender: TObject; var Key: Char);
  private
    L_nPageListMaxCount : integer;
    L_nCheckCount : integer;
    L_nProgress : integer;
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stButtonPreCaption : string;
    L_stNodeAddCaption : string;
    L_stNodeUpdateCaption : string;
    L_stOldNodeIP : string;
    L_stOldNodeServerNo : string;
    L_stWork : string;
    L_bNodeChange : Boolean;
    FireGroupCodeList : TStringList;
    NodeDeviceTypeCodeList : TStringList;
    ServerNoList : TStringList;
    { Private declarations }
    Function FormNameSetting:Boolean;
    Function SearchList(aCurrentCode:string;aTopRow:integer = 0):Boolean;
    Function SearchNodeList(aSearchName:string):Boolean;
    Function AddNodeWork : Boolean;
    Function UpdateNodeWork : Boolean;
  private
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);

  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmtelephoneOfficeManager: TfmtelephoneOfficeManager;

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
  uFormFunction,
  uFormVariable,
  uComboBoxCodeLoad,
  uFireGroup,
  uMain;
{$R *.dfm}

function TfmtelephoneOfficeManager.AddNodeWork: Boolean;
var
  stNodeNo : string;
  stEcuID : string;
  stMessage : string;
  i,j,k : integer;
  stDate : string;
  stDeviceID : string;
  stServerNo : string;
  stDeviceType : string;
  nViewDoor : integer;
begin
  inherited;
  stNodeNo := dmDBFunction.GetNextNodeNo;
  stDeviceID := FillZeroStrNum(ed_DeviceID.Text,G_nIDLength);
  if G_nProgramType = 2 then nViewDoor := 4
  else nViewDoor := 2;
  if G_nMonitoringType = 1 then nViewDoor := 1;

  if cmb_ServerNo.ItemIndex > -1 then
    stServerNo := ServerNoList.Strings[cmb_ServerNo.ItemIndex];
  if cmb_DeviceType.ItemIndex > -1 then
    stDeviceType := NodeDeviceTypeCodeList.Strings[cmb_DeviceType.ItemIndex];

  if dmDBFunction.CheckTB_NODE_NodeIP(ed_NodeIp.Text,stNodeNo) = 1 then
  begin
    stMessage := dmFormMessage.GetMessage('DBDATADUP');
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;
  if ed_AddBuildingCode.text = '' then ed_AddBuildingCode.text := '0';

  if Not dmDBInsert.InsertIntoTB_NODE_NodeIp(stNodeNo,'1',stDeviceID,ed_NodeIp.Text,ed_NodeName.Text,stDeviceType,stServerNo,ed_AddbuildingCode.text, ed_TelNumber.Text,ed_Addr.Text,ed_AddDate.text) then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('DBSAVEERROR'),'$WORK',btn_Save.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;
  dmDBInsert.InsertIntoTB_NODERCV_NodeIp(stNodeNo);

  for i := 0 to se_EcuCount.Value do
  begin
    stEcuID := FillZeroNumber(i,2);
    for j := 1 to G_nDefaultDoorCount do
    begin
      if j <= nViewDoor then
      begin
         if G_nMonitoringType = 1 then dmDBInsert.InsertIntoTB_DOOR_DeviceDoorInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text,'1','1',mem_DoorMemo.Text,ed_AddbuildingCode.text )
         else dmDBInsert.InsertIntoTB_DOOR_DeviceDoorInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text + '_' + stEcuID + '_' + inttostr(j),'1','1',mem_DoorMemo.Text,ed_AddbuildingCode.text );
         dmDBInsert.InsertIntoTB_DOORRCV_DeviceDoorInit(stNodeNo,stEcuID,inttostr(j));
      end ;
      //else
      //   dmDBInsert.InsertIntoTB_DOOR_DeviceDoorInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text + '_' + stEcuID + '_' + inttostr(j),'0','0' );

      Application.ProcessMessages;
    end;
    for j := 0 to G_nDefaultArmAreaCount do
    begin
      if j = 0 then
        dmDBInsert.InsertIntoTB_ARMAREA_DeviceArmAreaInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text,'1','1' )
      else dmDBInsert.InsertIntoTB_ARMAREA_DeviceArmAreaInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text + '_' + stEcuID + '_' + inttostr(j),'0','0' );
      Application.ProcessMessages;
    end;
    //for j := 0 to G_nDefaultExtentionCount do
    begin
      j := 0;
      for k := 1 to G_nDefaultZoneCount do
      begin
        dmDBInsert.InsertIntoTB_ZONE_ZoneInit(stNodeNo,stEcuID,inttostr(j),inttostr(k),ed_NodeName.Text + '_' + stEcuID + '_' +  inttostr(k));  //inttostr(j)+ '_' +
        dmDBInsert.InsertIntoTB_ZONERCV_ZoneInit(stNodeNo,stEcuID,inttostr(j),inttostr(k));
        Application.ProcessMessages;
      end;
      if j = 0 then
        dmDBInsert.InsertIntoTB_ZONEEXTENTION_ZoneInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text,'1')
      else dmDBInsert.InsertIntoTB_ZONEEXTENTION_ZoneInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text + '_' + stEcuID + '_' + inttostr(j),'0');
    end;
    for j := 1 to G_nDefaultReaderCount do
    begin
      dmDBInsert.InsertIntoTB_READER_ReaderInit(stNodeNo,stEcuID,inttostr(j));
      dmDBInsert.InsertIntoTB_READERRCV_ReaderInit(stNodeNo,stEcuID,inttostr(j));
      Application.ProcessMessages;
    end;

    //for j := 0 to G_nDefaultExtentionCount do //확장아이디틑 0만 입력하자
    begin
      j := 0;
      dmDBInsert.InsertIntoTB_DEVICE_DeviceInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text + '_' + stEcuID ,'1');   //+ '_' + inttostr(j)
      dmDBInsert.InsertIntoTB_DEVICERCV_DeviceInit(stNodeNo,stEcuID,inttostr(j));
      Application.ProcessMessages;
    end;

    //타임코드 -> 타임코드기기테이블 복사
    dmDBInsert.InsertIntoTB_TIMECODEDEVICE_TimeCodeToDevice(stNodeNo,stEcuID,'0');
    dmDBFunction.copyHoliDayToDevice(stNodeNo,stEcuID);
  end;

  stDate := FormatDateTime('yyyymmddhhnnss',now);
  dmDBInsert.InsertIntoTB_ADMINWORKLOG_All(copy(stDate,1,8), copy(stDate,9,6), GetLocalIPAddr, G_stAdminUserID,L_stMenuID, '1', stNodeNo, '00', '0', '0', '','Node Add');
end;

procedure TfmtelephoneOfficeManager.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmtelephoneOfficeManager.btn_AddClick(Sender: TObject);
begin
  inherited;
  pm_CodeAddClick(pm_CodeAdd);
end;

procedure TfmtelephoneOfficeManager.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Add.Visible := False;
end;

procedure TfmtelephoneOfficeManager.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmtelephoneOfficeManager.btn_DeleteClick(Sender: TObject);
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
        dmDBDelete.DeleteTB_ARMAREA_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_CARDPERMIT_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_CARDPERMITCOMPANYGROUP_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_CARDPERMITEMPLOYEECODE_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_CARDPERMITEMPLOYEEGROUP_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_DEVICE_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_DEVICERCV_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_DOOR_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_DOORRCV_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_HOLIDAYDEVICE_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_NODE_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_NODERCV_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_READER_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_READERRCV_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_TIMECODEDEVICE_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_ZONE_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_ZONERCV_NodeAll(cells[8,i]);
        dmDBDelete.DeleteTB_ZONEEXTENTION_NodeAll(cells[8,i]);
        Application.ProcessMessages;
      end;
    end;
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,'SERVER','0','00','','0',con_ComLogTYPE_PROGRAM,cells[4,Row] + ' : NODE DELETE');
  end;
  SearchList('');
end;

procedure TfmtelephoneOfficeManager.btn_ExcelClick(Sender: TObject);
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
        sg_List.SaveToXLS(stSaveFileName);
      Except
        sg_List.SaveToCSV(stSaveFileName);
      End;
//      advgridexcelio1.XLSExport(stSaveFileName);
    end;
  end;
  btn_Excel.Enabled := True;

end;

procedure TfmtelephoneOfficeManager.btn_FireGroupAddClick(Sender: TObject);
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

procedure TfmtelephoneOfficeManager.btn_FireGroupCancelClick(Sender: TObject);
begin
  inherited;
  sg_List.Enabled := True;
  pan_FireGroup.Visible := False;

end;

procedure TfmtelephoneOfficeManager.btn_FireGroupClick(Sender: TObject);
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

procedure TfmtelephoneOfficeManager.btn_FireGroupSelectClick(Sender: TObject);
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
        dmDBUpdate.UpdateTB_NODE_Field_StringValue(cells[5,i],'FG_GROUPCODE',stFireGroupCode);
      end;
    end;
  end;
  L_bNodeChange := True;
  sg_List.Enabled := True;
  pan_FireGroup.Visible := False;
  SearchList('');
end;

procedure TfmtelephoneOfficeManager.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmtelephoneOfficeManager.btn_SaveClick(Sender: TObject);
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

procedure TfmtelephoneOfficeManager.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmtelephoneOfficeManager.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  sg_ListDblClick(sg_List);
end;

procedure TfmtelephoneOfficeManager.CommandArrayCommandsTFORMNAMEExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  Caption := Params.Values['CAPTION'];

end;

procedure TfmtelephoneOfficeManager.CommandArrayCommandsTGRADEREFRESHExecute(
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

procedure TfmtelephoneOfficeManager.CommandArrayCommandsTMENUIDExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  L_stMenuID := Params.Values['ID'];
end;

procedure TfmtelephoneOfficeManager.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Top := eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := eb_BuildingName.Left;

end;

procedure TfmtelephoneOfficeManager.ed_AddBuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_AddbuildingName.Visible := Not tv_AddbuildingName.Visible;
  tv_AddbuildingName.Top := ed_AddBuildingName.Top - tv_AddbuildingName.Height;
  tv_AddbuildingName.Left := ed_AddBuildingName.Left;

end;

procedure TfmtelephoneOfficeManager.ed_NodeIpChange(Sender: TObject);
begin
  inherited;
  if L_stWork = 'ADD' then ed_NodeName.Text := ed_NodeIp.Text;

end;

procedure TfmtelephoneOfficeManager.ed_NodeIpKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Char(VK_RETURN) then
      Perform(WM_NEXTDLGCTL,0,0);

end;

procedure TfmtelephoneOfficeManager.ed_SearchIPKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    SearchList('');
  end;

end;

procedure TfmtelephoneOfficeManager.ed_SearchNameChange(Sender: TObject);
begin
  inherited;
  if G_nReportSearchType = 1 then  SearchList('');
end;

procedure TfmtelephoneOfficeManager.ed_SearchNameKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ed_SearchName.Text = '' then
  begin
    ed_SearchNodeNo.Text := '';
    sg_SearchNode.Visible := False;
  end else
  begin
    sg_SearchNode.Visible := True;
    SearchNodeList(ed_SearchName.Text);
  end;
end;

procedure TfmtelephoneOfficeManager.FormChangeEvent(aFormName: integer);
begin
//  case aFormName of
//  end;
end;

procedure TfmtelephoneOfficeManager.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if L_bNodeChange then
  begin
    fmMain.FORMCHANGE(con_FormBMOSNODEMANAGER,'')
  end;

  NodeDeviceTypeCodeList.Free;
  FireGroupCodeList.Free;
  ServerNoList.Free;

  Action := caFree;
end;

procedure TfmtelephoneOfficeManager.FormCreate(Sender: TObject);
begin
  inherited;
  FireGroupCodeList := TStringList.Create;
  NodeDeviceTypeCodeList := TStringList.Create;
  ServerNoList := TStringList.Create;

  L_nPageListMaxCount := 17;
  pan_Progress.Left := 10;
end;

procedure TfmtelephoneOfficeManager.FormGradeRefresh;
begin
  Try
    if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
    pm_CodeAdd.Enabled := IsInsertGrade;
    btn_Add.Enabled := False;
    btn_Delete.Enabled := False;
    pm_UpdateCode.Enabled := IsUpdateGrade;
    btn_Update.Enabled := False;
  Except
    Exit;
  End;
end;

procedure TfmtelephoneOfficeManager.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmtelephoneOfficeManager.FormNameSetting: Boolean;
begin
  Exit;
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
//  lb_List.Caption := dmFormFunction.GetFormName('2','1','BM2_011');//dmFormFunction.GetFormName('0','2','COMMONLIST01');
  pm_CodeAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  btn_Add.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  btn_Delete.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  pm_UpdateCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Update.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_AddNodeName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  sg_List.Cells[5,0] := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  lb_AddEcuCount.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDEVICECOUNT');
  lb_AddNodeIP.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONNODEIP01');
  sg_List.Cells[4,0] := dmFormFunction.GetFormName('0','2','COMMONNODEIP01');
  L_stNodeAddCaption := dmFormFunction.GetFormName('0','2','COMMONNODELIST02');
  L_stNodeUpdateCaption := dmFormFunction.GetFormName('0','2','COMMONNODELIST03');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stButtonPreCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU004');
  btn_Search.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');

end;

procedure TfmtelephoneOfficeManager.FormResize(Sender: TObject);
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
  //sg_List.ColWidths[3] := sg_List.Width - (sg_List.ColWidths[0] + sg_List.ColWidths[1] + sg_List.ColWidths[2]);
  btn_FireGroup.Left := sg_List.Left + sg_List.Width - btn_FireGroup.Width;

  Add.Left := (BodyPanel.Width div 2) - (Add.Width div 2);
  Add.Top := (BodyPanel.Height div 2) - (Add.Height div 2);

  pan_FireGroup.Left := (BodyPanel.Width div 2) - (pan_FireGroup.Width div 2);
  pan_FireGroup.Top := (BodyPanel.Height div 2) - (pan_FireGroup.Height div 2);

  sg_SearchNode.Left := ed_SearchName.Left;
  sg_SearchNode.Top := ed_SearchName.Top + ed_SearchName.Height + 5;
end;

procedure TfmtelephoneOfficeManager.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  GridInit(sg_List,8,2,true);
  FormNameSetting;

  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');

  LoadNodeDeviceType(NodeDeviceTypeCodeList,TComboBox(cmb_DeviceType),False,'');

  LoadServerNo(ServerNoList,TComboBox(cmb_ServerNo),False,'');
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  LoadBuildingTreeView('',tv_AddbuildingName,tv_AddbuildingCode,con_LocalBuildingImageIndex);
  tv_buildingNameDblClick(Self);

  //SearchList('');
end;

procedure TfmtelephoneOfficeManager.pm_CodeAddClick(Sender: TObject);
begin
  inherited;
  lb_WorkType.Caption := '추가';
  Add.Visible := True;
  L_stWork := 'ADD';
  ed_NodeIp.Text := '';
  ed_NodeName.Text := '';
  ed_NodeNo.Text := '';
  ed_Addr.Text := '';
  ed_TelNumber.Text := '';
  ed_DeviceID.Text := '0';
  mem_DoorMemo.Text := '';
  ed_AddDate.Text := FormatDateTime('yyyymmdd',now);
  cmb_DeviceType.ItemIndex := 0;
  ed_AddBuildingName.Text := eb_BuildingName.Text;
  ed_AddBuildingCode.text := ed_BuildingCode.Text;

end;

procedure TfmtelephoneOfficeManager.pm_UpdateCodeClick(Sender: TObject);
begin
  inherited;
  sg_ListDblClick(sg_List);
end;

function TfmtelephoneOfficeManager.SearchList(aCurrentCode:string;aTopRow:integer = 0): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stBuildingCode : string;
begin
  GridInit(sg_List,8,2,true);
  lb_count.Caption.Text := '조회건수 : ';

  stBuildingCode := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  stSql := dmDBSelect.SelectTB_NODE_Name(stBuildingCode,ed_SearchName.Text,ed_SearchIP.Text);
  L_nCheckCount := 0;
  btn_Excel.Enabled := False;
  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');

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
      if recordcount < 1 then Exit;
      btn_Excel.Enabled := True;
      if Not FileExists(G_stExeFolder + '\Excel-a.png') then
      begin
        ExcelEnImage.Picture.SaveToFile(G_stExeFolder + '\Excel-a.png');
      end;
      btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-a.png');

      lb_count.Caption.Text := '조회건수 : ' + inttostr(recordcount);
      with sg_List do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('BUILDINGNAME1').AsString;
          cells[2,nRow] := FindField('BUILDINGNAME2').AsString;
          cells[3,nRow] := FindField('BUILDINGNAME3').AsString;
          cells[4,nRow] := FindField('ND_NODENAME').AsString;
          cells[5,nRow] := FindField('ND_NODEIP').AsString;
          cells[6,nRow] := FindField('ND_TELNUM').AsString;
          cells[7,nRow] := FindField('ND_ADDR').AsString;
          cells[8,nRow] := FindField('ND_NODENO').AsString;
          cells[9,nRow] := FindField('ND_DEVICEID').AsString;
          cells[10,nRow] := FindField('ND_NODEPORT').AsString;
          cells[11,nRow] := FindField('ND_DECODERNO').AsString;
          cells[12,nRow] := FindField('ND_ADDDATE').AsString;
          cells[13,nRow] := FindField('BC_BUILDINGCODE').AsString;

          if cells[8,nRow] = aCurrentCode then
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


function TfmtelephoneOfficeManager.SearchNodeList(aSearchName: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stBuildingCode : string;
begin
  GridInit(sg_SearchNode,1,2);

  stBuildingCode := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  stSql := dmDBSelect.SelectTB_NODE_Name(stBuildingCode,aSearchName);

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
      if recordcount < 1 then Exit;
      with sg_SearchNode do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('ND_NODENAME').AsString;
          cells[1,nRow] := FindField('ND_NODENO').AsString;

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
end;

procedure TfmtelephoneOfficeManager.sg_ListCanClickCell(Sender: TObject; ARow,
  ACol: Integer; var Allow: Boolean);
var
    bAscending :Boolean;
begin

  // 타이틀이 아닐경우 빠져나감 (타이틀 2줄)
  if ARow > 1 then
     Exit;

  // 그룹타이틀을 클릭시에는 정렬하지 않음 (매수, 매도)
//  if (ACol in [3..12]) and (ARow = 0) then
//     Exit;

  with sg_List do
  begin
     // 기존의 정렬상태를 읽어와서 클릭시에
     // Ascending 으로 할지 Descending 으로 할지 결정한다.
     if (ACol = SortSettings.Column) and
        (SortSettings.Direction = sdAscending) then
        bAscending := False
     else
        bAscending := True;

     // 정렬하기
     SortSettings.Full := True;
     SortIndexes.Clear;
     SortIndexes.AddIndex(ACol, bAscending);
     QSortIndexed;

     // 현재 정렬한 내용 저장
     //  => 원래용도는 아니지만 여기서는 사용하지 않는 속성이라서 이곳에 저장했다.
     SortSettings.Column := ACol;
     if bAscending then
        SortSettings.Direction := sdAscending
     else
        SortSettings.Direction := sdDescending;

  end;
end;

procedure TfmtelephoneOfficeManager.sg_ListCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmtelephoneOfficeManager.sg_ListDblClick(Sender: TObject);
var
  nIndex : integer;
  vNode1 : TTreeNode;
  bNode : TTreeNode;

begin
  inherited;
  L_stWork := 'UPDATE';
  with sg_List do
  begin
    if Not isDigit(cells[8,Row]) then Exit;
    ed_NodeIp.Text := cells[5,Row];
    L_stOldNodeIP := cells[5,Row];
    ed_NodeName.Text := cells[4,Row];
    ed_NodeNo.Text := cells[8,Row];
    if cells[10,Row] = '' then cells[10,Row] := '0';
    nIndex := NodeDeviceTypeCodeList.IndexOf(cells[10,Row]);
    cmb_DeviceType.ItemIndex := nIndex;
    nIndex := ServerNoList.IndexOf(cells[11,Row]);
    L_stOldNodeServerNo := cells[11,Row];
    cmb_ServerNo.ItemIndex := nIndex;
    ed_TelNumber.Text := cells[6,Row];
    ed_Addr.Text := cells[7,Row];
    ed_AddDate.Text := cells[12,Row];
    ed_DeviceID.Text := cells[9,Row];
    ed_AddBuildingCode.text := cells[13,Row];
    mem_DoorMemo.Text := dmDBFunction.GetTB_Door_DoorMemo(ed_NodeNo.Text,'00','1');
  end;

  if ed_AddBuildingCode.text = '' then ed_AddBuildingCode.text := '0';

  vNode1:= GetNodeByText(tv_AddbuildingCode,ed_AddBuildingCode.text,True);
  if vNode1 <> nil then
  begin
    bNode := tv_AddbuildingName.Items.Item[vNode1.AbsoluteIndex];
    bNode.Selected := True;
    tv_AddbuildingNameDblClick(tv_AddbuildingName);
  end;

  lb_WorkType.Caption := '수정';
  Add.Visible := True;
(*
          cells[1,nRow] := FindField('ND_NODENAME').AsString;
          cells[2,nRow] := FindField('ND_NODEIP').AsString;
          cells[3,nRow] := FindField('ND_TELNUM').AsString;
          cells[4,nRow] := FindField('ND_ADDR').AsString;
          cells[5,nRow] := FindField('ND_NODENO').AsString;
          cells[6,nRow] := FindField('ND_DEVICEID').AsString;
          cells[7,nRow] := FindField('ND_NODEPORT').AsString;
          cells[8,nRow] := FindField('ND_DECODERNO').AsString;
          cells[9,nRow] := FindField('ND_ADDDATE').AsString;

*)
end;

procedure TfmtelephoneOfficeManager.TimerProgressTimer(Sender: TObject);
begin
  inherited;
  L_nProgress := L_nProgress + 1;
  if L_nProgress > 10 then L_nProgress := 0;

  AdvSmoothProgressBar1.Maximum := 10;
  AdvSmoothProgressBar1.Position := L_nProgress;

end;

procedure TfmtelephoneOfficeManager.tv_AddbuildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_AddbuildingName.Selected = nil then tv_AddbuildingName.Items[0].Selected := True;

  ed_AddBuildingCode.Text := tv_AddbuildingCode.Items.Item[tv_AddbuildingName.Selected.AbsoluteIndex].Text;
  ed_AddBuildingName.Text := tv_AddbuildingName.Selected.Text;
  tv_AddbuildingName.Visible := False;
end;

procedure TfmtelephoneOfficeManager.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  if G_nReportSearchType = 1 then  SearchList('');

end;

function TfmtelephoneOfficeManager.UpdateNodeWork: Boolean;
var
  stNodeNo : string;
  stMessage : string;
  stDate : string;
  stServerNo : string;
begin
  inherited;
  stNodeNo := ed_NodeNo.Text;

  if dmDBFunction.CheckTB_NODE_NodeIP(ed_NodeIp.Text,stNodeNo) = 1 then
  begin
    stMessage := dmFormMessage.GetMessage('DBDATADUP');
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  if cmb_ServerNo.ItemIndex > -1 then
    stServerNo := ServerNoList.Strings[cmb_ServerNo.ItemIndex];

  if ed_AddBuildingCode.text = '' then ed_AddBuildingCode.text := '0';
  if Not dmDBUpdate.UpdateTB_NODE_TelphoneOfficeNodeIP(stNodeNo,ed_NodeIp.Text,ed_NodeName.Text,inttostr(cmb_DeviceType.ItemIndex),stServerNo,ed_AddbuildingCode.text, ed_TelNumber.Text,ed_Addr.Text,ed_AddDate.text) then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('DBSAVEERROR'),'$WORK',btn_Save.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  if L_stOldNodeServerNo <> stServerNo then
  begin
    //서버가 변경 되었다.
    if isdigit(L_stOldNodeServerNo) then
    begin
      dmDBUpdate.UpdateTB_NODE_Field_IntValue(stNodeNo,'ND_OLDDECORDERNO',L_stOldNodeServerNo);
      dmDBUpdate.UpdateTB_NODE_Field_StringValue(stNodeNo,'ND_DECODERNOCHANGE','Y');
    end;
  end;
  if (L_stOldNodeServerNo <> stServerNo) OR (L_stOldNodeIP <> ed_NodeIp.Text) then
  begin
    dmDBUpdate.UpdateTB_NODE_Field_StringValue(stNodeNo,'ND_MEMLOAD','N');
  end;

  dmDBUpdate.UpdateTB_ARMAREA_TelphoneOfficeArmAreaName(stNodeNo,ed_NodeName.Text);
  dmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(stNodeNo,'00','0','0','BC_BUILDINGCODE',ed_AddBuildingCode.text);
  dmDBUpdate.UpdateTB_DEVICE_TelphoneOfficeDeviceName(stNodeNo,ed_NodeName.Text);
  dmDBUpdate.UpdateTB_DOOR_TelphoneOfficeDoorName(stNodeNo,ed_NodeName.Text);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,'00','0','1','DO_MEMO',mem_DoorMemo.Text);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,'00','0','1','BC_BUILDINGCODE',ed_AddBuildingCode.text);
  //dmDBUpdate.UpdateTB_READER_DefaultNodeReaderName(stNodeNo,ed_NodeName.Text);
  dmDBUpdate.UpdateTB_ZONE_TelphoneOfficeZoneName(stNodeNo,ed_NodeName.Text);

  stDate := FormatDateTime('yyyymmddhhnnss',now);
  dmDBInsert.InsertIntoTB_ADMINWORKLOG_All(copy(stDate,1,8), copy(stDate,9,6), GetLocalIPAddr, G_stAdminUserID,L_stMenuID, '1', stNodeNo, '00', '0', '0', '','Node Update');

end;

initialization
  RegisterClass(TfmtelephoneOfficeManager);
Finalization
  UnRegisterClass(TfmtelephoneOfficeManager);

end.