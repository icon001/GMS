
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit uMapArmAreaMonitoring;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ExtCtrls, StdCtrls, AppEvnts, Vcl.ComCtrls,uSubForm, W7Classes, W7Panels,
  uMapArmAreaState, CommandArray, AdvPageControl, AdvToolBar, AdvToolBarStylers,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvAppStyler, Vcl.Imaging.pngimage;

type
  TfmMapArmAreaMonitoring = class(TfmASubForm)
    W7Panel1: TW7Panel;
    PageBuilding: TAdvPageControl;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageBuildingDockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
    procedure PageBuildingDockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure PageBuildingGetSiteInfo(Sender: TObject; DockClient: TControl;
      var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
  private
    TabList : TStringList;
    ArmAreaFormList : TStringList;
    procedure CreateDockableWindows;
    procedure ShowDockableWindows;
  private
    FUndockedLeft: Integer;
    FUndockedTop: Integer;
    FFloatOnCloseDock: boolean;
    FfmParent: TfmASubForm;
    FArmAreaType: string;
    FParentTop: integer;
    FParentLeft: integer;
    function  ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;   //도킹되어 있는 상태에서 다른 폼이 도킹을 시도하는 경우 발생
    procedure CMDockClient(var Message: TCMDockClient); message CM_DOCKCLIENT;
    procedure WMNCLButtonDown(var Msg: TMessage); message WM_NCLBUTTONDOWN;
    procedure SetParentLeft(const Value: integer);
    procedure SetParentTop(const Value: integer);
  public
    procedure ArmAreaCurrentAlarmStateChange(aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure BuildingAlarmStateChange(aBuildingCode:string;aAlarmState: integer);
    procedure BuildingSecurityModeChange(aBuildingCode:string;aMode : integer);
    procedure DeviceReload;
    procedure DoorChangeEvent(aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
    procedure SecurityEventClear;
    procedure FontSetting;
  public
    property fmParent : TfmASubForm read FfmParent write FfmParent;
    property ArmAreaType : string read FArmAreaType write FArmAreaType;
    property UndockedLeft: Integer read FUndockedLeft;
    property UndockedTop: Integer read FUndockedTop;
    property FloatOnCloseDock: boolean read FFloatOnCloseDock write FFloatOnCloseDock;
    property ParentTop : integer read FParentTop write SetParentTop;
    property ParentLeft : integer read FParentLeft write SetParentLeft;
  public
    procedure ShowDockPanel(APanel: TPanel; MakeVisible: Boolean; Client: TControl);override;
    procedure ParentCommand(aChildName,aCommand,aValue:string);override;
  end;

implementation
uses
  uFormDeviceState,
  uFormVariable,
  uCommonVariable,
  uFormUtil;
{$R *.dfm}

procedure TfmMapArmAreaMonitoring.FormDockOver(Sender: TObject; Source: TDragDockObject;
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

procedure TfmMapArmAreaMonitoring.FormShow(Sender: TObject);
begin
  CreateDockableWindows;
  ShowDockableWindows;
//  ShowDockableWindows;
end;

procedure TfmMapArmAreaMonitoring.PageBuildingDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);
begin
  inherited;
  //OnDockDrop gets called AFTER the client has actually docked,
  //so we check for DockClientCount = 1 before making the dock panel visible.
  {if (Sender as TPageControl).DockClientCount = 1 then
    ShowDockPanel(Sender as TPageControl, True, nil);
  (Sender as TPageControl).DockManager.ResetBounds(True);    }
  //Make DockManager repaints it's clients.

end;

procedure TfmMapArmAreaMonitoring.PageBuildingDockOver(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := Source.Control is TForm;
  if Accept then
  begin
    //Modify the DockRect to preview dock area.
    ARect.TopLeft := PageBuilding.ClientToScreen(Point(0, 0));
//    ARect.BottomRight := LeftDockPanel.ClientToScreen(Point(Self.ClientWidth div 3, LeftDockPanel.Height));
    ARect.BottomRight := PageBuilding.ClientToScreen(Point(Self.ClientWidth div 3, Self.Height));
    Source.DockRect := ARect;
  end;
end;

procedure TfmMapArmAreaMonitoring.PageBuildingGetSiteInfo(Sender: TObject;
  DockClient: TControl; var InfluenceRect: TRect; MousePos: TPoint;
  var CanDock: Boolean);
begin
  inherited;
  CanDock := DockClient is TForm;
end;

procedure TfmMapArmAreaMonitoring.ParentCommand(aChildName,aCommand, aValue: string);
var
  nIndex : integer;
begin
  inherited;
  if aChildName = 'TfmMapArmAreaState' then
  begin
    if aCommand = 'BUILDINGCHANGE' then
    begin
      nIndex := ArmAreaFormList.IndexOf(aValue);
      if nIndex < 0 then Exit;
      PageBuilding.ActivePageIndex := nIndex;
    end;
  end;
end;

procedure TfmMapArmAreaMonitoring.SecurityEventClear;
var
  i : integer;
begin
  for i := 0 to ArmAreaFormList.Count - 1 do
  begin;
    TfmMapArmAreaState(ArmAreaFormList.Objects[i]).SecurityEventClear;
  end;
end;

procedure TfmMapArmAreaMonitoring.SetParentLeft(const Value: integer);
var
  i : integer;
begin
  FParentLeft := Value;
  for i := 0 to ArmAreaFormList.Count - 1 do
  begin;
    TfmMapArmAreaState(ArmAreaFormList.Objects[i]).ParentLeft := Value;
  end;

end;

procedure TfmMapArmAreaMonitoring.SetParentTop(const Value: integer);
var
  i : integer;
begin
  FParentTop := Value;
  for i := 0 to ArmAreaFormList.Count - 1 do
  begin;
    TfmMapArmAreaState(ArmAreaFormList.Objects[i]).ParentTop := Value;
  end;
end;

procedure TfmMapArmAreaMonitoring.ShowDockableWindows;
var
  i : integer;
  DockWindow : TfmMapArmAreaState;
  DockTapSheet : TTabSheet;
begin
  for i := 0 to ArmAreaFormList.Count - 1 do
  begin;
    DockWindow := TfmMapArmAreaState(ArmAreaFormList.Objects[i]);
    if DockWindow <> nil then
    begin
      DockWindow.ManualDock(PageBuilding,nil,alClient);
      DockWindow.Show;
    end;
    //DockWindow.ManualDock(PageBuilding,DockWindow,alClient);
  end;
  PageBuilding.DockSite := False;
  PageBuilding.ActivePageIndex := 0;
end;

procedure TfmMapArmAreaMonitoring.ShowDockPanel(APanel: TPanel;
  MakeVisible: Boolean; Client: TControl);
begin
  inherited;

end;

function TfmMapArmAreaMonitoring.ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;
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

procedure TfmMapArmAreaMonitoring.CreateDockableWindows;
var
  I: Integer;
  oArmAreaMonitorForm : TfmMapArmAreaState;
  stBuildingCode : string;
begin
  if ArmAreaFormList.Count > 0 then
  begin
    for i := ArmAreaFormList.Count - 1 downto 0 do
      TfmMapArmAreaState(ArmAreaFormList.Objects[i]).Free;
  end;
  ArmAreaFormList.Clear;
  if G_bBuildingMonitoringShow then
  begin
    oArmAreaMonitorForm := TfmMapArmAreaState.Create(nil);
    oArmAreaMonitorForm.FormTYPE := 'BUILDING';
    oArmAreaMonitorForm.Caption := '전체';
    oArmAreaMonitorForm.BuildingCode := '0';
    oArmAreaMonitorForm.fmParent := self;
    ArmAreaFormList.AddObject('BUILDING',oArmAreaMonitorForm);
  end;
  for i := 1 to G_MonitoringBuildingList.Count - 1 do
  begin
    oArmAreaMonitorForm := TfmMapArmAreaState.Create(nil);
    stBuildingCode := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingCode;
    oArmAreaMonitorForm.FormTYPE := 'ALARM';
    oArmAreaMonitorForm.BuildingCode := stBuildingCode ;
    oArmAreaMonitorForm.Caption := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingName;
    oArmAreaMonitorForm.fmParent := self;
    ArmAreaFormList.AddObject(stBuildingCode,oArmAreaMonitorForm);
  end;
end;


procedure TfmMapArmAreaMonitoring.DeviceReload;
var
  i : integer;
begin
  if ArmAreaFormList.Count < 1 then Exit;
  for i := 0 to ArmAreaFormList.Count - 1 do
    TfmMapArmAreaState(ArmAreaFormList.Objects[i]).DeviceReload;
end;

procedure TfmMapArmAreaMonitoring.DoorChangeEvent(aNodeNo, aEcuID, aType, aNo,
  aCmd, aData, aBuildingCode: string);
var
  nIndex : integer;
  stBuildingCode : string;
begin
  stBuildingCode := '0'; //전체
  nIndex := ArmAreaFormList.IndexOf(stBuildingCode);
  if nIndex > -1 then
  begin
    TfmMapArmAreaState(ArmAreaFormList.Objects[nIndex]).DoorChangeEvent(aNodeNo, aEcuID, aType, aNo,aCmd, aData,aBuildingCode);
  end;
  if Length(aBuildingCode) < (G_nBuildingCodeLength + 1) then Exit;
  stBuildingCode := copy(aBuildingCode,1,1 + G_nBuildingCodeLength);
  nIndex := ArmAreaFormList.IndexOf(stBuildingCode);
  if nIndex > -1 then
  begin
    TfmMapArmAreaState(ArmAreaFormList.Objects[nIndex]).DoorChangeEvent(aNodeNo, aEcuID, aType, aNo,aCmd, aData,aBuildingCode);
  end;
end;

procedure TfmMapArmAreaMonitoring.FontSetting;
begin
  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);

end;

procedure TfmMapArmAreaMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i : integer;
begin
  if ArmAreaFormList.Count > 0 then
  begin
    for i := ArmAreaFormList.Count - 1 downto 0 do
    begin
      TfmMapArmAreaState(ArmAreaFormList.Objects[i]).Close;
      TfmMapArmAreaState(ArmAreaFormList.Objects[i]).Free;
    end;
  end;

  if TabList.Count > 0 then
  begin
    for i := TabList.Count - 1 downto 0 do
    begin
      TTabSheet(TabList.Objects[i]).Free;
    end;
  end;

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

procedure TfmMapArmAreaMonitoring.FormCreate(Sender: TObject);
begin
  self.ModuleID := 'TfmBuildingArmAreaMonitoring';
  TabList := TStringList.Create;
  ArmAreaFormList := TStringList.Create;
  FontSetting;

end;

procedure TfmMapArmAreaMonitoring.ArmAreaCurrentAlarmStateChange(aNodeNo,
  aEcuID, aArmAreaNo, aAlarmState, aBuildingCode: string);
var
  nIndex : integer;
  stBuildingCode : string;
begin
  stBuildingCode := '0'; //전체
  nIndex := ArmAreaFormList.IndexOf(stBuildingCode);
  if nIndex > -1 then
  begin
    TfmMapArmAreaState(ArmAreaFormList.Objects[nIndex]).ArmAreaCurrentAlarmStateChange(aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode);
  end;
  if Length(aBuildingCode) < (G_nBuildingCodeLength + 1) then Exit;
  stBuildingCode := copy(aBuildingCode,1,1 + G_nBuildingCodeLength);
  nIndex := ArmAreaFormList.IndexOf(stBuildingCode);
  if nIndex > -1 then
  begin
    TfmMapArmAreaState(ArmAreaFormList.Objects[nIndex]).ArmAreaCurrentAlarmStateChange(aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode);
  end;
end;

procedure TfmMapArmAreaMonitoring.ArmAreaSecurityModeChange(aNodeNo,
  aEcuID, aArmAreaNo, aMode, aBuildingCode: string);
var
  nIndex : integer;
  stBuildingCode : string;
begin
  stBuildingCode := '0'; //전체
  nIndex := ArmAreaFormList.IndexOf(stBuildingCode);
  if nIndex > -1 then
  begin
    TfmMapArmAreaState(ArmAreaFormList.Objects[nIndex]).ArmAreaSecurityModeChange(aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode);
  end;
  if Length(aBuildingCode) < (G_nBuildingCodeLength + 1) then Exit;
  stBuildingCode := copy(aBuildingCode,1,1 + G_nBuildingCodeLength);
  nIndex := ArmAreaFormList.IndexOf(stBuildingCode);
  if nIndex > -1 then
  begin
    TfmMapArmAreaState(ArmAreaFormList.Objects[nIndex]).ArmAreaSecurityModeChange(aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode);
  end;
end;

procedure TfmMapArmAreaMonitoring.BuildingAlarmStateChange(
  aBuildingCode: string; aAlarmState: integer);
var
  nIndex : integer;
  stBuildingCode : string;
begin
  stBuildingCode := 'BUILDING'; //전체
  nIndex := ArmAreaFormList.IndexOf(stBuildingCode);
  if nIndex < 0 then Exit;
  TfmMapArmAreaState(ArmAreaFormList.Objects[nIndex]).BuildingAlarmStateChange(aBuildingCode,aAlarmState);
end;

procedure TfmMapArmAreaMonitoring.BuildingSecurityModeChange(
  aBuildingCode: string; aMode: integer);
var
  nIndex : integer;
  stBuildingCode : string;
begin
  stBuildingCode := 'BUILDING'; //전체
  nIndex := ArmAreaFormList.IndexOf(stBuildingCode);
  if nIndex < 0 then Exit;
  TfmMapArmAreaState(ArmAreaFormList.Objects[nIndex]).BuildingSecurityModeChange(aBuildingCode,aMode);
end;

procedure TfmMapArmAreaMonitoring.CMDockClient(var Message: TCMDockClient);
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

procedure TfmMapArmAreaMonitoring.WMNCLButtonDown(var Msg: TMessage);
begin
  inherited;
  // This event happen when mouse click in caption
  // save initial window position
  FUndockedLeft:= Left;
  FUndockedTop:= Top;
end;

end.
