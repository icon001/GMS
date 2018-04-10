
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit uSecurityMonitoringEvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ExtCtrls, StdCtrls, AppEvnts, Vcl.ComCtrls,uSubForm, W7Classes, W7Panels,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid,Clipbrd,System.IniFiles,ActiveX,ADODB,
  CommandArray, AdvToolBar, AdvToolBarStylers, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPageControl;

type

  TfmSecurityMonitoringEvent = class(TfmASubForm)
    W7Panel1: TW7Panel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    PageControl1: TAdvPageControl;
    TabSheet1: TAdvTabSheet;
    TabSheet2: TAdvTabSheet;
    sg_AlarmEvent: TAdvStringGrid;
    sg_ModeChange: TAdvStringGrid;
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet1Resize(Sender: TObject);
    procedure TabSheet2Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg_ModeChangeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
  private
    FUndockedLeft: Integer;
    FUndockedTop: Integer;
    FFloatOnCloseDock: boolean;
    FfmParent: TfmASubForm;
    function  ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;   //도킹되어 있는 상태에서 다른 폼이 도킹을 시도하는 경우 발생
    procedure CMDockClient(var Message: TCMDockClient); message CM_DOCKCLIENT;
    procedure WMNCLButtonDown(var Msg: TMessage); message WM_NCLBUTTONDOWN;
    procedure FontSetting;
  public
    procedure DeviceAlarmEvent(aNodeNo, aECUID,aExtendID, aCmd, aMsgNo, aTime, aSubCLass, aSubAddr, aArmAreaNo, aMode, aAlarmStateCode, aLoop,
                      aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor:string);
    procedure DeviceCardAccessEvent(aTime,aNodeNo, aEcuID, aDoorNo,aReaderNo, aInOut,aInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,
                    aAccessPermitName,aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName:string);
    procedure SecurityEventClear;
  public
    property fmParent : TfmASubForm read FfmParent write FfmParent;
    property UndockedLeft: Integer read FUndockedLeft;
    property UndockedTop: Integer read FUndockedTop;
    property FloatOnCloseDock: boolean read FFloatOnCloseDock write FFloatOnCloseDock;
  end;

implementation
{$R *.dfm}
uses
  uSecurityEventConfirm,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uFormDeviceState,
  uFormFunction,
  uFormVariable,
  uPCClient,
  uServerClientVariable,
  uFormUtil;

