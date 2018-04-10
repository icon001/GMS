﻿unit uDeviceComMonitoring;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, W7Classes, W7Panels, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvSmoothPanel, Vcl.ExtCtrls, AdvSmoothLabel,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvToolBtn,ADODB,ActiveX, uSubForm, CommandArray, AdvCombo, AdvGroupBox,
  Vcl.Mask, AdvSpin, AdvOfficeButtons, AdvPanel, Vcl.ComCtrls, AdvListV,
  Vcl.ImgList, Vcl.Menus, AdvMenus, AdvExplorerTreeview, paramtreeview,
  Vcl.Clipbrd, Vcl.Imaging.pngimage, AdvGlowButton, AdvOfficePager,
  AdvAppStyler, AdvOfficePagerStylers;


type
  TfmDeviceComMonitoring = class(TfmASubForm)
    pan_CardListHeader: TAdvSmoothPanel;
    lb_DeviceName: TAdvSmoothLabel;
    lb_NodeCommand: TAdvSmoothLabel;
    cmb_Device: TComboBox;
    ImageList1: TImageList;
    pop_PermitAdd: TAdvPopupMenu;
    mn_addpermitListDelete: TMenuItem;
    toolslist: TImageList;
    sg_ComMonitoring: TAdvStringGrid;
    ed_cmd: TAdvEdit;
    SearchTimer: TTimer;
    lb_NodeName: TAdvSmoothLabel;
    cmb_Node: TComboBox;
    SaveDialog1: TSaveDialog;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_List: TLabel;
    btnStart: TAdvGlowButton;
    btn_Clear: TAdvGlowButton;
    btn_FileSave: TAdvGlowButton;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    btn_DoorState: TAdvGlowButton;
    ed_DoorID: TAdvEdit;
    ed_DSState: TAdvEdit;
    ed_CardMode: TAdvEdit;
    ed_ManagerMode: TAdvEdit;
    ed_DoorRcvState: TAdvEdit;
    ed_DeviceDoorRcvState: TAdvEdit;
    ed_DeviceDoorCount: TAdvEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_AddNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure CommandArrayCommandsTMENUIDExecute(Command: TCommand;
      Params: TStringList);
    procedure cmb_NodeChange(Sender: TObject);
    procedure CommandArrayCommandsTFORMNAMEExecute(Command: TCommand;
      Params: TStringList);
    procedure btnStartClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure sg_ComMonitoringKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_DoorStateClick(Sender: TObject);
  private
    L_bStart : Boolean;
    L_bClear : Boolean;
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stButtonPlayName : string;
    L_stButtonStopName : string;

    NodeCodeList : TStringList;
    DeviceCodeList : TStringList;
    DisplayList : TStringList;
    { Private declarations }
  private
    Function FormNameSetting:Boolean;

  public
    { Public declarations }
    procedure Form_Close;
    procedure NodePacketEvent(aNodeNo : integer; aNodeName,aEcuID,aCmd,aMsgNo,aDeviceVer,aData,aType:string);
  end;

var
  fmDeviceComMonitoring: TfmDeviceComMonitoring;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDeviceVariable,
  uFormFunction,
  uFormDevice,
  uFormVariable,
  uNode;

{$R *.dfm}


procedure TfmDeviceComMonitoring.btnStartClick(Sender: TObject);
begin
  inherited;
  if btnStart.Caption = L_stButtonStopName then
  begin
    btnStart.Caption := L_stButtonPlayName;
    if Not FileExists(G_stExeFolder + '\pccomstart.png') then
    begin
      Img_Start.Picture.SaveToFile(G_stExeFolder + '\pccomstart.png');
    end;
    btnStart.Picture.LoadFromFile(G_stExeFolder + '\pccomstart.png');
  end else
  begin
    btnStart.Caption := L_stButtonStopName;
    if Not FileExists(G_stExeFolder + '\pccomstop.png') then
    begin
      Img_Stop.Picture.SaveToFile(G_stExeFolder + '\pccomstop.png');
    end;
    btnStart.Picture.LoadFromFile(G_stExeFolder + '\pccomstop.png');
  end;
end;

procedure TfmDeviceComMonitoring.btn_ClearClick(Sender: TObject);
begin
  inherited;
  L_bClear := True;
  GridInitialize(sg_ComMonitoring);

end;

