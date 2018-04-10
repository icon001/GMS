unit uMonitoring;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, AdvOfficePager,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvAppStyler, AdvOfficePagerStylers,
  AdvSmoothPanel, Vcl.ExtCtrls, AdvSplitter, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Menus, Vcl.ImgList, uSubForm, CommandArray,Winapi.ShellAPI,
  AdvSmoothButton, Vcl.Imaging.pngimage,System.IniFiles, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, AdvPageControl,Vcl.Clipbrd, Vcl.Buttons, AdvListV;

const
  //con_AlarmStateNotEvent = -1;
  //con_AlarmStateNormalEvent = 0;
  //con_AlarmStateAlarmEvent = 1;
  //con_TEST = 0;

  con_ArmAreaImageNothing = 0;
  con_ArmAreaNormalImageDisArm = 1;
  con_ArmAreaNormalImagePartArm = 2;
  con_ArmAreaNormalImageArm = 3;
  con_ArmAreaEventImageDisArm = 4;
  con_ArmAreaEventImagePartArm = 5;
  con_ArmAreaEventImageArm = 6;
  con_ArmAreaAlarmImageDisArm = 7;
  con_ArmAreaAlarmImagePartArm = 8;
  con_ArmAreaAlarmImageArm = 9;

  con_BuildingArmAreaImageNothing = 0;
  con_BuildingArmAreaNormalImageDisArm = 1;
  con_BuildingArmAreaNormalImagePartArm = 2;
  con_BuildingArmAreaNormalImageArm = 3;
  con_BuildingArmAreaEventImageDisArm = 4;
  con_BuildingArmAreaEventImagePartArm = 5;
  con_BuildingArmAreaEventImageArm = 6;
  con_BuildingArmAreaAlarmImageDisArm = 7;
  con_BuildingArmAreaAlarmImagePartArm = 8;
  con_BuildingArmAreaAlarmImageArm = 9;

const
  con_LocalNodeAllConnectedImageIndex = 2;
  con_LocalNodeConnectedImageIndex = 1;
  con_LocalNodeDisConnectedImageIndex = 0;

  con_LocalDeviceConnectedImageIndex = 4;
  con_LocalDeviceDisConnectedImageIndex = 3;

  con_LocalServerConnectedImageIndex = 11;
  con_LocalServerDisConnectedImageIndex = 10;

  con_DoorStatePosiManageMode = 0;
  con_DoorStateNegaManageMode = 1;
  con_DoorStateAckManageMode = 3;
  con_DoorStatePosiOpenMode = -1;
  con_DoorStateNegaOpenMode = -1;
  con_DoorStatePosiCloseMode = 2;
  con_DoorStateNegaCloseMode = 2;

  con_DoorImageFire = 4;
  con_DoorImageLongTime = 3;
  con_DoorImageOpen = 1;
  con_DoorImageClose = 0;
  con_DoorImageNothing = 2;
  con_BuildingImage = 5;

const
  LeftSpace = '__  ';

type
  TfmMonitoring = class(TfmASubForm)
    AdvOfficePager1: TAdvOfficePager;
    ap_Access: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    ap_Alarm: TAdvOfficePage;
    pan_Device: TAdvSmoothPanel;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvSplitter1: TAdvSplitter;
    lb_List: TLabel;
    toolslist: TImageList;
    pm_NodeControl: TPopupMenu;
    pm_PingTest: TMenuItem;
    pm_TimeSync: TMenuItem;
    N3: TMenuItem;
    pm_DeviceReset: TMenuItem;
    pm_PermitReSend: TMenuItem;
    MenuImageList16: TImageList;
    pan_AlarmDevice: TAdvSmoothPanel;
    lb_List1: TLabel;
    AdvSplitter2: TAdvSplitter;
    pan_Alarm: TAdvSmoothPanel;
    pan_Access: TAdvSmoothPanel;
    pan_DoorState: TAdvSmoothPanel;
    lb_DoorState: TLabel;
    SmallDoorList: TImageList;
    statelist: TImageList;
    pm_DoorControl: TPopupMenu;
    mn_DoorOpen: TMenuItem;
    N9: TMenuItem;
    pm_JavarOpen: TMenuItem;
    pm_JavarClose: TMenuItem;
    pm_DoorManageMode: TMenuItem;
    pm_DooOpenMode: TMenuItem;
    pm_DoorCloseMode: TMenuItem;
    N1: TMenuItem;
    pm_CardMode: TMenuItem;
    Positive1: TMenuItem;
    Negative1: TMenuItem;
    N6: TMenuItem;
    pm_DoorStateCheck: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    pm_DoorInfo: TMenuItem;
    AdvSplitter3: TAdvSplitter;
    ReSizeTimer: TTimer;
    ActiveTimer: TTimer;
    AdvSmoothPanel2: TAdvSmoothPanel;
    PageControl1: TAdvPageControl;
    tb_AccessEvent: TAdvTabSheet;
    sg_AccessEvent: TAdvStringGrid;
    tb_AccessAlarm: TAdvTabSheet;
    sg_AccessAlarmEvent: TAdvStringGrid;
    PopupMenu3: TPopupMenu;
    mn_CardNOCopy: TMenuItem;
    pan_AlarmState: TAdvSmoothPanel;
    AdvSplitter4: TAdvSplitter;
    AdvSmoothPanel4: TAdvSmoothPanel;
    lb_AlarmState: TLabel;
    stateArmArealist: TImageList;
    SmallArmAreaList: TImageList;
    ArmAreaListView: TListView;
    pan_ArmAreaInfo: TAdvSmoothPanel;
    lb_ArmAreaNodeIP: TLabel;
    lb_ArmAreaDeviceID: TLabel;
    lb_ArmAreaNo1: TLabel;
    lb_ArmAreaPositoin: TLabel;
    Label34: TLabel;
    lb_ArmAreaNo: TLabel;
    Label35: TLabel;
    lb_ArmAreaName1: TLabel;
    lb_ArmAreaName: TLabel;
    lb_ArmAreaTelno1: TLabel;
    lb_TelNo: TLabel;
    lb_ArmAreaMemo: TLabel;
    memo1: TMemo;
    ed_NodeIP: TEdit;
    btn_ArmAreaInfoConfirm: TAdvGlowButton;
    lb_ArmAreaInfo: TLabel;
    pm_AlarmControl: TPopupMenu;
    pm_AlarmConfirm: TMenuItem;
    pm_ArmAreaStateSearch: TMenuItem;
    N4: TMenuItem;
    pm_ArmModeChange: TMenuItem;
    pm_DisArmModeChange: TMenuItem;
    MenuItem2: TMenuItem;
    pm_LargeIcon: TMenuItem;
    pm_SmallICon: TMenuItem;
    MenuItem3: TMenuItem;
    pm_DeviceInfo: TMenuItem;
    MenuItem4: TMenuItem;
    pm_AlarmReport: TMenuItem;
    ap_AlarmEvent: TAdvPageControl;
    tb_AlarmEvent: TAdvTabSheet;
    tb_ArmModeChange: TAdvTabSheet;
    sg_AlarmEvent: TAdvStringGrid;
    sg_ModeChange: TAdvStringGrid;
    pm_AlarmEvent: TPopupMenu;
    mn_AlarmConfirm1: TMenuItem;
    lb_DeviceStateExample: TLabel;
    lb_DoorstateExample: TLabel;
    LargeImageList32: TImageList;
    gb_AlarmStateExample: TGroupBox;
    lb_AlarmState1: TLabel;
    lb_AlarmstateExample: TLabel;
    LargeArmAreaList32: TImageList;
    lb_AlarmDeviceStateExample: TLabel;
    gb_DeviceState1: TGroupBox;
    Image21: TImage;
    lb_NodeState2: TLabel;
    lb_NodeDisConnect2: TLabel;
    Image22: TImage;
    lb_NodeConnect2: TLabel;
    Image23: TImage;
    lb_NodePartConnect2: TLabel;
    lb_DeviceState2: TLabel;
    Image24: TImage;
    lb_DeviceDisconnect2: TLabel;
    Image25: TImage;
    lb_Deviceconnect2: TLabel;
    SpeedButton9: TSpeedButton;
    lb_DisArmMode: TLabel;
    lb_ArmMode: TLabel;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    lb_AlarmEvent: TLabel;
    ap_DoorState: TAdvOfficePager;
    ap_Building: TAdvOfficePage;
    ap_Door: TAdvOfficePage;
    pan_Building: TAdvSmoothPanel;
    lb_Building1: TLabel;
    AdvSmoothPanel3: TAdvSmoothPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    AdvGlowButton1: TAdvGlowButton;
    pm_Building: TPopupMenu;
    mn_BuildingDoorClose: TMenuItem;
    mn_BuildingDoorOpen: TMenuItem;
    doorListView: TListView;
    gb_DoorState: TGroupBox;
    lb_DoorMode: TLabel;
    lb_DoorState1: TLabel;
    GroupBox1: TGroupBox;
    lb_DoorOpen: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    lb_DoorPManager: TLabel;
    SpeedButton3: TSpeedButton;
    lb_DoorNManager: TLabel;
    SpeedButton4: TSpeedButton;
    lb_DoorLock: TLabel;
    GroupBox2: TGroupBox;
    lb_DoorOpenState: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    lb_DoorCloseState: TLabel;
    SpeedButton7: TSpeedButton;
    lb_DoorTimeOver: TLabel;
    SpeedButton8: TSpeedButton;
    lb_DoorFire: TLabel;
    BuildingListView: TListView;
    pm_deviceAlarm: TPopupMenu;
    mn_DeviceAlarmConfirm: TMenuItem;
    ap_ArmAreaState: TAdvOfficePager;
    ap_ArmAreaBuilding: TAdvOfficePage;
    pan_ArmAreaBuilding: TAdvSmoothPanel;
    lb_Building2: TLabel;
    AdvSmoothPanel5: TAdvSmoothPanel;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    AdvGlowButton2: TAdvGlowButton;
    ArmAreaBuildingListView: TListView;
    ap_ArmArea: TAdvOfficePage;
    mn_AllDeviceAlarmClear: TMenuItem;
    mn_AllAlarmEvent: TMenuItem;
    ap_AccessControler: TAdvOfficePager;
    ap_AccessServerState: TAdvOfficePage;
    ap_AccessNode: TAdvOfficePage;
    ap_AccessDevice: TAdvOfficePage;
    gb_DeviceState: TGroupBox;
    Image1: TImage;
    lb_NodeState1: TLabel;
    lb_NodeDisConnect1: TLabel;
    Image2: TImage;
    lb_NodeConnect1: TLabel;
    Image3: TImage;
    lb_NodePartConnect1: TLabel;
    lb_DeviceState1: TLabel;
    Image4: TImage;
    lb_DeviceDisconnect1: TLabel;
    Image5: TImage;
    lb_Deviceconnect1: TLabel;
    sg_AccessServer: TAdvStringGrid;
    sg_AccessNode: TAdvStringGrid;
    ap_AccessDoor: TAdvOfficePage;
    sg_AccessDevice: TAdvStringGrid;
    sg_AccessDoor: TAdvStringGrid;
    ap_AlarmControler: TAdvOfficePager;
    ap_AlarmServer: TAdvOfficePage;
    sg_AlarmServer: TAdvStringGrid;
    ap_AlarmNode: TAdvOfficePage;
    sg_AlarmNode: TAdvStringGrid;
    ap_AlarmDevice: TAdvOfficePage;
    sg_AlarmDevice: TAdvStringGrid;
    ap_AlarmArmArea: TAdvOfficePage;
    sg_AlarmArmArea: TAdvStringGrid;
    pan_DoorInfo: TAdvSmoothPanel;
    lb_DoorNodeIP: TLabel;
    lb_DoorDeviceID: TLabel;
    lb_DoorID: TLabel;
    lb_DoorPositoin: TLabel;
    lb_NodeIP: TLabel;
    lb_DeviceID: TLabel;
    lb_DoorNo: TLabel;
    lb_Building: TLabel;
    lb_DoorName1: TLabel;
    lb_DoorName: TLabel;
    lb_DoorInfo: TLabel;
    btn_DoorInfoConfirm: TAdvGlowButton;
    pm_DeviceControl: TPopupMenu;
    mn_DeviceReset: TMenuItem;
    mn_deviceCardReSend: TMenuItem;
    mn_RegFingerSpace: TMenuItem;
    mn_RegFinger: TMenuItem;
    PositiveACK1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure pan_DeviceResize(Sender: TObject);
    procedure pan_AlarmDeviceResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tv_DeviceListClick(Sender: TObject);
    procedure tv_AlarmDeviceListClick(Sender: TObject);
    procedure pm_PingTestClick(Sender: TObject);
    procedure pm_TimeSyncClick(Sender: TObject);
    procedure pm_DeviceResetClick(Sender: TObject);
    procedure pm_PermitReSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ReSizeTimerTimer(Sender: TObject);
    procedure ActiveTimerTimer(Sender: TObject);
    procedure Positive1Click(Sender: TObject);
    procedure doorListView_Click(Sender: TObject);
    procedure doorListView_SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btn_DoorInfoConfirmClick(Sender: TObject);
    procedure mn_DoorOpenClick(Sender: TObject);
    procedure pm_JavarOpenClick(Sender: TObject);
    procedure pm_JavarCloseClick(Sender: TObject);
    procedure pm_DoorManageModeClick(Sender: TObject);
    procedure pm_DooOpenModeClick(Sender: TObject);
    procedure pm_DoorCloseModeClick(Sender: TObject);
    procedure pm_DoorStateCheckClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure pm_DoorInfoClick(Sender: TObject);
    procedure sg_AccessEventKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mn_CardNOCopyClick(Sender: TObject);
    procedure btn_ArmAreaInfoConfirmClick(Sender: TObject);
    procedure pm_LargeIconClick(Sender: TObject);
    procedure pm_SmallIConClick(Sender: TObject);
    procedure pm_ArmModeChangeClick(Sender: TObject);
    procedure pm_DisArmModeChangeClick(Sender: TObject);
    procedure pm_DeviceInfoClick(Sender: TObject);
    procedure pm_AlarmConfirmClick(Sender: TObject);
    procedure pm_AlarmReportClick(Sender: TObject);
    procedure ArmAreaListViewClick(Sender: TObject);
    procedure ArmAreaListViewDblClick(Sender: TObject);
    procedure pm_ArmAreaStateSearchClick(Sender: TObject);
    procedure ap_AlarmShow(Sender: TObject);
    procedure ap_AccessShow(Sender: TObject);
    procedure sg_ModeChangeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mn_AlarmConfirm1Click(Sender: TObject);
    procedure lb_DeviceStateExampleMouseEnter(Sender: TObject);
    procedure lb_DeviceStateExampleMouseLeave(Sender: TObject);
    procedure pan_DoorStateResize(Sender: TObject);
    procedure pan_AlarmStateResize(Sender: TObject);
    procedure lb_AlarmstateExampleMouseEnter(Sender: TObject);
    procedure lb_AlarmstateExampleMouseLeave(Sender: TObject);
    procedure lb_AlarmDeviceStateExampleMouseEnter(Sender: TObject);
    procedure lb_AlarmDeviceStateExampleMouseLeave(Sender: TObject);
    procedure AdvSmoothPanel2Resize(Sender: TObject);
    procedure ap_AlarmEventResize(Sender: TObject);
    procedure lb_DoorstateExampleMouseEnter(Sender: TObject);
    procedure lb_DoorstateExampleMouseLeave(Sender: TObject);
    procedure sg_AccessEventColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_AccessAlarmEventColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_AlarmEventColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_ModeChangeColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure ap_DoorStateChange(Sender: TObject);
    procedure pan_BuildingResize(Sender: TObject);
    procedure mn_BuildingDoorCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BuildingListViewDblClick(Sender: TObject);
    procedure mn_DeviceAlarmConfirmClick(Sender: TObject);
    procedure pan_ArmAreaBuildingResize(Sender: TObject);
    procedure ArmAreaBuildingListViewDblClick(Sender: TObject);
    procedure mn_AllDeviceAlarmClearClick(Sender: TObject);
    procedure mn_AllAlarmEventClick(Sender: TObject);
    procedure sg_AccessServerDblClick(Sender: TObject);
    procedure sg_AccessNodeDblClick(Sender: TObject);
    procedure sg_AccessDeviceDblClick(Sender: TObject);
    procedure sg_AlarmServerDblClick(Sender: TObject);
    procedure sg_AlarmNodeDblClick(Sender: TObject);
    procedure sg_AlarmDeviceDblClick(Sender: TObject);
    procedure ap_AlarmControlerChange(Sender: TObject);
    procedure ap_AccessControlerChange(Sender: TObject);
    procedure mn_DeviceResetClick(Sender: TObject);
    procedure mn_deviceCardReSendClick(Sender: TObject);
    procedure mn_RegFingerClick(Sender: TObject);
    procedure sg_AccessDeviceClick(Sender: TObject);
    procedure sg_AccessNodeClick(Sender: TObject);
    procedure ArmAreaBuildingListViewClick(Sender: TObject);
  private
    BuildingCodeList : TStringList;
    BuildingArmAreaList : TStringList;
    BuildingDoorList : TStringList;
    ArmAreaBuildingCodeList : TStringList;
    AccessEventHeaderNameList : TStringList;
    DeviceEventHeaderNameList : TStringList;
    AlarmEventHeaderNameList : TStringList;
    AlarmModeHeaderNameList : TStringList;
    L_arrAccessEventIndexArray:Array of integer; //�����̺�Ʈ ����Ʈ ���� �迭
    L_arrRelAccessEventIndexArray:Array of integer; //�����̺�Ʈ ���� ��ġ
    L_arrAccessEventShowTable : Array of integer;  //�����̺�Ʈ ��ȸ �׸����̺�
    L_arrAccessEventSizeTable : Array of integer;  //�����̺�Ʈ Cell Size
    L_arrDeviceEventIndexArray:Array of integer; //����̻� ����Ʈ ���� �迭
    L_arrRelDeviceEventIndexArray:Array of integer; //����̻� ���� ��ġ
    L_arrDeviceEventShowTable : Array of integer;  //����̻� ��ȸ �׸����̺�
    L_arrDeviceEventSizeTable : Array of integer;  //����̻� Cell Size
    L_arrAlarmEventIndexArray:Array of integer; //�˶��̺�Ʈ ����Ʈ ���� �迭
    L_arrRelAlarmEventIndexArray:Array of integer; //�˶��̺�Ʈ ���� ��ġ
    L_arrAlarmEventShowTable : Array of integer;  //�˶��̺�Ʈ ��ȸ �׸����̺�
    L_arrAlarmEventSizeTable : Array of integer;  //�˶��̺�ƮCell Size
    L_arrAlarmModeIndexArray:Array of integer; //��庯�� ����Ʈ ���� �迭
    L_arrRelAlarmModeIndexArray:Array of integer; //��庯�� ���� ��ġ
    L_arrAlarmModeShowTable : Array of integer;  //��庯�� ��ȸ �׸����̺�
    L_arrAlarmModeSizeTable : Array of integer;  //��庯�� Cell Size

    L_bAlarmControlerChange : Boolean;
    L_bFormActive : Boolean;
    L_bViewRefresh : Boolean;
    L_bClose : Boolean;
    L_nCount : integer;
    L_nAlarmViewListStyle : integer;
    L_nAccessEventShowCount : integer;
    L_nAlarmEventShowCount : integer;
    L_nAlarmModeShowCount : integer;
    L_nDeviceEventShowCount : integer;
    L_nViewListStyle : integer;
    L_stMenuID : string;
    L_stAccessAlarmCaption : string;
    L_stAllName : string;
    L_stSelectAccessDecorderNo : string;
    L_stSelectAlarmDecorderNo : string;

    { Private declarations }
    procedure ArmAreaStateRefresh;
    procedure BuildingStateRefresh;
    procedure ChangeAccessEventIndex(FromIndex,ToIndex:integer);
    procedure ChangeAlarmEventIndex(FromIndex,ToIndex:integer);
    procedure ChangeAlarmModeIndex(FromIndex,ToIndex:integer);
    procedure ChangeDeviceEventIndex(FromIndex,ToIndex:integer);
    function  ListCellSize:Boolean;
    function  ListConfigRead:Boolean;
    function  ListHeaderNameGet:Boolean;
    function  ListHeaderNameSetting:Boolean;
    function  ListFieldNameSetting:Boolean;
    function  LoadBuilding:Boolean;
    function  LoadBuildingArmArea:Boolean;
    function  LoadBuildingDoor : Boolean;
    procedure LoadTreeDeviceList(aTreeList,vTreeList:TTreeView);
    procedure LoadServerGrid(aList:TAdvStringGrid);
    procedure LoadMainGrid(aServerNo:string;aList:TAdvStringGrid);
    procedure LoadDeviceGrid(aServerNo,aNodeNo:string;aList:TAdvStringGrid);
    procedure LoadDoorGrid(aServerNo,aNodeNo,aEcuID:string;aList:TAdvStringGrid);
    procedure LoadAlarmArmAreaGrid(aServerNo,aNodeNo,aEcuID:string;aList:TAdvStringGrid);
    procedure TreeViewDeviceConnectChange(aTreeList,vTreeList:TTreeView;aDecoderNo:integer; aNodeNo, aEcuID,aData:string);
    procedure TreeViewNodeConnectChange(aTreeList,vTreeList:TTreeView;aDecoderNo:integer;aNodeNo, aEcuID,aData:string);
    procedure TreeViewServerConnectChange(aTreeList,vTreeList:TTreeView;aDecoderNo:integer;aConnected:Boolean);
    function  WriteIniConfig:Boolean;
  private
    FBuildingCode: string;
    FArmAreaBuildingCode: string;
    function GetDoorManageModeImageIndex(aDoorCardMode,aDoorManageMode:string):integer;
    function GetDoorStateImageIndex(aDoorDSState,aDoorLSState,aDoorFireEvent:string):integer;
  public
    procedure AlarmEventAllClear(aMessage:string);
    procedure DeviceAccessAlarmEventAllClear(aMessage:string);
    procedure DeviceReload;
  public
    { Public declarations }
    procedure ArmAreaCurrentAlarmStateChange(aDecoderNo:integer;aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(aDecoderNo:integer;aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure BuildingAlarmStateChange(aBuildingCode:string;aAlarmState: integer);
    procedure BuildingSecurityModeChange(aBuildingCode:string;aMode : integer);
    procedure DeviceCardAccessEvent(aDecoderNo:integer;aTime,aNodeNo, aEcuID, aDoorNo,aReaderNo, aInOut,aInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,
                    aAccessPermitName,aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone:string);
    procedure DeviceAlarmEvent(aDecoderNo:integer;aNodeNo, aECUID,aExtendID, aCmd,aMsgNo, aTime, aSubCLass, aSubAddr, aArmAreaNo, aMode, aAlarmStateCode, aLoop,
                          aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor:string);
    procedure DoorChangeEvent(aDecoderNo:integer;aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
    Function  FormNameSetting:Boolean;
    procedure RcvDeviceConnectedChangeEvent(aDecoderNo :integer;aNodeNo,aEcuID,aData:string);
    procedure RcvNodeConnectedChangeEvent(aDecoderNo :integer;aNodeNo,aEcuID,aData:string);
    procedure SecurityEventClear;
    procedure ServerConnected(aDecoderNo:integer;aConnected:Boolean);
    procedure MonitoringRefresh;
  public
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property ArmAreaBuildingCode : string read FArmAreaBuildingCode write FArmAreaBuildingCode;
  end;

var
  fmMonitoring: TfmMonitoring;

implementation
uses
  uBuildingAlarmConfirm,
  uCommonFunction,
  uCommonVariable,
  uFormFunction,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uFormDeviceState,
  uFormVariable,
  uMain,
  uPCClient,
  uSecurityEventConfirm,
  uServerClientVariable;
{$R *.dfm}


procedure TfmMonitoring.ActiveTimerTimer(Sender: TObject);
var
  nSelectIndex : integer;
begin
  inherited;
  Exit;
  if L_bClose then Exit;

  FormResize(self);
  Exit;

//  if L_bFormActive then Exit;
  if L_bViewRefresh then Exit;
  L_bViewRefresh := True;
  Try
    //if Not L_bFormActive then
    //begin
      LoadBuilding;
      ap_Door.Caption := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[0]).BuildingName;
      if LoadBuildingDoor then
      begin
        if LoadBuildingArmArea then L_bFormActive := True;
      end;
      ap_DoorState.ActivePage := ap_Door;
    //end;
    //if Not L_bFormActive then
    //begin
    //  ActiveTimer.Interval := 1000;
    //  ActiveTimer.Enabled := True;
    //  Exit;
   // end;


    if L_nViewListStyle = 0 then
    begin
      doorListView.ViewStyle := vsList;
      Delay(100);
      doorListView.ViewStyle := vsICon;
      //doorListView.Refresh;
    end else
    begin
      doorListView.ViewStyle := vsICon;
      Delay(100);
      doorListView.ViewStyle := vsList;
      //doorListView.Refresh;
    end;

    if L_nAlarmViewListStyle = 0 then
    begin
      ArmAreaListView.ViewStyle := vsList;
      Delay(100);
      ArmAreaListView.ViewStyle := vsIcon;
      //ArmAreaListView.Refresh;
    end else if L_nAlarmViewListStyle = 1 then
    begin
      ArmAreaListView.ViewStyle := vsIcon;
      Delay(100);
      ArmAreaListView.ViewStyle := vsList;
      //ArmAreaListView.Refresh;
    end;
    FormResize(self);
  Finally
    L_bViewRefresh := False;
  End;
end;

procedure TfmMonitoring.AdvSmoothPanel2Resize(Sender: TObject);
begin
  inherited;
  sg_AccessEvent.Top := 5;
  sg_AccessEvent.Left := 5;
  sg_AccessEvent.Height := tb_AccessEvent.Height - (sg_AccessEvent.Top * 2);
  sg_AccessEvent.Width := tb_AccessEvent.Width - (sg_AccessEvent.Left * 2);

  sg_AccessAlarmEvent.Top := 5;
  sg_AccessAlarmEvent.Left := 5;
  sg_AccessAlarmEvent.Height := tb_AccessAlarm.Height - (sg_AccessAlarmEvent.Top * 2);
  sg_AccessAlarmEvent.Width := tb_AccessAlarm.Width - (sg_AccessAlarmEvent.Left * 2);
end;

procedure TfmMonitoring.AlarmEventAllClear(aMessage: string);
var
  stTime : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stMsgNo : string;
  stAlarmDate : string;
  stAlarmTime : string;
  i : integer;
begin
  With sg_AlarmEvent do
  begin
    for i := 1 to RowCount - 1 do
    begin
      if Cells[L_arrAlarmEventIndexArray[10],i] = '' then continue;
      if Cells[L_arrAlarmEventIndexArray[2],i] = '' then continue;
      if Cells[L_arrAlarmEventIndexArray[11],i] = '' then continue;
      if Cells[L_arrAlarmEventIndexArray[12],i] = '' then continue;
      stTime := Cells[L_arrAlarmEventIndexArray[12],i];
      stTime := stringReplace(stTime,'-','',[rfReplaceAll]);
      stTime := stringReplace(stTime,':','',[rfReplaceAll]);
      stTime := stringReplace(stTime,' ','',[rfReplaceAll]);
      stNodeNo := Cells[L_arrAlarmEventIndexArray[10],i];
      stEcuID := Cells[L_arrAlarmEventIndexArray[2],i];
      stExtendID := Cells[L_arrAlarmEventIndexArray[13],i];
      stMsgNo := Cells[L_arrAlarmEventIndexArray[11],i];
      stAlarmDate := copy(stTime,1,8);
      stAlarmTime := copy(stTime,9,6);
      dmDBUpdate.UpdateTB_ALARMEVENT_Confirm(stAlarmDate, stAlarmTime,
            stNodeNo, stEcuID, stExtendID, stMsgNo, '1', aMessage, formatDateTime('yyyymmddhhnnsszzz',now),
            GetLocalIPAddr);
    end;
  end;
end;

procedure TfmMonitoring.ap_AccessControlerChange(Sender: TObject);
begin
  inherited;
  L_bAlarmControlerChange := True;
  if ap_AccessControler.ActivePage = ap_AccessDevice then
  begin
    sg_AccessNodeDblClick(sg_AccessNode);
  end else if ap_AccessControler.ActivePage = ap_AccessDoor then
  begin
    if G_nMonitoringProtocol = 1 then sg_AccessNodeDblClick(sg_AccessNode)
    else sg_AccessDeviceDblClick(sg_AccessDevice);
  end;
  L_bAlarmControlerChange := False;

end;

procedure TfmMonitoring.ap_AccessShow(Sender: TObject);
begin
  inherited;
  FormResize(self);
end;

procedure TfmMonitoring.ap_AlarmControlerChange(Sender: TObject);
begin
  inherited;
  L_bAlarmControlerChange := True;
  if ap_AlarmControler.ActivePage = ap_AlarmDevice then
  begin
    sg_AlarmNodeDblClick(sg_AlarmNode);
  end else if ap_AlarmControler.ActivePage = ap_AlarmArmArea then
  begin
    sg_AlarmDeviceDblClick(sg_AlarmDevice);
  end;
  L_bAlarmControlerChange := False;
end;

procedure TfmMonitoring.ap_AlarmEventResize(Sender: TObject);
begin
  inherited;

  sg_AlarmEvent.top := 5;
  sg_AlarmEvent.Left := 5;
  sg_AlarmEvent.Height := tb_AlarmEvent.Height - (sg_AlarmEvent.Top * 2);
  sg_AlarmEvent.Width := tb_AlarmEvent.Width - (sg_AlarmEvent.Left * 2);

  sg_ModeChange.Top := 5;
  sg_ModeChange.Left := 5;
  sg_ModeChange.Height := tb_ArmModeChange.Height - (sg_ModeChange.Top * 2);
  sg_ModeChange.Width := tb_ArmModeChange.Width - (sg_ModeChange.Left * 2);

end;

procedure TfmMonitoring.ap_AlarmShow(Sender: TObject);
begin
  inherited;
  FormResize(self);
  ArmAreaStateRefresh;

end;

procedure TfmMonitoring.ap_DoorStateChange(Sender: TObject);
begin
  inherited;
  FormResize(self);
  //pan_DoorState.Refresh;
end;

procedure TfmMonitoring.ArmAreaBuildingListViewClick(Sender: TObject);
begin
  inherited;
  if Not IsInsertGrade then
  begin
    pm_ArmModeChange.Enabled := False;
    pm_DisArmModeChange.Enabled := False;
  end else
  begin
    pm_ArmModeChange.Enabled := True;
    pm_DisArmModeChange.Enabled := True;
  end;

end;

procedure TfmMonitoring.ArmAreaBuildingListViewDblClick(Sender: TObject);
begin
  inherited;
  if ArmAreaBuildingListView.ItemIndex < 0 then Exit;

  ArmAreaBuildingCode := ArmAreaBuildingListView.Items[ArmAreaBuildingListView.ItemIndex].SubItems.Strings[0];
  ap_ArmArea.Caption := ArmAreaBuildingListView.Items[ArmAreaBuildingListView.ItemIndex].Caption;
  LoadBuildingArmArea;
  ap_ArmAreaState.ActivePage := ap_ArmArea;

end;

procedure TfmMonitoring.ArmAreaCurrentAlarmStateChange(aDecoderNo:integer;aNodeNo, aEcuID,
  aArmAreaNo, aAlarmState, aBuildingCode: string);
var
  stArmAreaID : string;
  nIndex : Integer;
  nTempIndex : integer;
  stArmMode : string;
  nEventIndex : integer;
  nImageIndex : integer;
begin
  stArmAreaID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := BuildingArmAreaList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  if nIndex > ArmAreaListView.Items.Count - 1 then Exit;

  nTempIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
  if nTempIndex < 0 then Exit;

  stArmMode := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nTempIndex]).GetArmAreaDeviceSecurityMode(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo);
  nEventIndex := 0;
  nImageIndex := con_ArmAreaImageNothing;
  if isDigit(aAlarmState) then nEventIndex := strtoint(aAlarmState);
  case nEventIndex of //'0'.Clear,'1'.�̺�Ʈ �߻�,'2'.View �̺�Ʈ �߻�,'3'.Sound Event �߻�
    1 : begin
      if stArmMode = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
      else if stArmMode = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
    end;
    2 : begin
      if stArmMode = 'D' then nImageIndex := con_ArmAreaEventImageDisArm
      else if stArmMode = 'A' then nImageIndex := con_ArmAreaEventImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
    end;
    3 : begin   //�˶��߻�
      if stArmMode = 'D' then nImageIndex := con_ArmAreaAlarmImageDisArm
      else if stArmMode = 'A' then nImageIndex := con_ArmAreaAlarmImageDisArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateAlarmEvent;
    end;
    else begin
      tb_AccessAlarm.Caption := L_stAccessAlarmCaption;
      if stArmMode = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
      else if stArmMode = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNotEvent;
    end;
  end;
  ArmAreaListView.Items[nIndex].ImageIndex := nImageIndex;

  ArmAreaListView.Refresh;