procedure TfmSecurityMonitoringEvent.FormDockOver(Sender: TObject; Source: TDragDockObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := (Source.Control is Tform);
  //Draw dock preview depending on where the cursor is relative to our client area
  if Accept and (ComputeDockingRect(ARect, Point(X, Y)) <> alNone) then
  begin
    ComputeDockingRect(ARect, Point(X, Y));
    Source.DockRect := ARect;
  end;
end;


procedure TfmSecurityMonitoringEvent.N1Click(Sender: TObject);
var
  stTime : string;
begin
  inherited;
  With sg_AlarmEvent do
  begin
    if Cells[10,Row] = '' then Exit;
    if Cells[2,Row] = '' then Exit;
    if Cells[11,Row] = '' then Exit;
    if Cells[12,Row] = '' then Exit;
    stTime := Cells[12,Row];
    stTime := stringReplace(stTime,'-','',[rfReplaceAll]);
    stTime := stringReplace(stTime,':','',[rfReplaceAll]);
    stTime := stringReplace(stTime,' ','',[rfReplaceAll]);
    fmSecurityEventConfirm:= TfmSecurityEventConfirm.Create(Self);
    fmSecurityEventConfirm.NodeNo := Cells[10,Row];
    fmSecurityEventConfirm.EcuID := Cells[2,Row];
    fmSecurityEventConfirm.ExtendID := Cells[13,Row];
    fmSecurityEventConfirm.MsgNo := Cells[11,Row];
    fmSecurityEventConfirm.AlarmDate := copy(stTime,1,8);
    fmSecurityEventConfirm.AlarmTime := copy(stTime,9,6);
    fmSecurityEventConfirm.ed_ArmAreaName.Text := Cells[4,Row];
    fmSecurityEventConfirm.ed_AlarmStateName.Text := Cells[9,Row];
    fmSecurityEventConfirm.Memo1.Text := '';
    fmSecurityEventConfirm.SHowmodal;
    if fmSecurityEventConfirm.Save then
    begin
      if dmPCClient.Connected then
        dmPCClient.SendPacket('E',SCMONITORING,'A','0000','00','')
      else self.FindSubForm('Main').FindCommand('ALARMCONFIRM').Execute;
    end;
    fmSecurityEventConfirm.Free;
  end;
end;

procedure TfmSecurityMonitoringEvent.SecurityEventClear;
begin
  GridInit(sg_AlarmEvent,10);
end;

procedure TfmSecurityMonitoringEvent.sg_ModeChangeKeyDown(Sender: TObject;
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

procedure TfmSecurityMonitoringEvent.TabSheet1Resize(Sender: TObject);
begin
  sg_ModeChange.Top := 3;
  sg_ModeChange.Left := 3;
  sg_ModeChange.Width := TabSheet1.Width - 6;
  sg_ModeChange.Height := TabSheet1.Height - 6;
end;

procedure TfmSecurityMonitoringEvent.TabSheet2Resize(Sender: TObject);
begin
  sg_AlarmEvent.Top := 3;
  sg_AlarmEvent.Left := 3;
  sg_AlarmEvent.Width := TabSheet2.Width - 6;
  sg_AlarmEvent.Height := TabSheet2.Height - 6;
end;

function TfmSecurityMonitoringEvent.ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;
var
  DockTopRect,
  DockLeftRect,
  DockBottomRect,
  DockRightRect,
  DockCenterRect: TRect;
begin
  Result := alNone;
  //divide form up into docking "Zones"
  DockLeftRect.TopLeft := Point(0, 0);
  DockLeftRect.BottomRight := Point(ClientWidth div 5, ClientHeight);

  DockTopRect.TopLeft := Point(ClientWidth div 5, 0);
  DockTopRect.BottomRight := Point(ClientWidth div 5 * 4, ClientHeight div 5);

  DockRightRect.TopLeft := Point(ClientWidth div 5 * 4, 0);
  DockRightRect.BottomRight := Point(ClientWidth, ClientHeight);

  DockBottomRect.TopLeft := Point(ClientWidth div 5, ClientHeight div 5 * 4);
  DockBottomRect.BottomRight := Point(ClientWidth div 5 * 4, ClientHeight);

  DockCenterRect.TopLeft := Point(ClientWidth div 5, ClientHeight div 5);
  DockCenterRect.BottomRight := Point(ClientWidth div 5 * 4, ClientHeight div 5 * 4);

  //Find out where the mouse cursor is, to decide where to draw dock preview.
  if PtInRect(DockLeftRect, MousePos) then
  begin
    Result := alLeft;
    DockRect := DockLeftRect;
    DockRect.Right := ClientWidth div 2;
  end
  else
  if PtInRect(DockTopRect, MousePos) then
  begin
    Result := alTop;
    DockRect := DockTopRect;
    DockRect.Left := 0;
    DockRect.Right := ClientWidth;
    DockRect.Bottom := ClientHeight div 2;
  end
  else
  if PtInRect(DockRightRect, MousePos) then
  begin
    Result := alRight;
    DockRect := DockRightRect;
    DockRect.Left := ClientWidth div 2;
  end
  else
  if PtInRect(DockBottomRect, MousePos) then
  begin
    Result := alBottom;
    DockRect := DockBottomRect;
    DockRect.Left := 0;
    DockRect.Right := ClientWidth;
    DockRect.Top := ClientHeight div 2;
 end
  else
  if PtInRect(DockCenterRect, MousePos) then
  begin
    Result := alClient;
    DockRect := DockCenterRect;
  end;
  if Result = alNone then Exit;

  //DockRect is in screen coordinates.
  DockRect.TopLeft := ClientToScreen(DockRect.TopLeft);
  DockRect.BottomRight := ClientToScreen(DockRect.BottomRight);
end;

procedure TfmSecurityMonitoringEvent.DeviceAlarmEvent(aNodeNo, aECUID,aExtendID, aCmd,
  aMsgNo, aTime, aSubCLass, aSubAddr, aArmAreaNo, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor: string);
var
  nIndex : integer;
  stNodeIP : string;
  stAlarmAreaName : string;
  stAlarmDeviceTypeName : string;
  stAlarmModeName : string;
  stEmSeq,stPosiName : string;
  stEmName,stCompanyName,stEmCode : string;
begin
  if aCmd <> 'A' then Exit;

  if Not isDigit(aArmAreaNo) then aArmAreaNo := '0'
  else aArmAreaNo := inttostr(strtoint(aArmAreaNo));

  nIndex := G_MonitoringNodeList.Indexof(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength));
  if nIndex > -1 then
  begin
    stNodeIP := TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).NodeIP;
    stAlarmAreaName := TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaName,aEcuID,aArmAreaNo);
  end;
  stAlarmDeviceTypeName := dmFormFunction.GetAlarmDeviceTypeName(aSubCLass);
  stAlarmModeName := dmFormFunction.GetAlarmModeName(aMode);

  if aArmModeChange <> '1' then
  begin
    //AlarmEvent
    if aAlarmView = '0' then Exit;
    with sg_AlarmEvent do
    begin
      if Cells[0,1] <> '' then InsertRows(1,1);
      Cells[0,1] := MakeDatetimeStr(aTime);
      Cells[1,1] := stNodeIP;
      Cells[2,1] := aECUID;
      Cells[3,1] := aArmAreaNo;
      Cells[4,1] := stAlarmAreaName;
      Cells[5,1] := stAlarmDeviceTypeName;
      Cells[6,1] := aSubAddr;
      Cells[7,1] := stAlarmModeName;
      Cells[8,1] := aLoop;
      Cells[9,1] := aAlarmStatePCCodeName;
      Cells[10,1] := aNodeNo;
      Cells[11,1] := aMsgNo;
      Cells[12,1] := aTime;
      Cells[13,1] := aExtendID;
      if isDigit(aAlarmColor) then
        RowColor[1] := strtoint(aAlarmColor);
    end;
  end else
  begin
    with sg_ModeChange do
    begin
      if Cells[0,1] <> '' then InsertRows(1,1);
      Cells[0,1] := MakeDatetimeStr(aTime);
      Cells[1,1] := stNodeIP;
      Cells[2,1] := aECUID;
      Cells[3,1] := aArmAreaNo;
      Cells[4,1] := stAlarmAreaName;
      Cells[5,1] := aAlarmStatePCCodeName;
      Cells[6,1] := aOper;
      dmFormFunction.GetCardToEmployeeInfo(aOper,stEmSeq,stEmName,stCompanyName,stEmCode,stPosiName);
      Cells[7,1] := stEmName;
      Cells[8,1] := stCompanyName;
      Cells[9,1] := stEmCode;
      if isDigit(aAlarmColor) then
        RowColor[1] := strtoint(aAlarmColor);
    end;
  end;
  if aAlarmSound = '1' then
  begin
    self.FindSubForm('Main').FindCommand('ALARMMESSAGE').Params.Values['DATA'] := stAlarmAreaName + '-' + aAlarmStatePCCodeName;
    self.FindSubForm('Main').FindCommand('ALARMMESSAGE').Execute;
  end;
