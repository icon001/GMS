unit uSecurityMonitoring;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls,System.IniFiles,
  uDeviceState,uSecurityMonitoringEvent,uArmModeChangeEmployeeInfo,uBuildingArmAreaMonitoring,
  AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers, Vcl.Imaging.pngimage;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalPosiImageIndex = 1;

type
  TfmSecurityMonitoring = class(TfmASubForm)
    menuTab: TAdvOfficeTabSet;
    MenuImageList16: TImageList;
    LeftDockPanel: TPanel;
    LeftSplitter: TSplitter;
    BottomDockPanel: TPanel;
    BottomSplitter: TSplitter;
    RightDockPanel: TPanel;
    RightSplitter: TSplitter;
    CenterDockPanel: TPanel;
    TopDockPanel: TPanel;
    TopSplitter: TSplitter;
    pm_FormMenu: TPopupMenu;
    pm_Screen: TMenuItem;
    pm_Screen1: TMenuItem;
    Panel1: TPanel;
    pm_Screen2: TMenuItem;
    pm_Screen3: TMenuItem;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure menuTabChange(Sender: TObject);
    procedure LeftDockPanelDockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
    procedure LeftDockPanelDockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure LeftDockPanelGetSiteInfo(Sender: TObject; DockClient: TControl;
      var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
    procedure LeftDockPanelUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure pm_Screen1Click(Sender: TObject);
    procedure pm_Screen2Click(Sender: TObject);
    procedure BottomDockPanelDockOver(Sender: TObject; Source: TDragDockObject;
      X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure pm_Screen3Click(Sender: TObject);
    procedure LeftDockPanelResize(Sender: TObject);
    procedure CenterDockPanelResize(Sender: TObject);
    procedure RightDockPanelResize(Sender: TObject);
    procedure BottomDockPanelResize(Sender: TObject);
  private
    DockDeviceState : TfmDeviceState;
    DockSecurityEvent : TfmSecurityMonitoringEvent;
    DockArmModeChangeEmployeeInfo : TfmArmModeChangeEmployeeInfo;
    DockBuildingArmAreaMonitoring : TfmBuildingArmAreaMonitoring;
    L_bDeviceDocking : Boolean;
    L_bDoorDocking : Boolean;
    L_bEmployeeDocking : Boolean;
    L_bEventDocking : Boolean;
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
    L_nAccessEmployeeWidth : integer;
    L_nAccessEventHeigh : integer;
    L_nDeviceStateWidth : integer;

    L_nLeftDockPanelVisible : integer;
    L_nLeftDockPanelWidth : integer;
    L_nRightDockPanelVisible : integer;
    L_nRightDockPanelWidth : integer;
    L_nTopDockPanelVisible : integer;
    L_nTopDockPanelHeigh : integer;
    L_nBottomDockPanelVisible : integer;
    L_nBottomDockPanelHeigh : integer;

    procedure FormNameSetting;
    procedure FontSetting;
  private
    { Private declarations }
    procedure ArmModeChangeEmployeeInfoFormCreate;
    procedure ArmModeChangeEmployeeInfoFormShow;
    procedure SecurityEventFormCreate;
    procedure SecurityEventFormShow;
    procedure BuildingDoorMonitoringFormCreate;
    procedure BuildingDoorMonitoringFormShow;
    procedure CreateDockableWindows;
    procedure DestroyDockableWindows;
    procedure DeviceStateFormCreate;
    procedure DeviceStateFormShow;
  public
    procedure ArmAreaCurrentAlarmStateChange(aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure BuildingAlarmStateChange(aBuildingCode:string;aAlarmState: integer);
    procedure BuildingSecurityModeChange(aBuildingCode:string;aMode : integer);
    procedure RcvDeviceConnectedChangeEvent(aNodeNo,aEcuID,aData:string);
    procedure RcvNodeConnectedChangeEvent(aNodeNo,aEcuID,aData:string);
    procedure DeviceAlarmEvent(aNodeNo, aECUID,aExtendID, aCmd,aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
                          aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor:string);
    procedure DeviceCardAccessEvent(aTime,aNodeNo, aEcuID,aDoorNo, aReaderNo, aInOut,aInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,
                          aAccessPermitName,aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName:string);
    procedure DeviceReload;
    procedure DoorChangeEvent(aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
    procedure SecurityEventClear;
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
    procedure ShowDockPanel(APanel: TPanel; MakeVisible: Boolean; Client: TControl);override;
  end;

var
  fmSecurityMonitoring: TfmSecurityMonitoring;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uFormVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uDBDelete,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmSecurityMonitoring.ArmAreaCurrentAlarmStateChange(aNodeNo, aEcuID,
  aArmAreaNo, aAlarmState, aBuildingCode: string);
begin
  //방범 이벤트
  if DockBuildingArmAreaMonitoring = nil then Exit;
  DockBuildingArmAreaMonitoring.ArmAreaCurrentAlarmStateChange(aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode);
end;

procedure TfmSecurityMonitoring.ArmAreaSecurityModeChange(aNodeNo, aEcuID,
  aArmAreaNo, aMode, aBuildingCode: string);
begin
  //방범 모드 변경 이벤트
  if DockBuildingArmAreaMonitoring = nil then Exit;
  DockBuildingArmAreaMonitoring.ArmAreaSecurityModeChange(aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode);
end;

procedure TfmSecurityMonitoring.ArmModeChangeEmployeeInfoFormCreate;
begin
  DockArmModeChangeEmployeeInfo := TfmArmModeChangeEmployeeInfo.Create(Application);
  DockArmModeChangeEmployeeInfo.fmParent := self;
end;

procedure TfmSecurityMonitoring.ArmModeChangeEmployeeInfoFormShow;
begin
  //If form is docked to one of the "hidden" docking panels, resize the
  //panel and re-show the docked form.
  if (DockArmModeChangeEmployeeInfo.HostDockSite is TPanel) then
  begin
    if ((DockArmModeChangeEmployeeInfo.HostDockSite.Height = 0) or (DockArmModeChangeEmployeeInfo.HostDockSite.Width = 0)) then
      ShowDockPanel(DockArmModeChangeEmployeeInfo.HostDockSite as TPanel, True, DockArmModeChangeEmployeeInfo)
    else
    begin
      DockArmModeChangeEmployeeInfo.ManualDock(RightDockPanel,nil,alClient);
      DockArmModeChangeEmployeeInfo.Show;
    end;
  end
  else   //if the window isn't docked at all, simply show it.
  begin
    DockArmModeChangeEmployeeInfo.ManualDock(RightDockPanel,nil,alClient);
    DockArmModeChangeEmployeeInfo.Show;
  end;
  //DockArmModeChangeEmployeeInfo.ManualDock(RightDockPanel,DockArmModeChangeEmployeeInfo,alLeft);
  RightDockPanel.DockSite := False;
  L_bEmployeeDocking := True;
  pm_Screen3.Checked := True;
end;

procedure TfmSecurityMonitoring.SecurityEventClear;
begin
  if DockSecurityEvent = nil then Exit;
  DockSecurityEvent.SecurityEventClear;
end;

procedure TfmSecurityMonitoring.SecurityEventFormCreate;
begin
  DockSecurityEvent := TfmSecurityMonitoringEvent.Create(Application);
  DockSecurityEvent.fmParent := self;
end;

procedure TfmSecurityMonitoring.SecurityEventFormShow;
begin
  //If form is docked to one of the "hidden" docking panels, resize the
  //panel and re-show the docked form.
  if (DockSecurityEvent.HostDockSite is TPanel) then
  begin
    if ((DockSecurityEvent.HostDockSite.Height = 0) or (DockSecurityEvent.HostDockSite.Width = 0)) then
      ShowDockPanel(DockSecurityEvent.HostDockSite as TPanel, True, DockSecurityEvent)
    else
    begin
      DockSecurityEvent.ManualDock(BottomDockPanel,nil,alClient);
      DockSecurityEvent.Show;
    end;
  end
  else   //if the window isn't docked at all, simply show it.
  begin
    DockSecurityEvent.ManualDock(BottomDockPanel,nil,alClient);
    DockSecurityEvent.Show;
  end;
  //DockSecurityEvent.ManualDock(BottomDockPanel,DockSecurityEvent,alLeft);
  BottomDockPanel.DockSite := False;
  L_bEventDocking := True;
  pm_Screen2.Checked := True;
end;

procedure TfmSecurityMonitoring.BottomDockPanelDockOver(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := Source.Control is TForm;
  if Accept then
  begin
    //Modify the DockRect to preview dock area.
    ARect.TopLeft := BottomDockPanel.ClientToScreen(
      Point(0, -L_nAccessEventHeigh));
    ARect.BottomRight := BottomDockPanel.ClientToScreen(
      Point(BottomDockPanel.Width, BottomDockPanel.Height));
    Source.DockRect := ARect;
  end;

end;

procedure TfmSecurityMonitoring.BottomDockPanelResize(Sender: TObject);
begin
  inherited;
  if Not L_bEmployeeDocking then Exit;

  BottomDockPanel.DockSite := True;

  if BottomDockPanel.Height > 10 then
     L_nAccessEventHeigh := BottomDockPanel.Height;
  BottomDockPanel.DockSite := False;
end;

procedure TfmSecurityMonitoring.BuildingAlarmStateChange(aBuildingCode: string;
  aAlarmState: integer);
begin
  //방범 이벤트 변경
  if DockBuildingArmAreaMonitoring = nil then Exit;
  DockBuildingArmAreaMonitoring.BuildingAlarmStateChange(aBuildingCode,aAlarmState);

end;

procedure TfmSecurityMonitoring.BuildingDoorMonitoringFormCreate;
begin
  DockBuildingArmAreaMonitoring := TfmBuildingArmAreaMonitoring.Create(Application);
  DockBuildingArmAreaMonitoring.fmParent := self;
end;

procedure TfmSecurityMonitoring.BuildingDoorMonitoringFormShow;
begin
  //If form is docked to one of the "hidden" docking panels, resize the
  //panel and re-show the docked form.
  if (DockBuildingArmAreaMonitoring.HostDockSite is TPanel) then
  begin
    if ((DockBuildingArmAreaMonitoring.HostDockSite.Height = 0) or (DockBuildingArmAreaMonitoring.HostDockSite.Width = 0)) then
      ShowDockPanel(DockBuildingArmAreaMonitoring.HostDockSite as TPanel, True, DockBuildingArmAreaMonitoring)
    else
    begin
      DockBuildingArmAreaMonitoring.ManualDock(CenterDockPanel,nil,alClient);
      DockBuildingArmAreaMonitoring.Show;
    end;
  end
  else   //if the window isn't docked at all, simply show it.
  begin
    DockBuildingArmAreaMonitoring.ManualDock(CenterDockPanel,nil,alClient);
    DockBuildingArmAreaMonitoring.Show;
  end;
  //DockBuildingArmAreaMonitoring.ManualDock(CenterDockPanel,DockBuildingArmAreaMonitoring,alLeft);
  CenterDockPanel.DockSite := False;
  L_bDoorDocking := True;
end;

procedure TfmSecurityMonitoring.BuildingSecurityModeChange(
  aBuildingCode: string; aMode: integer);
begin
  //방범 모드 변경 이벤트
  if DockBuildingArmAreaMonitoring = nil then Exit;
  DockBuildingArmAreaMonitoring.BuildingSecurityModeChange(aBuildingCode,aMode);

end;

procedure TfmSecurityMonitoring.CenterDockPanelResize(Sender: TObject);
begin
  inherited;
  if Not L_bDoorDocking then Exit;

  CenterDockPanel.DockSite := True;
  //CenterDockPanel.DockManager.ResetBounds(True);
  CenterDockPanel.DockSite := False;
end;

procedure TfmSecurityMonitoring.CreateDockableWindows;
begin
  DeviceStateFormCreate;
  SecurityEventFormCreate;
  ArmModeChangeEmployeeInfoFormCreate;
  BuildingDoorMonitoringFormCreate;
end;

procedure TfmSecurityMonitoring.DestroyDockableWindows;
begin
  if DockDeviceState <> nil then DockDeviceState.Close;
  DockDeviceState.Free;
  if DockSecurityEvent <> nil then DockSecurityEvent.Close;
  DockSecurityEvent.Free;
  if DockArmModeChangeEmployeeInfo <> nil then DockArmModeChangeEmployeeInfo.Close;
  DockArmModeChangeEmployeeInfo.Free;
  if DockBuildingArmAreaMonitoring <> nil then DockBuildingArmAreaMonitoring.Close;
  DockBuildingArmAreaMonitoring.Free;
end;

procedure TfmSecurityMonitoring.DeviceAlarmEvent(aNodeNo, aECUID,aExtendID, aCmd, aMsgNo,
  aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor: string);
begin
  if DockSecurityEvent <> nil then
  begin
    DockSecurityEvent.DeviceAlarmEvent(aNodeNo, aECUID,aExtendID, aCmd, aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
                      aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor);
  end;
  if DockArmModeChangeEmployeeInfo <> nil then
  begin
    DockArmModeChangeEmployeeInfo.DeviceAlarmEvent(aNodeNo, aECUID,aExtendID, aCmd, aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
                      aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor);
  end;
end;

procedure TfmSecurityMonitoring.DeviceCardAccessEvent(aTime,aNodeNo, aEcuID, aDoorNo,
  aReaderNo, aInOut,aInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,aAccessPermitName,
  aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,
  aEmCode, aEmName,aPosiCode,aPosiName: string);
begin

  if DockArmModeChangeEmployeeInfo <> nil then
  begin
    DockArmModeChangeEmployeeInfo.DeviceCardAccessEvent(aTime,aNodeNo, aEcuID, aDoorNo,aReaderNo, aInOut,aInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,
                    aAccessPermitName,aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName);
  end;

end;

procedure TfmSecurityMonitoring.DeviceReload;
begin
  if DockBuildingArmAreaMonitoring = nil then Exit;
     DockBuildingArmAreaMonitoring.DeviceReload;
end;

procedure TfmSecurityMonitoring.DeviceStateFormCreate;
begin
  DockDeviceState := TfmDeviceState.Create(Application);
  DockDeviceState.fmParent := self;
end;

procedure TfmSecurityMonitoring.DeviceStateFormShow;
begin
  //If form is docked to one of the "hidden" docking panels, resize the
  //panel and re-show the docked form.
  if (DockDeviceState.HostDockSite is TPanel) and
    ((DockDeviceState.HostDockSite.Height = 0) or (DockDeviceState.HostDockSite.Width = 0)) then
    ShowDockPanel(DockDeviceState.HostDockSite as TPanel, True, DockDeviceState)
  else
  begin
    //if the window isn't docked at all, simply show it.
    DockDeviceState.ManualDock(LeftDockPanel,nil,alClient);
    DockDeviceState.Show;
  end;
  //DockDeviceState.ManualDock(LeftDockPanel,DockDeviceState,alBottom);
  DockDeviceState.DockSite := False;
  L_bDeviceDocking := True;
  pm_Screen1.Checked := True;
end;

procedure TfmSecurityMonitoring.DoorChangeEvent(aNodeNo, aEcuID, aType, aNo, aCmd,
  aData, aBuildingCode: string);
begin
  if DockBuildingArmAreaMonitoring = nil then Exit;
  DockBuildingArmAreaMonitoring.DoorChangeEvent(aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode);
end;

procedure TfmSecurityMonitoring.FontSetting;
begin
  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
end;

procedure TfmSecurityMonitoring.FormChangeEvent(aNumber: integer);
begin

end;

procedure TfmSecurityMonitoring.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini_fun : TiniFile;
begin
  inherited;
  fmMain.FORMENABLE(con_FormBMOSSECURITYMONITOR,'FALSE');

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\SecurityMonitoring.INI');
    with ini_fun do
    begin
      if LeftDockPanel.Visible and (LeftDockPanel.Width <> 0) then
      begin
        WriteInteger('Form','LeftDockPanelVisible',1);
        WriteInteger('Form','LeftDockPanelWidth',LeftDockPanel.Width);
      end else
      begin
        WriteInteger('Form','LeftDockPanelVisible',0);
      end;
      if RightDockPanel.Visible and (RightDockPanel.Width <> 0) then
      begin
        WriteInteger('Form','RightDockPanelVisible',1);
        WriteInteger('Form','RightDockPanelWidth',RightDockPanel.Width);
      end else
      begin
        WriteInteger('Form','RightDockPanelVisible',0);
      end;
      if TopDockPanel.Visible and (TopDockPanel.Height <> 0) then
      begin
        WriteInteger('Form','TopDockPanelVisible',1);
        WriteInteger('Form','TopDockPanelHeight',TopDockPanel.Height);
      end else
      begin
        WriteInteger('Form','TopDockPanelVisible',0);
      end;
      if BottomDockPanel.Visible and (BottomDockPanel.Height <> 0) then
      begin
        WriteInteger('Form','BottomDockPanelVisible',1);
        WriteInteger('Form','BottomDockPanelHeight',BottomDockPanel.Height);
      end else
      begin
        WriteInteger('Form','BottomDockPanelVisible',0);
      end;
    end;
  Finally
    ini_fun.Free;
  End;

  DestroyDockableWindows;

  Action := caFree;
end;

procedure TfmSecurityMonitoring.FormCreate(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  inherited;
  TopDockPanel.Height := 0;
  LeftDockPanel.Width := 0;
  RightDockPanel.Width := 0;
  BottomDockPanel.Height := 0;

  L_nDeviceStateWidth := 200;
  L_nAccessEmployeeWidth := 200;
  L_nAccessEventHeigh := 150;
  CreateDockableWindows;

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\SecurityMonitoring.INI');
    with ini_fun do
    begin
      L_nLeftDockPanelVisible := ReadInteger('Form','LeftDockPanelVisible',1);
      L_nLeftDockPanelWidth := ReadInteger('Form','LeftDockPanelWidth',200);
      L_nDeviceStateWidth := L_nLeftDockPanelWidth;

      L_nRightDockPanelVisible := ReadInteger('Form','RightDockPanelVisible',1);
      L_nRightDockPanelWidth := ReadInteger('Form','RightDockPanelWidth',200);
      L_nAccessEmployeeWidth := L_nRightDockPanelWidth;

      L_nTopDockPanelVisible := ReadInteger('Form','TopDockPanelVisible',1);
      L_nTopDockPanelHeigh := ReadInteger('Form','TopDockPanelHeight',0);

      L_nBottomDockPanelVisible := ReadInteger('Form','BottomDockPanelVisible',1);
      L_nBottomDockPanelHeigh := ReadInteger('Form','BottomDockPanelHeight',150);
      L_nAccessEventHeigh := L_nBottomDockPanelHeigh;

    end;
  Finally
    ini_fun.Free;
  End;
  FontSetting;
end;

procedure TfmSecurityMonitoring.FormGradeRefresh;
begin
(*  if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
  pmAddCode.Enabled := IsInsertGrade;
  pm_DeleteCode.Enabled := IsDeleteGrade;
  pm_UpdateCode.Enabled := IsUpdateGrade;   *)
  if DockBuildingArmAreaMonitoring <> nil then
  begin
    DockBuildingArmAreaMonitoring.IsInsertGrade := IsInsertGrade;
    DockBuildingArmAreaMonitoring.IsDeleteGrade := IsDeleteGrade;
    DockBuildingArmAreaMonitoring.IsUpdateGrade := IsUpdateGrade;
  end;
end;

procedure TfmSecurityMonitoring.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmSecurityMonitoring.FormNameSetting;
var
  stSql : string;
  nCommonLength : integer;
  nButtonLength : integer;
  nMenuLength : integer;
  TempAdoQuery : TADOQuery;
begin
  nButtonLength := length('BUTTON');
  nCommonLength := length('COMMON');
  nMenuLength := length(L_stMenuID);
  stSql := ' Select FN_NAMECODE,FN_NAME' + inttostr(G_nFormLanguageType) + ' AS FORMNAME from TB_FORMNAME ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND (FN_PROGRAMGUBUN = ''0'' or FN_PROGRAMGUBUN = ''2'' )'; //프로그램그룹
  stSql := stSql + ' AND FN_MENUGUBUN = ''2'' '; //화면
  if G_nDBType = MSSQL then
  begin
    stSql := stSql + ' AND ( substring(FN_NAMECODE,1,' + inttostr(nCommonLength) + ') = ''COMMON'' ';
    stSql := stSql + ' OR substring(FN_NAMECODE,1,' + inttostr(nButtonLength) + ') = ''BUTTON'' ';
    stSql := stSql + ' OR substring(FN_NAMECODE,1,' + inttostr(nMenuLength) + ') = ''' + L_stMenuID + ''') ';
  end else if G_nDBType = POSTGRESQL then
  begin
    stSql := stSql + ' AND (substr(FN_NAMECODE,1,' + inttostr(nCommonLength) + ') = ''COMMON'' ';
    stSql := stSql + ' OR substr(FN_NAMECODE,1,' + inttostr(nButtonLength) + ') = ''BUTTON'' ';
    stSql := stSql + ' OR substr(FN_NAMECODE,1,' + inttostr(nMenuLength) + ') = ''' + L_stMenuID + ''') ';
  end else if G_nDBType = MDB then
  begin
    stSql := stSql + ' AND (LEFT(FN_NAMECODE,' + inttostr(nCommonLength) + ') = ''COMMON'' ';
    stSql := stSql + ' OR LEFT(FN_NAMECODE,' + inttostr(nButtonLength) + ') = ''BUTTON'' ';
    stSql := stSql + ' OR LEFT(FN_NAMECODE,' + inttostr(nMenuLength) + ') = ''' + L_stMenuID + ''') ';
  end else if G_nDBType = FIREBIRD then
  begin
    stSql := stSql + ' AND (substring(FN_NAMECODE From 1 for ' + inttostr(nCommonLength) + ') = ''COMMON'' ';
    stSql := stSql + ' OR substring(FN_NAMECODE From 1 for ' + inttostr(nButtonLength) + ') = ''BUTTON'' ';
    stSql := stSql + ' OR substring(FN_NAMECODE From 1 for ' + inttostr(nMenuLength) + ') = ''' + L_stMenuID + ''') ';
  end;
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
      while Not Eof do
      begin
        if FindField('FN_NAMECODE').AsString = 'BUTTONMENU001' then
        begin
          menuTab.AdvOfficeTabs[0].Caption := FindField('FORMNAME').AsString;
          L_stButtonCloseCaption := FindField('FORMNAME').AsString;
        end else if FindField('FN_NAMECODE').AsString = 'BM3_012cap001' then
        begin
          menuTab.AdvOfficeTabs[1].Caption := FindField('FORMNAME').AsString;
//          List.Caption.Text := FindField('FORMNAME').AsString;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmSecurityMonitoring.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSSECURITYMONITOR,'TRUE');

  menuTab.ActiveTabIndex := 1;
  menuTabChange(self);
  DeviceStateFormShow;
  if L_nLeftDockPanelVisible = 0 then
  begin
    ShowDockPanel(DockDeviceState.HostDockSite as TPanel, False, DockDeviceState);
    pm_Screen1.Checked := False;
  end;
  SecurityEventFormShow;
  if L_nBottomDockPanelVisible = 0 then
  begin
    ShowDockPanel(DockSecurityEvent.HostDockSite as TPanel, False, DockSecurityEvent);
    pm_Screen2.Checked := False;
  end;
  ArmModeChangeEmployeeInfoFormShow;
  if L_nRightDockPanelVisible = 0 then
  begin
    ShowDockPanel(DockArmModeChangeEmployeeInfo.HostDockSite as TPanel, False, DockArmModeChangeEmployeeInfo);
    pm_Screen3.Checked := False;
  end;

  BuildingDoorMonitoringFormShow;
end;

procedure TfmSecurityMonitoring.Form_Close;
begin
  Close;
end;


procedure TfmSecurityMonitoring.LeftDockPanelDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);
begin
  inherited;
  //OnDockDrop gets called AFTER the client has actually docked,
  //so we check for DockClientCount = 1 before making the dock panel visible.
  Try
    if (Sender as TPanel).DockClientCount = 1 then
      ShowDockPanel(Sender as TPanel, True, nil);

    if (Sender as TPanel).DockManager <> nil then
      (Sender as TPanel).DockManager.ResetBounds(True);
  Except

  End;
  //Make DockManager repaints it's clients.
end;

procedure TfmSecurityMonitoring.LeftDockPanelDockOver(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := Source.Control is TForm;
  if Accept then
  begin
    //Modify the DockRect to preview dock area.
    ARect.TopLeft := LeftDockPanel.ClientToScreen(Point(0, 0));
//    ARect.BottomRight := LeftDockPanel.ClientToScreen(Point(Self.ClientWidth div 3, LeftDockPanel.Height));
    ARect.BottomRight := LeftDockPanel.ClientToScreen(Point(L_nDeviceStateWidth, LeftDockPanel.Height));
    Source.DockRect := ARect;
  end;
end;

procedure TfmSecurityMonitoring.LeftDockPanelGetSiteInfo(Sender: TObject;
  DockClient: TControl; var InfluenceRect: TRect; MousePos: TPoint;
  var CanDock: Boolean);
begin
  inherited;
  //if CanDock is true, the panel will not automatically draw the preview rect.
  CanDock := DockClient is TForm;
end;

procedure TfmSecurityMonitoring.LeftDockPanelResize(Sender: TObject);
begin
  inherited;
  if Not L_bDeviceDocking then Exit;

  LeftDockPanel.DockSite := True;

  if LeftDockPanel.Width > 10 then
     L_nDeviceStateWidth := LeftDockPanel.Width;
  LeftDockPanel.DockSite := False;
end;

procedure TfmSecurityMonitoring.LeftDockPanelUnDock(Sender: TObject;
  Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
begin
  inherited;
  //OnUnDock gets called BEFORE the client is undocked, in order to optionally
  //disallow the undock. DockClientCount is never 0 when called from this event.
  if ((Sender as TPanel).DockClientCount = 1) then
    ShowDockPanel(Sender as TPanel, False, nil);
end;

procedure TfmSecurityMonitoring.menuTabChange(Sender: TObject);
begin
  inherited;
  if menuTab.ActiveTabIndex = 0 then //Ȩ
  begin
    if menuTab.AdvOfficeTabs.Items[0].Caption = L_stButtonCloseCaption then Close
    else
    begin
      menuTab.ActiveTabIndex := 1;
      menuTabChange(self);
    end;
  end;
end;

procedure TfmSecurityMonitoring.pm_Screen1Click(Sender: TObject);
begin
  inherited;
  pm_Screen1.Checked := Not pm_Screen1.Checked;
  if Not pm_Screen1.Checked then ShowDockPanel(DockDeviceState.HostDockSite as TPanel, False, DockDeviceState)
  else DeviceStateFormShow;
end;

procedure TfmSecurityMonitoring.pm_Screen2Click(Sender: TObject);
begin
  inherited;
  pm_Screen2.Checked := Not pm_Screen2.Checked;
  if Not pm_Screen2.Checked then ShowDockPanel(DockSecurityEvent.HostDockSite as TPanel, False, DockSecurityEvent)
  else SecurityeventFormShow;

end;

procedure TfmSecurityMonitoring.pm_Screen3Click(Sender: TObject);
begin
  inherited;
  pm_Screen3.Checked := Not pm_Screen3.Checked;
  if Not pm_Screen3.Checked then ShowDockPanel(DockArmModeChangeEmployeeInfo.HostDockSite as TPanel, False, DockArmModeChangeEmployeeInfo)
  else ArmModeChangeEmployeeInfoFormShow;

end;

procedure TfmSecurityMonitoring.RcvDeviceConnectedChangeEvent(aNodeNo, aEcuID,
  aData: string);
begin
  if DockDeviceState = nil then Exit;
  DockDeviceState.RcvDeviceConnectedChangeEvent(aNodeNo,aEcuID,aData);
end;

procedure TfmSecurityMonitoring.RcvNodeConnectedChangeEvent(aNodeNo, aEcuID,
  aData: string);
begin
  if DockDeviceState = nil then Exit;
  DockDeviceState.RcvNodeConnectedChangeEvent(aNodeNo,aEcuID,aData);
end;

procedure TfmSecurityMonitoring.RightDockPanelResize(Sender: TObject);
begin
  inherited;
  if Not L_bEmployeeDocking then Exit;

  RightDockPanel.DockSite := True;

  if RightDockPanel.Width > 10 then
    L_nAccessEmployeeWidth := RightDockPanel.Width;
  RightDockPanel.DockSite := False;
end;

procedure TfmSecurityMonitoring.ShowDockPanel(APanel: TPanel;
  MakeVisible: Boolean; Client: TControl);
begin
  //Client - the docked client to show if we are re-showing the panel.
  //Client is ignored if hiding the panel.

  //Since docking to a non-visible docksite isn't allowed, instead of setting
  //Visible for the panels we set the width to zero. The default InfluenceRect
  //for a control extends a few pixels beyond it's boundaries, so it is possible
  //to dock to zero width controls.

  //Don't try to hide a panel which has visible dock clients.
  if not MakeVisible and (APanel.VisibleDockClientCount > 1) then
    Exit;

  //APanel.Visible := MakeVisible;
  if APanel = LeftDockPanel then
    LeftSplitter.Visible := MakeVisible;

  if MakeVisible then
  begin
    if APanel = LeftDockPanel then
    begin
      APanel.Width := L_nDeviceStateWidth;//ClientWidth div 3;
      LeftSplitter.Left := APanel.Width + LeftSplitter.Width;
    end else if APanel = RightDockPanel then
    begin
      APanel.Width := L_nAccessEmployeeWidth;//ClientWidth div 3;
      RightSplitter.Left := APanel.Width - RightSplitter.Width;
    end else if APanel = BottomDockPanel then
    begin
      APanel.Height := L_nAccessEventHeigh;
      BottomSplitter.Top := ClientHeight - APanel.Height - BottomSplitter.Width;
    end;
  end else
  begin
    if APanel = LeftDockPanel then
    begin
      APanel.Width := 0;
      pm_Screen1.Checked := False;
    end else if APanel = RightDockPanel then
    begin
      APanel.Width := 0;
      pm_Screen3.Checked := False;
    end else if APanel = BottomDockPanel then
    begin
      APanel.Height := 0;
      pm_Screen2.Checked := False;
    end;
    //센터에 있는 놈의 크기를 조절하자.
  end;
  if L_bDoorDocking then
  begin
    CenterDockPanel.DockSite := True;
    //CenterDockPanel.DockManager.ResetBounds(True);
    CenterDockPanel.DockSite := False;
  end;
  if MakeVisible and (Client <> nil) then
    Client.Show;
end;

initialization
  RegisterClass(TfmSecurityMonitoring);
Finalization
  UnRegisterClass(TfmSecurityMonitoring);

end.