end;

procedure TfmMonitoring.ArmAreaListViewClick(Sender: TObject);
begin
  inherited;
  //popupMenu := nil;
  if ArmAreaListView.ItemIndex < 0 then Exit;
  if ArmAreaListView.ItemIndex > (ArmAreaListView.Items.Count ) then Exit;
  if Not IsInsertGrade then
  begin
    pm_ArmModeChange.Enabled := False;
    pm_DisArmModeChange.Enabled := False;
  end else
  begin
    pm_ArmModeChange.Enabled := True;
    pm_DisArmModeChange.Enabled := True;
  end;
end;

procedure TfmMonitoring.ArmAreaListViewDblClick(Sender: TObject);
var
  stArmAreaID : string;
begin
  Try
    if ArmAreaListView.Selected = nil then Exit;
    stArmAreaID:= ArmAreaListView.Selected.SubItems.Strings[0];
  Except
    Exit;
  End;

end;

procedure TfmMonitoring.ArmAreaSecurityModeChange(aDecoderNo:integer;aNodeNo, aEcuID, aArmAreaNo,
  aMode, aBuildingCode: string);
var
  stArmAreaID : string;
  nIndex : Integer;
  nImageIndex : integer;
  nEventIndex : integer;
  nTempIndex : integer;
begin
  stArmAreaID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := BuildingArmAreaList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  if nIndex > ArmAreaListView.Items.Count - 1 then Exit;
  nImageIndex := con_ArmAreaImageNothing;

  nTempIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
  if nTempIndex < 0 then Exit;

  nEventIndex := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nTempIndex]).GetArmAreaDeviceArmAreaState(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo);
  case nEventIndex of
    1 : begin
      if aMode = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
      else if aMode = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
    end;
    2 : begin
      if aMode = 'D' then nImageIndex := con_ArmAreaEventImageDisArm
      else if aMode = 'A' then nImageIndex := con_ArmAreaEventImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
    end;
    3 : begin
      if aMode = 'D' then nImageIndex := con_ArmAreaAlarmImageArm
      else if aMode = 'A' then nImageIndex := con_ArmAreaAlarmImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateAlarmEvent;
    end;
    else begin
      if aMode = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
      else if aMode = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNotEvent;
    end;
  end;
  ArmAreaListView.Items[nIndex].ImageIndex := nImageIndex;

  ArmAreaListView.Refresh;
end;

procedure TfmMonitoring.ArmAreaStateRefresh;
var
  nIndex : integer;
  i : integer;
  nArmAreaIndex : integer;
  nDecoderNo : integer;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stArmAreaName : string;
  stArmAreaID : string;
  nImageIndex : integer;
  nEventIndex : integer;
  stArmState : string;
begin
  Try
    nIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
    if nIndex < 0 then Exit;
    for i := 0 to TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaCount - 1 do
    begin
      if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexDevieInfo(i,nDecoderNo,stNodeNo,stEcuID,stArmAreaNo,stArmAreaName) then
      begin
        stDecoderNo := FillZeroNumber(nDecoderNo,G_nDecoderCodeLength);
        stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
        stArmAreaID := stDecoderNo + stNodeNo + stEcuID + stArmAreaNo;
        nArmAreaIndex := BuildingArmAreaList.IndexOf(stArmAreaID);
        if nArmAreaIndex < 0 then Exit;
        nImageIndex := con_ArmAreaImageNothing;
        stArmState := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexSecurityMode(i);
        {if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexSecurityMode(i) = 'D' then
        begin
          nImageIndex := con_ArmAreaImageDisArm;
        end else if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexSecurityMode(i) = 'A' then
        begin
          nImageIndex := con_ArmAreaImageArm;
        end;
        ArmAreaListView.Items[nArmAreaIndex].ImageIndex := nImageIndex;

        nEventIndex := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexArmAreaState(i);
        case nEventIndex of
          1 : begin
            ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
          end;
          2 : begin
            ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
          end;
          3 : begin
            ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateAlarmEvent;
          end;
          else begin
            ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNotEvent;
          end;
        end;   }
        nEventIndex := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexArmAreaState(i);
        case nEventIndex of
          1 : begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
          end;
          2 : begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaEventImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaEventImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
          end;
          3 : begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaAlarmImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaAlarmImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateAlarmEvent;
          end;
          else begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNotEvent;
          end;
        end;
        if ArmAreaListView.Items.Count > nArmAreaIndex  then
           ArmAreaListView.Items[nArmAreaIndex].ImageIndex := nImageIndex;
      end;
    end;
  Except
    Exit;
  End;
end;

procedure TfmMonitoring.btn_ArmAreaInfoConfirmClick(Sender: TObject);
begin
  inherited;
  pan_ArmAreaInfo.Visible := False;
end;

procedure TfmMonitoring.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMonitoring.btn_DoorInfoConfirmClick(Sender: TObject);
begin
  inherited;
  pan_DoorInfo.Visible := False;
end;

procedure TfmMonitoring.btn_minimizeClick(Sender: TObject);
begin
  windowState := wsNormal;
end;

procedure TfmMonitoring.BuildingAlarmStateChange(aBuildingCode: string;
  aAlarmState: integer);
begin
  Exit;
end;

procedure TfmMonitoring.BuildingListViewDblClick(Sender: TObject);
begin
  inherited;
  if BuildingListView.ItemIndex < 0 then Exit;

  BuildingCode := BuildingListView.Items[BuildingListView.ItemIndex].SubItems.Strings[0];
  ap_Door.Caption := BuildingListView.Items[BuildingListView.ItemIndex].Caption;
  LoadBuildingDoor;
  ap_DoorState.ActivePage := ap_Door;

end;

procedure TfmMonitoring.BuildingSecurityModeChange(aBuildingCode: string;
  aMode: integer);
begin
  Exit;
end;

procedure TfmMonitoring.BuildingStateRefresh;
var
  i : integer;
  stBuildingCode : string;
  nBuildingSecurityMode : integer;
  nImageIndex : integer;
begin
  Try
    if G_MonitoringBuildingList.Count < 1 then Exit;
    for i := 0 to G_MonitoringBuildingList.Count - 1 do
    begin
      nImageIndex := con_BuildingArmAreaImageNothing;
      stBuildingCode := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingCode;
      nBuildingSecurityMode := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingSecurityMode;
      case TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingAlarmState of
        1 : begin
          if nBuildingSecurityMode = 1 then nImageIndex := con_BuildingArmAreaNormalImageDisArm
          else if nBuildingSecurityMode = 2 then nImageIndex := con_BuildingArmAreaNormalImagePartArm
          else if nBuildingSecurityMode = 3 then nImageIndex := con_BuildingArmAreaNormalImageArm;
          //ArmAreaListView.Items[i].StateIndex := con_AlarmStateNormalEvent;
        end;
        2 : begin
          if nBuildingSecurityMode = 1 then nImageIndex := con_BuildingArmAreaEventImageDisArm
          else if nBuildingSecurityMode = 2 then nImageIndex := con_BuildingArmAreaEventImagePartArm
          else if nBuildingSecurityMode = 3 then nImageIndex := con_BuildingArmAreaEventImageArm;
          //ArmAreaListView.Items[i].StateIndex := con_AlarmStateNormalEvent;
        end;
        3 : begin
          if nBuildingSecurityMode = 1 then nImageIndex := con_BuildingArmAreaAlarmImageDisArm
          else if nBuildingSecurityMode = 2 then nImageIndex := con_BuildingArmAreaAlarmImagePartArm
          else if nBuildingSecurityMode = 3 then nImageIndex := con_BuildingArmAreaAlarmImageArm;
          //ArmAreaListView.Items[i].StateIndex := con_AlarmStateAlarmEvent;
        end;
        else begin
          if nBuildingSecurityMode = 1 then nImageIndex := con_BuildingArmAreaNormalImageDisArm
          else if nBuildingSecurityMode = 2 then nImageIndex := con_BuildingArmAreaNormalImagePartArm
          else if nBuildingSecurityMode = 3 then nImageIndex := con_BuildingArmAreaNormalImageArm;
          //ArmAreaListView.Items[i].StateIndex := con_AlarmStateNotEvent;
        end;
      end;
      ArmAreaListView.Items[i].ImageIndex := nImageIndex;
(*      if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingSecurityMode = 1 then
      begin
        ArmAreaListView.Items[nIndex].ImageIndex  := con_BuildingArmAreaImageDisArm;
      end else if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingSecurityMode = 2 then
      begin
        ArmAreaListView.Items[nIndex].ImageIndex := con_BuildingArmAreaImagePartArm;
      end else if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingSecurityMode = 3 then
      begin
        ArmAreaListView.Items[nIndex].ImageIndex := con_BuildingArmAreaImageArm;
      end;

      case TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingAlarmState of
        1 : begin
          ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateNormalEvent;
        end;
        2 : begin
          ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateNormalEvent;
        end;
        3 : begin
          ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateAlarmEvent;
        end;
        else begin
          ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateNotEvent;
        end;
      end;
*)
    end;
  Except
    Exit;
  End;
end;