procedure TfmDeviceComMonitoring.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmDeviceComMonitoring.btn_DoorStateClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  nIndex : integer;
begin
  inherited;

  if cmb_Node.ItemIndex > 0 then
  begin
    stNodeNo := NodeCodeList.Strings[cmb_Node.ItemIndex];
  end;
  if cmb_Device.ItemIndex > 0 then
  begin
    stEcuID := DeviceCodeList.Strings[cmb_Device.ItemIndex];
    stEcuID := copy(stEcuID,1 + G_nNodeCodelength,2);
  end;
  if Not isDigit(stNodeNo) then Exit;
  if stEcuID = '' then Exit;
  if ed_DoorID.Text = '' then Exit;
  nIndex := NodeList.IndexOf(stNodeNo);
  if nIndex < 0 then Exit;
  ed_DSState.Text := TNode(NodeList.Objects[nIndex]).GetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCurrentDSState,stEcuID,ed_DoorID.Text);
  ed_CardMode.Text := TNode(NodeList.Objects[nIndex]).GetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCurrentCARDMode,stEcuID,ed_DoorID.Text);
  ed_ManagerMode.Text := TNode(NodeList.Objects[nIndex]).GetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCurrentManagerMode,stEcuID,ed_DoorID.Text);
  ed_DoorRcvState.Text := TNode(NodeList.Objects[nIndex]).GetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCurrentRcvState,stEcuID,ed_DoorID.Text);
  ed_DeviceDoorRcvState.Text := TNode(NodeList.Objects[nIndex]).GetDeviceIDInformation(con_DeviceDoorStateRCV,stEcuID);
  ed_DeviceDoorCount.Text := TNode(NodeList.Objects[nIndex]).GetDeviceIDInformation(con_DeviceCmdDoorCount,stEcuID);
end;

procedure TfmDeviceComMonitoring.btn_FileSaveClick(Sender: TObject);
var
  stSaveFileName : string;
begin
  inherited;
  SaveDialog1.FileName := pan_CardListHeader.Caption.Text;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      //
      if fileexists(stSaveFileName) then
        deletefile(stSaveFileName);
      Try
        sg_ComMonitoring.SaveToXLS(stSaveFileName,True);
      Except
        sg_ComMonitoring.SaveToCSV(stSaveFileName);
      End;

      //advgridexcelio1.XLSExport(stSaveFileName);
    end;
  end;

end;

procedure TfmDeviceComMonitoring.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmDeviceComMonitoring.cmb_NodeChange(Sender: TObject);
var
  stNodeNo : string;
begin
  inherited;
  stNodeNo := '';
  if cmb_Node.ItemIndex > -1 then
    stNodeNo := NodeCodeList.Strings[cmb_Node.ItemIndex];
  dmFormDevice.LoadDeviceCode(stNodeNo,TComboBox(cmb_Device),DeviceCodeList,True);

end;

procedure TfmDeviceComMonitoring.CommandArrayCommandsTFORMNAMEExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Caption := Params.Values['CAPTION'];

end;

procedure TfmDeviceComMonitoring.CommandArrayCommandsTMENUIDExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  L_stMenuID := Params.Values['ID'];

end;


procedure TfmDeviceComMonitoring.ed_AddNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfmDeviceComMonitoring.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfmDeviceComMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  NodeCodeList.Free;
  DeviceCodeList.Free;
  DisplayList.Free;

  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(conFORMDEVICECOMMONITORING);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;

  Action := caFree;
end;

procedure TfmDeviceComMonitoring.FormCreate(Sender: TObject);
var
  stNodeNo : string;
begin

  NodeCodeList := TStringList.Create;
  DeviceCodeList := TStringList.Create;
  DisplayList := TStringList.Create;

  dmFormDevice.LoadNodeName(TComboBox(cmb_Node),NodeCodeList,True);
  stNodeNo := '';
  if cmb_Node.ItemIndex > -1 then
    stNodeNo := NodeCodeList.Strings[cmb_Node.ItemIndex];
  dmFormDevice.LoadDeviceCode(stNodeNo,TComboBox(cmb_Device),DeviceCodeList,True);
  L_bClear := True;
  L_bStart := True;
  if Not FileExists(G_stExeFolder + '\pccomstop.png') then
  begin
    Img_Stop.Picture.SaveToFile(G_stExeFolder + '\pccomstop.png');
  end;
  btnStart.Picture.LoadFromFile(G_stExeFolder + '\pccomstop.png');
  if Not FileExists(G_stExeFolder + '\Excel-a.png') then
  begin
    ExcelEnImage.Picture.SaveToFile(G_stExeFolder + '\Excel-a.png');
  end;
  btn_FileSave.Picture.LoadFromFile(G_stExeFolder + '\Excel-a.png');
end;