end;

procedure TfmSecurityMonitoringEvent.DeviceCardAccessEvent(aTime,aNodeNo, aEcuID, aDoorNo,
  aReaderNo, aInOut,aInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,aAccessPermitName,
  aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,
  aEmCode, aEmName,aPosiCode,aPosiName: string);
begin

end;

procedure TfmSecurityMonitoringEvent.FontSetting;
begin
  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);

end;

procedure TfmSecurityMonitoringEvent.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ini_fun : TiniFile;
  i : integer;
begin

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\SecurityMonitoringEvent.INI');
    with ini_fun do
    begin
      for i := 0 to sg_ModeChange.ColCount - 1 do
        WriteInteger('EVENT','CELL' + inttostr(i),sg_ModeChange.ColWidths[i]);
      for i := 0 to sg_AlarmEvent.ColCount - 1 do
        WriteInteger('ALARM','CELL' + inttostr(i),sg_AlarmEvent.ColWidths[i]);
    end;
  Finally
    ini_fun.Free;
  End;

  //the action taken depends on how the form is docked.

  //if docked to a panel, tell the panel to hide itself. If there are other
  //visible dock clients on the panel, it ShowDockPanel won't allow it to
  //be hidden
  if (HostDockSite is TPanel) then
    fmParent.ShowDockPanel(HostDockSite as TPanel, False, nil);

  Action := caHide;

  if not Floating and FloatOnCloseDock then
  begin
    // Float when close docked window
    Hide;
    ManualFloat(Rect(FUndockedLeft, FUndockedTop, FUndockedLeft + UndockWidth,
      FUndockedTop + UndockHeight));
  end;
end;

procedure TfmSecurityMonitoringEvent.FormCreate(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\SecurityMonitoringEvent.INI');
    with ini_fun do
    begin
      for i := 0 to sg_ModeChange.ColCount - 1 do
        sg_ModeChange.ColWidths[i] := ReadInteger('EVENT','CELL' + inttostr(i),200);
      for i := 0 to sg_AlarmEvent.ColCount - 1 do
        sg_AlarmEvent.ColWidths[i] := ReadInteger('ALARM','CELL' + inttostr(i),200);
    end;
  Finally
    ini_fun.Free;
  End;
  sg_ModeChange.RowCount := 2;
  SecurityEventClear;
  PageControl1.ActivePageIndex := 0;
  FontSetting;
end;

procedure TfmSecurityMonitoringEvent.CMDockClient(var Message: TCMDockClient);
var
  ARect: TRect;
  DockType: TAlign;
  Host: TForm;
  Pt: TPoint;
begin
  //Overriding this message allows the dock form to create host forms
  //depending on the mouse position when docking occurs. If we don't override
  //this message, the form will use VCL's default DockManager.

  //NOTE: the only time ManualDock can be safely called during a drag
  //operation is we override processing of CM_DOCKCLIENT.
  if Message.DockSource.Control is Tform then
  begin
    //Find out how to dock (Using a TAlign as the result of ComputeDockingRect)
    Pt.X := Message.MousePos.X;
    Pt.Y := Message.MousePos.Y;
    DockType := ComputeDockingRect(ARect, Pt);

    //if we are over a dockable form docked to a panel in the
    //main window, manually dock the dragged form to the panel with
    //the correct orientation.
    if (HostDockSite is TPanel) then
    begin
      Message.DockSource.Control.ManualDock(HostDockSite, nil, DockType);
      Exit;
    end;
  end;
end;

procedure TfmSecurityMonitoringEvent.WMNCLButtonDown(var Msg: TMessage);
begin
  inherited;
  // This event happen when mouse click in caption
  // save initial window position
  FUndockedLeft:= Left;
  FUndockedTop:= Top;
end;

end.