procedure TfmMonitoring.ChangeAccessEventIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelAccessEventIndexArray[FromIndex];
  if FromIndex > ToIndex then   //�ڿ� �ִ� ���� ������ ���� ���
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelAccessEventIndexArray[i] := L_arrRelAccessEventIndexArray[i - 1];
    end;
    L_arrRelAccessEventIndexArray[ToIndex] := nChangData;
  end else   //�տ� �ִ� ���� �ڷ� ���� ���
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelAccessEventIndexArray[i] := L_arrRelAccessEventIndexArray[i + 1];
    end;
    L_arrRelAccessEventIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelAccessEventIndexArray) to HIGH(L_arrRelAccessEventIndexArray) do
  begin
    L_arrAccessEventIndexArray[L_arrRelAccessEventIndexArray[i]] := i;
  end;

end;

procedure TfmMonitoring.ChangeAlarmEventIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelAlarmEventIndexArray[FromIndex];
  if FromIndex > ToIndex then   //�ڿ� �ִ� ���� ������ ���� ���
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelAlarmEventIndexArray[i] := L_arrRelAlarmEventIndexArray[i - 1];
    end;
    L_arrRelAlarmEventIndexArray[ToIndex] := nChangData;
  end else   //�տ� �ִ� ���� �ڷ� ���� ���
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelAlarmEventIndexArray[i] := L_arrRelAlarmEventIndexArray[i + 1];
    end;
    L_arrRelAlarmEventIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelAlarmEventIndexArray) to HIGH(L_arrRelAlarmEventIndexArray) do
  begin
    L_arrAlarmEventIndexArray[L_arrRelAlarmEventIndexArray[i]] := i;
  end;

end;

procedure TfmMonitoring.ChangeAlarmModeIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelAlarmModeIndexArray[FromIndex];
  if FromIndex > ToIndex then   //�ڿ� �ִ� ���� ������ ���� ���
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelAlarmModeIndexArray[i] := L_arrRelAlarmModeIndexArray[i - 1];
    end;
    L_arrRelAlarmModeIndexArray[ToIndex] := nChangData;
  end else   //�տ� �ִ� ���� �ڷ� ���� ���
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelAlarmModeIndexArray[i] := L_arrRelAlarmModeIndexArray[i + 1];
    end;
    L_arrRelAlarmModeIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelAlarmModeIndexArray) to HIGH(L_arrRelAlarmModeIndexArray) do
  begin
    L_arrAlarmModeIndexArray[L_arrRelAlarmModeIndexArray[i]] := i;
  end;

end;

procedure TfmMonitoring.ChangeDeviceEventIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelDeviceEventIndexArray[FromIndex];
  if FromIndex > ToIndex then   //�ڿ� �ִ� ���� ������ ���� ���
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelDeviceEventIndexArray[i] := L_arrRelDeviceEventIndexArray[i - 1];
    end;
    L_arrRelDeviceEventIndexArray[ToIndex] := nChangData;
  end else   //�տ� �ִ� ���� �ڷ� ���� ���
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelDeviceEventIndexArray[i] := L_arrRelDeviceEventIndexArray[i + 1];
    end;
    L_arrRelDeviceEventIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelDeviceEventIndexArray) to HIGH(L_arrRelDeviceEventIndexArray) do
  begin
    L_arrDeviceEventIndexArray[L_arrRelDeviceEventIndexArray[i]] := i;
  end;

end;

procedure TfmMonitoring.DeviceAccessAlarmEventAllClear(aMessage:string);
var
  stTime : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stMsgNo : string;
  stAlarmDate : string;
  stAlarmTime : string;
  i : integer;
begin
  With sg_AccessAlarmEvent do
  begin
    for i := 1 to RowCount - 1 do
    begin
      if Cells[L_arrDeviceEventIndexArray[5],i] = '' then continue;
      if Cells[L_arrDeviceEventIndexArray[2],i] = '' then continue;
      if Cells[L_arrDeviceEventIndexArray[6],i] = '' then continue;
      if Cells[L_arrDeviceEventIndexArray[7],i] = '' then continue;
      stTime := Cells[L_arrDeviceEventIndexArray[7],i];
      stTime := stringReplace(stTime,'-','',[rfReplaceAll]);
      stTime := stringReplace(stTime,':','',[rfReplaceAll]);
      stTime := stringReplace(stTime,' ','',[rfReplaceAll]);
      stNodeNo := Cells[L_arrDeviceEventIndexArray[5],i];
      stEcuID := Cells[L_arrDeviceEventIndexArray[2],i];
      stExtendID := Cells[L_arrDeviceEventIndexArray[8],i];
      stMsgNo := Cells[L_arrDeviceEventIndexArray[6],i];
      stAlarmDate := copy(stTime,1,8);
      stAlarmTime := copy(stTime,9,6);
      dmDBUpdate.UpdateTB_ALARMEVENT_Confirm(stAlarmDate, stAlarmTime,
            stNodeNo, stEcuID, stExtendID, stMsgNo, '1', aMessage, formatDateTime('yyyymmddhhnnsszzz',now),
            GetLocalIPAddr);
    end;
  end;
end;

procedure TfmMonitoring.DeviceAlarmEvent(aDecoderNo:integer;aNodeNo, aECUID, aExtendID, aCmd,
  aMsgNo, aTime, aSubCLass, aSubAddr, aArmAreaNo, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
  aAlarmColor: string);
var
  nIndex : integer;
  stNodename : string;
  stDoorName : string;
  stNodeNo : string;
  stNodeIP : string;
  stAlarmAreaName : string;
  stAlarmDeviceTypeName : string;
  stAlarmModeName : string;
  stEmSeq,stEmName,stCompanyName,stEmCode,stPosiName : string;
  stZoneName : string;
begin
  stNodeNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength);
  if (aAlarmStateCode = G_stLongTimeStateCode) or
     (aAlarmStateCode = G_stFireStateCode) or
     (aAlarmStateCode = 'AF') or
     (aAlarmStateCode = 'AN') or
     (aAlarmStateCode = 'CO') or
     (aAlarmStateCode = 'CC') or
     (aAlarmStateCode = 'NF') or
     (aAlarmStateCode = 'NR')
  then
  begin
    //PageControl1.ActivePage := tb_AccessAlarm;
    nIndex := PCClientSocketList.IndexOf(inttostr(aDecoderNo));
    if nIndex > -1 then
    begin
      stNodename := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeName(stNodeNo);
      stDoorName := '';
      if aAlarmStateCode = G_stLongTimeStateCode then
      begin
        stDoorName := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeDeviceToDoorName(stNodeNo,aEcuID,aSubCLass[2]);
      end;
    end;

    with sg_AccessAlarmEvent do
    begin
      if Cells[L_arrDeviceEventIndexArray[0],1] <> '' then InsertRows(1,1);
      Cells[L_arrDeviceEventIndexArray[0],1] := MakeDatetimeStr(aTime);
      Cells[L_arrDeviceEventIndexArray[1],1] := stNodename;
      Cells[L_arrDeviceEventIndexArray[2],1] := aECUID;
      Cells[L_arrDeviceEventIndexArray[3],1] := stDoorName;
      Cells[L_arrDeviceEventIndexArray[4],1] := aAlarmStatePCCodeName;
      Cells[L_arrDeviceEventIndexArray[5],1] := aNodeNo;
      Cells[L_arrDeviceEventIndexArray[6],1] := aMsgNo;
      Cells[L_arrDeviceEventIndexArray[7],1] := aTime;
      Cells[L_arrDeviceEventIndexArray[8],1] := aExtendID;

      if (aAlarmStatePCCode = '000FI001') or   //ȭ��߻�
        (aAlarmStateCode = 'AF') or
        (aAlarmStateCode = 'CO') or
        (aAlarmStateCode = 'NF')
      then
      begin
        RowColor[1] := clWebDarkOrange;
      end;
      if RowCount > 1000 then RowCount := 1000;
    end;
    tb_AccessAlarm.Caption := L_stAccessAlarmCaption + '[' + inttostr(sg_AccessAlarmEvent.RowCount - 1) + ']';
  end;
  if aCmd <> 'A' then Exit;
  if Not G_bAlarmMonitoringUse then Exit; //TEST

  if Not isDigit(aArmAreaNo) then aArmAreaNo := '0'
  else aArmAreaNo := inttostr(strtoint(aArmAreaNo));

  nIndex := PCClientSocketList.IndexOf(inttostr(aDecoderNo));
  if nIndex > -1 then
  begin
    stNodeIP := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeIP(stNodeNo);
    stAlarmAreaName := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaName,stNodeNo,aEcuID,aArmAreaNo);
  end;
(*  nIndex := G_MonitoringNodeList.Indexof(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength));
  if nIndex > -1 then
  begin
    stNodeIP := TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).NodeIP;
    stAlarmAreaName := TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaName,aEcuID,aArmAreaNo);
  end;
*)
  stAlarmDeviceTypeName := dmFormFunction.GetAlarmDeviceTypeName(aSubCLass);
  stAlarmModeName := dmFormFunction.GetAlarmModeName(aMode);
  stZoneName := dmDBFunction.GetTB_ZONE_ZoneName(aNodeNo,aECUID,aExtendID,aLoop);
  if (stZoneName <> '') then aAlarmStatePCCodeName := stZoneName + ':' + aAlarmStatePCCodeName;

  Try
    if aArmModeChange <> '1' then
    begin
      //AlarmEvent
      if aAlarmView = '0' then Exit;
      with sg_AlarmEvent do
      begin
        if Cells[L_arrAlarmEventIndexArray[0],1] <> '' then InsertRows(1,1);
        Cells[L_arrAlarmEventIndexArray[0],1] := MakeDatetimeStr(aTime);
        Cells[L_arrAlarmEventIndexArray[1],1] := stNodeIP;
        Cells[L_arrAlarmEventIndexArray[2],1] := aECUID;
        Cells[L_arrAlarmEventIndexArray[3],1] := aArmAreaNo;
        Cells[L_arrAlarmEventIndexArray[4],1] := stAlarmAreaName;
        Cells[L_arrAlarmEventIndexArray[5],1] := stAlarmDeviceTypeName;
        Cells[L_arrAlarmEventIndexArray[6],1] := aSubAddr;
        Cells[L_arrAlarmEventIndexArray[7],1] := stAlarmModeName;
        Cells[L_arrAlarmEventIndexArray[8],1] := aLoop;
        Cells[L_arrAlarmEventIndexArray[9],1] := aAlarmStatePCCodeName;
        Cells[L_arrAlarmEventIndexArray[10],1] := aNodeNo;
        Cells[L_arrAlarmEventIndexArray[11],1] := aMsgNo;
        Cells[L_arrAlarmEventIndexArray[12],1] := aTime;
        Cells[L_arrAlarmEventIndexArray[13],1] := aExtendID;
        if isDigit(aAlarmColor) then
          RowColor[1] := strtoint(aAlarmColor);
      end;
    end else
    begin
      with sg_ModeChange do
      begin
        if Cells[L_arrAlarmModeIndexArray[0],1] <> '' then InsertRows(1,1);
        Cells[L_arrAlarmModeIndexArray[0],1] := MakeDatetimeStr(aTime);
        Cells[L_arrAlarmModeIndexArray[1],1] := stNodeIP;
        Cells[L_arrAlarmModeIndexArray[2],1] := aECUID;
        Cells[L_arrAlarmModeIndexArray[3],1] := aArmAreaNo;
        Cells[L_arrAlarmModeIndexArray[4],1] := stAlarmAreaName;
        Cells[L_arrAlarmModeIndexArray[5],1] := aAlarmStatePCCodeName;
        Cells[L_arrAlarmModeIndexArray[6],1] := aOper;
        dmFormFunction.GetCardToEmployeeInfo(aOper,stEmSeq,stEmName,stCompanyName,stEmCode,stPosiName);
        Cells[L_arrAlarmModeIndexArray[7],1] := stEmName;
        Cells[L_arrAlarmModeIndexArray[8],1] := stCompanyName;
        Cells[L_arrAlarmModeIndexArray[9],1] := stEmCode;
        if isDigit(aAlarmColor) then
          RowColor[1] := strtoint(aAlarmColor);
      end;
    end;
  Except
    Exit;
  End;
  if aAlarmSound = '1' then
  begin
    fmMain.FORMALARMMESSAGE(stAlarmAreaName + '-' + aAlarmStatePCCodeName);
  end;
end;

procedure TfmMonitoring.DeviceCardAccessEvent(aDecoderNo:integer;aTime, aNodeNo, aEcuID, aDoorNo,
  aReaderNo, aInOut, aInOutName, aCardMode, aDoorMode, aChangeState,
  aAccessResult, aAccessPermitName, aDoorState, aATButton, aType, aArmAreaNo,
  aCardno, aCompanyCode, aCompanyName, aEmSeq, aEmCode, aEmName, aPosiCode,
  aPosiName,aPrintNo,aHandPhone: string);
var
  nIndex : integer;
  stDoorName : string;
  stViewCardNo : string;
  stViewEmName : string;
  stNodeNo : string;
begin
  stNodeNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength);
  nIndex := PCClientSocketList.IndexOf(inttostr(aDecoderNo));
  if nIndex > -1 then
  begin
    stDoorName := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeDeviceToDoorName(stNodeNo,aEcuID,aDoorNo);
  end;

  stViewEmName := aEmName;
  stViewCardNo := aCardNo;
  if aChangeState = 'P' then  //��ȭ ���� �� ���
  begin
    stViewCardNo := copy(stViewCardNo,1,8);
    stViewCardNo := inttostr(Hex2Dec(stViewCardNo));
    stViewEmName := '��ȭ����';
  end;

  with sg_AccessEvent do
  begin
    if Cells[L_arrAccessEventIndexArray[0],1] <> '' then InsertRows(1,1);
    Cells[L_arrAccessEventIndexArray[0],1] := MakeDatetimeStr(aTime);
    Cells[L_arrAccessEventIndexArray[1],1] := stDoorName;
    if aType = 'B' then
    begin
      Cells[L_arrAccessEventIndexArray[2],1] := dmFormFunction.GetAccessControlTypeName(aChangeState[1]);
      (*case aChangeState[1] of
        'R' : Cells[L_arrAccessEventIndexArray[2],1] := '��������';
        'P' : Cells[L_arrAccessEventIndexArray[2],1] := '��ȭ';
        'B' : Cells[L_arrAccessEventIndexArray[2],1] := '��ǹ�ư';
        'S' : Cells[L_arrAccessEventIndexArray[2],1] := '������';
        'F' : Cells[L_arrAccessEventIndexArray[2],1] := 'ȭ��߻�';
        'f' : Cells[L_arrAccessEventIndexArray[2],1] := '����ȭ��';
      end;
      *)
    end else Cells[L_arrAccessEventIndexArray[2],1] := stViewCardNo;
    Cells[L_arrAccessEventIndexArray[3],1] := stViewEmName;
    Cells[L_arrAccessEventIndexArray[4],1] := aCompanyName;
    Cells[L_arrAccessEventIndexArray[5],1] := aEmCode;
    Cells[L_arrAccessEventIndexArray[6],1] := aReaderNo;
    Cells[L_arrAccessEventIndexArray[7],1] := aInOutName;
    Cells[L_arrAccessEventIndexArray[8],1] := aAccessPermitName;
    Cells[L_arrAccessEventIndexArray[9],1] := aATButton;

    case aAccessResult[1] of
      '1','2' : begin  //���Խ���

      end;
      '3','4' : begin  //�������

      end;
      'A' : begin       //�̵�� ī��
        RowColor[1] := clFuchsia;
      end;
      'B' : begin       //�������� ���� �Ұ�
        RowColor[1] := clFuchsia;
      end;
      'C' : begin       //������� ���� �Ұ�
        RowColor[1] := clFuchsia;
      end;
      'D' : begin       //����� ���� �Ұ�
        RowColor[1] := clFuchsia;
      end;
      'E' : begin       //���� ���� �ð�
        RowColor[1] := clFuchsia;
      end;
      'F' : begin       //��ȿ�Ⱓ ����
        RowColor[1] := clFuchsia;
      end;
      'G' : begin       //����
        RowColor[1] := clYellow;
      end;
      'H' : begin       //��������ԺҰ�
        RowColor[1] := clFuchsia;
      end;
      'I' : begin       //�����ٸ�
        RowColor[1] := clFuchsia;
      end;
      'J' : begin       //��Ƽ�н� �Ұ�
        RowColor[1] := clFuchsia;
      end;
    end;

    if RowCount > 1000 then RowCount := 1000;

  end;
end;

procedure TfmMonitoring.DeviceReload;
begin
  LoadBuilding;
  LoadBuildingDoor;
  LoadBuildingArmArea;
end;

procedure TfmMonitoring.DoorChangeEvent(aDecoderNo:integer;aNodeNo, aEcuID, aType, aNo, aCmd,
  aData, aBuildingCode: string);
var
  stDoorID : string;
  nIndex : Integer;
  nBuildingIndex : integer;
  stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent : string;
  nImageIndex : integer;
begin
  stDoorID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aNo;
  nIndex := BuildingDoorList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  nBuildingIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
  if nBuildingIndex < 0 then Exit;
  if Not TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nBuildingIndex]).GetDoorCurrentState(aDecoderNo,aNodeNo,aEcuID,aNo,stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent) then Exit;
  nImageIndex := GetDoorManageModeImageIndex(stDoorCardMode,stDoorManageMode);
  DoorListView.Items[nIndex].StateIndex := nImageIndex;
  nImageIndex := GetDoorStateImageIndex(stDoorDSState,stDoorLSState,stDoorFireEvent);
  DoorListView.Items[nIndex].ImageIndex := nImageIndex;

  
  //DoorListView.Refresh;
end;

procedure TfmMonitoring.doorListView_Click(Sender: TObject);
begin
  inherited;
//  popupMenu := nil;
  if doorListView.ItemIndex < 0 then Exit;
  if doorListView.ItemIndex > (doorListView.Items.Count ) then Exit;
  if Not IsInsertGrade then
  begin
    mn_DoorOpen.Enabled := False;
    pm_JavarOpen.Enabled := False;
    pm_JavarClose.Enabled := False;
    pm_DoorManageMode.Enabled := False;
    pm_DooOpenMode.Enabled := False;
    pm_DoorCloseMode.Enabled := False;
    pm_CardMode.Enabled := False;
    mn_BuildingDoorClose.Enabled := False;
    mn_BuildingDoorOpen.Enabled := False;
  end else
  begin
    mn_DoorOpen.Enabled := True;
    pm_JavarOpen.Enabled := True;
    pm_JavarClose.Enabled := True;
    pm_DoorManageMode.Enabled := True;
    pm_DooOpenMode.Enabled := True;
    pm_DoorCloseMode.Enabled := True;
    pm_CardMode.Enabled := True;
    mn_BuildingDoorClose.Enabled := True;
    mn_BuildingDoorOpen.Enabled := True;
  end;
  pm_CardMode.Visible := G_bCardModeShow;
  N1.Visible := G_bCardModeShow;
end;

procedure TfmMonitoring.doorListView_SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  stLockType : string;
  bJavaraType : Boolean;
begin
  if Selected then
  begin
      stLockType := TListView(Sender).Selected.SubItems.Strings[1];
      if stLockType = '10' then
      begin
        bJavaraType := True;
      end else
      begin
        bJavaraType := False;
      end;
      pm_JavarOpen.Visible := bJavaraType;
      pm_JavarClose.Visible := bJavaraType;
      mn_DoorOpen.Visible := Not bJavaraType;
      N9.Visible := Not bJavaraType;
      pm_DoorManageMode.Visible := Not bJavaraType;
      pm_DooOpenMode.Visible := Not bJavaraType;
      pm_DoorCloseMode.Visible := Not bJavaraType;

      if (G_nFingerRelayType = 2) or (G_nFingerRelayType = 3) then
      begin
        mn_RegFingerSpace.Visible := True;
        mn_RegFinger.Visible := True;
      end else
      begin
        mn_RegFingerSpace.Visible := False;
        mn_RegFinger.Visible := False;
      end;
  end else popupMenu := nil;
end;

procedure TfmMonitoring.FormActivate(Sender: TObject);
begin
  inherited;
  ActiveTimer.Enabled := True;

end;

procedure TfmMonitoring.FormChangeEvent(aFormName: integer);
begin

end;

procedure TfmMonitoring.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini_fun : TiniFile;
  i : integer;