function TfmDeviceComMonitoring.FormNameSetting: Boolean;
begin
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  btn_Clear.Caption := dmFormFunction.GetFormName('0','2','BUTTONCLEAR001');
  L_stButtonPlayName := dmFormFunction.GetFormName('0','2','BUTTONPLAY001');
  L_stButtonStopName := dmFormFunction.GetFormName('0','2','BUTTONPLAY002');
  btn_FileSave.Caption := dmFormFunction.GetFormName('0','2','BUTTONFILESAVE002');
  lb_NodeName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  sg_ComMonitoring.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  lb_DeviceName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDEVICENAME');
  sg_ComMonitoring.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONDEVICENAME');
  sg_ComMonitoring.Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONTIME01');
  sg_ComMonitoring.Cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONTXRX01');
  lb_NodeCommand.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONNODECMD01');
  sg_ComMonitoring.Cells[4,0] := dmFormFunction.GetFormName('0','2','COMMONNODECMD01');
  sg_ComMonitoring.Cells[5,0] := dmFormFunction.GetFormName('0','2','COMMONNODEMSG01');
  sg_ComMonitoring.Cells[6,0] := dmFormFunction.GetFormName('0','2','COMMONNODEVER01');
  sg_ComMonitoring.Cells[7,0] := dmFormFunction.GetFormName('0','2','COMMONNODEDATA01');

  btnStart.Caption := L_stButtonStopName;
end;

procedure TfmDeviceComMonitoring.FormResize(Sender: TObject);
begin
  inherited;
  sg_ComMonitoring.Top := btnStart.Top + btnStart.Height + 10;
  sg_ComMonitoring.Left := 5;
  sg_ComMonitoring.Width := pan_CardListHeader.Width - (sg_ComMonitoring.Left * 2);
  sg_ComMonitoring.Height := pan_CardListHeader.Height - sg_ComMonitoring.Top - 5;

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
  sg_ComMonitoring.ColWidths[7] := sg_ComMonitoring.Width - (sg_ComMonitoring.ColWidths[0] + sg_ComMonitoring.ColWidths[1] + sg_ComMonitoring.ColWidths[2] + sg_ComMonitoring.ColWidths[3] + sg_ComMonitoring.ColWidths[4] + sg_ComMonitoring.ColWidths[5] + sg_ComMonitoring.ColWidths[6]);
end;

procedure TfmDeviceComMonitoring.FormShow(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(conFORMDEVICECOMMONITORING);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;
  FormNameSetting;
  if G_nDebugMode = 1 then
  begin
    ed_DoorID.Visible := True;
    btn_DoorState.Visible := True;
    ed_DSState.Visible := True;
    ed_CardMode.Visible := True;
    ed_ManagerMode.Visible := True;
    ed_DoorRcvState.Visible := True;
    ed_DeviceDoorRcvState.Visible := True;
    ed_DeviceDoorCount.Visible := True;
  end;
end;

procedure TfmDeviceComMonitoring.Form_Close;
begin
  Close;
end;


procedure TfmDeviceComMonitoring.NodePacketEvent(aNodeNo: integer; aNodeName,
  aEcuID, aCmd, aMsgNo, aDeviceVer, aData, aType: string);
var
  stNodeNo : string; 
  stEcuID : string; 
begin
  if btnStart.Caption <> L_stButtonStopName then Exit;
  if ed_cmd.Text <> '' then
  begin
    if Pos(aCmd,ed_cmd.Text) = 0 then Exit;
  end;
  if cmb_Node.ItemIndex > 0 then
  begin
    stNodeNo := NodeCodeList.Strings[cmb_Node.ItemIndex];
    if isDigit(stNodeNo) then
      if strtoint(stNodeNo) <> aNodeNo then Exit;
  end;
  if cmb_Device.ItemIndex > 0 then
  begin  
    stEcuID := DeviceCodeList.Strings[cmb_Device.ItemIndex];
    stEcuID := copy(stEcuID,1 + G_nNodeCodelength,2);
    if stEcuID <> aEcuID then Exit;
  end;

  with sg_ComMonitoring do
  begin
    if RowCount >= 10000 then  rowCount := 9999;

    if Not L_bClear then InsertRows(1,1);
    L_bClear := False;

    Cells[0,1] := aNodeName;
    Cells[1,1] :=  aEcuID ;
    Cells[2,1] :=  FormatDateTime('hh:nn:ss',now) ;
    Cells[3,1] :=  aType ;
    Cells[4,1] :=  aCmd ;
    Cells[5,1] :=  aMsgNo ;
    Cells[6,1] :=  aDeviceVer ;
    Cells[7,1] :=  aData ;
    if UpperCase(aType) = 'RX' then
    begin
      RowColor[1] := $00EACAB6;
    end;
    if UpperCase(aType) = 'ER' then RowColor[1] := clYellow;

  end;

end;

procedure TfmDeviceComMonitoring.sg_ComMonitoringKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  stTemp: string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      stTemp:= Cells[Col,Row];

      if stTemp <> '' then ClipBoard.SetTextBuf(PChar(stTemp));
      showmessage(stTemp + ' 가 ClipBoard에 복사 되었습니다.');
    end;
  end;

end;

initialization
  RegisterClass(TfmDeviceComMonitoring);
Finalization
  UnRegisterClass(TfmDeviceComMonitoring);

end.