begin
  L_bClose := True;
  ReSizeTimer.Enabled := False;
  ActiveTimer.Enabled := False;

  WriteIniConfig;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\Monitoring.INI');
    with ini_fun do
    begin
      WriteInteger('Form','DoorDeviceWidth',Pan_Device.Width);
      WriteInteger('Form','DoorStateHeight',ap_DoorState.Height);
      WriteInteger('Form','AlarmDeviceWidth',pan_AlarmDevice.Width);
      WriteInteger('Form','AlarmStateHeight',pan_AlarmState.Height);
    end;
  Finally
    ini_fun.Free;
  End;
  fmMain.FORMENABLE(con_FormBMOSMONITOR,'FALSE');

  Finalize(L_arrAccessEventIndexArray);
  Finalize(L_arrRelAccessEventIndexArray);
  Finalize(L_arrAccessEventShowTable);
  Finalize(L_arrAccessEventSizeTable);

  Finalize(L_arrDeviceEventIndexArray);
  Finalize(L_arrRelDeviceEventIndexArray);
  Finalize(L_arrDeviceEventShowTable);
  Finalize(L_arrDeviceEventSizeTable);

  Finalize(L_arrAlarmEventIndexArray);
  Finalize(L_arrRelAlarmEventIndexArray);
  Finalize(L_arrAlarmEventShowTable);
  Finalize(L_arrAlarmEventSizeTable);

  Finalize(L_arrAlarmModeIndexArray);
  Finalize(L_arrRelAlarmModeIndexArray);
  Finalize(L_arrAlarmModeShowTable);
  Finalize(L_arrAlarmModeSizeTable);

  ArmAreaBuildingCodeList.Free;
  BuildingCodeList.Free;
  BuildingArmAreaList.Free;
  BuildingDoorList.Free;
  Action := caFree;
end;

procedure TfmMonitoring.FormCreate(Sender: TObject);
begin
  inherited;
  L_bClose := False;
  BuildingCode := '0' ; //��ü
  ArmAreaBuildingCode := '0' ; //��ü
  ArmAreaBuildingCodeList := TStringList.Create;
  BuildingCodeList := TStringList.Create;
  BuildingArmAreaList := TStringList.Create;
  BuildingDoorList := TStringList.Create;
  AccessEventHeaderNameList := TStringList.Create;
  DeviceEventHeaderNameList := TStringList.Create;
  AlarmEventHeaderNameList := TStringList.Create;
  AlarmModeHeaderNameList := TStringList.Create;

  if G_bAccessMonitoringUse then
  begin
    LoadServerGrid(sg_AccessServer);
    sg_AccessServerDblClick(sg_AccessServer);
    if G_nMonitoringType = 1 then   //�бⱹ���ΰ��
    begin
      ap_AccessDevice.TabVisible := False;
      ap_AccessDoor.TabVisible := False;
    end;
    if G_nMonitoringProtocol = 1 then  //����ġ�� ����ϴ� ���
    begin
      ap_AccessDevice.TabVisible := False;
    end;
    ap_AccessControler.ActivePage := ap_AccessNode;
  end;

  if G_bAlarmMonitoringUse then
  begin
    LoadServerGrid(sg_AlarmServer);
    sg_AlarmServerDblClick(sg_AlarmServer);
    if G_nMonitoringType = 1 then   //�бⱹ���ΰ��
    begin
      ap_AlarmDevice.TabVisible := False;
      ap_AlarmArmArea.TabVisible := False;
    end;
    if G_nMonitoringProtocol = 1 then  //����ġ�� ����ϴ� ���
    begin
      ap_AlarmDevice.TabVisible := False;
    end;
    ap_AlarmControler.ActivePage := ap_AlarmNode;
  end;

  PageControl1.ActivePageIndex := 0;
  sg_AccessEvent.RowCount := 2;
  sg_AccessAlarmEvent.RowCount := 2;
  sg_AlarmEvent.RowCount := 2;
  sg_ModeChange.RowCount := 2;

  sg_ModeChange.RowCount := 2;
  ap_AlarmEvent.ActivePageIndex := 0;
  FormNameSetting;

end;

procedure TfmMonitoring.FormGradeRefresh;
begin

end;

procedure TfmMonitoring.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmMonitoring.FormNameSetting: Boolean;
begin
  Caption := dmFormFunction.GetFormName('2','2','BM3_012Caption');
  ap_Access.Caption := dmFormFunction.GetFormName('2','2','BM3_012AccessMonitor');
  ap_Alarm.Caption := dmFormFunction.GetFormName('2','2','BM3_012AlarmMonitor');
  ap_Building.Caption := dmFormFunction.GetFormName('0','2','COMMONBUILDING');
  ap_ArmAreaBuilding.Caption := dmFormFunction.GetFormName('0','2','COMMONBUILDING');
  lb_Building1.Caption := dmFormFunction.GetFormName('0','2','COMMONBUILDING');
  lb_Building2.Caption := dmFormFunction.GetFormName('0','2','COMMONBUILDING');

  lb_List.Caption := dmFormFunction.GetFormName('2','2','BM3_012Controler');
  lb_List1.Caption := dmFormFunction.GetFormName('2','2','BM3_012Controler');
  //lb_DoorState.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorState');
  //lb_AlarmState.Caption := dmFormFunction.GetFormName('2','2','BM3_012AlarmState');
  //lb_AlarmState1.Caption := dmFormFunction.GetFormName('2','2','BM3_012AlarmState');
  lb_DisArmMode.Caption := dmFormFunction.GetFormName('2','2','BM3_012DisArmMode');
  lb_ArmMode.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmMode');
  lb_AlarmEvent.Caption := dmFormFunction.GetFormName('2','2','BM3_012Alarm');
  gb_DeviceState.Caption := dmFormFunction.GetFormName('2','2','BM3_012Example');
  lb_DoorstateExample.Caption := dmFormFunction.GetFormName('2','2','BM3_012Example');
  lb_DeviceStateExample.Caption := dmFormFunction.GetFormName('2','2','BM3_012Example');
  gb_DeviceState1.Caption := dmFormFunction.GetFormName('2','2','BM3_012Example');
  gb_AlarmStateExample.Caption := dmFormFunction.GetFormName('2','2','BM3_012Example');
  lb_AlarmDeviceStateExample.Caption := dmFormFunction.GetFormName('2','2','BM3_012Example');
  lb_AlarmstateExample.Caption := dmFormFunction.GetFormName('2','2','BM3_012Example');
  lb_NodeState1.Caption := dmFormFunction.GetFormName('2','2','BM3_012NodeState');
  lb_NodeState2.Caption := dmFormFunction.GetFormName('2','2','BM3_012NodeState');
  lb_DeviceState1.Caption := dmFormFunction.GetFormName('2','2','BM3_012DeviceState');
  lb_DeviceState2.Caption := dmFormFunction.GetFormName('2','2','BM3_012DeviceState');
  lb_NodeDisConnect1.Caption := dmFormFunction.GetFormName('2','2','BM3_012NDisCon');
  lb_NodeDisConnect2.Caption := dmFormFunction.GetFormName('2','2','BM3_012NDisCon');
  lb_NodeConnect1.Caption := dmFormFunction.GetFormName('2','2','BM3_012NCon');
  lb_NodeConnect2.Caption := dmFormFunction.GetFormName('2','2','BM3_012NCon');
  lb_NodePartConnect1.Caption := dmFormFunction.GetFormName('2','2','BM3_012NPartCon');
  lb_NodePartConnect2.Caption := dmFormFunction.GetFormName('2','2','BM3_012NPartCon');
  lb_DeviceDisconnect1.Caption := dmFormFunction.GetFormName('2','2','BM3_012DDisCon');
  lb_Deviceconnect1.Caption := dmFormFunction.GetFormName('2','2','BM3_012DCon');
  lb_Deviceconnect2.Caption := dmFormFunction.GetFormName('2','2','BM3_012DCon');
  lb_DoorOpen.Caption := dmFormFunction.GetFormName('2','2','BM3_012DOOROPEN');
  lb_DoorPManager.Caption := dmFormFunction.GetFormName('2','2','BM3_012DOORPM');
  lb_DoorNManager.Caption := dmFormFunction.GetFormName('2','2','BM3_012DOORNM');
  lb_DoorLock.Caption := dmFormFunction.GetFormName('2','2','BM3_012DOORLOCK');
  lb_DoorMode.Caption := dmFormFunction.GetFormName('2','2','BM3_012DOORMODE');
  lb_DoorState1.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorState');
  lb_DoorOpenState.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorOState');
  lb_DoorCloseState.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorCState');
  lb_DoorTimeOver.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorTimeOver');
  lb_DoorFire.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorFire');
  lb_DoorNodeIP.Caption := dmFormFunction.GetFormName('2','2','BM3_012NodeIP');
  lb_DoorDeviceID.Caption := dmFormFunction.GetFormName('2','2','BM3_012DeviceID');
  lb_DoorID.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorID');
  lb_DoorPositoin.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorPosition');
  btn_DoorInfoConfirm.Caption := dmFormFunction.GetFormName('0','2','COMMONCONFIRM');
  lb_DoorInfo.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorInfo');
  lb_DoorName1.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
  lb_ArmAreaInfo.Caption := dmFormFunction.GetFormName('0','2','BM3_012ArmAreaInfo');
  lb_ArmAreaName1.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREANAME');
  lb_ArmAreaNodeIP.Caption := dmFormFunction.GetFormName('2','2','BM3_012NodeIP');
  lb_ArmAreaDeviceID.Caption := dmFormFunction.GetFormName('2','2','BM3_012DeviceID');
  lb_ArmAreaNo1.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREANO');
  lb_ArmAreaPositoin.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmAreaPosition');
  lb_ArmAreaTelno1.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmAreaTel');
  lb_ArmAreaMemo.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmAreaMemo');
  btn_ArmAreaInfoConfirm.Caption := dmFormFunction.GetFormName('0','2','COMMONCONFIRM');
  tb_AccessEvent.Caption := dmFormFunction.GetFormName('2','2','BM3_012AccessEvent') + ' ';
  L_stAccessAlarmCaption := dmFormFunction.GetFormName('2','2','BM3_012AccessAlarm') + ' ';
  tb_AccessAlarm.Caption := L_stAccessAlarmCaption;
  tb_AlarmEvent.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmEvent') + ' ';
  tb_ArmModeChange.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmModeChange') + ' ';

  mn_BuildingDoorClose.Caption := dmFormFunction.GetFormName('0','2','COMMONALLCLOSE');
  mn_BuildingDoorOpen.Caption := dmFormFunction.GetFormName('0','2','COMMONALLOPEN');
  mn_BuildingDoorClose.Caption := dmFormFunction.GetFormName('0','2','COMMONALLCLOSE');
  mn_DoorOpen.Caption := dmFormFunction.GetFormName('0','2','COMDOOROPEN');
  pm_JavarOpen.Caption := dmFormFunction.GetFormName('0','2','COMJAVARAOPEN');
  pm_JavarClose.Caption := dmFormFunction.GetFormName('0','2','COMJAVARACLOSE');
  pm_DoorManageMode.Caption := dmFormFunction.GetFormName('0','2','COMMONCLOSEMODE');
  pm_DooOpenMode.Caption := dmFormFunction.GetFormName('0','2','COMMONOPENMODE');
  pm_DoorCloseMode.Caption := dmFormFunction.GetFormName('0','2','COMMONLOCKMODE');
  Positive1.Caption  := dmFormFunction.GetFormName('0','2','COMDOORPOSI');
  Negative1.Caption  := dmFormFunction.GetFormName('0','2','COMDOORNEGA');
  pm_CardMode.Caption  := dmFormFunction.GetFormName('0','2','COMDOORCARDMODE');
  pm_DoorStateCheck.Caption := dmFormFunction.GetFormName('0','2','COMDOORSTATESEARCH');
  N11.Caption := dmFormFunction.GetFormName('0','2','COMSCREEN');
  N12.Caption := dmFormFunction.GetFormName('0','2','COMBIGICON');
  N13.Caption := dmFormFunction.GetFormName('0','2','COMSMALLICON');
  pm_DoorInfo.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorInfo');
  pm_AlarmConfirm.Caption := dmFormFunction.GetFormName('0','2','COMALARMCONFIRM');
  pm_ArmAreaStateSearch.Caption := dmFormFunction.GetFormName('0','2','COMARMSTATESEARCH');
  pm_ArmModeChange.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmMode');
  pm_DisArmModeChange.Caption := dmFormFunction.GetFormName('2','2','BM3_012DisArmMode');
  pm_LargeIcon.Caption := dmFormFunction.GetFormName('0','2','COMBIGICON');
  pm_SmallICon.Caption := dmFormFunction.GetFormName('0','2','COMSMALLICON');
  pm_DeviceInfo.Caption := dmFormFunction.GetFormName('0','2','COMDEVICEINFO');
  pm_AlarmReport.Caption := dmFormFunction.GetFormName('2','1','BM4_013');
  mn_AlarmConfirm1.Caption := dmFormFunction.GetFormName('0','2','COMALARMCONFIRM');
  mn_CardNOCopy.Caption := dmFormFunction.GetFormName('0','2','COMCARDNOCOPY');

  ap_AccessServerState.Caption:= dmFormFunction.GetFormName('0','2','COMMONSERVERSTATE');
  ap_AccessNode.Caption:= dmFormFunction.GetFormName('0','2','COMMONNODESTATE');
  ap_AccessDevice.Caption:= dmFormFunction.GetFormName('0','2','COMMONDEVICESTATE');
  ap_AccessDoor.Caption:= dmFormFunction.GetFormName('0','2','COMMONDOORSTATE');
  lb_DoorState.Caption:= dmFormFunction.GetFormName('0','2','COMMONDOORSTATE');

  ap_AlarmServer.Caption:= dmFormFunction.GetFormName('0','2','COMMONSERVERSTATE');
  ap_AlarmNode.Caption:= dmFormFunction.GetFormName('0','2','COMMONNODESTATE');
  ap_AlarmDevice.Caption:= dmFormFunction.GetFormName('0','2','COMMONDEVICESTATE');
  ap_AlarmArmArea.Caption:= dmFormFunction.GetFormName('0','2','COMMONARMAREASTATE');
  lb_AlarmState.Caption:= dmFormFunction.GetFormName('0','2','COMMONARMAREASTATE');

  sg_AccessServer.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONSERVERNAME');
  sg_AccessServer.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONSERVERID');
  sg_AccessNode.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  sg_AccessNode.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONNODEIP01');
  sg_AccessNode.Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONNODENO');
  sg_AccessDevice.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONCONTROLERID');
  sg_AccessDevice.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONDEVICENAME');
  sg_AccessDoor.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONDOORNO');
  sg_AccessDoor.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');

  sg_AlarmServer.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONSERVERNAME');
  sg_AlarmServer.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONSERVERID');
  sg_AlarmNode.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  sg_AlarmNode.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONNODEIP01');
  sg_AlarmNode.Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONNODENO');
  sg_AlarmDevice.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONCONTROLERID');
  sg_AlarmDevice.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONDEVICENAME');
  sg_AlarmArmArea.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONARMAREANO');
  sg_AlarmArmArea.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONARMAREANAME');

  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');
end;

procedure TfmMonitoring.FormResize(Sender: TObject);
begin
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

  ReSizeTimer.Enabled := False;
  ReSizeTimer.Enabled := True;

  pan_AlarmStateResize(pan_AlarmState);
  pan_DoorStateResize(pan_DoorState);
  pan_BuildingResize(pan_Building);

//  LoadBuilding;
//  LoadBuildingDoor;
//  LoadBuildingArmArea;

end;

procedure TfmMonitoring.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  inherited;
  Application.ProcessMessages;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringDoorState.INI');
    with ini_fun do
    begin
      L_nViewListStyle := 0;
      if ReadString('MONITOR','ViewStyle','VSICON') = 'VSLIST' then
      begin
        DoorListView.ViewStyle := vsList;
        L_nViewListStyle := 1;
      end else
      begin
        DoorListView.ViewStyle := vsIcon;
        L_nViewListStyle := 0;
      end;
    end;
  Finally
    ini_fun.Free;
  End;

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringArmAreaState.INI');
    with ini_fun do
    begin
      if ReadString('MONITOR','ViewStyle' + BuildingCode,'VSICON') = 'VSICON' then
      begin
        ArmAreaListView.ViewStyle := vsIcon;
        L_nAlarmViewListStyle := 0;
      end else
      begin
        ArmAreaListView.ViewStyle := vsList;
        L_nAlarmViewListStyle := 1;
      end;
    end;
  Finally
    ini_fun.Free;
  End;

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\Monitoring.INI');
    with ini_fun do
    begin
      Pan_Device.Width := ReadInteger('Form','DoorDeviceWidth',256);
      ap_DoorState.Height := ReadInteger('Form','DoorStateHeight',400);
      pan_AlarmDevice.Width := ReadInteger('Form','AlarmDeviceWidth',256);
      pan_AlarmState.Height := ReadInteger('Form','AlarmStateHeight',400);
    end;
  Finally
    ini_fun.Free;
  End;

  ListHeaderNameGet;  //���� ���� �� ��...

  SetLength(L_arrAccessEventIndexArray,AccessEventHeaderNameList.Count);
  SetLength(L_arrRelAccessEventIndexArray,AccessEventHeaderNameList.Count);
  SetLength(L_arrAccessEventShowTable,AccessEventHeaderNameList.Count);
  SetLength(L_arrAccessEventSizeTable,AccessEventHeaderNameList.Count);

  SetLength(L_arrDeviceEventIndexArray,DeviceEventHeaderNameList.Count);
  SetLength(L_arrRelDeviceEventIndexArray,DeviceEventHeaderNameList.Count);
  SetLength(L_arrDeviceEventShowTable,DeviceEventHeaderNameList.Count);
  SetLength(L_arrDeviceEventSizeTable,DeviceEventHeaderNameList.Count);

  SetLength(L_arrAlarmEventIndexArray,AlarmEventHeaderNameList.Count);
  SetLength(L_arrRelAlarmEventIndexArray,AlarmEventHeaderNameList.Count);
  SetLength(L_arrAlarmEventShowTable,AlarmEventHeaderNameList.Count);
  SetLength(L_arrAlarmEventSizeTable,AlarmEventHeaderNameList.Count);

  SetLength(L_arrAlarmModeIndexArray,AlarmModeHeaderNameList.Count);
  SetLength(L_arrRelAlarmModeIndexArray,AlarmModeHeaderNameList.Count);
  SetLength(L_arrAlarmModeShowTable,AlarmModeHeaderNameList.Count);
  SetLength(L_arrAlarmModeSizeTable,AlarmModeHeaderNameList.Count);

  ListConfigRead;
  ListHeaderNameSetting;
  ListCellSize;

  pm_ArmAreaStateSearch.Visible := True;
  N4.Visible := True;
  pm_ArmModeChange.Visible := True;
  pm_DisArmModeChange.Visible := True;
  N6.Visible := True;
  N14.Visible := True;
  pm_DeviceInfo.Visible := True;
  N1.Visible := True;
  pm_AlarmReport.Visible := True;

  fmMain.FORMENABLE(con_FormBMOSMONITOR,'TRUE');
  fmMain.FORMALARMCONFIRMExecute;

  ap_Alarm.TabVisible := G_bAlarmMonitoringUse;
  ap_Access.TabVisible := G_bAccessMonitoringUse;
  ap_DoorState.ActivePageIndex := 0;
  ap_ArmAreaState.ActivePageIndex := 0;
  if G_bAccessMonitoringUse then
     AdvOfficePager1.ActivePage := ap_Access
  else AdvOfficePager1.ActivePage := ap_Alarm;

  LoadBuilding;
  if G_bAccessMonitoringUse then
  begin
    LoadBuildingDoor;
    ap_DoorState.ActivePage := ap_Door;
  end;
  if G_bAlarmMonitoringUse then
  begin
    LoadBuildingArmArea;
    ap_ArmAreaState.ActivePage := ap_ArmArea;
  end;

end;

function TfmMonitoring.GetDoorManageModeImageIndex(aDoorCardMode,
  aDoorManageMode: string): integer;
begin
  result := -1;
  if aDoorCardMode = '' then Exit;
  if aDoorManageMode = '' then Exit;
  case aDoorManageMode[1] of
    '0' : begin       //�
      case aDoorCardMode[1] of
        '0' : result := con_DoorStatePosiManageMode;
        '1' : result := con_DoorStateNegaManageMode;
        '2' : result := con_DoorStateAckManageMode;
        '3' : result := con_DoorStateNegaManageMode;
        else result := -1;
      end;
    end;
    '1' : begin      //����
      case aDoorCardMode[1] of
        '0' : result := con_DoorStatePosiOpenMode;
        '1' : result := con_DoorStateNegaOpenMode;
        '2' : result := con_DoorStatePosiOpenMode;
        '3' : result := con_DoorStateNegaOpenMode;
        else result := -1;
      end;
    end;
    '2' : begin      //���
      case aDoorCardMode[1] of
        '0' : result := con_DoorStatePosiCloseMode;
        '1' : result := con_DoorStateNegaCloseMode;
        '2' : result := con_DoorStatePosiCloseMode;
        '3' : result := con_DoorStateNegaCloseMode;
        else result := -1;
      end;
    end;
    else begin
      result := -1;
    end;
  end;
end;

function TfmMonitoring.GetDoorStateImageIndex(aDoorDSState, aDoorLSState,
  aDoorFireEvent: string): integer;
begin
  result := con_DoorImageNothing;
  if aDoorFireEvent = '1' then
  begin
    result := con_DoorImageFire;
    Exit;
  end;
  if aDoorDSState = '' then Exit;
  case aDoorDSState[1] of
    'C': //����
      begin
        result := con_DoorImageClose;
      end;
    'O': //����
      begin
        result := con_DoorImageOpen;
      end;
    'E': //����
      begin
        //result := ;
      end;
    'T','D'://��ð� ����
      begin
        result := con_DoorImageLongTime;
      end;
    'U':    //�����̻�
      begin
        result := con_DoorImageClose;
      end;
    'L':    //�����̻�
      begin
        result := con_DoorImageOpen;
      end;
  end;
end;

procedure TfmMonitoring.lb_AlarmDeviceStateExampleMouseEnter(Sender: TObject);
begin
  inherited;
  gb_DeviceState1.Visible := True;

end;

procedure TfmMonitoring.lb_AlarmDeviceStateExampleMouseLeave(Sender: TObject);
begin
  inherited;
  gb_DeviceState1.Visible := False;

end;

procedure TfmMonitoring.lb_AlarmstateExampleMouseEnter(Sender: TObject);
begin
  inherited;
  gb_AlarmStateExample.Visible := True;
end;

procedure TfmMonitoring.lb_AlarmstateExampleMouseLeave(Sender: TObject);
begin
  inherited;
  gb_AlarmStateExample.Visible := False;

end;

procedure TfmMonitoring.lb_DeviceStateExampleMouseEnter(Sender: TObject);
begin
  inherited;
  gb_DeviceState.Visible := True;
end;

procedure TfmMonitoring.lb_DeviceStateExampleMouseLeave(Sender: TObject);
begin
  inherited;
  gb_DeviceState.Visible := False;
end;

procedure TfmMonitoring.lb_DoorstateExampleMouseEnter(Sender: TObject);
begin
  inherited;
  gb_DoorState.Visible := True;
end;

procedure TfmMonitoring.lb_DoorstateExampleMouseLeave(Sender: TObject);
begin
  inherited;
  gb_DoorState.Visible := False;

end;

function TfmMonitoring.ListCellSize: Boolean;
var
  i : integer;
begin
  for i := 0 to sg_AccessEvent.ColCount - 1 do
  begin
    if L_arrAccessEventShowTable[i] = 0 then
    begin
      sg_AccessEvent.ColWidths[L_arrAccessEventIndexArray[i]] := 0;
    end else
    begin
      if L_arrAccessEventSizeTable[L_arrAccessEventIndexArray[i]] <> 0 then sg_AccessEvent.ColWidths[L_arrAccessEventIndexArray[i]] := L_arrAccessEventSizeTable[L_arrAccessEventIndexArray[i]]
      else sg_AccessEvent.ColWidths[L_arrAccessEventIndexArray[i]] := 90;
    end;
  end;
  for i := 0 to sg_AccessAlarmEvent.ColCount - 1 do
  begin
    if L_arrDeviceEventShowTable[i] = 0 then
    begin
      sg_AccessAlarmEvent.ColWidths[L_arrDeviceEventIndexArray[i]] := 0;
    end else
    begin
      if L_arrDeviceEventSizeTable[L_arrDeviceEventIndexArray[i]] <> 0 then sg_AccessAlarmEvent.ColWidths[L_arrDeviceEventIndexArray[i]] := L_arrDeviceEventSizeTable[L_arrDeviceEventIndexArray[i]]
      else sg_AccessAlarmEvent.ColWidths[L_arrDeviceEventIndexArray[i]] := 90;
    end;
  end;
  for i := 0 to sg_AlarmEvent.ColCount - 1 do
  begin
    if L_arrAlarmEventShowTable[i] = 0 then
    begin
      sg_AlarmEvent.ColWidths[L_arrAlarmEventIndexArray[i]] := 0;
    end else
    begin
      if L_arrAlarmEventSizeTable[L_arrAlarmEventIndexArray[i]] <> 0 then sg_AlarmEvent.ColWidths[L_arrAlarmEventIndexArray[i]] := L_arrAlarmEventSizeTable[L_arrAlarmEventIndexArray[i]]
      else sg_AlarmEvent.ColWidths[L_arrAlarmEventIndexArray[i]] := 90;
    end;
  end;
  for i := 0 to sg_ModeChange.ColCount - 1 do
  begin
    if L_arrAlarmModeShowTable[i] = 0 then
    begin
      sg_ModeChange.ColWidths[L_arrAlarmModeIndexArray[i]] := 0;
    end else
    begin
      if L_arrAlarmModeSizeTable[L_arrAlarmModeIndexArray[i]] <> 0 then sg_ModeChange.ColWidths[L_arrAlarmModeIndexArray[i]] := L_arrAlarmModeSizeTable[L_arrAlarmModeIndexArray[i]]
      else sg_ModeChange.ColWidths[L_arrAlarmModeIndexArray[i]] := 90;
    end;
  end;
end;

function TfmMonitoring.ListConfigRead: Boolean;
var
  ini_fun : TiniFile;
  nShowCount : integer;
  nSize : integer;
  i : integer;
begin
  L_nAccessEventShowCount := 0;
  ini_fun := TiniFile.Create(G_stExeFolder + '\Monitoring.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrAccessEventIndexArray) to HIGH(L_arrAccessEventIndexArray) do
      begin
        L_arrAccessEventIndexArray[i] := ReadInteger('LIST','AccessEventIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelAccessEventIndexArray) to HIGH(L_arrRelAccessEventIndexArray) do
      begin
        L_arrRelAccessEventIndexArray[i] := ReadInteger('LIST','RelAccessEventIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrAccessEventShowTable) to HIGH(L_arrAccessEventShowTable) do
      begin
        L_arrAccessEventShowTable[i] := ReadInteger('LIST','RelAccessEventShowArray'+inttostr(i),1);
        L_nAccessEventShowCount := L_nAccessEventShowCount + L_arrAccessEventShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrAccessEventSizeTable) to HIGH(L_arrAccessEventSizeTable) do
      begin
        L_arrAccessEventSizeTable[i] := ReadInteger('LIST','RelAccessEventSizeArray'+inttostr(i),nSize);
      end;

      for i := LOW(L_arrDeviceEventIndexArray) to HIGH(L_arrDeviceEventIndexArray) do
      begin
        L_arrDeviceEventIndexArray[i] := ReadInteger('LIST','DeviceEventIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelDeviceEventIndexArray) to HIGH(L_arrRelDeviceEventIndexArray) do
      begin
        L_arrRelDeviceEventIndexArray[i] := ReadInteger('LIST','RelDeviceEventIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrDeviceEventShowTable) to HIGH(L_arrDeviceEventShowTable) do
      begin
        L_arrDeviceEventShowTable[i] := ReadInteger('LIST','RelDeviceEventShowArray'+inttostr(i),1);
        L_nDeviceEventShowCount := L_nDeviceEventShowCount + L_arrDeviceEventShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrDeviceEventSizeTable) to HIGH(L_arrDeviceEventSizeTable) do
      begin
        L_arrDeviceEventSizeTable[i] := ReadInteger('LIST','RelDeviceEventSizeArray'+inttostr(i),nSize);
      end;

      for i := LOW(L_arrAlarmEventIndexArray) to HIGH(L_arrAlarmEventIndexArray) do
      begin
        L_arrAlarmEventIndexArray[i] := ReadInteger('LIST','AlarmEventIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelAlarmEventIndexArray) to HIGH(L_arrRelAlarmEventIndexArray) do
      begin
        L_arrRelAlarmEventIndexArray[i] := ReadInteger('LIST','RelAlarmEventIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrAlarmEventShowTable) to HIGH(L_arrAlarmEventShowTable) do
      begin
        L_arrAlarmEventShowTable[i] := ReadInteger('LIST','RelAlarmEventShowArray'+inttostr(i),1);
        L_nAlarmEventShowCount := L_nAlarmEventShowCount + L_arrAlarmEventShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrAlarmEventSizeTable) to HIGH(L_arrAlarmEventSizeTable) do
      begin
        L_arrAlarmEventSizeTable[i] := ReadInteger('LIST','RelAlarmEventSizeArray'+inttostr(i),nSize);
      end;

      for i := LOW(L_arrAlarmModeIndexArray) to HIGH(L_arrAlarmModeIndexArray) do
      begin
        L_arrAlarmModeIndexArray[i] := ReadInteger('LIST','AlarmModeIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelAlarmModeIndexArray) to HIGH(L_arrRelAlarmModeIndexArray) do
      begin
        L_arrRelAlarmModeIndexArray[i] := ReadInteger('LIST','RelAlarmModeIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrAlarmModeShowTable) to HIGH(L_arrAlarmModeShowTable) do
      begin
        L_arrAlarmModeShowTable[i] := ReadInteger('LIST','RelAlarmModeShowArray'+inttostr(i),1);
        L_nAlarmModeShowCount := L_nAlarmModeShowCount + L_arrAlarmModeShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrAlarmModeSizeTable) to HIGH(L_arrAlarmModeSizeTable) do
      begin
        L_arrAlarmModeSizeTable[i] := ReadInteger('LIST','RelAlarmModeSizeArray'+inttostr(i),nSize);
      end;
    end;
  Finally
    ini_fun.Free;
  End;

end;

function TfmMonitoring.ListFieldNameSetting: Boolean;
begin

end;

function TfmMonitoring.ListHeaderNameGet: Boolean;
begin

  if AccessEventHeaderNameList = nil then AccessEventHeaderNameList := TStringList.Create;
  if DeviceEventHeaderNameList = nil then DeviceEventHeaderNameList := TStringList.Create;
  if AlarmEventHeaderNameList = nil then AlarmEventHeaderNameList := TStringList.Create;
  if AlarmModeHeaderNameList = nil then AlarmModeHeaderNameList := TStringList.Create;


  AccessEventHeaderNameList.Clear;
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONACCESSTIME'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONDOOR'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANY'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONREADER'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONREADERPOSI'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONACCESSPERMITNAME'));

  DeviceEventHeaderNameList.Clear;
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMTIME'));
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODENAME01'));
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDEVICENO'));
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONDOOR'));
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMCONTENT'));
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODENO'));
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODEMSG01'));
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMTIME'));
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEXTENDNO'));

  AlarmEventHeaderNameList.Clear;
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMTIME'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODEIP01'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDEVICENO'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMAREANO'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMAREANAME'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDEVICETYPE'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDEVICENO'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMMODE'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONPORTNO'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMCONTENT'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODENO'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODEMSG01'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMTIME'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEXTENDNO'));


  AlarmModeHeaderNameList.Clear;
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMTIME'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODEIP01'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDEVICENO'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMAREANO'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMAREANAME'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONMANGEDETAIL'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANY'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE'));

  result := True;
end;

function TfmMonitoring.ListHeaderNameSetting: Boolean;
var
  i : integer;
begin
  sg_AccessEvent.ColCount := AccessEventHeaderNameList.Count;
  for i := LOW(L_arrAccessEventIndexArray) to HIGH(L_arrAccessEventIndexArray) do
  begin
    if (sg_AccessEvent.ColCount - 1) < i then Exit;
    if (AccessEventHeaderNameList.Count - 1) < i then Exit;

    sg_AccessEvent.cells[L_arrAccessEventIndexArray[i],0] := AccessEventHeaderNameList[i];
  end;

  sg_AccessAlarmEvent.ColCount := DeviceEventHeaderNameList.Count;
  for i := LOW(L_arrDeviceEventIndexArray) to HIGH(L_arrDeviceEventIndexArray) do
  begin
    if (sg_AccessAlarmEvent.ColCount - 1) < i then Exit;
    if (DeviceEventHeaderNameList.Count - 1) < i then Exit;

    sg_AccessAlarmEvent.cells[L_arrDeviceEventIndexArray[i],0] := DeviceEventHeaderNameList[i];
  end;

  sg_AlarmEvent.ColCount := AlarmEventHeaderNameList.Count;
  for i := LOW(L_arrAlarmEventIndexArray) to HIGH(L_arrAlarmEventIndexArray) do
  begin
    if (sg_AlarmEvent.ColCount - 1) < i then Exit;
    if (AlarmEventHeaderNameList.Count - 1) < i then Exit;

    sg_AlarmEvent.cells[L_arrAlarmEventIndexArray[i],0] := AlarmEventHeaderNameList[i];
  end;

  sg_ModeChange.ColCount := AlarmModeHeaderNameList.Count;
  for i := LOW(L_arrAlarmModeIndexArray) to HIGH(L_arrAlarmModeIndexArray) do
  begin
    if (sg_ModeChange.ColCount - 1) < i then Exit;
    if (AlarmModeHeaderNameList.Count - 1) < i then Exit;

    sg_ModeChange.cells[L_arrAlarmModeIndexArray[i],0] := AlarmModeHeaderNameList[i];
  end;
end;

procedure TfmMonitoring.LoadAlarmArmAreaGrid(aServerNo, aNodeNo, aEcuID: string;
  aList: TAdvStringGrid);
var
  i : integer;
  nServerIndex : integer;
  nArmAreaCount : integer;
  stArmAreaNo,stArmAreaName : string;
begin
  GridInit(aList,2);
  nServerIndex := PCClientSocketList.IndexOf(aServerNo);
  if nServerIndex < 0 then Exit;

  with aList do
  begin
    nArmAreaCount := TdmPCClient(PCClientSocketList.Objects[nServerIndex]).GetNodeDeviceToArmAreaCount(aNodeNo,aEcuID);
    if nArmAreaCount > 0 then
    begin
      RowCount := nArmAreaCount + 1;
      for i := 0 to nArmAreaCount - 1 do
      begin
        if TdmPCClient(PCClientSocketList.Objects[nServerIndex]).GetNodeDeviceToArmAreaIndexInfo(aNodeNo,aEcuID,i,stArmAreaNo,stArmAreaName) then
        begin
          AddImageIdx(0,i + 1,8,haLeft,vaCenter); //��������̹���
          Cells[0,i + 1] := LeftSpace + stArmAreaNo;
          Cells[1,i + 1] := stArmAreaName;
          Cells[2,i + 1] := aServerNo;
          Cells[3,i + 1] := aNodeNo;
          Cells[4,i + 1] := aEcuID;
          Cells[5,i + 1] := stArmAreaNo;
        end;
      end;
    end;
  end;
end;

function TfmMonitoring.LoadBuilding: Boolean;
var
  i : integer;
begin
  BuildingListView.Clear;
  BuildingCodeList.Clear;
  ArmAreaBuildingListView.Clear;
  ArmAreaBuildingCodeList.Clear;
  for i := 0 to G_MonitoringBuildingList.Count - 1 do
  begin
    BuildingListView.Items.Add.Caption:= TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingName;
    BuildingListView.Items[i].SubItems.Add(TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingCode);
    BuildingCodeList.Add(TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingCode);
    BuildingListView.Items[i].ImageIndex := con_BuildingImage;

    ArmAreaBuildingListView.Items.Add.Caption:= TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingName;
    ArmAreaBuildingListView.Items[i].SubItems.Add(TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingCode);
    ArmAreaBuildingCodeList.Add(TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingCode);
    ArmAreaBuildingListView.Items[i].ImageIndex := con_BuildingImage;
  end;

end;

function TfmMonitoring.LoadBuildingArmArea:Boolean;
var
  nIndex : integer;
  i : integer;
  nArmAreaIndex : integer;
  nDecoderNo : integer;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stArmAreaName : string;
  stArmAreaID : string;
  nImageIndex : integer;
  nEventIndex : integer;
  stArmState : string;
begin
  result := False;
  Try
    ArmAreaListView.Clear;
    BuildingArmAreaList.Clear;
    nIndex := G_MonitoringBuildingList.IndexOf(ArmAreaBuildingCode);
    if nIndex < 0 then Exit;
    ap_ArmArea.Caption := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).BuildingName;
    result := True;
    nArmAreaIndex := 0;
    for i := 0 to TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaCount - 1 do
    begin
      if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexDevieInfo(i,nDecoderNo,stNodeNo,stEcuID,stArmAreaNo,stArmAreaName) then
      begin
        stDecoderNo := FillZeroNumber(nDecoderNo,G_nDecoderCodeLength);
        stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
        stArmAreaID := stDecoderNo + stNodeNo + stEcuID + stArmAreaNo;

        ArmAreaListView.Items.Add.Caption:= stArmAreaName;
        ArmAreaListView.Items[nArmAreaIndex].SubItems.Add(stArmAreaID);
        nImageIndex := con_ArmAreaImageNothing;
        stArmState := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexSecurityMode(i);

        nEventIndex := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexArmAreaState(i);
        case nEventIndex of
          1 : begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
          end;
          2 : begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaEventImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaEventImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
          end;
          3 : begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaAlarmImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaAlarmImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateAlarmEvent;
          end;
          else begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNotEvent;
          end;
        end;
        ArmAreaListView.Items[nArmAreaIndex].ImageIndex := nImageIndex;
        BuildingArmAreaList.Add(stArmAreaID);
        nArmAreaIndex := nArmAreaIndex + 1;
      end;
    end;
  Except
    Exit;
  End;
end;

function TfmMonitoring.LoadBuildingDoor:Boolean;
var
  nIndex : integer;
  i : integer;
  nDecoderNo : integer;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stDoorName : string;
  nDoorIndex : integer;
  stDoorLockType : string;
  stDoorCardMode : string;
  stDoorManageMode : string;
  stDoorDSState : string;
  stDoorLSState : string;
  stDoorFireEvent : string;
  stDoorLongTimeEvent : string;
  nImageIndex : integer;
  ini_fun : TiniFile;
begin
  result := False;
  Try
    doorListView.Clear;
    BuildingDoorList.Clear;
    nIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
    if nIndex < 0 then Exit;
    ap_Door.Caption := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).BuildingName;
    nDoorIndex := 0;
    for i := 0 to TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorCount - 1 do
    begin
      if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorIndexDevieInfo(i,nDecoderNo,stNodeNo,stEcuID,stDoorNo,stDoorName) then
      begin
        stDecoderNo := FillZeroNumber(nDecoderNo,G_nDecoderCodeLength);
        stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
        stDoorLockType := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorIndexLockType(i);
        if stDoorLockType = '11' then  continue; //�ڹٶ� - ���� Ÿ���̸� ���Թ��� ǥ�� ���� ����
        if Not TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorIndexCurrentState(i,stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent) then continue;
        DoorListView.Items.Add.Caption:= stDoorName;
        DoorListView.Items[nDoorIndex].SubItems.Add(stDecoderNo + stNodeNo + stEcuID + stDoorNo);
        DoorListView.Items[nDoorIndex].SubItems.Add(stDoorLockType);               //��Ÿ�� Ȯ���ؼ� �ڹٶ��̸� �ڹٶ� ����/�������� ���� �ϵ���
        nImageIndex := GetDoorManageModeImageIndex(stDoorCardMode,stDoorManageMode);
        DoorListView.Items[nDoorIndex].StateIndex := nImageIndex;
        nImageIndex := GetDoorStateImageIndex(stDoorDSState,stDoorLSState,stDoorFireEvent);
        DoorListView.Items[nDoorIndex].ImageIndex := nImageIndex;
        BuildingDoorList.Add(stDecoderNo + stNodeNo + stEcuID + stDoorNo);
        nDoorIndex := nDoorIndex + 1;
      end;
    end;
    result := True;
  Except
    Exit;
  End;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringDoorState.INI');
    with ini_fun do
    begin
      L_nViewListStyle := 0;
      if ReadString('MONITOR','ViewStyle'  + BuildingCode,'VSICON') = 'VSLIST' then
      begin
        DoorListView.ViewStyle := vsIcon;
        DoorListView.Refresh;
        DoorListView.ViewStyle := vsList;
        L_nViewListStyle := 1;
      end else
      begin
        DoorListView.ViewStyle := vsList;
        DoorListView.Refresh;
        DoorListView.ViewStyle := vsIcon;
        L_nViewListStyle := 0;
      end;
    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmMonitoring.LoadDeviceGrid(aServerNo,aNodeNo: string; aList: TAdvStringGrid);
var
  k : integer;
  nServerIndex : integer;
  nNodeIndex : integer;
  nNodeDeviceCount : integer;
  stEcuID,stEcuName : string;
begin
  GridInit(aList,2);
  nServerIndex := PCClientSocketList.IndexOf(aServerNo);
  if nServerIndex < 0 then Exit;
  nNodeIndex := TdmPCClient(PCClientSocketList.Objects[nServerIndex]).GetNodeIndex(aNodeNo);
  if nNodeIndex < 0 then Exit;

  with aList do
  begin
    nNodeDeviceCount := TdmPCClient(PCClientSocketList.Objects[nServerIndex]).GetNodeIndexDeviceCount(nNodeIndex);
    RowCount := nNodeDeviceCount + 1;
    if nNodeDeviceCount > 0 then
    begin
      for k := 0 to nNodeDeviceCount - 1 do
      begin
        if TdmPCClient(PCClientSocketList.Objects[nServerIndex]).GetNodeIndexDeviceIndexName(nNodeIndex,k,stEcuID,stEcuName) then
        begin
          case TdmPCClient(PCClientSocketList.Objects[nServerIndex]).GetNodeIndexDeviceConnect(nNodeIndex,stEcuID)[1] of
            '0' : begin
              AddImageIdx(0,k + 1,con_LocalDeviceDisConnectedImageIndex,haLeft,vaCenter);
            end;
            '1' : begin
              AddImageIdx(0,k + 1,con_LocalDeviceConnectedImageIndex,haLeft,vaCenter);
            end;
            else begin
              AddImageIdx(0,k + 1,con_LocalDeviceDisConnectedImageIndex,haLeft,vaCenter);
            end;
          end;
          Cells[0,k + 1] := LeftSpace + stEcuID;
          Cells[1,k + 1] := stEcuName;
          Cells[2,k + 1] := aServerNo;
          Cells[3,k + 1] := aNodeNo;
          Cells[4,k + 1] := stEcuID;
        end;
      end;
    end;
  end;
end;

procedure TfmMonitoring.LoadDoorGrid(aServerNo, aNodeNo, aEcuID: string;
  aList: TAdvStringGrid);
var
  i : integer;
  nServerIndex : integer;
  nDoorCount : integer;
  stDoorNo,stDoorName : string;
begin
  GridInit(aList,2);
  nServerIndex := PCClientSocketList.IndexOf(aServerNo);
  if nServerIndex < 0 then Exit;

  with aList do
  begin
    nDoorCount := TdmPCClient(PCClientSocketList.Objects[nServerIndex]).GetNodeDeviceToDoorCount(aNodeNo,aEcuID);
    if nDoorCount > 0 then
    begin
      RowCount := nDoorCount + 1;
      for i := 0 to nDoorCount - 1 do
      begin
        if TdmPCClient(PCClientSocketList.Objects[nServerIndex]).GetNodeDeviceToDoorIndexInfo(aNodeNo,aEcuID,i,stDoorNo,stDoorName) then
        begin
          AddImageIdx(0,i + 1,12,haLeft,vaCenter); //���Թ��̹���
          Cells[0,i + 1] := LeftSpace + stDoorNo;
          Cells[1,i + 1] := stDoorName;
          Cells[2,i + 1] := aServerNo;
          Cells[3,i + 1] := aNodeNo;
          Cells[4,i + 1] := aEcuID;
          Cells[5,i + 1] := stDoorNo;
        end;
      end;
    end;
  end;
end;

procedure TfmMonitoring.LoadMainGrid(aServerNo: string; aList: TAdvStringGrid);
var
  i : integer;
  nIndex : integer;
  nNodeCount : integer;
  stNodeConnected : string;
  nNodeNo : integer;
begin
  GridInit(aList,2);
  nIndex := PCClientSocketList.IndexOf(aServerNo);
  if nIndex < -1 then Exit;
  nNodeCount := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeCount;

  with aList do
  begin
    RowCount := nNodeCount + 1;
    for i := 0 to nNodeCount - 1 do
    begin
      stNodeConnected := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeIndexNodeConnected(i);
      case stNodeConnected[1] of
        '2' : begin
          AddImageIdx(0,i + 1,con_LocalNodeAllConnectedImageIndex,haLeft,vaCenter);
        end;
        '1' : begin
          AddImageIdx(0,i + 1,con_LocalNodeConnectedImageIndex,haLeft,vaCenter);
        end;
        '0' : begin
          AddImageIdx(0,i + 1,con_LocalNodeDisConnectedImageIndex,haLeft,vaCenter);
        end;
        else begin
          AddImageIdx(0,i + 1,con_LocalNodeDisConnectedImageIndex,haLeft,vaCenter);
        end;
      end;
      nNodeNo :=  TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeIndexNodeNo(i);
      //Cells[0,i + 1] := LeftSpace + FillZeroNumber(nNodeNo,G_nNodeCodeLength)  + ':' + TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeIndexName(i);
      Cells[0,i + 1] := LeftSpace + TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeIndexName(i);
      Cells[1,i + 1] := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeIndexIP(i);
      Cells[2,i + 1] := aServerNo;
      Cells[3,i + 1] := inttostr(nNodeNo);
    end;
    Refresh;
  end;
end;

procedure TfmMonitoring.LoadServerGrid(aList: TAdvStringGrid);
var
  i : integer;
begin
  GridInit(aList,1);

  with aList do
  begin
    RowCount := PCClientSocketList.Count + 1;
    for i := 0 to PCClientSocketList.Count - 1 do
    begin
      if TdmPCClient(PCClientSocketList.Objects[i]).Connected then
      begin
        AddImageIdx(0,i + 1,con_LocalServerConnectedImageIndex,haLeft,vaCenter);
      end else
      begin
        AddImageIdx(0,i + 1,con_LocalServerDisConnectedImageIndex,haLeft,vaCenter);
      end;
      Cells[0,i + 1] := LeftSpace + FillZeroNumber(TdmPCClient(PCClientSocketList.Objects[i]).DecoderNo,3) + ':' + TdmPCClient(PCClientSocketList.Objects[i]).ServerIP;
      Cells[1,i + 1] := inttostr(TdmPCClient(PCClientSocketList.Objects[i]).DecoderNo);
    end;
    Refresh;
  end;
end;

procedure TfmMonitoring.LoadTreeDeviceList(aTreeList,vTreeList:TTreeView);
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  i,j,k : integer;
  stNodeNo : string;
  stNodeCaption : string;
  stNodeConnected : string;
  stDecoderNo : string;
  stEcuID,stEcuName : string;
  nNodeCount : integer;
  nNodeDeviceCount : integer;
begin
  aTreeView := aTreeList;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := vTreeList;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  if PCClientSocketList.Count < 1 then Exit;

  for i := 0 to PCClientSocketList.Count - 1 do
  begin
    stDecoderNo := FillZeroNumber(TdmPCClient(PCClientSocketList.Objects[i]).DecoderNo,G_nDecoderCodeLength);
    aNode := aTreeView.Items.Add(nil, stDecoderNo + ':' + TdmPCClient(PCClientSocketList.Objects[i]).ServerIP);
    if TdmPCClient(PCClientSocketList.Objects[i]).Connected then
    begin
      aNode.ImageIndex := con_LocalServerConnectedImageIndex;
      aNode.SelectedIndex := con_LocalServerConnectedImageIndex;
    end else
    begin
      aNode.ImageIndex := con_LocalServerDisConnectedImageIndex;
      aNode.SelectedIndex := con_LocalServerDisConnectedImageIndex;
    end;
    vNode1 := vTreeView.Items.AddChild(nil,'S' + stDecoderNo);
    nNodeCount := TdmPCClient(PCClientSocketList.Objects[i]).GetNodeCount;
    if nNodeCount > 0 then
    begin
      for j := 0 to nNodeCount - 1 do
      begin
        if aNode <> nil then
        begin
          stNodeCaption := TdmPCClient(PCClientSocketList.Objects[i]).GetNodeIndexIP(j) + ':' + TdmPCClient(PCClientSocketList.Objects[i]).GetNodeIndexName(j);
          bNode:= aTreeView.Items.AddChild(aNode,stNodeCaption); //+ ':' + stEcuName);
          stNodeConnected := TdmPCClient(PCClientSocketList.Objects[i]).GetNodeIndexNodeConnected(j);
          case stNodeConnected[1] of
            '2' : begin
              bNode.ImageIndex := con_LocalNodeAllConnectedImageIndex;
              bNode.SelectedIndex := con_LocalNodeAllConnectedImageIndex;
            end;
            '1' : begin
              bNode.ImageIndex := con_LocalNodeConnectedImageIndex;
              bNode.SelectedIndex := con_LocalNodeConnectedImageIndex;
            end;
            '0' : begin
              bNode.ImageIndex := con_LocalNodeDisConnectedImageIndex;
              bNode.SelectedIndex := con_LocalNodeDisConnectedImageIndex;
            end;
            else begin
              bNode.ImageIndex := con_LocalNodeDisConnectedImageIndex;
              bNode.SelectedIndex := con_LocalNodeDisConnectedImageIndex;
            end;
          end;
          stNodeNo := FillZeroNumber(TdmPCClient(PCClientSocketList.Objects[i]).GetNodeIndexNodeNo(j),G_nNodeCodeLength);
          vNode2:= aTreeView.Items.AddChild(vNode1,'N' + stDecoderNo + stNodeNo);
          TdmPCClient(PCClientSocketList.Objects[i]).NodeIndexDeviceSort(j); //����ȣ���� ��ȸ ����.
          nNodeDeviceCount := TdmPCClient(PCClientSocketList.Objects[i]).GetNodeIndexDeviceCount(j);
          if nNodeDeviceCount > 0 then
          begin
            for k := 0 to nNodeDeviceCount - 1 do
            begin
              if TdmPCClient(PCClientSocketList.Objects[i]).GetNodeIndexDeviceIndexName(j,k,stEcuID,stEcuName) then
              begin
                if bNode <> nil then
                begin
                  cNode:= aTreeView.Items.AddChild(bNode,stEcuID); //+ ':' + stEcuName);
                  case TdmPCClient(PCClientSocketList.Objects[i]).GetNodeIndexDeviceConnect(j,stEcuID)[1] of
                    '0' : begin
                      cNode.ImageIndex := con_LocalDeviceDisConnectedImageIndex ;
                      cNode.SelectedIndex := con_LocalDeviceDisConnectedImageIndex ;
                    end;
                    '1' : begin
                      cNode.ImageIndex := con_LocalDeviceConnectedImageIndex;
                      cNode.SelectedIndex := con_LocalDeviceConnectedImageIndex;
                    end;
                    else begin
                      cNode.ImageIndex := con_LocalDeviceDisConnectedImageIndex;
                      cNode.SelectedIndex := con_LocalDeviceDisConnectedImageIndex;
                    end;
                  end;
                  bNode.Expanded := True;
                end;
                if vNode2 <> nil then
                begin
                  vNode3:= vTreeView.Items.AddChild(vNode2,'E' + stDecoderNo + stNodeNo + stEcuID);
                end;
              end;
            end;
            aNode.Expanded := True;
          end;

        end;
      end;   //for j := 0 to nNodeCount - 1 do
    end;   //if nNodeCount > 0 then
  end;  //for i := 0 to PCClientSocketList.Count - 1 do
end;

procedure TfmMonitoring.mn_CardNOCopyClick(Sender: TObject);
var
  stTemp : string;
  stMessage : string;
begin
  inherited;
    with sg_AccessEvent do
    begin
      stTemp:= Cells[2,Row];

      if stTemp <> '' then ClipBoard.SetTextBuf(PChar(stTemp));
      stMessage := dmFormMessage.GetMessage('CLIPDATACOPY');
      stMessage := stringReplace(stMessage,'$DATA',stTemp,[rfReplaceAll]);
      fmMain.FORMSTATUSMSG(2,stMessage);
      //showmessage(stTemp + ' �� ClipBoard�� ���� �Ǿ����ϴ�.');
    end;
end;

procedure TfmMonitoring.mn_AlarmConfirm1Click(Sender: TObject);
var
  stTime : string;
begin
  inherited;
  With sg_AlarmEvent do
  begin
    if Cells[L_arrAlarmEventIndexArray[10],Row] = '' then Exit;
    if Cells[L_arrAlarmEventIndexArray[2],Row] = '' then Exit;
    if Cells[L_arrAlarmEventIndexArray[11],Row] = '' then Exit;
    if Cells[L_arrAlarmEventIndexArray[12],Row] = '' then Exit;
    stTime := Cells[L_arrAlarmEventIndexArray[12],Row];
    stTime := stringReplace(stTime,'-','',[rfReplaceAll]);
    stTime := stringReplace(stTime,':','',[rfReplaceAll]);
    stTime := stringReplace(stTime,' ','',[rfReplaceAll]);
    fmSecurityEventConfirm:= TfmSecurityEventConfirm.Create(Self);
    fmSecurityEventConfirm.NodeNo := Cells[L_arrAlarmEventIndexArray[10],Row];
    fmSecurityEventConfirm.EcuID := Cells[L_arrAlarmEventIndexArray[2],Row];
    fmSecurityEventConfirm.ExtendID := Cells[L_arrAlarmEventIndexArray[13],Row];
    fmSecurityEventConfirm.MsgNo := Cells[L_arrAlarmEventIndexArray[11],Row];
    fmSecurityEventConfirm.AlarmDate := copy(stTime,1,8);
    fmSecurityEventConfirm.AlarmTime := copy(stTime,9,6);
    fmSecurityEventConfirm.ed_ArmAreaName.Text := Cells[L_arrAlarmEventIndexArray[4],Row];
    fmSecurityEventConfirm.ed_AlarmStateName.Text := Cells[L_arrAlarmEventIndexArray[9],Row];
    fmSecurityEventConfirm.Memo1.Text := '';
    fmSecurityEventConfirm.SHowmodal;
    if fmSecurityEventConfirm.Save then
    begin
      //if dmPCClient.Connected then
      //  dmPCClient.SendPacket('E',SCMONITORING,'A','0000','00','')
      //else
      fmMain.FORMALARMCONFIRMExecute;
    end;
    fmSecurityEventConfirm.Free;
  end;
end;

procedure TfmMonitoring.mn_AllAlarmEventClick(Sender: TObject);
begin
  inherited;
  fmSecurityEventConfirm:= TfmSecurityEventConfirm.Create(Self);
  fmSecurityEventConfirm.AllAlarmProcess := True;
  fmSecurityEventConfirm.Memo1.Text := '';
  fmSecurityEventConfirm.SHowmodal;
  if fmSecurityEventConfirm.Save then
  begin
    AlarmEventAllClear(fmSecurityEventConfirm.Memo1.Text);
    fmMain.FORMALARMCONFIRMExecute;
  end;
  fmSecurityEventConfirm.Free;

end;

procedure TfmMonitoring.mn_AllDeviceAlarmClearClick(Sender: TObject);
begin
  inherited;
  fmSecurityEventConfirm:= TfmSecurityEventConfirm.Create(Self);
  fmSecurityEventConfirm.AllAlarmProcess := True;
  fmSecurityEventConfirm.Memo1.Text := '';
  fmSecurityEventConfirm.SHowmodal;
  tb_AccessAlarm.Caption := L_stAccessAlarmCaption;
  if fmSecurityEventConfirm.Save then
  begin
    DeviceAccessAlarmEventAllClear(fmSecurityEventConfirm.Memo1.Text);
    fmMain.FORMALARMCONFIRMExecute;
  end;
  fmSecurityEventConfirm.Free;

end;

procedure TfmMonitoring.mn_BuildingDoorCloseClick(Sender: TObject);
var
  nDecoderNo : integer;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stDoorName : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  stBuildingCode : string;
  nIndex : integer;
  nTempIndex : integer;
begin
  Try
    if BuildingListView.SelCount < 1 then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    stBuildingCode := BuildingListView.Items[BuildingListView.ItemIndex].SubItems.Strings[0];
    nIndex := G_MonitoringBuildingList.IndexOf(stBuildingCode);
    if nIndex < 0 then Exit;
    for i := 0 to TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorCount - 1 do
    begin
      if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorIndexDevieInfo(i,nDecoderNo,stNodeNo,stEcuID,stDoorNo,stDoorName) then
      begin
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + inttostr(TMenuItem(Sender).Tag);

        nTempIndex := PCClientSocketList.IndexOf(inttostr(nDecoderNo));
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        end;
        //dmPCClient.SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
        delay(5);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;

end;

procedure TfmMonitoring.mn_DeviceAlarmConfirmClick(Sender: TObject);
var
  stTime : string;
begin
  inherited;
  With sg_AccessAlarmEvent do
  begin
    if Cells[L_arrDeviceEventIndexArray[5],Row] = '' then Exit;
    if Cells[L_arrDeviceEventIndexArray[2],Row] = '' then Exit;
    if Cells[L_arrDeviceEventIndexArray[6],Row] = '' then Exit;
    if Cells[L_arrDeviceEventIndexArray[7],Row] = '' then Exit;
    stTime := Cells[L_arrDeviceEventIndexArray[7],Row];
    stTime := stringReplace(stTime,'-','',[rfReplaceAll]);
    stTime := stringReplace(stTime,':','',[rfReplaceAll]);
    stTime := stringReplace(stTime,' ','',[rfReplaceAll]);
    fmSecurityEventConfirm:= TfmSecurityEventConfirm.Create(Self);
    fmSecurityEventConfirm.NodeNo := Cells[L_arrDeviceEventIndexArray[5],Row];
    fmSecurityEventConfirm.EcuID := Cells[L_arrDeviceEventIndexArray[2],Row];
    fmSecurityEventConfirm.ExtendID := Cells[L_arrDeviceEventIndexArray[8],Row];
    fmSecurityEventConfirm.MsgNo := Cells[L_arrDeviceEventIndexArray[6],Row];
    fmSecurityEventConfirm.AlarmDate := copy(stTime,1,8);
    fmSecurityEventConfirm.AlarmTime := copy(stTime,9,6);
    fmSecurityEventConfirm.ed_ArmAreaName.Text := Cells[L_arrDeviceEventIndexArray[1],Row] + '-' + Cells[L_arrDeviceEventIndexArray[2],Row];
    fmSecurityEventConfirm.ed_AlarmStateName.Text := Cells[L_arrDeviceEventIndexArray[4],Row];
    fmSecurityEventConfirm.Memo1.Text := '';
    fmSecurityEventConfirm.SHowmodal;
    tb_AccessAlarm.Caption := L_stAccessAlarmCaption;
    if fmSecurityEventConfirm.Save then
    begin
      //if dmPCClient.Connected then
      //  dmPCClient.SendPacket('E',SCMONITORING,'A','0000','00','')
      //else
      fmMain.FORMALARMCONFIRMExecute;
    end;
    fmSecurityEventConfirm.Free;
  end;
end;

procedure TfmMonitoring.mn_deviceCardReSendClick(Sender: TObject);
var
  stDecoderNo : string;
  stDeviceCode : string;
  stNodeNo : string;
  stECUID : string;
  stClientIP : string;
  stTime : string;
  nTempIndex : integer;
begin
  if AdvOfficePager1.ActivePage = ap_Access then
  begin
    stDecoderNo := sg_AccessDevice.Cells[2,sg_AccessDevice.row];
    stNodeNo := sg_AccessDevice.Cells[3,sg_AccessDevice.row];
    stECUID := sg_AccessDevice.Cells[4,sg_AccessDevice.row];
  end else if AdvOfficePager1.ActivePage = ap_Alarm then
  begin
    stDecoderNo := sg_AlarmDevice.Cells[2,sg_AlarmDevice.row];
    stNodeNo := sg_AlarmDevice.Cells[3,sg_AlarmDevice.row];
    stECUID := sg_AlarmDevice.Cells[4,sg_AlarmDevice.row];
  end else Exit;

  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  if dmDBFunction.CheckTB_CARDFTPDOWNLIST_Device(stNodeNo,stEcuID) < 1 then
  begin
    //Insert
    dmDBInsert.InsertIntoTB_CARDFTPDOWNLIST_Value(stNodeNo,stEcuID,'0','N','0');
  end else
  begin
    //Update
    dmDBUpdate.UpdateTB_CARDFTPDOWNLIST_Value(stNodeNo,stEcuID,'0','N','0')
  end;

  nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
  if nTempIndex > -1 then
  begin
    TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCECU,'C',stNodeNo,stEcuID,'');
  end;
//  dmPCClient.SendPacket('C',SCECU,'C',stNodeNo,stEcuID,'');

  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'','0',con_ComLogTYPE_DEVICE,TMenuItem(Sender).Caption);

end;

procedure TfmMonitoring.mn_DeviceResetClick(Sender: TObject);
var
  stDeviceCode : string;
  stDecoderNo : string;
  stNodeNo : string;
  stECUID : string;
  stClientIP : string;
  stTime : string;
  nTempIndex : integer;
begin
  if AdvOfficePager1.ActivePage = ap_Access then
  begin
    stDecoderNo := sg_AccessDevice.Cells[2,sg_AccessDevice.row];
    stNodeNo := sg_AccessDevice.Cells[3,sg_AccessDevice.row];
    stEcuID := sg_AccessDevice.Cells[4,sg_AccessDevice.Row];
  end else if AdvOfficePager1.ActivePage = ap_Alarm then
  begin
    stDecoderNo := sg_AlarmDevice.Cells[2,sg_AlarmDevice.row];
    stNodeNo := sg_AlarmDevice.Cells[3,sg_AlarmDevice.row];
    stEcuID := sg_AlarmDevice.Cells[4,sg_AlarmDevice.Row];
  end else Exit;
//  stEcuID := '00';
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
  if nTempIndex > -1 then
  begin
    TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCECU,'R',stNodeNo,stEcuID,'');
  end;
//  dmPCClient.SendPacket('C',SCECU,'R',stNodeNo,stEcuID,'');
  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'','0',con_ComLogTYPE_DEVICE,TMenuItem(Sender).Caption);

end;

procedure TfmMonitoring.mn_DoorOpenClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;

end;

procedure TfmMonitoring.mn_RegFingerClick(Sender: TObject);
var
  i : integer;
  stDoorID : string;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  nTempIndex : integer;
begin
  inherited;
  Try
    if doorListView.SelCount < 1 then Exit;
    stDoorID:= doorListView.Selected.SubItems.Strings[0];
    stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
    stDecoderNo := inttostr(strtoint(stDecoderNo));
    stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
    stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
    fmMain.RegFingerDeviceEmployee(stDecoderNo,stNodeNo,stEcuID,stDoorNo);
    (*
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

      end;
    end;   *)
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
//
//
end;

procedure TfmMonitoring.MonitoringRefresh;
begin
  LoadBuildingDoor;
  LoadBuildingArmArea;
end;

procedure TfmMonitoring.N12Click(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  L_nViewListStyle := 0;
  doorListView.ViewStyle := vsIcon;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringDoorState.INI');
    with ini_fun do
    begin
      if L_nViewListStyle = 0 then
        WriteString('MONITOR','ViewStyle'  + BuildingCode ,'VSICON')
      else WriteString('MONITOR','ViewStyle'  + BuildingCode,'VSLIST');
    end;
  Finally
    ini_fun.Free;
  End;

end;

procedure TfmMonitoring.N13Click(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  L_nViewListStyle := 1;
  doorListView.ViewStyle := vsList;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringDoorState.INI');
    with ini_fun do
    begin
      if L_nViewListStyle = 0 then
        WriteString('MONITOR','ViewStyle'  + BuildingCode ,'VSICON')
      else WriteString('MONITOR','ViewStyle'  + BuildingCode,'VSLIST');
    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmMonitoring.pan_AlarmDeviceResize(Sender: TObject);
begin
  inherited;
  ap_AlarmControler.Left := 10;
  //tv_DeviceList.Top := (gb_DeviceState.Top + gb_DeviceState.Height + 10);
  ap_AlarmControler.Width := pan_AlarmDevice.Width - (ap_AlarmControler.Left * 2);
  ap_AlarmControler.Height := pan_AlarmDevice.Height - ap_AlarmControler.Top - 10;
  sg_AlarmServer.ColWidths[0] := ap_AlarmControler.Width - 30;

  gb_DeviceState1.Width := pan_AlarmDevice.Width - (gb_DeviceState1.Left * 2);

  lb_AlarmDeviceStateExample.Left := ap_AlarmControler.Left + ap_AlarmControler.Width - lb_AlarmDeviceStateExample.Width;
  gb_DeviceState1.Top := ap_AlarmControler.Top;
  gb_DeviceState1.Left := ap_AlarmControler.Left;
end;

procedure TfmMonitoring.pan_AlarmStateResize(Sender: TObject);
begin
  inherited;
  pan_ArmAreaInfo.Top := (pan_AlarmState.Height div 2) - (pan_ArmAreaInfo.Height div 2);
  pan_ArmAreaInfo.Left := (pan_AlarmState.Width div 2) - (pan_ArmAreaInfo.Width div 2);

  ArmAreaListView.Left := 10;
  ArmAreaListView.Height := pan_AlarmState.Height - ArmAreaListView.Top - 10;
  ArmAreaListView.Width := pan_AlarmState.Width - (ArmAreaListView.Left * 2);
  ArmAreaListView.Top := 64;

  gb_AlarmStateExample.Left := ArmAreaListView.Left;
  gb_AlarmStateExample.Top := ArmAreaListView.Top;
  gb_AlarmStateExample.Width := ArmAreaListView.Width;

  lb_AlarmstateExample.Left := ArmAreaListView.Left + ArmAreaListView.Width - lb_AlarmstateExample.Width;

end;

procedure TfmMonitoring.pan_ArmAreaBuildingResize(Sender: TObject);
begin
  inherited;
  ArmAreaBuildingListView.Left := 10;
  ArmAreaBuildingListView.Height := pan_ArmAreaBuilding.Height - ArmAreaBuildingListView.Top - 10;
  ArmAreaBuildingListView.Width := pan_ArmAreaBuilding.Width - (ArmAreaBuildingListView.Left * 2);
  ArmAreaBuildingListView.Top := 64;

end;

procedure TfmMonitoring.pan_BuildingResize(Sender: TObject);
begin
  inherited;
  BuildingListView.Left := 10;
  BuildingListView.Height := pan_Building.Height - BuildingListView.Top - 10;
  BuildingListView.Width := pan_Building.Width - (BuildingListView.Left * 2);
  BuildingListView.Top := 64;
end;

procedure TfmMonitoring.pan_DeviceResize(Sender: TObject);
begin
  ap_AccessControler.Left := 10;
  //tv_DeviceList.Top := (gb_DeviceState.Top + gb_DeviceState.Height + 10);
  ap_AccessControler.Width := pan_Device.Width - (ap_AccessControler.Left * 2);
  ap_AccessControler.Height := pan_Device.Height - ap_AccessControler.Top - 10;
  sg_AccessServer.ColWidths[0] := ap_AccessControler.Width - 30;

  gb_DeviceState.Width := pan_Device.Width - (gb_DeviceState.Left * 2);

  lb_DeviceStateExample.Left := ap_AccessControler.Left + ap_AccessControler.Width - lb_DeviceStateExample.Width;
  gb_DeviceState.Top := ap_AccessControler.Top;
  gb_DeviceState.Left := ap_AccessControler.Left;
//
end;

procedure TfmMonitoring.pan_DoorStateResize(Sender: TObject);
begin
  inherited;
  doorListView.Left := 10;
  doorListView.Height := pan_DoorState.Height - doorListView.Top - 10;
  doorListView.Width := pan_DoorState.Width - (doorListView.Left * 2);
  doorListView.Top := 64;

  gb_DoorState.Left := doorListView.Left;
  gb_DoorState.Top := doorListView.Top;
  gb_DoorState.Width := doorListView.Width;

  lb_DoorstateExample.Left := doorListView.Left + doorListView.Width - lb_DoorstateExample.Width;

  pan_DoorInfo.Top := (pan_DoorState.Height div 2) - (pan_DoorInfo.Height div 2);
  pan_DoorInfo.Left := (pan_DoorState.Width div 2) - (pan_DoorInfo.Width div 2);

end;

procedure TfmMonitoring.pm_AlarmConfirmClick(Sender: TObject);
var
  stArmAreaID : string;
begin
  Try
    if ArmAreaListView.Selected = nil then
    begin
      if ArmAreaListView.ItemIndex > -1 then ArmAreaListView.Items[ArmAreaListView.ItemIndex].Selected := True;
      Exit;
    end;
    stArmAreaID:= ArmAreaListView.Selected.SubItems.Strings[0];
    Delete(stArmAreaID,1,G_nDecoderCodeLength);
    fmBuildingAlarmConfirm := TfmBuildingAlarmConfirm.create(Self);
    fmBuildingAlarmConfirm.FormTYPE := 'ALARM';
    fmBuildingAlarmConfirm.SearchID := stArmAreaID;
    fmBuildingAlarmConfirm.ShowModal;
    if fmBuildingAlarmConfirm.Save then
    begin
      //if dmPCClient.Connected then
      //  dmPCClient.SendPacket('E',SCMONITORING,'A','0000','00','')
      //else
      fmMain.FORMALARMCONFIRMExecute;
    end;

    fmBuildingAlarmConfirm.Free;
  Except
    Exit;
  End;

end;

procedure TfmMonitoring.pm_AlarmReportClick(Sender: TObject);
var
  stArmAreaID : string;
begin
  Try
    if ArmAreaListView.Selected = nil then Exit;
    stArmAreaID:= ArmAreaListView.Selected.SubItems.Strings[0];
    fmMain.FORMREPORT(con_FormBMOSALARMEVENTREPORT,'ALARM',stArmAreaID);
  Except
    Exit;
  End;
end;

procedure TfmMonitoring.pm_ArmAreaStateSearchClick(Sender: TObject);
var
  stArmAreaID : string;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if ArmAreaListView.SelCount < 1 then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to ArmAreaListView.Items.Count - 1 do
    begin
      if ArmAreaListView.Items[i].Selected then
      begin
        stArmAreaID:= ArmAreaListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stArmAreaID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stArmAreaID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stArmAreaID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stArmAreaNo := copy( stArmAreaID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stArmAreaNo),2);

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('S',SCARMAREA,'s',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('S',SCARMAREA,'s',stNodeNo,stEcuID,stSendData);
        //dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoring.pm_ArmModeChangeClick(Sender: TObject);
var
  stArmAreaID : string;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stSendData : string;
  stTime : string;
  stClientIP : string;
  i : integer;
  nTempIndex : integer;
begin
  Try
    if ArmAreaListView.Selected = nil then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    for i := 0 to ArmAreaListView.Items.Count - 1 do
    begin
      if ArmAreaListView.Items[i].Selected then
      begin
        stArmAreaID:= ArmAreaListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stArmAreaID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stArmAreaID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stArmAreaID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stArmAreaNo := copy( stArmAreaID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stArmAreaNo),2) + 'A';

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    Exit;
  End;

end;

procedure TfmMonitoring.pm_DeviceInfoClick(Sender: TObject);
var
  stArmAreaID : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stTelNo : string;
  stMemo : string;
  stBuildingName : string;
begin
  if ArmAreaListView.Selected = nil then Exit;

  lb_ArmAreaName.Caption := ArmAreaListView.Selected.Caption;
  stArmAreaID:= ArmAreaListView.Selected.SubItems.Strings[0];
  stNodeNo := copy(stArmAreaID,1,G_nNodeCodeLength);
  stEcuID := copy(stArmAreaID,1 + G_nNodeCodeLength,2);
  stArmAreaNo := copy( stArmAreaID,1 + G_nNodeCodeLength + 2,1);
  ed_NodeIP.Text := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);
  lb_DeviceID.Caption := stEcuID;
  lb_ArmAreaNo.Caption := stArmAreaNo;
  dmDBFunction.GetTB_ARMAREA_BuildingInfo(stNodeNo,stEcuID,stArmAreaNo,stBuildingName,stTelNo,stMemo);
  //lb_Building.Caption := dmDBFunction.GetTB_ARMAREA_BuildingName(stNodeNo,stEcuID,stArmAreaNo);
  lb_TelNo.Caption := stTelNo;
  memo1.Text := stMemo;
  pan_DoorInfo.Visible := True;
  //pan_DoorInfo.Caption.Text := pm_DeviceInfo.Caption;
end;

procedure TfmMonitoring.pm_DeviceResetClick(Sender: TObject);
var
  stDeviceCode : string;
  stDecoderNo : string;
  stNodeNo : string;
  stECUID : string;
  stClientIP : string;
  stTime : string;
  nTempIndex : integer;
begin
  if AdvOfficePager1.ActivePage = ap_Access then
  begin
    stDecoderNo := sg_AccessNode.Cells[2,sg_AccessNode.row];
    stNodeNo := sg_AccessNode.Cells[3,sg_AccessNode.row];
  end else if AdvOfficePager1.ActivePage = ap_Alarm then
  begin
    stDecoderNo := sg_AlarmNode.Cells[2,sg_AlarmNode.row];
    stNodeNo := sg_AlarmNode.Cells[3,sg_AlarmNode.row];
  end else Exit;
  stEcuID := '00';
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
  if nTempIndex > -1 then
  begin
    TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCECU,'R',stNodeNo,stEcuID,'');
  end;
//  dmPCClient.SendPacket('C',SCECU,'R',stNodeNo,stEcuID,'');
  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'','0',con_ComLogTYPE_DEVICE,TMenuItem(Sender).Caption);
end;

procedure TfmMonitoring.pm_DisArmModeChangeClick(Sender: TObject);
var
  stArmAreaID : string;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stSendData : string;
  stTime : string;
  stClientIP : string;
  i : integer;
  nTempIndex : integer;
begin
  Try
    if ArmAreaListView.Selected = nil then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    for i := 0 to ArmAreaListView.Items.Count - 1 do
    begin
      if ArmAreaListView.Items[i].Selected then
      begin
        stArmAreaID:= ArmAreaListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stArmAreaID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stArmAreaID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stArmAreaID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stArmAreaNo := copy( stArmAreaID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stArmAreaNo),2) + 'D';

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
        end;
        //dmPCClient.SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    Exit;
  End;

end;

procedure TfmMonitoring.pm_DooOpenModeClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + '1';

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoring.pm_DoorCloseModeClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + '2';

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoring.pm_DoorInfoClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stDecoderNo : string;
begin
  if doorListView.Selected = nil then Exit;

  lb_DoorName.Caption := doorListView.Selected.Caption;
  stDoorID:= doorListView.Selected.SubItems.Strings[0];
  stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
  stDecoderNo := inttostr(strtoint(stDecoderNo));
  stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
  stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
  stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
  lb_NodeIp.Caption := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);
  lb_DeviceID.Caption := stEcuID;
  lb_DoorNo.Caption := stDoorNo;
  lb_Building.Caption := dmDBFunction.GetTB_Door_BuildingName(stNodeNo,stEcuID,stDoorNo);
  pan_DoorInfo.Visible := True;
  //pan_DoorInfo.Caption.Text := pm_DoorInfo.Caption;
end;

procedure TfmMonitoring.pm_DoorManageModeClick(Sender: TObject);
var
  stDoorID : string;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + '0';

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoring.pm_DoorStateCheckClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('S',SCDOOR,'D',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('S',SCDOOR,'D',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
  DeviceReload;
end;

procedure TfmMonitoring.pm_JavarCloseClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stClientIP : string;
  stTime : string;
  nTempIndex :integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := '2';
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoring.pm_JavarOpenClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stClientIP : string;
  stTime : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := '1';
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoring.pm_LargeIconClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  ArmAreaListView.ViewStyle := vsIcon;
  L_nAlarmViewListStyle := 0;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringArmAreaState.INI');
    with ini_fun do
    begin
      if L_nAlarmViewListStyle = 0 then
        WriteString('MONITOR','ViewStyle'  + BuildingCode ,'VSICON')
      else WriteString('MONITOR','ViewStyle'  + BuildingCode,'VSLIST');
    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmMonitoring.pm_PermitReSendClick(Sender: TObject);
var
  stDecoderNo : string;
  stDeviceCode : string;
  stNodeNo : string;
  stECUID : string;
  stClientIP : string;
  stTime : string;
  nTempIndex : integer;
begin
  if AdvOfficePager1.ActivePage = ap_Access then
  begin
    stDecoderNo := sg_AccessNode.Cells[2,sg_AccessNode.row];
    stNodeNo := sg_AccessNode.Cells[3,sg_AccessNode.row];
  end else if AdvOfficePager1.ActivePage = ap_Alarm then
  begin
    stDecoderNo := sg_AlarmNode.Cells[2,sg_AlarmNode.row];
    stNodeNo := sg_AlarmNode.Cells[3,sg_AlarmNode.row];
  end else Exit;

  stEcuID := '00';
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  if dmDBFunction.CheckTB_CARDFTPDOWNLIST_Device(stNodeNo,stEcuID) < 1 then
  begin
    //Insert
    dmDBInsert.InsertIntoTB_CARDFTPDOWNLIST_Value(stNodeNo,stEcuID,'0','N','0');
  end else
  begin
    //Update
    dmDBUpdate.UpdateTB_CARDFTPDOWNLIST_Value(stNodeNo,stEcuID,'0','N','0')
  end;

  nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
  if nTempIndex > -1 then
  begin
    TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCECU,'C',stNodeNo,stEcuID,'');
  end;
//  dmPCClient.SendPacket('C',SCECU,'C',stNodeNo,stEcuID,'');

  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'','0',con_ComLogTYPE_DEVICE,TMenuItem(Sender).Caption);

end;

procedure TfmMonitoring.pm_PingTestClick(Sender: TObject);
var
  stNodeIp : string;
  stMessage : string;
  stExe:string;
begin
  if AdvOfficePager1.ActivePage = ap_Access then
  begin
    stNodeIp := sg_AccessNode.Cells[1,sg_AccessNode.row];
  end else if AdvOfficePager1.ActivePage = ap_Alarm then
  begin
    stNodeIp := sg_AlarmNode.Cells[1,sg_AlarmNode.row];
  end else Exit;

  stNodeIp := FindCharCopy(stNodeIp,0,':');
  if Not IsIPTypeCheck(stNodeIp) then
  begin
    stMessage := dmFormMessage.GetMessage('DATATYPEFAIL');
    showmessage(stNodeIp + ':' + stMessage);
    Exit;
  end;
  ShellExecute(0, 'open', PChar('ping.exe'), PChar(stNodeIp), nil, SW_SHOWNORMAL );
end;

procedure TfmMonitoring.pm_SmallIConClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  ArmAreaListView.ViewStyle := vsList;
  L_nAlarmViewListStyle := 1;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringArmAreaState.INI');
    with ini_fun do
    begin
      if L_nAlarmViewListStyle = 0 then
        WriteString('MONITOR','ViewStyle'  + BuildingCode ,'VSICON')
      else WriteString('MONITOR','ViewStyle'  + BuildingCode,'VSLIST');
    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmMonitoring.pm_TimeSyncClick(Sender: TObject);
var
  stDecoderNo : string;
  stNodeNo : string;
  stClientIP : string;
  stTime : string;
  nTempIndex : integer;
begin
  if AdvOfficePager1.ActivePage = ap_Access then
  begin
    stDecoderNo := sg_AccessNode.Cells[2,sg_AccessNode.row];
    stNodeNo := sg_AccessNode.Cells[3,sg_AccessNode.row];
  end else if AdvOfficePager1.ActivePage = ap_Alarm then
  begin
    stDecoderNo := sg_AlarmNode.Cells[2,sg_AlarmNode.row];
    stNodeNo := sg_AlarmNode.Cells[3,sg_AlarmNode.row];
  end else Exit;

  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
  if nTempIndex > -1 then
  begin
    TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCNODE,'T',stNodeNo,'00','');
  end;
//  dmPCClient.SendPacket('C',SCNODE,'T',stNodeNo,'00','');
  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,'00','','0',con_ComLogTYPE_DEVICE,TMenuItem(Sender).Caption);

end;

procedure TfmMonitoring.Positive1Click(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  stMode : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stMode := inttostr(TMenuItem(Sender).Tag);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + stMode;

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoring.RcvDeviceConnectedChangeEvent(aDecoderNo :integer;aNodeNo, aEcuID,
  aData: string);
begin
//    if G_bAccessMonitoringUse then TreeViewDeviceConnectChange(tv_DeviceList,tv_DeviceCode,aDecoderNo,aNodeNo, aEcuID,aData);
//    if G_bAlarmMonitoringUse then TreeViewDeviceConnectChange(tv_AlarmDeviceList,tv_AlarmDeviceCode,aDecoderNo,aNodeNo, aEcuID,aData);
end;

procedure TfmMonitoring.RcvNodeConnectedChangeEvent(aDecoderNo :integer;aNodeNo, aEcuID,
  aData: string);
var
  nNodeIndex : integer;
  i : integer;
  nConnectIndex : integer;
begin
  if aData <> '' then
  begin
    case aData[1] of
      '2' : begin
        nConnectIndex := con_LocalNodeAllConnectedImageIndex;
      end;
      '1' : begin
        nConnectIndex := con_LocalNodeConnectedImageIndex;
      end;
      '0' : begin
        nConnectIndex := con_LocalNodeDisConnectedImageIndex;
      end;
      else begin
        nConnectIndex := con_LocalNodeDisConnectedImageIndex;
      end;
    end;
  end else
  begin
    nConnectIndex := con_LocalNodeDisConnectedImageIndex;
  end;

  if G_bAccessMonitoringUse then
  begin
    if L_stSelectAccessDecorderNo = inttostr(aDecoderNo) then
    begin
      nNodeIndex := -1;
      for i := 1 to sg_AccessNode.RowCount do
      begin
        if sg_AccessNode.Cells[3,i] = aNodeNo then
        begin
          nNodeIndex := i - 1;
          break;
        end;
      end;
      if nNodeIndex > -1 then
      begin
        with sg_AccessNode do
        begin
          RemoveImageIdx(0,nNodeIndex + 1);
          AddImageIdx(0,nNodeIndex + 1,nConnectIndex,haLeft,vaCenter);
          refresh;
        end;
      end;
    end;
  end;
  if G_bAlarmMonitoringUse then
  begin
    if L_stSelectAlarmDecorderNo = inttostr(aDecoderNo) then
    begin
      nNodeIndex := -1;
      for i := 1 to sg_AlarmNode.RowCount do
      begin
        if sg_AlarmNode.Cells[3,i] = aNodeNo then
        begin
          nNodeIndex := i - 1;
          break;
        end;
      end;
      if nNodeIndex > -1 then
      begin
        with sg_AlarmNode do
        begin
          RemoveImageIdx(0,nNodeIndex + 1);
          AddImageIdx(0,nNodeIndex + 1,nConnectIndex,haLeft,vaCenter);
          refresh;
        end;
      end;
    end;
  end;
end;

procedure TfmMonitoring.ReSizeTimerTimer(Sender: TObject);
begin
  inherited;
  Exit;
  if L_bClose then Exit;

  ReSizeTimer.Enabled := False;
  if L_bViewRefresh then Exit;
  L_bViewRefresh := True;
  Try
    if L_nViewListStyle = 0 then
    begin
      doorListView.ViewStyle := vsList;
      Delay(100);
      doorListView.ViewStyle := vsICon;
      //doorListView.Refresh;
    end else
    begin
      doorListView.ViewStyle := vsICon;
      Delay(100);
      doorListView.ViewStyle := vsList;
      //doorListView.Refresh;
    end;
    if L_nAlarmViewListStyle = 0 then
    begin
      ArmAreaListView.ViewStyle := vsList;
      Delay(100);
      ArmAreaListView.ViewStyle := vsICon;
    end else
    begin
      ArmAreaListView.ViewStyle := vsICon;
      Delay(100);
      ArmAreaListView.ViewStyle := vsList;
    end;
  Finally
    L_bViewRefresh := False;
  End;
end;

procedure TfmMonitoring.SecurityEventClear;
begin
  Try
    GridInit(sg_AlarmEvent,10);
    sg_AlarmEvent.RowColor[1] := clWhite;
    GridInitialize(sg_AccessAlarmEvent);
    sg_AccessAlarmEvent.RowColor[1] := clWhite;
  Except
    Exit;
  End;
end;

procedure TfmMonitoring.ServerConnected(aDecoderNo: integer;
  aConnected: Boolean);
var
  nServerIndex : integer;
  i : integer;
begin
  if G_bAccessMonitoringUse then
  begin
    nServerIndex := -1;
    for i := 1 to sg_AccessServer.RowCount do
    begin
      if sg_AccessServer.Cells[1,i] = inttostr(aDecoderNo) then
      begin
        nServerIndex := i - 1;
        break;
      end;
    end;
    if nServerIndex > -1 then
    begin
      with sg_AccessServer do
      begin
        RemoveImageIdx(0,nServerIndex + 1);
        if aConnected then
          AddImageIdx(0,nServerIndex + 1,con_LocalServerConnectedImageIndex,haLeft,vaCenter)
        else AddImageIdx(0,nServerIndex + 1,con_LocalServerDisConnectedImageIndex,haLeft,vaCenter);
        refresh;
      end;
    end;
  end;
  if G_bAlarmMonitoringUse then
  begin
    nServerIndex := -1;
    for i := 1 to sg_AlarmServer.RowCount do
    begin
      if sg_AlarmServer.Cells[1,i] = inttostr(aDecoderNo) then
      begin
        nServerIndex := i - 1;
        break;
      end;
    end;
    if nServerIndex > -1 then
    begin
      with sg_AlarmServer do
      begin
        RemoveImageIdx(0,nServerIndex + 1);
        if aConnected then
          AddImageIdx(0,nServerIndex + 1,con_LocalServerConnectedImageIndex,haLeft,vaCenter)
        else AddImageIdx(0,nServerIndex + 1,con_LocalServerDisConnectedImageIndex,haLeft,vaCenter);
        refresh;
      end;
    end;
  end;
end;

procedure TfmMonitoring.sg_AccessAlarmEventColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  inherited;
  ChangeDeviceEventIndex(FromIndex, ToIndex);
end;

procedure TfmMonitoring.sg_AccessDeviceClick(Sender: TObject);
begin
  inherited;
  if Not IsInsertGrade then
  begin
    sg_AccessDevice.popupmenu := nil;
  end else
  begin
    sg_AccessDevice.popupmenu := pm_DeviceControl;
  end;

end;

procedure TfmMonitoring.sg_AccessDeviceDblClick(Sender: TObject);
var
  stServerNo : string;
  stNodeNo : string;
  stEcuID : string;
begin
  inherited;
  if G_nMonitoringType = 1 then Exit; //�бⱹ�� Ÿ���̸� �ٷ� ���� ������.
  if sg_AccessDevice.SelectedRowCount = 0 then
  begin
    sg_AccessDevice.SelectRows(1,1);
  end;
  stServerNo := sg_AccessDevice.Cells[2,sg_AccessDevice.Row];
  stNodeNo := sg_AccessDevice.Cells[3,sg_AccessDevice.Row];
  stEcuID := sg_AccessDevice.Cells[4,sg_AccessDevice.Row];
  LoadDoorGrid(stServerNo,stNodeNo,stEcuID,sg_AccessDoor);
  if Not L_bAlarmControlerChange then  ap_AccessControler.ActivePage := ap_AccessDoor;
end;

procedure TfmMonitoring.sg_AccessEventColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeAccessEventIndex(FromIndex, ToIndex);
end;

procedure TfmMonitoring.sg_AccessEventKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  stTemp: string;
  stMessage : string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      stTemp:= Cells[2,Row];

      if stTemp <> '' then ClipBoard.SetTextBuf(PChar(stTemp));
      stMessage := dmFormMessage.GetMessage('CLIPDATACOPY');
      stMessage := stringReplace(stMessage,'$DATA',stTemp,[rfReplaceAll]);
      fmMain.FORMSTATUSMSG(2,stMessage);
      //showmessage(stTemp + ' �� ClipBoard�� ���� �Ǿ����ϴ�.');
    end;
  end;
end;

procedure TfmMonitoring.sg_AccessNodeClick(Sender: TObject);
begin
  inherited;
  if Not IsInsertGrade then
  begin
    sg_AccessNode.popupmenu := nil;
  end else
  begin
    sg_AccessNode.popupmenu := pm_NodeControl;
  end;

end;

procedure TfmMonitoring.sg_AccessNodeDblClick(Sender: TObject);
var
  stServerNo : string;
  stNodeNo : string;
  stEcuID : string;
begin
  inherited;
  if G_nMonitoringType = 1 then Exit; //�бⱹ�� Ÿ���̸� �ٷ� ���� ������.
  if sg_AccessNode.SelectedRowCount = 0 then
  begin
    sg_AccessNode.SelectRows(1,1);
  end;
  stServerNo := sg_AccessNode.Cells[2,sg_AccessNode.Row];
  stNodeNo := sg_AccessNode.Cells[3,sg_AccessNode.Row];

  if G_nMonitoringProtocol = 1 then  //����ġ ���� -> �ٷ� ������� �� ���Թ� ���·� �Ѿ� ����.
  begin
    stEcuID := '00';
    LoadDoorGrid(stServerNo,stNodeNo,stEcuID,sg_AccessDoor);
    ap_AccessControler.ActivePage := ap_AccessDoor;
  end else
  begin
    LoadDeviceGrid(stServerNo,stNodeNo,sg_AccessDevice);
    sg_AccessDeviceDblClick(sg_AccessDevice);
    if Not L_bAlarmControlerChange then ap_AccessControler.ActivePage := ap_AccessDevice;
  end;
//
end;

procedure TfmMonitoring.sg_AccessServerDblClick(Sender: TObject);
var
  stServerNo : string;
begin
  inherited;
  if sg_AccessServer.SelectedRowCount = 0 then
  begin
    sg_AccessServer.SelectRows(1,1);
  end;

  stServerNo := sg_AccessServer.Cells[1,sg_AccessServer.Row];
  L_stSelectAccessDecorderNo := stServerNo;
  if Not isdigit(stServerNo) then Exit;
  LoadMainGrid(stServerNo,sg_AccessNode);
  sg_AccessNodeDblClick(sg_AccessNode);
  ap_AccessControler.ActivePage := ap_AccessNode;
end;

procedure TfmMonitoring.sg_AlarmDeviceDblClick(Sender: TObject);
var
  stServerNo : string;
  stNodeNo : string;
  stEcuID : string;
begin
  inherited;
  if G_nMonitoringType = 1 then Exit; //�бⱹ�� Ÿ���̸� �ٷ� ���� ������.
  if sg_AlarmDevice.SelectedRowCount = 0 then
  begin
    sg_AlarmDevice.SelectRows(1,1);
  end;
  stServerNo := sg_AlarmDevice.Cells[2,sg_AlarmDevice.Row];
  stNodeNo := sg_AlarmDevice.Cells[3,sg_AlarmDevice.Row];
  stEcuID := sg_AlarmDevice.Cells[4,sg_AlarmDevice.Row];
  LoadAlarmArmAreaGrid(stServerNo,stNodeNo,stEcuID,sg_AlarmArmArea);
  if Not L_bAlarmControlerChange then ap_AlarmControler.ActivePage := ap_AlarmArmArea;

end;

procedure TfmMonitoring.sg_AlarmEventColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeAlarmEventIndex(FromIndex, ToIndex);
end;

procedure TfmMonitoring.sg_AlarmNodeDblClick(Sender: TObject);
var
  stServerNo : string;
  stNodeNo : string;
  stEcuID : string;
begin
  inherited;
  if G_nMonitoringType = 1 then Exit; //�бⱹ�� Ÿ���̸� �ٷ� ���� ������.
  if sg_AlarmNode.SelectedRowCount = 0 then
  begin
    sg_AlarmNode.SelectRows(1,1);
  end;
  stServerNo := sg_AlarmNode.Cells[2,sg_AlarmNode.Row];
  stNodeNo := sg_AlarmNode.Cells[3,sg_AlarmNode.Row];

  if G_nMonitoringProtocol = 1 then  //����ġ ���� -> �ٷ� ������� �� ���Թ� ���·� �Ѿ� ����.
  begin
    stEcuID := '00';
    LoadAlarmArmAreaGrid(stServerNo,stNodeNo,stEcuID,sg_AlarmArmArea);
    ap_AlarmControler.ActivePage := ap_AlarmArmArea;
  end else
  begin
    LoadDeviceGrid(stServerNo,stNodeNo,sg_AlarmDevice);
    sg_AlarmDeviceDblClick(sg_AlarmDevice);
    if Not L_bAlarmControlerChange then ap_AlarmControler.ActivePage := ap_AlarmDevice;
  end;
//
end;

procedure TfmMonitoring.sg_AlarmServerDblClick(Sender: TObject);
var
  stServerNo : string;
begin
  inherited;
  if sg_AlarmServer.SelectedRowCount = 0 then
  begin
    sg_AlarmServer.SelectRows(1,1);
  end;
  stServerNo := sg_AlarmServer.Cells[1,sg_AlarmServer.Row];
  L_stSelectAlarmDecorderNo := stServerNo;
  if Not isdigit(stServerNo) then Exit;
  LoadMainGrid(stServerNo,sg_AlarmNode);
  sg_AlarmNodeDblClick(sg_AlarmNode);
  ap_AlarmControler.ActivePage := ap_AlarmNode;
end;

procedure TfmMonitoring.sg_ModeChangeColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeAlarmModeIndex(FromIndex, ToIndex);
end;

procedure TfmMonitoring.sg_ModeChangeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  stTemp: string;
  stMessage : string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      stTemp:= Cells[6,Row];

      if stTemp <> '' then ClipBoard.SetTextBuf(PChar(stTemp));
      stMessage := dmFormMessage.GetMessage('CLIPDATACOPY');
      stMessage := stringReplace(stMessage,'$DATA',stTemp,[rfReplaceAll]);
      fmMain.FORMSTATUSMSG(2,stMessage);
    end;
  end;
end;

procedure TfmMonitoring.TreeViewDeviceConnectChange(aTreeList,vTreeList: TTreeView; aDecoderNo:integer;aNodeNo,
  aEcuID, aData: string);
var
  stDecoderNo : string;
  stNodeNo : string;
  aTreeView   : TTreeview;
  vTreeView   : TTreeview;
  aNode       : TTreeNode;
  nItemIndex : integer;
begin
  stDecoderNo := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength);
  stNodeNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength);
  aTreeView := aTreeList;
  if aTreeView.Items.Count < 1 then Exit;
  vTreeView := vTreeList;
  aNode:= GetNodeByText(vTreeView,'E' + stDecoderNo + stNodeNo + aEcuID ,False);

  if aNode = nil then
  begin
    aNode:= GetNodeByText(vTreeView,'E' + stDecoderNo + stNodeNo + aEcuID ,False);
    exit;
  end;

  nItemIndex := aNode.AbsoluteIndex;
  if aData <> '' then
  begin
    case aData[1] of
      '0' : begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalDeviceDisConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalDeviceDisConnectedImageIndex;
      end;
      '1' : begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalDeviceConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalDeviceConnectedImageIndex;
      end;
      else begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalDeviceDisConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalDeviceDisConnectedImageIndex;
      end;
    end;
  end else
  begin
    aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalDeviceDisConnectedImageIndex;
    aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalDeviceDisConnectedImageIndex;
  end;
end;

procedure TfmMonitoring.TreeViewNodeConnectChange(aTreeList,
  vTreeList: TTreeView; aDecoderNo:integer; aNodeNo, aEcuID, aData: string);
var
  stDecoderNo : string;
  stNodeNo : string;
  aTreeView   : TTreeview;
  vTreeView   : TTreeview;
  aNode       : TTreeNode;
  nItemIndex : integer;
begin
  stDecoderNo := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength);
  stNodeNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength);
  aTreeView := aTreeList;
  if aTreeView.Items.Count < 1 then Exit;
  vTreeView := vTreeList;
  aNode:= GetNodeByText(vTreeView,'N' + stDecoderNo + stNodeNo ,False);

  if aNode = nil then
  begin
    aNode:= GetNodeByText(vTreeView,'N' + stDecoderNo + stNodeNo ,False);
    exit;
  end;

  nItemIndex := aNode.AbsoluteIndex;
  if aData <> '' then
  begin
    case aData[1] of
      '2' : begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalNodeAllConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalNodeAllConnectedImageIndex;
      end;
      '1' : begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalNodeConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalNodeConnectedImageIndex;
      end;
      '0' : begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalNodeDisConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalNodeDisConnectedImageIndex;
      end;
      else begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalNodeDisConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalNodeDisConnectedImageIndex;
      end;
    end;
  end else
  begin
    aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalNodeDisConnectedImageIndex;
    aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalNodeDisConnectedImageIndex;
  end;
  aTreeView.Refresh;
end;

procedure TfmMonitoring.TreeViewServerConnectChange(aTreeList,
  vTreeList: TTreeView; aDecoderNo: integer; aConnected: Boolean);
var
  stDecoderNo : string;
  aTreeView   : TTreeview;
  vTreeView   : TTreeview;
  aNode       : TTreeNode;
  nItemIndex : integer;
begin
  stDecoderNo := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength);
  aTreeView := aTreeList;
  if aTreeView.Items.Count < 1 then Exit;
  vTreeView := vTreeList;
  aNode:= GetNodeByText(vTreeView,'S' + stDecoderNo ,False);

  if aNode = nil then
  begin
    aNode:= GetNodeByText(vTreeView,'S' + stDecoderNo ,False);
    exit;
  end;

  nItemIndex := aNode.AbsoluteIndex;
  if aConnected then
  begin
    aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalServerConnectedImageIndex;
    aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalServerConnectedImageIndex;
  end else
  begin
    aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalServerDisConnectedImageIndex;
    aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalServerDisConnectedImageIndex;
  end;
  aTreeView.Refresh;
end;

procedure TfmMonitoring.tv_AlarmDeviceListClick(Sender: TObject);
var
  stCode : string;
begin
  popupmenu := nil;
//  if tv_AlarmDeviceList.Selected = nil then Exit;
//  stCode := tv_AlarmDeviceList.Items.Item[tv_AlarmDeviceList.Selected.AbsoluteIndex].Text;


  if copy(stCode,1,1) = 'N' then
  begin
    pm_PingTest.Visible := True;
    pm_TimeSync.Visible := True;
    pm_DeviceReset.Visible := False;
    pm_PermitReSend.Visible := False;
  end else
  begin
    pm_PingTest.Visible := False;
    pm_TimeSync.Visible := False;
    pm_DeviceReset.Visible := True;
    pm_PermitReSend.Visible := True;
  end;

end;

procedure TfmMonitoring.tv_DeviceListClick(Sender: TObject);
var
  stCode : string;
begin
  popupmenu := nil;
//  if tv_DeviceList.Selected = nil then Exit;
//  stCode := tv_DeviceCode.Items.Item[tv_DeviceList.Selected.AbsoluteIndex].Text;


  if copy(stCode,1,1) = 'N' then
  begin
    pm_PingTest.Visible := True;
    pm_TimeSync.Visible := True;
    pm_DeviceReset.Visible := False;
    pm_PermitReSend.Visible := False;
  end else
  begin
    pm_PingTest.Visible := False;
    pm_TimeSync.Visible := False;
    pm_DeviceReset.Visible := True;
    pm_PermitReSend.Visible := True;
  end;

end;

function TfmMonitoring.WriteIniConfig: Boolean;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(G_stExeFolder + '\Monitoring.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrAccessEventIndexArray) to HIGH(L_arrAccessEventIndexArray) do
      begin
        WriteInteger('LIST','AccessEventIndexArray'+inttostr(i),L_arrAccessEventIndexArray[i]);
      end;
      for i := LOW(L_arrRelAccessEventIndexArray) to HIGH(L_arrRelAccessEventIndexArray) do
      begin
        WriteInteger('LIST','RelAccessEventIndexArray'+inttostr(i),L_arrRelAccessEventIndexArray[i]);
      end;
      for i := 0 to sg_AccessEvent.ColCount - 1 do
      begin
        if i > HIGH(L_arrAccessEventSizeTable) then break;

        L_arrAccessEventSizeTable[i] := sg_AccessEvent.ColWidths[i];
        WriteInteger('LIST','RelAccessEventSizeArray' + inttostr(i),sg_AccessEvent.ColWidths[i]);
      end;

      for i := LOW(L_arrDeviceEventIndexArray) to HIGH(L_arrDeviceEventIndexArray) do
      begin
        WriteInteger('LIST','DeviceEventIndexArray'+inttostr(i),L_arrDeviceEventIndexArray[i]);
      end;
      for i := LOW(L_arrRelDeviceEventIndexArray) to HIGH(L_arrRelDeviceEventIndexArray) do
      begin
        WriteInteger('LIST','RelDeviceEventIndexArray'+inttostr(i),L_arrRelDeviceEventIndexArray[i]);
      end;
      for i := 0 to sg_AccessAlarmEvent.ColCount - 1 do
      begin
        if i > HIGH(L_arrDeviceEventSizeTable) then break;

        L_arrDeviceEventSizeTable[i] := sg_AccessAlarmEvent.ColWidths[i];
        WriteInteger('LIST','RelDeviceEventSizeArray' + inttostr(i),sg_AccessAlarmEvent.ColWidths[i]);
      end;

      for i := LOW(L_arrAlarmEventIndexArray) to HIGH(L_arrAlarmEventIndexArray) do
      begin
        WriteInteger('LIST','AlarmEventIndexArray'+inttostr(i),L_arrAlarmEventIndexArray[i]);
      end;
      for i := LOW(L_arrRelAlarmEventIndexArray) to HIGH(L_arrRelAlarmEventIndexArray) do
      begin
        WriteInteger('LIST','RelAlarmEventIndexArray'+inttostr(i),L_arrRelAlarmEventIndexArray[i]);
      end;
      for i := 0 to sg_AlarmEvent.ColCount - 1 do
      begin
        if i > HIGH(L_arrAlarmEventSizeTable) then break;

        L_arrAlarmEventSizeTable[i] := sg_AccessAlarmEvent.ColWidths[i];
        WriteInteger('LIST','RelAlarmEventSizeArray' + inttostr(i),sg_AlarmEvent.ColWidths[i]);
      end;

      for i := LOW(L_arrAlarmEventIndexArray) to HIGH(L_arrAlarmEventIndexArray) do
      begin
        WriteInteger('LIST','AlarmEventIndexArray'+inttostr(i),L_arrAlarmEventIndexArray[i]);
      end;
      for i := LOW(L_arrRelAlarmEventIndexArray) to HIGH(L_arrRelAlarmEventIndexArray) do
      begin
        WriteInteger('LIST','RelAlarmEventIndexArray'+inttostr(i),L_arrRelAlarmEventIndexArray[i]);
      end;
      for i := 0 to sg_AlarmEvent.ColCount - 1 do
      begin
        if i > HIGH(L_arrAlarmEventSizeTable) then break;

        L_arrAlarmEventSizeTable[i] := sg_AlarmEvent.ColWidths[i];
        WriteInteger('LIST','RelAlarmEventSizeArray' + inttostr(i),sg_AlarmEvent.ColWidths[i]);
      end;

      for i := LOW(L_arrAlarmModeIndexArray) to HIGH(L_arrAlarmModeIndexArray) do
      begin
        WriteInteger('LIST','AlarmModeIndexArray'+inttostr(i),L_arrAlarmModeIndexArray[i]);
      end;
      for i := LOW(L_arrRelAlarmModeIndexArray) to HIGH(L_arrRelAlarmModeIndexArray) do
      begin
        WriteInteger('LIST','RelAlarmModeIndexArray'+inttostr(i),L_arrRelAlarmModeIndexArray[i]);
      end;
      for i := 0 to sg_ModeChange.ColCount - 1 do
      begin
        if i > HIGH(L_arrAlarmModeSizeTable) then break;

        L_arrAlarmModeSizeTable[i] := sg_ModeChange.ColWidths[i];
        WriteInteger('LIST','RelAlarmModeSizeArray' + inttostr(i),sg_ModeChange.ColWidths[i]);
      end;
    end;

  Finally
    ini_fun.Free;
  End;
end;

initialization
  RegisterClass(TfmMonitoring);
Finalization
  UnRegisterClass(TfmMonitoring);

end.