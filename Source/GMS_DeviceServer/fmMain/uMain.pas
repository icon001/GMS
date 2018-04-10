unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvToolBar, AdvToolBarStylers, AdvMenus,
  AdvMenuStylers, AdvPreviewMenu, AdvPreviewMenuStylers, Vcl.ImgList,
  AdvAppStyler, AdvShapeButton, AdvGlowButton, Vcl.Imaging.jpeg, Vcl.ExtCtrls,uSubForm,
  AdvOfficeStatusBar, CommandArray, Vcl.Imaging.pngimage,ActiveX,ADODB,Data.DB,Winapi.ShellAPI,
  uSharedMemory, Vcl.Menus,
  uDeviceVariable, Vcl.StdCtrls;

type
  TNodePacketSendThread = class(TThread)
  private
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  TDeviceCardGrade = class(TComponent)
  private
    CardGradeList : TStringList;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    function CheckDoorMemoryGrade(aCardNo,aDoorNo:string):integer;
    function CardGradeAdd(aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
        aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8,aEndDate:string):Boolean;
  end;

  TfmMain = class(TfmASubForm)
    MenuImageList32: TImageList;
    MenuDisImageList32: TImageList;
    ImageList2: TImageList;
    ImageList1: TImageList;
    StartMenu: TAdvPreviewMenu;
    AdvPreviewMenuOfficeStyler2: TAdvPreviewMenuOfficeStyler;
    AdvPreviewMenuOfficeStyler1: TAdvPreviewMenuOfficeStyler;
    AdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    at_Menu: TAdvToolBarPager;
    ApManager: TAdvPage;
    AdvToolBar1: TAdvToolBar;
    mn_PCMonitor: TAdvGlowButton;
    mn_DeviceMonitoring: TAdvGlowButton;
    AdvShapeButton1: TAdvShapeButton;
    AdvQuickAccessToolBar1: TAdvQuickAccessToolBar;
    AdvFormStyler1: TAdvFormStyler;
    Image1: TImage;
    sb_Status: TAdvOfficeStatusBar;
    TrayIcon1: TTrayIcon;
    FireDoorOpenTimer: TTimer;
    TrayTimer: TTimer;
    MemoryReadTimer: TTimer;
    DeviceServerManagerCheckTimer: TTimer;
    pm_TrayMenu: TPopupMenu;
    mn_trayVisible: TMenuItem;
    N2: TMenuItem;
    mn_trayClose: TMenuItem;
    TrayImageList: TImageList;
    AdoConnectCheckTimer: TTimer;
    ManagerControlProcessTimer: TTimer;
    NodeOpenCheckTimer: TTimer;
    TimeSyncTimer: TTimer;
    ToDayTimer: TTimer;
    CardDownLoadTimer: TTimer;
    FireRecoveryTimer: TTimer;
    FTPCardDownLoadTimer: TTimer;
    NRCheckTimer: TTimer;
    NFCheckTimer: TTimer;
    StateCheckTimer: TTimer;
    pan_TEST: TPanel;
    btn_ConnectedCount: TButton;
    RcvCheckTimer: TTimer;
    lb_ConnectedCount: TLabel;
    btn_FailList: TButton;
    mem_FailList: TMemo;
    PopupMenu1: TPopupMenu;
    mn_Test1: TMenuItem;
    NodeSendPacketTimer: TTimer;
    btn_CardDownLoadCount: TButton;
    lb_CardDownLoadCount: TLabel;
    NodeRcvPacketTimer: TTimer;
    MemoryClearTimer: TTimer;
    chk_debug: TCheckBox;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FireDoorOpenTimerTimer(Sender: TObject);
    procedure mn_DeviceMonitoringClick(Sender: TObject);
    procedure CommandArrayCommandsTFORMENABLEExecute(Command: TCommand;
      Params: TStringList);
    procedure TrayTimerTimer(Sender: TObject);
    procedure MemoryReadTimerTimer(Sender: TObject);
    procedure DeviceServerManagerCheckTimerTimer(Sender: TObject);
    procedure mn_trayCloseClick(Sender: TObject);
    procedure mn_trayVisibleClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AdoConnectCheckTimerTimer(Sender: TObject);
    procedure mn_PCMonitorClick(Sender: TObject);
    procedure ManagerControlProcessTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NodeOpenCheckTimerTimer(Sender: TObject);
    procedure TimeSyncTimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToDayTimerTimer(Sender: TObject);
    procedure CardDownLoadTimerTimer(Sender: TObject);
    procedure FireRecoveryTimerTimer(Sender: TObject);
    procedure FTPCardDownLoadTimerTimer(Sender: TObject);
    procedure NRCheckTimerTimer(Sender: TObject);
    procedure NFCheckTimerTimer(Sender: TObject);
    procedure StateCheckTimerTimer(Sender: TObject);
    procedure btn_ConnectedCountClick(Sender: TObject);
    procedure RcvCheckTimerTimer(Sender: TObject);
    procedure btn_FailListClick(Sender: TObject);
    procedure mn_Test1Click(Sender: TObject);
    procedure NodeSendPacketTimerTimer(Sender: TObject);
    procedure chk_debugClick(Sender: TObject);
    procedure btn_CardDownLoadCountClick(Sender: TObject);
    procedure NodeRcvPacketTimerTimer(Sender: TObject);
    procedure MemoryClearTimerTimer(Sender: TObject);
  private
    L_bCardPermitLoad : Boolean;
    L_bClose : Boolean;
    L_bEmployeePermitLoad : Boolean;
    L_bFormAcive : Boolean;
    L_bMangerControlProcess : Boolean;
    L_bMemoryRead : Boolean;
    L_bNodeLock : Boolean;
    L_nReConnectSeq : integer;
    L_stHolidaySendYear : string;
    L_dtDeviceServerAliveTime : TDateTime;
    L_dtDeviceServerManagerAliveTime : TDateTime;
    L_nCount : integer;
    L_nFTPDownLoadNodeNo : integer;
    L_nFTPNextDownLoadNodeNo : integer;
    L_nDebugCnt : integer;

    CardEmList : TStringList;
    DeviceCardGradeList : TStringList;
    ManagerControlReceiveList : TStringList;
    ManagerEventReceiveList : TStringList;
    MonitorClientList : TStringList;
    //NodePacketSendThread : TNodePacketSendThread;

    oControlSendMemory : TfisSharedMemory;     //���ź�
    oEventSendMemory : TfisSharedMemory;       //���ź�
    oControlRecvMemory : TfisSharedMemory;  //���ۺ�
    oEventRecvMemory : TfisSharedMemory;  //���ۺ�
    procedure MIAMS_DeviceServerManagerControlAckMessageDataSend(aCmd:integer;aMessage:UnicodeString);
    procedure MIAMS_DeviceServerManagerEventAckMessageDataSend(aCmd:integer;aMessage:UnicodeString);
    Function MIAMS_DeviceServerManagerExecute : Boolean;
    Function MIAMS_DeviceServerManagerTerminate : Boolean;
  private
    procedure CardChangePacket(Sender: TObject;  aCmd: integer;aCardNo:string; aData:string);
    procedure CardPermitAllLoading(Sender:TObject;aNodeNo:integer;aData:string);
    procedure CardFTPSend(aData:string;aSendType:integer);
    procedure CardPermitDeviceSend(aData:string;aSendType:integer);
    procedure ArmAreaPacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure CardPermitChange(Sender: TObject;  aNodeNo : integer;aEcuID,aCardNo,aPermit,aDoorPermit,aArmAreaPermit,aTimeCodeUse,aTimeCodeGroup,aTimeData,aWeekCode:string);
    procedure CardRcvAckChange(Sender: TObject;  aNodeNo : integer;aEcuID,aCardNo,aRcvAck:string;aPermit:Boolean);
    procedure CardReaderPacketChange(Sender: TObject; aCmd, aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure ClientPacketView(Sender: TObject;  aClientIP,aTxRx,aData,aResult:string);   //PC Packet
    //���� Alarm����
    procedure CurrentAlarmEvent(Sender: TObject;  aNodeNo,aECUID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                                            aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor:string);
    procedure CurrentDoorState(Sender: TObject;  aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aCardMode,aDoorMode,aDoorState,aLockState,aDoorFire:string);
    procedure DeviceCardAccessEvent(Sender: TObject; aNodeNo,aECUID,aDoorNo,aReaderNo,aInOut,aTime,aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState,aATButton,aCardNo,aType,aArmAreaNo,aAntiGroup:string);
    procedure DeviceConnected(Sender: TObject;aSocketNo,aNodeNo : integer;aEcuID:string; aConnected:TConnectedState;aAntiGroupCode:string);
    procedure DeviceReceiveData(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string;aRcvInfoType:integer; aData: string);
    procedure DeviceReceiveTypeChage(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string;aRcvInfoType:integer; aData: string);
    procedure DevicePacketChange(Sender: TObject; aCmd, aNodeNo : integer;aEcuID:string; aData:string);
    procedure DeviceUsedEvent(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string; aUsed:Boolean);
    procedure DoorHolidaySend(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure DoorPacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure EmployeeCardPermitLoad(Sender: TObject;aCardNo:string);
    procedure EmployeePermitAllLoading(Sender:TObject;aNodeNo:integer;aData:string);
    procedure ManagerReceiveAccessEvent(aData:string);
    procedure ManagerReceiveAlarmEvent(aData:string);
    procedure NodeAutoDownLoadStart(Sender:TObject;aNodeNo:integer;aData:string);
    procedure NodePacketEvent(Sender: TObject;aNodeNo : integer; aNodeName,aEcuID,aCmd,aMsgNo,aDeviceVer,aData,aType:string);
    procedure ReaderTelNumberChange(aData:string);
    procedure ReceiveManagerControlProcess(aData:string);
    procedure ReceiveManagerEventProcess(aData:string);
    procedure ZONEEXTENDTYPEChange(Sender: TObject;  aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure ZonePacketChange(Sender: TObject; aCmd, aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
  private
    FireEventGubunList : TStringList;
    { Private declarations }
    function GetDecoderInfo:Boolean;
    procedure LoadAlarmEventModeChangeCode;
    procedure LoadAlarmEventStateCode;
    procedure LoadAlarmEventStatePCCode;
    procedure LoadAntiPassGroup;
    procedure LoadCardPermit(aPrograss:Boolean=True;aNodeNo:string='';aEcuID:string=''); //ī�� ���� �ε�
    procedure LoadTB_CONFIG;
    procedure LoadArmAreaUse(aNodeNo,aEcuID:string);   //
    procedure LoadDeviceChange(aNodeNo,aEcuID:string); //��Ʈ�ѷ� ��ü �� ����ڵ�� �������� �ٽ� �޾� �´�.
    procedure LoadDOOR(aNodeNo,aEcuID : string;aMemLoad:string='');
    procedure LoadHoliday;
    procedure LoadNode(aNodeNo:string);
//    procedure LoadDevice(aNodeNo,aEcuID:string);
    Function EmployeePermitLoad(aNodeNo:string = '';aEcuID:string = ''):Boolean;
    Function EmployeePermitToCardLoad(aEmSeq:string;aNodeNo:string='';aEcuID:string=''):Boolean;
    Function EmployeePermitToCardDeviceLoad(aNodeNo,aEcuID,aEmSeq:string):Boolean;
    Function AntiPassProcess(aNodeNo, aECUID,aDoorNo, aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,aAccessResult, aDoorState, aATButton, aCardNo, aType, aArmAreaNo,aAntiGroup:string;
                             var aCompanyCode,aCompanyName,aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aATUse,aFDUse,aPrintNo,aHandPhone:string ):integer;
    Function CheckDoorMemoryGrade(aCardNo,aNodeNo,aECUID,aDoorNo:string):integer;
    Function GetEmInfoFromCardNo(aCardNo,aLastDate :string;aSearchType:integer; var aCompanyCode,aCompanyName,aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aATUSE,aFDUSE,aPrintNo,aHandPhone:string):Boolean;
    Procedure MDIChildShow(FormName:String);
    Function  MDIForm(FormName:string):TForm;
    procedure MemoryCreate;
    procedure MemoryFree;
    procedure UnLoadNode(aNodeNo: string);
  private
    FToDayDate: string;
    FGMSSeverSocketOpen: Boolean;
    Procedure DataBaseAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    Function DeviceHolidaySend(aYear:string):Boolean;
    Function DoorScheduleSend : Boolean;
    Function DoorSettingRegist(aData:string):Boolean;
    Function DoorSettingSearch(aData:string):Boolean;
    Function DoorTimeCodeUseChangeSend:Boolean;
    Function NodeDataChange(aNodeNo,aCmd:string):Boolean;
    Function TimeDeviceCodeSend:Boolean;
    procedure WndProc(var Message: TMessage); override;
    procedure SetToDayDate(const Value: string);
    procedure SetGMSSeverSocketOpen(const Value: Boolean);
  public
    { Public declarations }
    procedure FORMENABLE(aName:integer;aValue:string);
    procedure  AppException( Sender:  TObject;  E:  Exception) ;
  public
    property ToDayDate : string read FToDayDate write SetToDayDate;
    property GMSSeverSocketOpen : Boolean read FGMSSeverSocketOpen write SetGMSSeverSocketOpen;
  end;

var
  fmMain: TfmMain;

implementation
uses
  uAlarmEventStateCode,
  uAntiPassLib,
  uCard,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDataBaseConfig,
  uDBDelete,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uDeviceComMonitoring,
  uDirectServer,
  uFormVariable,
  uFTPModule,
  uMonitoringServer,
  uNode,
  uNodeServer,
  uPCComMonitoring,
  systeminfos ;

{$R *.dfm}

procedure TfmMain.AdoConnectCheckTimerTimer(Sender: TObject);
begin
  inherited;
//(*TEST20160518
  if G_bApplicationTerminate then Exit;
  Try
    AdoConnectCheckTimer.Enabled := False;
    //if Not TDataBaseConfig.GetObject.DBConnected then Exit;
    TDataBaseConfig.GetObject.DBConnected := False;
    TDataBaseConfig.GetObject.DataBaseConnect;

    if G_bApplicationTerminate then Exit;
  Except
    LogSave(G_stLogDirectory + '\TimerErr' + FormatDateTime('yyyymmdd',now) + '.log','AdoConnectCheckTimerTimer');
  End;
//*)
end;

function TfmMain.AntiPassProcess(aNodeNo, aECUID, aDoorNo, aReaderNo, aInOut,
  aTime, aCardMode, aDoorMode, aChangeState, aAccessResult, aDoorState,
  aATButton, aCardNo, aType, aArmAreaNo, aAntiGroup: string;
  var aCompanyCode,aCompanyName,aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aATUse,aFDUse,aPrintNo,aHandPhone:string): integer;
var
  stSql : string;
  nCardCheck : integer;
  nSCSResult : integer;
  nAntiIndex : integer;
  nAntiInOut : integer;
  cAuth : char;
  stVoice : string;
  nIndex : integer;
  stNodeNo : string;
begin
  stNodeNo := FillZeroStrNum(aNodeNo,G_nNodeCodeLength);
  result := -1;
  if Not GetEmInfoFromCardNo(aCardNo,copy(aTime,1,8),G_nMonitoringType,aCompanyCode,aCompanyName,aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aATUse,aFDUse,aPrintNo,aHandPhone) then
  begin
    if G_nMonitoringType = 1 then GetEmInfoFromCardNo(aCardNo,copy(aCardNo,1,8),0,aCompanyCode,aCompanyName,aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aATUse,aFDUse,aPrintNo,aHandPhone); //�бⱹ�翡�� �Ϸù�ȣ�� �� ã���� ī���ȣ�� ã��.
  end;

  if dmDBFunction.CheckTB_ACCESSEVENT(copy(aTime,1,8), copy(aTime,9,6), aNodeNo, aEcuID,'0', aDoorNo, aCardNo) = 0 then
  begin
    if Not dmDBInsert.InsertIntoTB_ACCESSEVENT_All(copy(aTime,1,8), copy(aTime,9,6), aNodeNo, aEcuID,'0', aDoorNo, aCardNo, aReaderNo, aATButton, aInOut,'', aChangeState, aDoorMode, aCardMode, aAccessResult,
      aArmAreaNo, aCompanyCode, aEmSeq,aEmCode, aEmName, 'SYSTEM',FormatDateTime('yyyymmddhhnnsszzz',now),aATUse,aFDUse,aPrintNo) then
    begin
//      LogSave(G_stLogDirectory + '\CardAccessEvent'+ FormatDateTime('yyyymmdd',now) + '.log',CardEventList.Strings[i]);
      Exit;
    end;

    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(aNodeNo,aECUID,'0',aDoorNo,'DO_LASTACCESSCARD',aCardNo);   //���� ���� ī���ȣ ���
  end;
  nCardCheck := CheckDoorMemoryGrade(aCardNo,aNodeNo,aECUID,aDoorNo);
  cAuth := 'N';
  if nCardCheck = 1 then  //���Ա����� �ִ� ��� ��Ƽ �н� üũ ����.
  begin
    if isDigit(aReaderNo) then
    begin
      //if isDigit(aInOut) then nAntiInOut := strtoint(aInOut);
      nAntiInOut := strtoint(aReaderNo) mod 2;
      nAntiIndex := AntiPassGroupList.IndexOf(aAntiGroup);
      if nAntiIndex > -1 then
      begin
        nSCSResult := TAntiPassGroup(AntiPassGroupList.Objects[nAntiIndex]).AntiPassCardCheck(aCardNo,nAntiInOut);
        if nSCSResult = con_NOTAUTH then
        begin
          //cAuth := 'N';
          cAuth := 'A';
          stVoice := dec2Hex(28,2);      //��Ƽ�н� �������Դϴ�.
          result := -2;
        end else
        begin
          //cAuth := 'R';
          cAuth := 'P';
          stVoice := dec2Hex(14,2); //nVoice := 14;   //�����Ǿ����ϴ�.
        end;
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          nSCSResult := TNode(NodeList.Objects[nIndex]).ServerDoorControl(aECUID,aReaderNo,aDoorNo,aATButton,aCardNo,cAuth,stVoice);
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            nSCSResult := dmNodeServer.DeviceNodeServer_ServerDoorControl(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,aECUID,aReaderNo,aDoorNo,aATButton,aCardNo,cAuth,stVoice); //aWinSock
          end;
        end;
      end else
      begin
        cAuth := 'A';
        //nVoice := 10;
        stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          nSCSResult := TNode(NodeList.Objects[nIndex]).ServerDoorControl(aECUID,aReaderNo,aDoorNo,aATButton,aCardNo,cAuth,stVoice);
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            nSCSResult := dmNodeServer.DeviceNodeServer_ServerDoorControl(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,aECUID,aReaderNo,aDoorNo,aATButton,aCardNo,cAuth,stVoice); //aWinSock
          end;
        end;
      end;
    end;
  end else                //���Ա����� ���� ��� ���� �Ұ� �޽��� ��� ����..
  begin
    //cAuth := 'N';
    cAuth := 'A';
    //nVoice := 10;
    stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
    nIndex := NodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      nSCSResult := TNode(NodeList.Objects[nIndex]).ServerDoorControl(aECUID,aReaderNo,aDoorNo,aATButton,aCardNo,cAuth,stVoice);
    end else
    begin
      nIndex := ServerNodeList.IndexOf(stNodeNo);
      if nIndex > -1 then
      begin
        nSCSResult := dmNodeServer.DeviceNodeServer_ServerDoorControl(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,aECUID,aReaderNo,aDoorNo,aATButton,aCardNo,cAuth,stVoice); //aWinSock
      end;
    end;
  end;

  if (nSCSResult = con_SUCCESSDEVICESEND) and ((cAuth = 'R') OR (cAuth='P')) then  //���� ���� �Ѱ�� ó������.
  begin
    result := 1;
    dmDBUpdate.UpdateTB_ACCESSEVENT_Field_StringValue(copy(aTime,1,8),copy(aTime,9,6),aNodeNo,aEcuID,'0',aDoorNo,aCardNo,'AP_PERMITCODE','1');
  end else
  begin
    if result = -2 then
      dmDBUpdate.UpdateTB_ACCESSEVENT_Field_StringValue(copy(aTime,1,8),copy(aTime,9,6),aNodeNo,aEcuID,'0',aDoorNo,aCardNo,'AP_PERMITCODE','J')    //AntiPass ������
    else dmDBUpdate.UpdateTB_ACCESSEVENT_Field_StringValue(copy(aTime,1,8),copy(aTime,9,6),aNodeNo,aEcuID,'0',aDoorNo,aCardNo,'AP_PERMITCODE','A');
  end;

end;

procedure TfmMain.AppException(Sender: TObject; E: Exception);
var
  sObj : string;
  ctrl : TControl;
  Comp : TComponent;
begin
  sObj := '';
  if Sender <> nil then
  begin
    if Sender.InheritsFrom(TControl) then
    begin
      ctrl := TControl(Sender);
      While (ctrl <> nil) do
      begin
        sObj := ctrl.Name + '->' + sObj;
        ctrl := ctrl.Parent;
      end;
    end else if Sender.InheritsFrom(TComponent) then
    begin
      Comp := TComponent(Sender);
      sObj := Comp.Name;
      if (Comp.Owner <> nil) then
      begin
        sObj := comp.Owner.Name + '->' + sObj;
      end;
    end;
  end;
  LogSave(G_stExeFolder + '\..\log\GMS_DeviceServer' + FormatDateTime('yyyymmdd',now) + '.log',sObj);

end;

procedure TfmMain.ArmAreaPacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
//������� ������� ����� �̺�Ʈ �߻�
  case aCmd of
    con_ArmAreaCmdModeChange : begin
      //������� ��� ����� �̺�Ʈ �߻�
      dmMonitoringServer.ArmAreaModeChange(aNodeNo,aEcuID, aExtendID, aNumber, aData);
    end;
  end;
end;

procedure TfmMain.btn_CardDownLoadCountClick(Sender: TObject);
begin
  inherited;
  lb_CardDownLoadCount.Caption := inttostr(G_nDebugCardDownLoadCount) + '/' + inttostr(G_nDebugSendPacketCount) + '/' + inttostr(G_nDebugRcvPacketCount);
end;

procedure TfmMain.btn_ConnectedCountClick(Sender: TObject);
var
  i : integer;
  nConnected:integer;
begin
  inherited;
  nConnected := 0;
  for i := 0 to NodeList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if TNode(NodeList.Objects[i]).NodeConnected = csConnected then inc(nConnected);
  end;
  lb_ConnectedCount.Caption := 'ConnectedCount : ' + inttostr(nConnected) + '/' + inttostr(NodeList.Count) + ':' + inttostr(ManagerControlReceiveList.count) + '/' + inttostr(ManagerEventReceiveList.count);
end;

procedure TfmMain.btn_FailListClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  mem_FailList.Clear;
  for i := 0 to NodeList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if TNode(NodeList.Objects[i]).NodeConnected <> csConnected then
    begin
      mem_FailList.Lines.Add(TNode(NodeList.Objects[i]).NODEIP);
    end;
  end;
end;

procedure TfmMain.CardChangePacket(Sender: TObject; aCmd: integer; aCardNo,
  aData: string);
begin
  dmDBUpdate.UpdateTB_CARD_Field_StringValue(aCardNo,'CA_LASTUSEDATE',aData);
end;

procedure TfmMain.CardDownLoadTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if L_nDebugCnt > 100 then
  begin
    L_nDebugCnt := 0;
    sb_Status.Panels[2].Text := 'CardDownLoadTimerTimer(' + FormatDateTime('yyyymmddhhnnss',now) + ')';
  end;
  inc(L_nDebugCnt);
//(*TEST20160518
  if G_bApplicationTerminate then Exit;
  Try
    Try
      CardDownLoadTimer.Enabled := False;
      for i := 0 to NodeList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
        begin
          TNode(NodeList.Objects[i]).CardDownLoadTimer;
        end;
        Application.ProcessMessages;
      end;
    Finally
      CardDownLoadTimer.Enabled := Not G_bApplicationTerminate;
    End;
  Except
    LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','CardDownLoadTimerTimer');
  End;
//*)
end;

procedure TfmMain.CardFTPSend(aData: string; aSendType: integer);
var
  stNodeNo : string;
  stEcuID : string;
  nIndex : integer;
begin
  stNodeNo := copy(aData,1,G_nNodeCodeLength);                      //stNodeNo
  stEcuID := copy(aData,1 + G_nNodeCodeLength,2);
  nIndex := NodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).ControlNodeToDeviceCardResend(stEcuID);    //stEcuID
  end else
  begin
    nIndex := ServerNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      dmNodeServer.DeviceNodeServer_ControlNodeToDeviceCardResend(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID); //aWinSock
    end;
  end;
end;

procedure TfmMain.CardPermitAllLoading(Sender: TObject; aNodeNo: integer;
  aData: string);
begin
  while L_bCardPermitLoad do
  begin
    sleep(1);
    Application.ProcessMessages;
  end;
  LoadCardPermit(False,inttostr(aNodeNo),aData);

end;

procedure TfmMain.CardPermitChange(Sender: TObject; aNodeNo: integer; aEcuID,
  aCardNo, aPermit, aDoorPermit, aArmAreaPermit, aTimeCodeUse, aTimeCodeGroup,
  aTimeData, aWeekCode: string);
begin
//ī����� ����� �̺�Ʈ �߻�
end;

procedure TfmMain.CardPermitDeviceSend(aData: string; aSendType: integer);
var
  stNodeNo : string;
  nIndex : integer;
begin
  stNodeNo := copy(aData,1,G_nNodeCodeLength);                      //stNodeNo
  if G_bDebug then LogSave(G_stLogDirectory + '\CardDownloadRcv' + stNodeNo + FormatDateTime('yyyymmdd',now) + '.log',aData);
  nIndex := NodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetNodeToCardPermitInitialize(copy(aData,1 + G_nNodeCodeLength,2),    //stEcuID
            '0',copy(aData,1 + G_nNodeCodeLength + 2, G_nCardLength),                                     //stCardNo
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5,1),                                  //CardPermit
            '1',      //CARD_PERMIT �� �̹� ����Ǿ� �ִ�.
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),  //CardDoorPermit[8]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),      //CardDoorPermit[7]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1,1),          //CardDoorPermit[6]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1,1),              //CardDoorPermit[5]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1,1),                  //CardDoorPermit[4]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1,1),                      //CardDoorPermit[3]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1,1),                          //CardDoorPermit[2]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1,1),                              //CardDoorPermit[1]

            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1), //CardArmAreaPermit[8]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),     //CardArmAreaPermit[7]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),         //CardArmAreaPermit[6]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),             //CardArmAreaPermit[5]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                 //CardArmAreaPermit[4]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                     //CardArmAreaPermit[3]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                         //CardArmAreaPermit[2]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                             //CardArmAreaPermit[1]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                                 //CardArmAreaPermit[0]
            'R', //������ ������ ����.
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength,5),                                                                         //CardPositionNum
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8,1),            //CardTimeCodeUse
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1 + 1 + 1 + 1 + 1,1), //CardTimeGroup

            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1 + 1 + 1 + 1,1),  //CardTimeCode[4]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1 + 1 + 1,1),      //CardTimeCode[3]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1 + 1,1),          //CardTimeCode[2]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1,1),              //CardTimeCode[1]

            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1 + 1 + 1 + 1 + 1 + 1,7),  //CardWeekCode
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,8),         //CardStartDate
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8,8),     //CardEndDate
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1 + 1 + 1 + 1 + 1 + 1 + 7,1),  //CardEMState
            aSendType);
    if G_bDebug then LogSave(G_stLogDirectory + '\CardDownloadSetting' + stNodeNo + FormatDateTime('yyyymmdd',now) + '.log',aData);
  end else
  begin
    nIndex := ServerNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      // aECUID, aEXTENDID, aCARDNO, aPERMIT, aSTATECODE,
      //aDOOR1, aDOOR2, aDOOR3, aDOOR4, aDOOR5, aDOOR6, aDOOR7, aDOOR8, aARMAREA0,
      //aARMAREA1, aARMAREA2, aARMAREA3, aARMAREA4, aARMAREA5, aARMAREA6, aARMAREA7,
      //aARMAREA8, aRCVACK, aPOSITIONNUM, aTIMECODEUSE, aTCGROUP, aTCTIME1, aTCTIME2,
      //aTCTIME3, aTCTIME4, aTCWEEKCODE, aREGDATE, aENDDATE,aEmState: string
      dmNodeServer.LoadDeviceNodeServer_CardPermitSetting(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket, //aWinSock
            stNodeNo,                                                                                          //aNodeNo
            copy(aData,1 + G_nNodeCodeLength,2),
            '0',copy(aData,1 + G_nNodeCodeLength + 2, G_nCardLength),
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5,1),
            '1',      //CARD_PERMIT �� �̹� ����Ǿ� �ִ�.
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),  //CardDoorPermit[8]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),      //CardDoorPermit[7]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1,1),          //CardDoorPermit[6]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1,1),              //CardDoorPermit[5]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1,1),                  //CardDoorPermit[4]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1,1),                      //CardDoorPermit[3]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1,1),                          //CardDoorPermit[2]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1,1),                              //CardDoorPermit[1]

            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1), //CardArmAreaPermit[8]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),     //CardArmAreaPermit[7]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),         //CardArmAreaPermit[6]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),             //CardArmAreaPermit[5]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                 //CardArmAreaPermit[4]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                     //CardArmAreaPermit[3]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                         //CardArmAreaPermit[2]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                             //CardArmAreaPermit[1]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                                 //CardArmAreaPermit[0]
            'R', //������ ������ ����.
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength,5),                                                                         //CardPositionNum
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8,1),            //CardTimeCodeUse
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1 + 1 + 1 + 1 + 1,1), //CardTimeGroup

            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1 + 1 + 1 + 1,1),  //CardTimeCode[4]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1 + 1 + 1,1),      //CardTimeCode[3]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1 + 1,1),          //CardTimeCode[2]
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1,1),              //CardTimeCode[1]

            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1 + 1 + 1 + 1 + 1 + 1,7),  //CardWeekCode
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,8),         //CardStartDate
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8,8),     //CardEndDate
            copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8 + 8 + 1 + 1 + 1 + 1 + 1 + 1 + 7,1)  //CardEMState
            );
    end;
  end;
  nIndex := DeviceCardGradeList.IndexOf(stNodeNo + copy(aData,1 + G_nNodeCodeLength,2));
  if nIndex > -1 then
  begin
    TDeviceCardGrade(DeviceCardGradeList.Objects[nIndex]).CardGradeAdd(copy(aData,1 + G_nNodeCodeLength + 2, G_nCardLength), //CardNo
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5,1),                                  //CardPermit
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),  //Door1
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),      //Door2
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1,1),          //Door3
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1,1),              //Door4
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1,1),                  //Door5
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1,1),                      //Door6
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1,1),                          //Door7
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1,1),                              //Door8
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1), //ArmArea0
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),     //ArmArea1
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),         //ArmArea2
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),             //ArmArea3
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                 //ArmArea4
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                     //ArmArea5
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                         //ArmArea6
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                             //ArmArea7
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1,1),                                 //ArmArea8
      copy(aData,1 + G_nNodeCodeLength + 2 + G_nCardLength + 5 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 8,8) );     //CardEndDate
  end;
end;

procedure TfmMain.CardRcvAckChange(Sender: TObject; aNodeNo: integer; aEcuID,
  aCardNo, aRcvAck: string;aPermit:Boolean);
begin
  if aRcvAck = 'Y' then //���ż����� ��쿡�� update ����...
  begin
(*
     dmDBUpdate.UpdateTB_CARDPERMIT_CARDRCVACKSUSCECCESS(inttostr(aNodeNo),aEcuID,'0',aCardNo,aRcvAck);
     if Not aPermit then   //������ ������ ��쿡�� �������̺����� ���� ����.
     begin
       dmDBDelete.DeleteTB_CARDPERMIT_CARDRCVACKSUCESSECSS(inttostr(aNodeNo),aEcuID,'0',aCardNo);
     end;
*)
  end;
end;

procedure TfmMain.CardReaderPacketChange(Sender: TObject; aCmd,
  aNodeNo: integer; aEcuID, aExtendID, aNumber, aData: string);
begin
  //ī�帮�� ���� ���� �̺�Ʈ �߻���...
end;

function TfmMain.CheckDoorMemoryGrade(aCardNo, aNodeNo, aECUID,
  aDoorNo: string): integer;
var
  nIndex : integer;
  stDeviceID : string;
  oDeviceCardGrade : TDeviceCardGrade;
  stSql : string;
  stPermit : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;
  stDeviceID := FillZeroStrNum(aNodeNo,G_nNodeCodeLength) + aECUID;
  nIndex := DeviceCardGradeList.IndexOf(stDeviceID);
  if nIndex < 0 then
  begin
    oDeviceCardGrade := TDeviceCardGrade.Create(nil);
    DeviceCardGradeList.AddObject(stDeviceID,oDeviceCardGrade);
    nIndex := DeviceCardGradeList.IndexOf(stDeviceID);
  end;
  if nIndex < 0 then Exit;
  result := TDeviceCardGrade(DeviceCardGradeList.Objects[nIndex]).CheckDoorMemoryGrade(aCardNo,aDoorNo);
  if result <> -1 then Exit;
  //���⿡�� DB���� ���� ��ȸ ����.
  stSql := ' select a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.CA_CARDNO,a.CP_PERMIT,f.EM_STATE,a.CP_DOOR1,a.CP_DOOR2,a.CP_DOOR3,';
  stSql := stSql + ' a.CP_DOOR4,a.CP_DOOR5,a.CP_DOOR6,a.CP_DOOR7,a.CP_DOOR8,a.CP_ARMAREA0,a.CP_ARMAREA1,a.CP_ARMAREA2,';
  stSql := stSql + ' a.CP_ARMAREA3,a.CP_ARMAREA4,a.CP_ARMAREA5,a.CP_ARMAREA6,a.CP_ARMAREA7,a.CP_ARMAREA8,a.CP_RCVACK,';
  stSql := stSql + ' b.CA_POSITIONNUM,b.CA_STATECODE,c.EM_SEQ,c.EM_NAME,c.CO_COMPANYCODE,c.EM_ACUSE,c.EM_ATUSE,c.EM_FDUSE,';
  stSql := stSql + ' e.EM_TIMECODEUSE,e.TC_GROUP,e.TC_TIME1,e.TC_TIME2,e.TC_TIME3,e.TC_TIME4,e.TC_WEEKCODE,c.EM_REGDATE,c.EM_ENDDATE ';
  stSql := stSql + ' from TB_CARDPERMIT a  ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.EM_SEQ = c.EM_SEQ) ';
  stSql := stSql + ' Inner Join TB_DEVICE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID ';
  stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEEDEVICETIMECODE e ';
  stSql := stSql + ' ON(b.EM_SEQ = e.EM_SEQ ';
  stSql := stSql + ' AND a.ND_NODENO = e.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = e.DE_ECUID ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEESTATECODE f ';
  stSql := stSql + ' ON(c.EM_STATECODE = f.EM_STATECODE ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + '''';
  stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DE_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';

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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','CheckDoorMemoryGrade');
        Exit;
      End;

      if RecordCount < 1 then Exit;
      First;
      stPermit := FindField('CP_PERMIT').AsString;
      if FindField('EM_STATE').AsString <> '1' then stPermit := '0';
      if FindField('CA_STATECODE').AsString <> '1' then stPermit := '0';

      TDeviceCardGrade(DeviceCardGradeList.Objects[nIndex]).CardGradeAdd(FindField('CA_CARDNO').AsString,
        stPermit,FindField('CP_DOOR1').AsString,FindField('CP_DOOR2').AsString,
        FindField('CP_DOOR3').AsString,FindField('CP_DOOR4').AsString,FindField('CP_DOOR5').AsString,
        FindField('CP_DOOR6').AsString,FindField('CP_DOOR7').AsString,FindField('CP_DOOR8').AsString,
        FindField('CP_ARMAREA0').AsString,FindField('CP_ARMAREA1').AsString,FindField('CP_ARMAREA2').AsString,
        FindField('CP_ARMAREA3').AsString,FindField('CP_ARMAREA4').AsString,FindField('CP_ARMAREA5').AsString,
        FindField('CP_ARMAREA6').AsString,FindField('CP_ARMAREA7').AsString,FindField('CP_ARMAREA8').AsString,
        FindField('EM_ENDDATE').AsString);

      if (stPermit = '1') and (FindField('CP_DOOR' + aDoorNo).AsString = '1') then result := 1;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.chk_debugClick(Sender: TObject);
begin
  inherited;
  G_bDebug := chk_debug.Checked;
end;

procedure TfmMain.ClientPacketView(Sender: TObject; aClientIP, aTxRx, aData,
  aResult: string);
var
  fmTemp : TForm;
begin
//��Ŷ �ۼ��� �κ� üũ
  if G_bFormEnabled[conFORMPCCOMMONITORING] then
  begin
    fmTemp := MDIForm('TfmPCComMonitoring');
    if fmTemp <> nil then TfmPCComMonitoring(fmTemp).ClientPacketView(aClientIP,aTxRx,aData,aResult);
  end;

end;


procedure TfmMain.CommandArrayCommandsTFORMENABLEExecute(Command: TCommand;
  Params: TStringList);
var
  stName : string;
  bValue : Boolean;
begin
  stName := Params.Values['NAME'];
  if UpperCase(Params.Values['VALUE']) = 'TRUE' then bValue := True
  else bValue := False;

  if Not isDigit(stName) then Exit;

  G_bFormEnabled[strtoint(stName)] := bValue;   //�ش� ��
  case strtoint(stName) of
    conFORMCONFIG : begin  //ȯ�漳�� â �����
      if Not bValue then
      begin
        FireDoorOpenTimer.Enabled := G_bFireDoorOpenUse;
      end;
    end;
  end;
end;

procedure TfmMain.CurrentAlarmEvent(Sender: TObject; aNodeNo, aECUID, aCmd,
  aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
  aAlarmColor: string);
var
  stInsertTime : string;
  stExtendID : string;
  stAlarmEvent : string;
begin
  //���⿡�� �˶������� ���� �� Client �� �˶������� ����
  if Not isDigit(aArmArea) then aArmArea := '0'
  else aArmArea := inttostr(strtoint(aArmArea));
  if Not isDigit(aAlarmColor) then aAlarmColor := '16711935';
  if Not isDigit(aLoop) then aLoop := '0';
  if aArmModeChange = '' then aArmModeChange := '0';
  if aAlarmView = '' then aAlarmView := '0';
  if aAlarmSound = '' then aAlarmSound := '0';

  stExtendID := '0';
  if aSubCLass = 'EL' then
  begin
    if isDigit(aSubAddr) then stExtendID := inttostr(strtoint(aSubAddr));
  end;

  if aCmd = 'A' then    //Alarm Data �� ���� ����.
  begin
    aOper := stringReplace(aOper,',','',[rfReplaceAll]);
    stInsertTime := FormatDateTime('yyyymmddhhnnsszzz',now);
                                                                                           //yyyymmddhhnnss
(*    stAlarmEvent := FillZeroStrNum(aNodeNo,G_nNodeCodeLength) + aECUID + aCmd[1] + aMsgNo[1] + aTime + aSubCLass + aSubAddr + aArmArea[1] + aMode[1] +
                    aAlarmStateCode + aLoop[1] + aZoneState[1] + FillZeroStrNum(aAlarmStatePCCode,8) + aArmModeChange[1] + aAlarmView[1] + aAlarmSound[1] + FillZeroStrNum(aAlarmColor,10) + stInsertTime + aOper + DATADELIMITER +
                    aAlarmStateCodeName + DATADELIMITER + aAlarmStatePCCode;
*)
    stAlarmEvent := FillZeroStrNum(aNodeNo,G_nNodeCodeLength) + aECUID + '0' + aCmd[1] + aMsgNo[1] + FillZeroStrNum(aTime,14,False) + FillZeroStrNum(aSubCLass,2,False) + FillZeroStrNum(aSubAddr,2,False) +
                 FillZeroStrNum(aArmArea,2,True) + aMode[1] + FillZeroStrNum(aAlarmStateCode,2,True) + FillZeroStrNum(aLoop,2,True) +
                 aZoneState[1] + ',' + aOper + ',' + aAlarmStateCodeName + ',' + aAlarmStatePCCode + ',' + aAlarmStatePCCodeName + ',' + aArmModeChange + ',' + aAlarmView + ',' +
                 aAlarmSound + ',' + aAlarmColor;

    FileAppend(G_stEventDataDir + '\AlarmEvent' + FormatDateTime('yyyymmddhhnnss',now) + aNodeNo,stAlarmEvent,False);
    if G_bFireDoorOpenUse then
    begin
      if (aZoneState <> 'N') and (aAlarmStateCode = G_stFireStateCode) then
      begin
        if FireEventGubunList.IndexOf( TNode(Sender).FIREGUBUNCODE ) < 0 then FireEventGubunList.Add(TNode(Sender).FIREGUBUNCODE);
      end;
    end;
  end;
end;

procedure TfmMain.CurrentDoorState(Sender: TObject; aNodeNo: integer; aEcuID,
  aExtendID, aNumber, aCardMode, aDoorMode, aDoorState, aLockState,
  aDoorFire: string);
begin
  //���⿡�� ���Թ� ���� ����
  dmMonitoringServer.CurrentDoorState(aNodeNo,aEcuID,aExtendID, aNumber, aCardMode, aDoorMode, aDoorState, aLockState,aDoorFire);

end;

procedure TfmMain.DataBaseAdoConnected(Sender: TObject; DBConnected: Boolean);
begin
  AdoConnectCheckTimer.Enabled := Not DBConnected;  //���� �Ҷ��� �����ͺ��̽� ���� �������� �� �ʿ� ���� ��� DB Manager�� ó�� �ϵ��� ����.
end;

procedure TfmMain.DeviceCardAccessEvent(Sender: TObject; aNodeNo, aECUID,
  aDoorNo, aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
  aAccessResult, aDoorState, aATButton, aCardNo, aType, aArmAreaNo,
  aAntiGroup: string);
var
  nAntiPassSendResult : integer;
  stNodeNo : string;
  stCompanyCode,stCompanyName, stEmSeq,stEmCode, stEmName,stPosiCode,stPosiName,stPrintNo,stHandPhone : string;
  stATUse,stFDUse:string;
begin
  //�����̺�Ʈ ���ʿ����� ó������ ����... manager���� ó�� �Ŀ� �̺�Ʈ �޾Ƽ� ó�� ��
  if aType = 'A' then  //AntiPass ó�� ����.
  begin
    aAccessResult := 'A'; //�̵��ī��
    nAntiPassSendResult := AntiPassProcess(aNodeNo, aECUID,aDoorNo, aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,aAccessResult, aDoorState, aATButton, aCardNo, aType, aArmAreaNo,aAntiGroup,
                                           stCompanyCode,stCompanyName,stEmSeq,stEmCode, stEmName,stPosiCode,stPosiName,stATUse,stFDUse,stPrintNo,stHandPhone);
    if nAntiPassSendResult = 1 then aAccessResult := '1'
    else if nAntiPassSendResult = -2 then aAccessResult := 'J';

    stNodeNo := FillZeroStrNum(aNodeNo,G_nNodeCodeLength);

    dmMonitoringServer.DeviceCardAccessEvent(stNodeNo,aECUID,aDoorNo,aReaderNo,aInOut,aTime,aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState,aATButton,aCardNo,aType,aArmAreaNo,stCompanyCode,stCompanyName, stEmSeq,stEmCode, stEmName,stPosiCode,stPosiName,stPrintNo,stHandPhone);
  end else
  begin
    stNodeNo := FillZeroStrNum(aNodeNo,G_nNodeCodeLength);
    dmDirectServer.DeviceCardAccessEvent(stNodeNo,aECUID,aDoorNo,aReaderNo,aInOut,aTime,aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState,aATButton,aCardNo,aType,aArmAreaNo,stCompanyCode,stCompanyName, stEmSeq,stEmCode, stEmName,stPosiCode,stPosiName,stPrintNo,stHandPhone);
    sb_Status.Panels[2].Text := 'Direct CardAccessEvent Send' + aCardNo;
  end;
end;

procedure TfmMain.DeviceConnected(Sender: TObject; aSocketNo, aNodeNo: integer;
  aEcuID: string; aConnected: TConnectedState; aAntiGroupCode: string);
var
  stConnected : string;
  nIndex : integer;
  stDeviceID : string;
begin
  if aConnected = csConnected then stConnected := '1'
  else stConnected := '0';

  if aAntiGroupCode <> '' then
  begin
    nIndex := AntiPassGroupList.IndexOf(aAntiGroupCode);
    if nIndex > -1 then
    begin
      stDeviceID := FillZeroNumber(aNodeNo,G_nNodeCodeLength) + aEcuID;
      if stConnected = '1' then
        TAntiPassGroup(AntiPassGroupList.Objects[nIndex]).DeviceConnected(stDeviceID,True)
      else TAntiPassGroup(AntiPassGroupList.Objects[nIndex]).DeviceConnected(stDeviceID,False);
    end;
  end;

  //��Ʈ�ѷ� ��� ���� ����
  dmMonitoringServer.CurrentDeviceConnectedChange(aNodeNo,aEcuID,stConnected);

end;

function TfmMain.DeviceHolidaySend(aYear: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stNodeNo : string;
  stEcuID : string;
  stOldNodeNo : string;
  stOldEcuID : string;
  nIndex : integer;
  bNodeSetting : Boolean;
  i : integer;
  stHoType : string;
begin
  dmDBUpdate.UpdateTB_HOLIDAYDEVICE_CurrentYearSendStatus(aYear,'N','R'); // Manager ���� 'R' �� �����Ѵ�.

  stSql := ' Select a.* from TB_HOLIDAYDEVICE a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'' ) ';
  stSql := stSql + ' INNER JOIN TB_NODE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND c.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.HD_SEND = ''R'' ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND SUBSTRING(a.HO_DAY,1,4) = ''' + aYear + ''' '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND SUBSTR(a.HO_DAY,1,4) = ''' + aYear + ''' '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND SUBSTRING(a.HO_DAY From 1 for 4) = ''' + aYear + ''' ';
  stSql := stSql + ' Order by a.ND_NODENO,a.DE_ECUID ';

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
        TDataBaseConfig.GetObject.DBConnected := False;
        LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceHolidaySend');
        Exit;
      End;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
        stHoType := FindField('HO_TYPE').AsString;
        if FindField('HD_USE').AsString = '0' then stHoType := '0';

        if stOldNodeNo <> '' then
        begin
          if stOldNodeNo <> stNodeNo then  //��尡 �ٲ���
          begin
            nIndex := NodeList.IndexOf(stOldNodeNo);
            if nIndex > -1 then
            begin
              for i := 1 to 8 do
                TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdHOLIDAY,stOldEcuID,inttostr(i),'U');
            end else
            begin
              nIndex := ServerNodeList.IndexOf(stOldNodeNo);
              if nIndex > -1 then
              begin
                for i := 1 to 8 do
                  dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdHOLIDAY,stOldEcuID,inttostr(i),'U');
              end;
            end;
            bNodeSetting := True;
            stOldEcuID := FindField('DE_ECUID').AsString;
          end;
        end;
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          if stOldEcuID <> '' then //��Ʈ�ѷ� ���̵� ����Ȱ��
          begin
            if stOldEcuID <> FindField('DE_ECUID').AsString then
            begin
              for i := 1 to 8 do
                TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdHOLIDAY,stOldEcuID,inttostr(i),'U');
              bNodeSetting := True;
            end;
          end;
          TNode(NodeList.Objects[nIndex]).SetDeviceHoliday(FindField('DE_ECUID').AsString,copy(FindField('HO_DAY').AsString,5,4),stHoType);
          bNodeSetting := False;
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stOldNodeNo);
          if nIndex > -1 then
          begin
            if stOldEcuID <> '' then //��Ʈ�ѷ� ���̵� ����Ȱ��
            begin
              if stOldEcuID <> FindField('DE_ECUID').AsString then
              begin
                for i := 1 to 8 do
                  dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdHOLIDAY,stOldEcuID,inttostr(i),'U');
                bNodeSetting := True;
              end;
            end;

            dmNodeServer.DeviceNodeServer_SetDeviceHoliday(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,FindField('DE_ECUID').AsString,copy(FindField('HO_DAY').AsString,5,4),stHoType);
            bNodeSetting := False;
          end;
        end;
        stOldNodeNo := stNodeNo;
        stOldEcuID := FindField('DE_ECUID').AsString;

        dmDBUpdate.UpdateTB_HOLIDAYDEVICE_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('HO_DAY').AsString,'HD_SEND','S');
        Application.ProcessMessages;
        Next;
      end;
      if Not bNodeSetting then    //������ ���� ���Ѱ� ������ ���� ����.
      begin
        nIndex := NodeList.IndexOf(stOldNodeNo);
        if nIndex > -1 then
        begin
          for i := 1 to 8 do
            TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdHOLIDAY,stOldEcuID,inttostr(i),'U');
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stOldNodeNo);
          if nIndex > -1 then
          begin
            for i := 1 to 8 do
              dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdHOLIDAY,stOldEcuID,inttostr(i),'U');
          end;
        end;
      end;
      //dmDBUpdate.UpdateTB_HOLIDAYDEVICE_CurrentYearSendStatus(aYear,'R','S'); //
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.DevicePacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aData: string);
begin
//��Ʈ�ѷ� ���� ���� ���� �Ǿ����� �Ѿ�´�.
  case aCmd of
      con_DeviceCmdDeviceVersion : begin
        dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(inttostr(aNodeNo),aEcuID,'0','DE_DEVICEVER',aData);
      end;
      con_DeviceCmdDeviceCode : begin
        dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(inttostr(aNodeNo),aEcuID,'0','DE_DEVICECODE',aData);
      end;
  end;

end;

procedure TfmMain.DeviceReceiveData(Sender: TObject; aNodeNo: integer; aType,
  aEcuID, aExtendID, aNumber: string; aRcvInfoType: integer; aData: string);
begin
  if aType = 'DEVICE' then
  begin
    case aRcvInfoType of
      con_DeviceCmdNetworkState: begin  //��Ʈ�� üũ��

      end;
    end;
  end;
end;

procedure TfmMain.DeviceReceiveTypeChage(Sender: TObject; aNodeNo: integer;
  aType, aEcuID, aExtendID, aNumber: string; aRcvInfoType: integer;
  aData: string);
begin
  if aType = 'DEVICE' then
  begin
    case aRcvInfoType of
      con_DeviceCmdFTPCardDownLoadEnd : begin
        dmDBUpdate.UpdateTB_CARDFTPDOWNLIST_Field_StringValue(inttostr(aNodeNo),aEcuID,'CF_RCVACK',aData);
      end;
      con_DeviceCmdFTPCardDownLoadPer : begin
        dmDBUpdate.UpdateTB_CARDFTPDOWNLIST_Field_StringValue(inttostr(aNodeNo),aEcuID,'CF_SENDPROGRESS',aData);
        dmMonitoringServer.FTPCardDownLoadPercentChange(inttostr(aNodeNo),aEcuID, aExtendID, aNumber, aData);
      end;
      con_DeviceCmdTimeCodeSend : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_TIMECODEDEVICE_Field_StringValue(inttostr(aNodeNo),aEcuID,'TC_SEND',aData);
      end;
      con_DeviceCmdTimeCodeUse : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_TIMECODEUSE',aData);
      end;
    end;
  end else if aType = 'DOOR' then
  begin
    case aRcvInfoType of
      con_DoorCmdSCHEDULEDATA : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_DOORSCHEDULE_DoorReceive(inttostr(aNodeNo),aEcuID,aNumber,aData);
      end;
    end;
  end else if aType = 'READER' then
  begin
    case aRcvInfoType of
      con_CardReaderCmdTelNumber0 : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'RE_CARDREADERTEL0',aData);
      end;
      con_CardReaderCmdTelNumber1 : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'RE_CARDREADERTEL1',aData);
      end;
      con_CardReaderCmdTelNumber2 : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'RE_CARDREADERTEL2',aData);
      end;
      con_CardReaderCmdTelNumber3 : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'RE_CARDREADERTEL3',aData);
      end;
      con_CardReaderCmdTelNumber4 : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'RE_CARDREADERTEL4',aData);
      end;
      con_CardReaderCmdTelNumber5 : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'RE_CARDREADERTEL5',aData);
      end;
      con_CardReaderCmdTelNumber6 : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'RE_CARDREADERTEL6',aData);
      end;
      con_CardReaderCmdTelNumber7 : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'RE_CARDREADERTEL7',aData);
      end;
      con_CardReaderCmdTelNumber8 : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'RE_CARDREADERTEL8',aData);
      end;
      con_CardReaderCmdTelNumber9 : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'RE_CARDREADERTEL9',aData);
      end;
    end;
  end;
(*  if aType = 'NODE' then
  begin
    case aRcvInfoType of
      con_DeviceCmdKTTSystemID: begin
        dmDBUpdate.UpdateTB_NODERCV_Field_StringValue(inttostr(aNodeNo),'ND_KTTSYSTEMID',aData);
      end;  //���� �ý��� ���̵�
      con_DeviceCmdKTTTelNumber1: begin
        dmDBUpdate.UpdateTB_NODERCV_Field_StringValue(inttostr(aNodeNo),'ND_KTTTELNUMBER',aData);
      end;  //���� ���ڴ� ��ȭ��ȣ1
      con_DeviceCmdKTTREMOTEARMRINGCOUNT: begin
        dmDBUpdate.UpdateTB_NODERCV_Field_StringValue(inttostr(aNodeNo),'ND_KTTREMOTERINGCOUNT',aData);
      end;  //���ݰ��� ��Ƚ��
      con_DeviceCmdKttCdmaUse: begin
        dmDBUpdate.UpdateTB_NODERCV_Field_StringValue(inttostr(aNodeNo),'ND_KTTCDMAUSE',aData);
      end; //CDMA ��� ���� 0.�̻��,1.���
      con_DeviceCmdKttCDMADATA: begin
        dmDBUpdate.UpdateTB_NODERCV_Field_StringValue(inttostr(aNodeNo),'ND_KTTCDMADATA',aData);
      end;     //CDMA IP
      con_DeivceCmdDVRUSE: begin
        dmDBUpdate.UpdateTB_NODERCV_Field_StringValue(inttostr(aNodeNo),'ND_DVRUSE',aData);
      end; //DVR ��� ���� 0.�̻��,1.���
      con_DeviceCmdDVRIP: begin
        dmDBUpdate.UpdateTB_NODERCV_Field_StringValue(inttostr(aNodeNo),'ND_DVRDATA',aData);
      end; //DVR IP
      con_DeviceCmdARMEXTENTIONMAINTOLOCAL : begin
        dmDBUpdate.UpdateTB_NODERCV_Field_StringValue(inttostr(aNodeNo),'ND_ARMEXTENTIONMAINTOLOCAL',aData);
      end;
      con_DeviceCmdARMEXTENTIONMAINFROMLOCAL : begin
        dmDBUpdate.UpdateTB_NODERCV_Field_StringValue(inttostr(aNodeNo),'ND_ARMEXTENTIONMAINFROMLOCAL',aData);
      end;
      con_DeviceCmdUseState : begin //ECU Use �������
        dmDBUpdate.UpdateTB_NODERCV_Field_StringValue(inttostr(aNodeNo),'ND_ECUUSE',aData);
      end;
    end;
  end else if aType = 'DEVICE' then
  begin
    case aRcvInfoType of
      con_DeviceCmdDeviceCode : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_DEVICECODE',aData);
      end;
      con_DeviceCmdVER : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_DEVICEVER',aData);
      end;
      con_DeviceCmdDeviceDoor2RelayType : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_DOOR2RELAY',aData);
      end;
      con_DeviceCmdSystemInformation : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_SYSTEMINFO',aData);
      end;
      con_DeviceCmdJaeJungDelayUse : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_JAEJUNGDELAYUSE',aData);
      end;
      con_DeviceCmdArmRelay : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_ARMRELAY',aData);
      end;
      con_DeviceCmdCardReaderNetwork : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_CARDREADERNETWORK',aData);
      end;
      con_DeviceCmdCardReaderType : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_CARDREADERTYPE',aData);
      end;
      con_DeviceCmdEMZONELAMP : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_EMZONELAMP',aData);
      end;
      con_DeviceCmdExtentionNetwork : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_EXTENTIONNETWORK',aData);
      end;
      con_DeviceCmdLAMPONTIME : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_ZONELAMPONTIME',aData);
      end;
      con_DeviceCmdSIRENONTIME : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_ZONESIRENONTIME',aData);
      end;
      con_DeviceCmdArmAreaUse : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_ARMAREAUSE',aData);
      end;
      con_DeviceCmdDeviceDoorArmArea : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_DOORARMAREA',aData);
      end;
      con_DeviceCmdExtentionUse : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_DEVICEEXTENTION',aData);
      end;
      con_DeviceCmdJAVARAARMCLOSE : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_JAVARAARMCLOSE',aData);
      end;
      con_DeviceCmdJAVARAAUTOCLOSE : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_JAVARAAUTOCLOSE',aData);
      end;
      con_DeviceCmdTimeCodeSend : begin
        if aData = 'Y' then
           dmDBUpdate.UpdateTB_TIMECODEDEVICE_Field_StringValue(inttostr(aNodeNo),aEcuID,'TC_SEND',aData);
      end;
      con_DeviceCmdTimeCodeUse : begin
        dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'DE_TIMECODEUSE',aData);
      end;
    end;
  end else if aType = 'DOOR' then
  begin
    case aRcvInfoType of
      con_DoorCmdSettingInfo : begin
        dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'DO_SETTINGINFO',aData);
      end;
      con_DoorCmdDeadBoltDSCHECKUSE : begin
        dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'DO_DEADBOLTDSCHECKUSE',aData);
      end;
      con_DoorCmdDeadBoltDSCHECKTIME : begin
        dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'DO_DEADBOLTDSCHECKTIME',aData);
      end;
      con_DoorCmdARMDSCHECK : begin
        dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'DO_ARMDSCHECK',aData);
      end;
    end;
  end else if aType = 'READER' then
  begin
    case aRcvInfoType of
      con_CardReaderCmdSettingInfo : begin
        dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'RE_ReaderSETTINGINFO',aData);
      end;
    end;
  end else if aType = 'ZONE' then
  begin
    case aRcvInfoType of
      con_ZoneCmdSetting : begin
        dmDBUpdate.UpdateTB_ZONERCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'ZN_SETTING',aData);
      end;
    end;
  end else if aType = 'EXTEND' then
  begin
    case aRcvInfoType of
      con_ExtentionCmdZoneInfoSetting : begin
        dmDBUpdate.UpdateTB_ZONEEXTENTIONRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'ZE_ZONEINFO',aData);
      end;
    end;
  end;
*) //���⼭�� ���� �� ���� ����... == ���Թ� ������ Manager ���� �����Ѵ�.
end;

procedure TfmMain.DeviceServerManagerCheckTimerTimer(Sender: TObject);
var
  dtTimeOut : TDateTime;
begin
  inherited;
//(*TEST20160518
  if G_bApplicationTerminate then Exit;

  Try
    dtTimeOut:= IncTime(L_dtDeviceServerAliveTime,0,0,30,0);   //30�� ���� �ְ����� �����Ͱ� ������ ALIVE �� �����Ѵ�.
    if Now > dtTimeOut then
    begin
      L_dtDeviceServerAliveTime := Now;
      MIAMS_DeviceServerManagerControlAckMessageDataSend(0,inttostr(con_cmdManagerToServerACK) + DATADELIMITER + 'ALIVE' + DATADELIMITER);
    end;
    dtTimeOut:= IncTime(L_dtDeviceServerManagerAliveTime,0,1,0,0);   //1�� ���� �ְ����� �����Ͱ� ������ ���ڴ��δ��� ���� �� �ٽ� �⵿ ��Ű��.
    if Now > dtTimeOut then
    begin
      MIAMS_DeviceServerManagerTerminate;
      MIAMS_DeviceServerManagerExecute;
    end;
  Except
  End;
//*)
end;

procedure TfmMain.DeviceUsedEvent(Sender: TObject; aNodeNo: integer; aType,
  aEcuID, aExtendID, aNumber: string; aUsed: Boolean);
begin
//��Ʈ�ѷ� ������� ���� ��
end;

procedure TfmMain.DoorHolidaySend(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
var
  stDate : string;
  stUse : string;
begin
  stDate := FormatDateTime('yyyy',now) + copy(aData,1,4);
  stUse := copy(aData,5,1);
  dmDBUpdate.UpdateTB_HOLIDAYDEVICE_DaySendStatus(inttostr(aNodeNo),aEcuID,stDate,stUse,'Y');
end;

procedure TfmMain.DoorPacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
var
  stData : string;
  stNodeNo : string;
begin

  //���Թ� ���� ����
  case aCmd of
    con_DoorCmdHOLIDAY : begin
      //dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'DO_HOLIDAY',aData);
      if aData = 'Y' then dmDBUpdate.UpdateTB_HOLIDAYDEVICE_DeviceYearSendStatus(inttostr(aNodeNo),aEcuID,FormatDateTime('yyyy',Now),aData);
    end;
    con_DoorCurrentDSState : begin
      stNodeNo := FillZeroNumber(aNodeNo,G_nNodeCodeLength);
      stData := stNodeNo + aECUID + aNumber + FormatDateTime('yyyymmddhhnnss',Now) + aData;
      FileAppend(G_stEventDataDir + '\DOORDS' + FormatDateTime('yyyymmddhhnnss',now) + stNodeNo,stData,False);
    end;
  end;
end;

function TfmMain.DoorScheduleSend: Boolean;
var
  st:         string;
  stNodeNo : string ;
  stEcuID : string ;
  stDoorNo : string ;
  stOldNodeNo : string ;
  stOldEcuID : string ;
  stOldDoorNo : string ;
  nDoorIndex: Integer;
  cDay:       Char;
  stData:      String;
  nIndex:     Integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
  i : integer;
  bSendExcute : Boolean;
  nRecordCount : integer;
  nCount : integer;
begin
  result := True;

  Try
    //dmDBUpdate.UpdateTB_DOORSCHEDULE_SendStatus('N','R'); //Manager ���� 'R'�� ������

    stSql := 'SELECT a.* ';
    stSql := stSql + ' FROM TB_DOORSCHEDULE a ';
    stSql := stSql + ' INNER JOIN TB_NODE c ';
    stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND c.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DS_DEVICESYNC = ''R'' ' ;
    stSql := stSql + ' order by a.ND_NODENO,a.DE_ECUID,a.DO_DOORNO ';

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;

      with TempAdoQuery do
      begin
        Close;
        //Sql.Clear;
        Sql.Text := stSql;
        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DoorScheduleSend');
          Exit;
        End;
//        dmDBUpdate.UpdateTB_DOORSCHEDULE_SendStatus('R','S');

        if RecordCount > 0 then
        begin
    //      result := False;   //�۽� ������ ������ �ٽ� �ѹ� �� ���� ��� �� ����...
    //      aDeviceID:= FindField('DEVICE_ID').asString;
          First;
          nRecordCount := RecordCount;
          nCount := 1;
          While not eof do
          begin
            if G_bApplicationTerminate then Exit;
            stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
            stEcuID := FindField('DE_ECUID').AsString;
            stDoorNo := FindField('DO_DOORNO').AsString;
            bSendExcute := False;

            if nRecordCount = nCount then bSendExcute := True;

            if stOldNodeNo <> '' then
            begin
              if stOldNodeNo <> stNodeNo then
              begin
                bSendExcute := True;
              end else
              begin
                if stOldEcuID <> stEcuID then
                begin
                  bSendExcute := True;
                end else
                begin
                  if stOldDoorNo <> stDoorNo then
                  begin
                    bSendExcute := True;
                  end;
                end;
              end;
            end;
            if bSendExcute then
            begin
              nIndex := NodeList.IndexOf(stOldNodeNo);
              if nIndex > -1 then
              begin
                TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSCHEDULEDATA,stOldEcuID,stOldDoorNo,'U');
              end else
              begin
                nIndex := ServerNodeList.IndexOf(stOldNodeNo);
                if nIndex > -1 then
                begin
                  dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdSCHEDULEDATA,stOldEcuID,stOldDoorNo,'U');
                end;
              end;
            end;
            stOldNodeNo := stNodeNo;
            stOldEcuID := stEcuID;
            stOldDoorNo := stDoorNo;
            cDay := FindField('DS_DAYCODE').asString[1];
            stData:= cDay + '0000' + FindField('DS_TIMEMODE1').asString+
                        FindField('DS_TIME1').asString + FindField('DS_TIMEMODE2').asString+
                        FindField('DS_TIME2').asString + FindField('DS_TIMEMODE3').asString+
                        FindField('DS_TIME3').asString + FindField('DS_TIMEMODE4').asString+
                        FindField('DS_TIME4').asString + FindField('DS_TIMEMODE5').asString;

            nIndex := NodeList.IndexOf(stNodeNo);
            if nIndex > -1 then
            begin
              TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSCHEDULEDATA,stEcuID,stDoorNo,stData);
            end else
            begin
              nIndex := ServerNodeList.IndexOf(stNodeNo);
              if nIndex > -1 then
              begin
                dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdSCHEDULEDATA,stEcuID,stDoorNo,stData);
              end;
            end;
            inc(nCount);
            dmDBUpdate.UpdateTB_DOORSCHEDULE_Field_StringValue(FindField('ND_NODENO').asstring,FindField('DE_ECUID').asstring,FindField('DE_EXTENDID').asstring,FindField('DO_DOORNO').asstring,FindField('DS_DAYCODE').asstring,'DS_DEVICESYNC','S');  //������ ���ϵ���
            Application.ProcessMessages;
            Next;
          end;
          nIndex := NodeList.IndexOf(stOldNodeNo);
          if nIndex > -1 then
          begin
            TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSCHEDULEDATA,stOldEcuID,stOldDoorNo,'U');
          end else
          begin
            nIndex := ServerNodeList.IndexOf(stOldNodeNo);
            if nIndex > -1 then
            begin
              dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdSCHEDULEDATA,stOldEcuID,stOldDoorNo,'U');
            end;
          end;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Send_DoorScheduleInfo');
  End;
end;

function TfmMain.DoorSettingRegist(aData: string): Boolean;
var
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDOORNO : string;
  stDoorUse : string;
  stControlTime : string;
  stLongOpenTime : string;
  stLongOpenAlarm : string;
  stDoorScheduleUse : string;
  stDoorState : string;
  stAntiNo : string;
  stLockType : string;
  stFireDoorOpen : string;
  stDsOpenState : string;
  stRemoteDisArmDoorOpen : string;
  nIndex : integer;
begin
  stNodeNo := copy(aData,1,G_nNodeCodeLength);
  stEcuID := copy(aData,1 + G_nNodeCodeLength,2);
  stExtendID := copy(aData,1 + G_nNodeCodeLength + 2,1);
  stDOORNO := copy(aData,1 + G_nNodeCodeLength + 2 + 1,G_nDoorCodeLength);
  stDoorUse := copy(aData,1 + G_nNodeCodeLength + 2 + 1 + G_nDoorCodeLength,1);
  stControlTime := copy(aData,1 + G_nNodeCodeLength + 2 + 1 + G_nDoorCodeLength + 1,10);
  stLongOpenTime := copy(aData,1 + G_nNodeCodeLength + 2 + 1 + G_nDoorCodeLength + 1 + 10,10);
  stLongOpenAlarm := copy(aData,1 + G_nNodeCodeLength + 2 + 1 + G_nDoorCodeLength + 1 + 10 + 10,1);
  stDoorScheduleUse := copy(aData,1 + G_nNodeCodeLength + 2 + 1 + G_nDoorCodeLength + 1 + 10 + 10 + 1,1);
  stDoorState := copy(aData,1 + G_nNodeCodeLength + 2 + 1 + G_nDoorCodeLength + 1 + 10 + 10 + 1 + 1,1);  //���Թ���������
  stAntiNo := copy(aData,1 + G_nNodeCodeLength + 2 + 1 + G_nDoorCodeLength + 1 + 10 + 10 + 1 + 1 + 1,2);
  stLockType := copy(aData,1 + G_nNodeCodeLength + 2 + 1 + G_nDoorCodeLength + 1 + 10 + 10 + 1 + 1 + 1 + 2,1);
  stFireDoorOpen := copy(aData,1 + G_nNodeCodeLength + 2 + 1 + G_nDoorCodeLength + 1 + 10 + 10 + 1 + 1 + 1 + 2 + 1,1);
  stDsOpenState := copy(aData,1 + G_nNodeCodeLength + 2 + 1 + G_nDoorCodeLength + 1 + 10 + 10 + 1 + 1 + 1 + 2 + 1 + 1,1); //���Թ� ��������
  stRemoteDisArmDoorOpen := copy(aData,1 + G_nNodeCodeLength + 2 + 1 + G_nDoorCodeLength + 1 + 10 + 10 + 1 + 1 + 1 + 2 + 1 + 1 + 1,1);

  nIndex := NodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdInfoInitialize,stEcuID,stDOORNO,'1');
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdCONTROLTIME,stEcuID,stDOORNO,stControlTime);
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdLONGOPENTIME,stEcuID,stDOORNO,stLongOpenTime);
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdLONGOPENALARM,stEcuID,stDOORNO,stLongOpenAlarm);
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DOORCmdSTATE,stEcuID,stDOORNO,stDoorState);
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSCHEDULEUSE,stEcuID,stDOORNO,stDoorScheduleUse);
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdFIREDOOROPEN,stEcuID,stDOORNO,stFireDoorOpen);
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdLOCKTYPE,stEcuID,stDOORNO,stLockType);
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdDSOPENSTATE,stEcuID,stDOORNO,stDsOpenState);
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdREMOTEDISARMDOOROPEN,stEcuID,stDOORNO,stRemoteDisArmDoorOpen);
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdAntiNo,stEcuID,stDOORNO,inttostr(strtoint(stAntiNo)));
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdInfoInitialize,stEcuID,stDOORNO,'0');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U'); //���� ó�� ����.
  end else
  begin
    nIndex := ServerNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdInfoInitialize,stEcuID,stDOORNO,'1');
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdCONTROLTIME,stEcuID,stDOORNO,stControlTime);
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdLONGOPENTIME,stEcuID,stDOORNO,stLongOpenTime);
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdLONGOPENALARM,stEcuID,stDOORNO,stLongOpenAlarm);
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DOORCmdSTATE,stEcuID,stDOORNO,stDoorState);
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdSCHEDULEUSE,stEcuID,stDOORNO,stDoorScheduleUse);
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdFIREDOOROPEN,stEcuID,stDOORNO,stFireDoorOpen);
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdLOCKTYPE,stEcuID,stDOORNO,stLockType);
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdDSOPENSTATE,stEcuID,stDOORNO,stDsOpenState);
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdREMOTEDISARMDOOROPEN,stEcuID,stDOORNO,stRemoteDisArmDoorOpen);
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdAntiNo,stEcuID,stDOORNO,inttostr(strtoint(stAntiNo)));
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdInfoInitialize,stEcuID,stDOORNO,'0');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U'); //���� ó�� ����.
    end;
  end;
end;

function TfmMain.DoorSettingSearch(aData: string): Boolean;
var
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDoorNo : string;
  stDoorUse : string;
  nIndex : integer;
begin
  stNodeNo := copy(aData,1,G_nNodeCodeLength);
  stEcuID := copy(aData,1 + G_nNodeCodeLength, 2);
  stExtendID := copy(aData,1 + G_nNodeCodeLength + 2,1);
  stDoorNo := copy(aData,1 + G_nNodeCodeLength + 2 + 1,G_nDoorCodeLength);
  stDoorUse := copy(aData,1 + G_nNodeCodeLength + 2 + G_nDoorCodeLength,1);

  nIndex := NodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'N');
  end else
  begin
    nIndex := ServerNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'N');
    end;
  end;
end;

function TfmMain.DoorTimeCodeUseChangeSend: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  stNodeNo : string;
  stEcuID : string;
  nIndex : integer;
begin
  result := True;

  Try
    stSql := 'SELECT a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,b.DO_DOORNO,b.DO_TIMECODEUSE ';
    stSql := stSql + ' FROM TB_DEVICERCV a ';
    stSql := stSql + ' INNER JOIN TB_DOOR b ';
    stSql := stSql + ' ON(a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ) ';
    stSql := stSql + ' INNER JOIN TB_NODE c ';
    stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND c.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DE_TIMECODEUSE = ''R'' ' ;    //������Ʈ �Ȱ��� �ִ��� üũ

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;

      with TempAdoQuery do
      begin
        Close;
        Sql.Text := stSql;
        Try
          Open;
        Except
          on E : EDatabaseError do
          begin
            LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','TimeDeviceCodeSend' +  E.Message);
          end;
          else
          begin
            LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','TimeDeviceCodeSend');
          end;
          Exit;
        End;

        if RecordCount > 0 then
        begin
          First;
          While not eof do
          begin
            if G_bApplicationTerminate then Exit;
            stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
            stEcuID := FindField('DE_ECUID').AsString;


            nIndex := NodeList.IndexOf(stNodeNo);
            if nIndex > -1 then
            begin
              TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdTimeCodeUse,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_TIMECODEUSE').AsString);
              TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdTimeCodeUse,FindField('DE_ECUID').AsString,'U');
            end else
            begin
              nIndex := ServerNodeList.IndexOf(stNodeNo);
              if nIndex > -1 then
              begin
                dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdTimeCodeUse,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_TIMECODEUSE').AsString);
                dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceCmdTimeCodeUse,FindField('DE_ECUID').AsString,'U');
              end;
            end;
            dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,'DE_TIMECODEUSE','S');

            Application.ProcessMessages;
            Next;
          end;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Send_DoorScheduleInfo');
  End;
end;

procedure TfmMain.EmployeeCardPermitLoad(Sender: TObject; aCardNo: string);
begin
//
end;

procedure TfmMain.EmployeePermitAllLoading(Sender: TObject; aNodeNo: integer;
  aData: string);
begin
  while L_bEmployeePermitLoad do
  begin
    sleep(1);
    Application.ProcessMessages;
  end;
  EmployeePermitLoad(inttostr(aNodeNo),aData);
end;

function TfmMain.EmployeePermitLoad(aNodeNo, aEcuID: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stEmSeq : string;
begin
  result := False;
  Try
    L_bEmployeePermitLoad := True;
    //����͸����� �� �۾� ���� ���� �ϰ� ���⼭�� TB_CARDPERMIT �� ����
    stSql := ' Select ';
    if aEcuID = '' then
    begin
      if G_nDBType = MSSQL then
        stSql := stSql + ' top 1 ';
    end;
    stSql := stSql + ' EM_SEQ from TB_CARDPERMITEMPLOYEECODE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND CP_APPLY <> ''Y'' ';
    if aEcuID <> '' then
    begin
      stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
      stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
    end;
    stSql := stSql + ' GROUP BY EM_SEQ ';
    if aEcuID = '' then
    begin
      if G_nDBType = POSTGRESQL then stSql := stSql + ' LIMIT 1 OFFSET 0 ';
    end;
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
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','EmployeePermitLoad');
          Exit;
        End;
        if recordcount < 1 then Exit;
        result := True;
        while not Eof do
        begin
          if G_bApplicationTerminate then Exit;
          stEmSeq := FindField('EM_SEQ').AsString;
          if EmployeePermitToCardLoad(stEmSeq,aNodeNo,aEcuID) then
          begin
            if dmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N',aNodeNo,aEcuID) < 1 then //������ �����Ͱ� ������
               dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'Y',aNodeNo,aEcuID);
          end;
          Application.ProcessMessages;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
    L_bEmployeePermitLoad := False;
  End;
end;

function TfmMain.EmployeePermitToCardDeviceLoad(aNodeNo, aEcuID,
  aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stOldCardNo : string;
  stNodeNo : string;
  nIndex : integer;
  bNodeSetting : Boolean;
begin

  stSql := ' Select ';
  stSql := stSql + ' a.EM_SEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.CP_TYPE,f.EM_STATE,';
  stSql := stSql + ' a.CP_NUMBER,a.CP_PERMIT,b.CA_CARDNO,b.CA_STATECODE,b.CA_POSITIONNUM, ';
  stSql := stSql + ' c.EM_CODE,c.EM_NAME,c.CO_COMPANYCODE,c.EM_ACUSE,c.EM_ATUSE,c.EM_FDUSE,';
  stSql := stSql + ' e.EM_TIMECODEUSE,e.TC_GROUP,e.TC_TIME1,e.TC_TIME2,e.TC_TIME3,e.TC_TIME4,e.TC_WEEKCODE,c.EM_REGDATE,c.EM_ENDDATE ';
  stSql := stSql + ' from TB_CARDPERMITEMPLOYEECODE a ';
  stSql := stSql + ' INNER Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = c.EM_SEQ) ';
  stSql := stSql + ' Inner Join TB_DEVICE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID  ';
  stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEEDEVICETIMECODE e ';
  stSql := stSql + ' ON(a.EM_SEQ = e.EM_SEQ ';
  stSql := stSql + ' AND a.ND_NODENO = e.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = e.DE_ECUID ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEESTATECODE f ';
  stSql := stSql + ' ON(c.EM_STATECODE = f.EM_STATECODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND b.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' Order by b.CA_CARDNO';

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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','EmployeePermitToCardDeviceLoad');
        Exit;
      End;
      if recordcount < 1 then Exit;

      stOldCardNo := '';
      First;
      bNodeSetting := True;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
(*        if stOldCardNo <> FindField('CA_CARDNO').AsString then
        begin
          nIndex := CardEmList.IndexOf(FindField('CA_CARDNO').AsString);
          if nIndex > -1 then
          begin
            CardEmList.Delete(nIndex);    //����� ī��� ī�� ����Ʈ���� ������ �ٽ� �ε�����.
          end;
        end;
*)
        stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          if stOldCardNo <> '' then  //ī���ȣ�� ���� �� ���
          begin
            if stOldCardNo <> FindField('CA_CARDNO').AsString then
            begin
              TNode(NodeList.Objects[nIndex]).SetNodeToCardPermitExcute(FindField('DE_ECUID').AsString,stOldCardNo,'N');
              bNodeSetting := True;
            end;
          end;
          TNode(NodeList.Objects[nIndex]).SetNodeToCardPermitSetting(FindField('DE_ECUID').AsString,
          FindField('DE_EXTENDID').AsString,FindField('CA_CARDNO').AsString,FindField('CP_PERMIT').AsString,FindField('CA_STATECODE').AsString,
          FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,
          FindField('CA_POSITIONNUM').AsString,FindField('EM_TIMECODEUSE').AsString,FindField('TC_GROUP').AsString,
          FindField('TC_TIME1').AsString,FindField('TC_TIME2').AsString,FindField('TC_TIME3').AsString,
          FindField('TC_TIME4').AsString,FindField('TC_WEEKCODE').AsString,FindField('EM_REGDATE').AsString,FindField('EM_ENDDATE').AsString,FindField('EM_STATE').AsString
          );
          bNodeSetting := False;
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            if stOldCardNo <> '' then  //ī���ȣ�� ���� �� ���
            begin
              if stOldCardNo <> FindField('CA_CARDNO').AsString then
              begin
                dmNodeServer.DeviceNodeServer_SetNodeToCardPermitExcute(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,FindField('DE_ECUID').AsString,stOldCardNo,'N');
                bNodeSetting := True;
              end;
            end;
            dmNodeServer.DeviceNodeServer_SetNodeToCardPermitSetting(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,FindField('DE_ECUID').AsString,
            FindField('DE_EXTENDID').AsString,FindField('CA_CARDNO').AsString,FindField('CP_PERMIT').AsString,FindField('CA_STATECODE').AsString,
            FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,
            FindField('CA_POSITIONNUM').AsString,FindField('EM_TIMECODEUSE').AsString,FindField('TC_GROUP').AsString,
            FindField('TC_TIME1').AsString,FindField('TC_TIME2').AsString,FindField('TC_TIME3').AsString,
            FindField('TC_TIME4').AsString,FindField('TC_WEEKCODE').AsString,FindField('EM_REGDATE').AsString,FindField('EM_ENDDATE').AsString,FindField('EM_STATE').AsString
            );
            bNodeSetting := False;
          end;
        end;
        stOldCardNo := FindField('CA_CARDNO').AsString;
        //Application.ProcessMessages;
        Next;
      end;
      if Not bNodeSetting then    //������ ���� ���Ѱ� ������ ���� ����.
      begin
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).SetNodeToCardPermitExcute(FindField('DE_ECUID').AsString,stOldCardNo,'N');
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            dmNodeServer.DeviceNodeServer_SetNodeToCardPermitExcute(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,FindField('DE_ECUID').AsString,stOldCardNo,'N');
          end;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.EmployeePermitToCardLoad(aEmSeq, aNodeNo,
  aEcuID: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stOldNodeNo : string;
  stOldEcuID : string;
  stOldCardNo : string;
  stNodeNo : string;
  nIndex : integer;
  bNodeSetting : Boolean;
begin
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,'N','R',aNodeNo,aEcuID);
  stSql := ' Select ND_NODENO,DE_ECUID,EM_SEQ from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND CP_APPLY = ''R'' ';
  if aEcuID <> '' then
  begin
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  end;
  stSql := stSql + ' GROUP BY ND_NODENO,DE_ECUID,EM_SEQ ';

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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','EmployeePermitToCardLoad');
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        EmployeePermitToCardDeviceLoad(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('EM_SEQ').AsString);
        Application.ProcessMessages;
        Next;
      end;
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,'R','Y',aNodeNo,aEcuID);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

procedure TfmMain.FireDoorOpenTimerTimer(Sender: TObject);
var
  i : integer;
  nWinSock : integer;
  stFireGubunCode : string;
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if NodeList.Count > 0 then
  begin
    for i := 0 to NodeList.Count - 1 do
    begin
      if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
      begin
        if TNode(NodeList.Objects[i]).FireReceive = 1 then
            TNode(NodeList.Objects[i]).FireDoorOpen('999');
      end;
    end;
  end;

  if FireEventGubunList.Count < 1 then Exit;
  Try
    FireDoorOpenTimer.Enabled := False;
    stFireGubunCode := FireEventGubunList.Strings[0];
    FireEventGubunList.Delete(0);
    if NodeList.Count > 0 then
    begin
      for i := 0 to NodeList.Count - 1 do
      begin
        if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
        begin
          TNode(NodeList.Objects[i]).FireDoorOpen(stFireGubunCode);
        end;
      end;
    end;

    if ServerNodeList.Count > 1 then
    begin
(*      for i := 0 downto ServerNodeList.Count - 1 do
      begin
        nWinSock := TServerNode(ServerNodeList.Objects[i]).WinSocket;
        dmNodeServer.DeviceNodeServer_FireDoorOpen(nWinSock,stFireGubunCode);
      end;
*)
    end;

  Finally
    if G_bFireDoorOpenUse then
      FireDoorOpenTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

procedure TfmMain.FireRecoveryTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
//(*TEST20160518
//  Exit; //ȭ�� ������ ������� ����.
  if G_bApplicationTerminate then Exit;
  Try
    Try
      FireRecoveryTimer.Enabled := False;
      for i := 0 to NodeList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
        begin
          TNode(NodeList.Objects[i]).FireRecoveryTimer;
        end;
        Application.ProcessMessages;
      end;
    Finally
      FireRecoveryTimer.Enabled := Not G_bApplicationTerminate;
    End;
  Except
    LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','FireRecoveryTimer');
  End;
//*)
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  inherited;
  L_bFormAcive := True;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  inherited;
  G_bApplicationTerminate := True;
  dmMonitoringServer.ServerStart := False;
  Delay(500);
  dmDirectServer.ServerStart := False;
  Delay(500);

  ToDayTimer.Enabled := False;
  CardDownLoadTimer.Enabled := False;
  FireRecoveryTimer.Enabled := False;
  FTPCardDownLoadTimer.Enabled := False;
  NRCheckTimer.Enabled := False;
  NFCheckTimer.Enabled := False;
  StateCheckTimer.Enabled := False;
  RcvCheckTimer.Enabled := False;
  NodeSendPacketTimer.Enabled := False;
  NodeRcvPacketTimer.Enabled := False;
  //if NodePacketSendThread.Suspended then
  //  NodePacketSendThread.Resume;
  //NodePacketSendThread.Terminate;
  //NodePacketSendThread.WaitFor;
  //NodePacketSendThread.Free;
  MemoryFree;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if L_bClose = False then
  begin
    CanClose := False;
    Hide();
    WindowState := wsMinimized;
  end;

end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  bResult : Boolean;
  i : integer;
begin
  inherited;
  Self.ModuleID := 'Main';
  Application.OnException := AppException;

  G_bApplicationTerminate := False;
  L_bFormAcive := False;

  TDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('�����ͺ��̽� ���� ����.�����ͺ��̽����� ȯ�漳���� �ٽ� �ϼ���.');
    Application.Terminate;
    G_bApplicationTerminate := True;
    Exit;
  end;
  bResult := GetDecoderInfo; //���ڴ� ������ üũ ����.
(*  While Not bResult do
  begin
    if G_bApplicationTerminate then Exit;
    //���⿡�� ���ڴ� ���� �Է� ����.
    Application.ProcessMessages;
  end;
*)

  L_nReConnectSeq := 0;
  G_nDebugCardDownLoadCount := 0;
  G_nDebugSendPacketCount := 0;
  G_nDebugRcvPacketCount := 0;
  MemoryCreate;
  L_nCount := 0;
  L_nFTPDownLoadNodeNo := 0;
  L_nFTPNextDownLoadNodeNo := 0;

  LoadTB_CONFIG;

  LoadAlarmEventStateCode;
  LoadAlarmEventStatePCCode;
  LoadAlarmEventModeChangeCode;

  //���⼭ �ش� ���� ��带 �ε� ����...

  LoadAntiPassGroup;
  LoadNode('');
  LoadArmAreaUse('','');
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue('','','','','DO_MEMLOAD','Y');
  LoadDOOR('','');
  LoadHoliday; //Ư���� �ε�����.

  TrayIcon1.BalloonHint := 'DeviceServer Start';
  TrayIcon1.Hint := 'GMS_DeviceServer' + inttostr(G_nDecoderNo);
  TrayTimer.Enabled := True;
  DeviceServerManagerCheckTimer.Enabled := True;
  TimeSyncTimer.Interval := 24 * 60 * 60 * 1000;  //1��
  TimeSyncTimer.Enabled := True;

  dmFTPModule.FTPServerCreate;
  dmFTPModule.FTPPORT := inttostr(G_nDecoderFTPServerPort);
  Try
    dmFTPModule.FTPStart := True;
  Except
  End;
  if G_nDecoderSockType = 2 then  //���ڴ��� ������ �Ǹ�
  begin
    dmNodeServer.ServerPort :=  G_nDecoderDeviceServerPort;
    Try
      dmNodeServer.ServerStart := True;
    Except
    End;
  end;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('ACAMSERVER','VER','CO_CONFIGVALUE','2'); //���� ������ ���.


  //NodePacketSendThread := TNodePacketSendThread.Create;
  CardDownLoadTimer.Enabled := True;
  FireRecoveryTimer.Enabled := True;
  FTPCardDownLoadTimer.Enabled := True;
  NRCheckTimer.Enabled := True;
  NFCheckTimer.Enabled := True;
  StateCheckTimer.Enabled := True;
  RcvCheckTimer.Enabled := True;
  //NodePacketSendThread.Start;
  NodeSendPacketTimer.Enabled := True;
  NodeRcvPacketTimer.Enabled := True;
(*TEST 20160427
  for i := 0 to NodeList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if (TNode(NodeList.Objects[i]).SocketType = 1) and Not TNode(NodeList.Objects[i]).SocketOpen then
    begin
      TNode(NodeList.Objects[i]).SocketOpen := True;
    end;
  end;
//*)
end;

procedure TfmMain.FORMENABLE(aName: integer; aValue: string);
var
  bValue : Boolean;
begin
  if UpperCase(aValue) = 'TRUE' then bValue := True
  else bValue := False;

  G_bFormEnabled[aName] := bValue;   //�ش� ��

end;

procedure TfmMain.FormResize(Sender: TObject);
var
  nImageWidth : integer;
  nImageHight : integer;
begin
  inherited;
  nImageWidth := 1919;
  nImageHight := 928;

  Image1.Width := Width;
  Image1.Height := nImageHight * width div nImageWidth;

  Image1.Top := at_Menu.Height + (Height - at_Menu.Height - sb_Status.Height) div 2 - (Image1.Height div 2) - 20;
  Image1.Left := 0;

end;

procedure TfmMain.FormShow(Sender: TObject);
var
  stLogoFile : string;
begin
  inherited;
  if dmDBFunction.CheckTB_CONFIG_Value('DAEMON','HOLIDAYSENDYEAR' + inttostr(G_nDecoderNo)) = 0 then
  begin
    dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','HOLIDAYSENDYEAR' + inttostr(G_nDecoderNo),'');
  end;
  dmDBUpdate.UpdateTB_HOLIDAYDEVICE_CurrentYearSendStatus(FormatDateTime('yyyy',now),'R','N',inttostr(G_nDecoderNo)); //������ ������ �� ������ ������ ����.
  dmDBUpdate.UpdateTB_HOLIDAYDEVICE_CurrentYearSendStatus(FormatDateTime('yyyy',now),'S','N',inttostr(G_nDecoderNo)); //������ ������ �� ������ ������ ����.

  dmDBUpdate.UpdateTB_DOORSCHEDULE_SendStatus('R','N',inttostr(G_nDecoderNo));  //���Թ������� ������� �����۰� ������ ����������.
  dmDBUpdate.UpdateTB_DOORSCHEDULE_SendStatus('S','N',inttostr(G_nDecoderNo));

  dmDBUpdate.UpdateTB_DEVICERCV_TIMECODEUSEAllChange('R','U',inttostr(G_nDecoderNo));  //���Թ� Ÿ���ڵ� ������� �����۰� ������ ����������.
  dmDBUpdate.UpdateTB_DEVICERCV_TIMECODEUSEAllChange('S','U',inttostr(G_nDecoderNo));

  dmDBUpdate.UpdateTB_TIMECODEDEVICE_SendStatus('R','N',inttostr(G_nDecoderNo));    //��Ʈ�ѷ� �ð� ������
  dmDBUpdate.UpdateTB_TIMECODEDEVICE_SendStatus('S','N',inttostr(G_nDecoderNo));

  //dmDBUpdate.UpdateTB_CARDPERMIT_AllRCVACK('S','N',inttostr(G_nDecoderNo)); //���� �����۰��� ������ ����.  ���� ������ ���Ƽ� ����
  dmDBFunction.ChangeTB_CARDPERMIT_AllRCVACK('S','N',inttostr(G_nDecoderNo));

  dmDBUpdate.UpdateTB_DOORRCV_AllRcvAck('DO_DOORSCHUSE','S','N',inttostr(G_nDecoderNo));

  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL0','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL1','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL2','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL3','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL4','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL5','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL6','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL7','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL8','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL9','S','C',inttostr(G_nDecoderNo));

//  if Not isDigit(G_nDecoderControlServerPort) then G_nDecoderControlServerPort := '4000';
(*  dmMonitoringServer.ServerPort := G_nDecoderControlServerPort;
  Try
    dmMonitoringServer.ServerStart := True;
  Except
  End;
  dmDirectServer.ServerPort := G_nDecoderDirectServerPort;
  Try
    dmDirectServer.ServerStart := True;
  Except
  End;
*)

  stLogoFile := G_stExeFolder + '\Logo.JPG';
  if FileExists(stLogoFile) then
    Image1.Picture.LoadFromFile(stLogoFile);

  MemoryReadTimer.Enabled := True;  //20160426TEST
  ManagerControlProcessTimer.Enabled := True;
  NodeOpenCheckTimer.Enabled := True;
  ToDayTimer.Enabled := True;

  StartMenu.SubMenuItems[1].Title := strBuildInfo;
  at_Menu.Caption.Caption := 'GMS_DeviceServer[' + strBuildInfo + ']';//'ACAM software[' + strBuildInfo + ']';
end;

procedure TfmMain.FTPCardDownLoadTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
//(*TEST20160518
  if G_bApplicationTerminate then Exit;
  Try
    Try
      FTPCardDownLoadTimer.Enabled := False;
      if NodeList.Count < 1 then Exit;

      if Not TNode(NodeList.Objects[L_nFTPDownLoadNodeNo]).FTPComplete then
      begin
        TNode(NodeList.Objects[L_nFTPDownLoadNodeNo]).FTPCompleteCheck;
        Exit;
      end;
      if L_nFTPNextDownLoadNodeNo > NodeList.Count - 1 then L_nFTPNextDownLoadNodeNo := 0;

      for i := L_nFTPNextDownLoadNodeNo to NodeList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
        begin
          if TNode(NodeList.Objects[i]).CheckFtpDownLoadData then
          begin
            L_nFTPDownLoadNodeNo := i;
            TNode(NodeList.Objects[i]).FTPCardDownLoadTimer;
            break;
          end;
        end;
        Application.ProcessMessages;
      end;
      L_nFTPNextDownLoadNodeNo := i + 1;
    Finally
      FTPCardDownLoadTimer.Enabled := Not G_bApplicationTerminate;
    End;
  Except
    LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','FTPCardDownLoadTimer');
  End;
//*)
end;

function TfmMain.GetDecoderInfo: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  G_nDecoderFTPServerPort := 6000;
  result := False;
  stSql := ' Select * from TB_DECODER ';
  stSql := stSql + ' Where ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //����ó��
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadNode');
        Exit;
      End;
      if recordcount < 1 then Exit;
      G_nDecoderSockType := FindField('ND_DECODERSOCKTYPE').AsInteger;
      G_stDecoderServerIP := FindField('ND_DECODERIP').AsString;
      G_nDecoderDeviceServerPort := FindField('ND_DECODERDEVICEPORT').AsInteger;
      G_nDecoderControlServerPort := FindField('ND_DECODERCONTROLPORT').AsInteger;
      G_nDecoderDirectServerPort := FindField('ND_DIRECTPORT').AsInteger;
      if Not FindField('ND_DECORDERFTPPORT').IsNull then
         G_nDecoderFTPServerPort := FindField('ND_DECORDERFTPPORT').AsInteger;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.GetEmInfoFromCardNo(aCardNo, aLastDate: string;
  aSearchType: integer; var aCompanyCode, aCompanyName, aEmSeq, aEmCode,
  aEmName, aPosiCode, aPosiName, aATUSE, aFDUSE, aPrintNo,
  aHandPhone: string): Boolean;
var
  nIndex : integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
  oCard : TCard;
  stTemp : string;
begin
  result := False;
  nIndex := CardEmList.IndexOf(aCardNo);
  if nIndex > -1 then
  begin
    if G_nVisitUse = 1 then  //�湮�� ����ϴ� ���
    begin
      if TCard(CardEmList.Objects[nIndex]).COMPANYCODE <> G_stVisitCode then   //�湮�� ����ϸ鼭 �湮�� �ڵ尡 �ƴѰ�� - �湮�� �ڵ�� �ǽð����� ������ ���� ����.
      begin
        if TCard(CardEmList.Objects[nIndex]).LoadDate = FormatDateTime('yyyymmdd',Now) then   //�ε��� ��¥�� �����̸�
        begin
          aCompanyCode := TCard(CardEmList.Objects[nIndex]).COMPANYCODE;
          aCompanyName := TCard(CardEmList.Objects[nIndex]).COMPANYNAME;
          aEmSeq := inttostr(TCard(CardEmList.Objects[nIndex]).EMSEQ);
          aEmCode := TCard(CardEmList.Objects[nIndex]).EMCODE;
          aEmName := TCard(CardEmList.Objects[nIndex]).EMNAME;
          aPosiCode := TCard(CardEmList.Objects[nIndex]).POSICODE;
          aPosiName := TCard(CardEmList.Objects[nIndex]).POSINAME;
          aATUSE := TCard(CardEmList.Objects[nIndex]).ATUSE;
          aFDUSE := TCard(CardEmList.Objects[nIndex]).FDUSE;
          aPrintNo := TCard(CardEmList.Objects[nIndex]).PRINTNO;
          aHandPhone := TCard(CardEmList.Objects[nIndex]).HandPhoneNum;
          TCard(CardEmList.Objects[nIndex]).LastUseDate := aLastDate;
          result := True;
          Exit;
        end;
      end;
    end else
    begin
      if TCard(CardEmList.Objects[nIndex]).LoadDate = FormatDateTime('yyyymmdd',Now) then   //�ε��� ��¥�� �����̸�
      begin
        aCompanyCode := TCard(CardEmList.Objects[nIndex]).COMPANYCODE;
        aCompanyName := TCard(CardEmList.Objects[nIndex]).COMPANYNAME;
        aEmSeq := inttostr(TCard(CardEmList.Objects[nIndex]).EMSEQ);
        aEmCode := TCard(CardEmList.Objects[nIndex]).EMCODE;
        aEmName := TCard(CardEmList.Objects[nIndex]).EMNAME;
        aPosiCode := TCard(CardEmList.Objects[nIndex]).POSICODE;
        aPosiName := TCard(CardEmList.Objects[nIndex]).POSINAME;
        aATUSE := TCard(CardEmList.Objects[nIndex]).ATUSE;
        aFDUSE := TCard(CardEmList.Objects[nIndex]).FDUSE;
        aPrintNo := TCard(CardEmList.Objects[nIndex]).PRINTNO;
        aHandPhone := TCard(CardEmList.Objects[nIndex]).HandPhoneNum;
        TCard(CardEmList.Objects[nIndex]).LastUseDate := aLastDate;
        result := True;
        Exit;
      end;
    end;
  end;

  if aSearchType = 1 then   //�бⱹ���̸�
  begin
    stSql := 'Select b.EM_SEQ,b.CA_LASTUSEDATE,a.CA_PRINTNO,c.EM_CODE,c.EM_NAME,c.CO_COMPANYCODE,c.EM_ATUSE,c.EM_FDUSE,c.EM_HANDPHONE,d.CO_COMPANYNAME,c.PO_POSICODE,e.PO_POSICODENAME ';
    stSql := stSql + ' From TB_CARDPRINTLIST a ';
    stSql := stSql + ' Left Join TB_CARD b';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO) ';
    stSql := stSql + ' Left Join TB_EMPLOYEE c ';
    stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND b.EM_SEQ = c.EM_SEQ) ';
    stSql := stSql + ' Left Join TB_COMPANYCODE d ';
    stSql := stSql + ' ON(c.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND c.CO_COMPANYCODE = d.CO_COMPANYCODE )';
    stSql := stSql + ' Left Join TB_POSICODE e ';
    stSql := stSql + ' ON(c.GROUP_CODE = e.GROUP_CODE ';
    stSql := stSql + ' AND c.PO_POSICODE = e.PO_POSICODE ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';
  end else
  begin
    stSql := 'Select a.EM_SEQ,a.CA_LASTUSEDATE,a.CA_PRINTNO,b.EM_CODE,b.EM_NAME,b.CO_COMPANYCODE,b.EM_ATUSE,b.EM_FDUSE,b.EM_HANDPHONE,c.CO_COMPANYNAME,b.PO_POSICODE,d.PO_POSICODENAME ';
    stSql := stSql + ' From TB_CARD a';
    stSql := stSql + ' Left Join TB_EMPLOYEE b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ) ';
    stSql := stSql + ' Left Join TB_COMPANYCODE c ';
    stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE )';
    stSql := stSql + ' Left Join TB_POSICODE d ';
    stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND b.PO_POSICODE = d.PO_POSICODE ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';
  end;

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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','GetEmInfoFromCardNo');
        Exit;
      End;

      if RecordCount < 1 then Exit;
      First;
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      aCompanyName := FindField('CO_COMPANYNAME').AsString;
      aEmSeq := FindField('EM_SEQ').AsString;
      aEmCode := FindField('EM_CODE').AsString;
      aEmName := FindField('EM_NAME').AsString;
      aPosiCode := FindField('PO_POSICODE').AsString;
      aPosiName := FindField('PO_POSICODENAME').AsString;
      aATUSE := FindField('EM_ATUSE').AsString;
      aFDUSE := FindField('EM_FDUSE').AsString;
      aPrintNo := FindField('CA_PRINTNO').AsString;
      aHandPhone := FindField('EM_HANDPHONE').AsString;

      nIndex := CardEmList.IndexOf(aCardNo);
      if nIndex < 0 then
      begin
        oCard := TCard.Create(nil);
        oCard.CARDNO := aCardNo;
        oCard.COMPANYCODE := aCompanyCode;
        oCard.COMPANYNAME := aCompanyName;
        oCard.EMSEQ := FindField('EM_SEQ').AsInteger;
        oCard.EMCODE := aEmCode;
        oCard.EMNAME := aEmName;
        oCard.POSICODE := aPosiCode;
        oCard.POSINAME := aPosiName;
        oCard.ATUSE := aATUSE;
        oCard.FDUSE := aFDUSE;
        oCard.PRINTNO := aPrintNo;
        oCard.HandPhoneNum := aHandPhone;
        oCard.LastUseDate := FindField('CA_LASTUSEDATE').AsString;
        oCard.OnCardChangePacket := CardChangePacket;
        oCard.LastUseDate := aLastDate;
        oCard.LoadDate := FormatDateTime('yyyymmdd',Now);
        CardEmList.AddObject(aCardNo,oCard);
      end else
      begin
        TCard(CardEmList.Objects[nIndex]).COMPANYCODE := aCompanyCode;
        TCard(CardEmList.Objects[nIndex]).COMPANYNAME := aCompanyName;
        TCard(CardEmList.Objects[nIndex]).EMSEQ := FindField('EM_SEQ').AsInteger;
        TCard(CardEmList.Objects[nIndex]).EMCODE := aEmCode;
        TCard(CardEmList.Objects[nIndex]).EMNAME := aEmName;
        TCard(CardEmList.Objects[nIndex]).POSICODE := aPosiCode;
        TCard(CardEmList.Objects[nIndex]).POSINAME := aPosiName;
        TCard(CardEmList.Objects[nIndex]).ATUSE := aATUSE;
        TCard(CardEmList.Objects[nIndex]).FDUSE := aFDUSE;
        TCard(CardEmList.Objects[nIndex]).PRINTNO := aPrintNo;
        TCard(CardEmList.Objects[nIndex]).HandPhoneNum := aHandPhone;
        TCard(CardEmList.Objects[nIndex]).LastUseDate := aLastDate;
        TCard(CardEmList.Objects[nIndex]).LoadDate := FormatDateTime('yyyymmdd',Now);
      end;
      //dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(aEmSeq,'EM_MEMLOAD','Y');
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.LoadAlarmEventModeChangeCode;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  nIndex : integer;
begin
  stSql := ' select AM_OPERCODE,AM_ALARMSTATECODE,AM_ALARMCHANGECODE';
  stSql := stSql + ' from TB_ALARMEVENTOPERMODECHANGE  ';
  stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //����ó��
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadAlarmEventModeChangeCode');
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        nIndex := AlarmEventStateCodeList.IndexOf('00');
        if nIndex > -1 then
        begin
          TAlarmEventStateCode(AlarmEventStateCodeList.Objects[nIndex]).SetAlarmEventModeChangeCode(FindField('AM_OPERCODE').AsString,FindField('AM_ALARMSTATECODE').AsString,FindField('AM_ALARMCHANGECODE').AsString);
        end;
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

procedure TfmMain.LoadAlarmEventStateCode;
var
  stSql : string;
  oAlarmEventStateCode : TAlarmEventStateCode;
  TempAdoQuery : TAdoQuery;
  stAlarmEventCode : string;
  nIndex : integer;
  i : integer;
begin
  if AlarmEventStateCodeList.Count > 0 then
  begin
    for i := 0 to AlarmEventStateCodeList.Count - 1 do
    begin
      TAlarmEventStateCode(AlarmEventStateCodeList.Objects[i]).Free;
    end;
  end;

  stSql := ' select AE_EVENTSTATECODE,AE_EVENTSTATECODENAME' + inttostr(G_nFormLanguageType) + ' as NAME,';
  stSql := stSql + ' AE_DEVICE,AE_ARMTYPE,AE_ZONESTATE,AE_OPER from TB_ALARMEVENTSTATECODE  ';
  stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + '''';
  stSql := stSql + ' Order by AE_EVENTSTATECODE ';

  if AlarmEventStateCodeList = nil then AlarmEventStateCodeList := TStringList.Create;
  AlarmEventStateCodeList.Clear;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //����ó��
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        stAlarmEventCode := FindField('AE_EVENTSTATECODE').AsString;
        nIndex := AlarmEventStateCodeList.IndexOf(stAlarmEventCode);
        if nIndex < 0 then
        begin
          oAlarmEventStateCode := TAlarmEventStateCode.Create(nil);
          oAlarmEventStateCode.AlarmEventCode := FindField('AE_EVENTSTATECODE').AsString;
          oAlarmEventStateCode.AlarmEventCodeName := FindField('NAME').AsString;
          oAlarmEventStateCode.AlarmDEVICEType := FindField('AE_DEVICE').AsString;
          oAlarmEventStateCode.AlarmARMTYPE := FindField('AE_ARMTYPE').AsString;
          oAlarmEventStateCode.AlarmZONESTATE := FindField('AE_ZONESTATE').AsString;
          oAlarmEventStateCode.AlarmOPER := FindField('AE_OPER').AsString;
          AlarmEventStateCodeList.AddObject(stAlarmEventCode,oAlarmEventStateCode);
        end;
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

procedure TfmMain.LoadAlarmEventStatePCCode;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  stAlarmEventCode : string;
  nIndex : integer;
begin
    stSql := ' select AP_EVENTSTATEPCCODE,AP_EVENTSTATEPCCODENAME' + inttostr(G_nFormLanguageType) + ' as NAME,';
    stSql := stSql + ' AE_EVENTSTATECODE,AP_MODECHANGE,AP_VIEW,AP_SOUND,AP_COLOR from TB_ALARMEVENTSTATEPCCODE  ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + '''';
    stSql := stSql + ' Order by AE_EVENTSTATECODE ';

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          //����ó��
          Exit;
        End;
        if RecordCount < 1 then Exit;
        First;
        while Not Eof do
        begin
          if G_bApplicationTerminate then Exit;
          stAlarmEventCode := FindField('AE_EVENTSTATECODE').AsString;
          nIndex := AlarmEventStateCodeList.IndexOf(stAlarmEventCode);
          if nIndex > -1 then
          begin
            TAlarmEventStateCode(AlarmEventStateCodeList.Objects[nIndex]).SetAlarmEventPCCode(FindField('AP_EVENTSTATEPCCODE').AsString,
                                                                                              FindField('NAME').AsString,
                                                                                              FindField('AP_MODECHANGE').AsString,
                                                                                              FindField('AP_VIEW').AsString,
                                                                                              FindField('AP_SOUND').AsString,
                                                                                              FindField('AP_COLOR').AsString);
          end;
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

procedure TfmMain.LoadAntiPassGroup;
var
  stSql : string;
  i   : integer;
  TempAdoQuery : TAdoQuery;
  stAntiGroupCode : string;
  nIndex : integer;
  oAntiPassGroup : TAntiPassGroup;
begin
  if AntiPassGroupList.Count > 0 then
  begin
    for I := AntiPassGroupList.Count - 1 downto 0 do  TAntiPassGroup(AntiPassGroupList.Objects[i]).Free;
  end;
  AntiPassGroupList.Clear;

  stSql := ' Select * from TB_ANTIGROUPCODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //����ó��
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      while Not Eof do
      begin
        stAntiGroupCode := FillZeroNumber(FindField('AG_CODE').asInteger,G_nAntiGroupCodeLength);
        oAntiPassGroup := TAntiPassGroup.Create(nil);
        oAntiPassGroup.AntiPassGroup := stAntiGroupCode;
        oAntiPassGroup.AntiPassNo := FindField('AG_ANTINO').asInteger;
        AntiPassGroupList.AddObject(stAntiGroupCode,oAntiPassGroup);

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

procedure TfmMain.LoadArmAreaUse(aNodeNo, aEcuID: string);
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  stNodeNo : string;
  nIndex : integer;
begin
  stSql := 'Select a.* from TB_DEVICE a ';
  stSql := stSql + ' INNER JOIN TB_NODE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND b.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
  stSql := stSql + ' where a.DE_DEVICEUSE = ''1'' ';
  stSql := stSql + ' AND a.DE_EXTENDID = 0 ';
  if isDigit(aNodeNo) then
  begin
    stSql := stSql + ' AND a.ND_NODENO = ' +  aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.DE_ECUID = ''' +  aEcuID + ''' ';
  end;

  Try
    if NodeList = nil then Exit;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          //����ó��
          Exit;
        End;
        if RecordCount < 1 then Exit;
        First;
        while Not Eof do
        begin
          if G_bApplicationTerminate then Exit;

          stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
          nIndex := NodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdArmAreaUse,FindField('DE_ECUID').AsString,FindField('DE_ARMAREAUSE').AsString);
          end else
          begin
            nIndex := ServerNodeList.IndexOf(stNodeNo);
            if nIndex > -1 then
            begin
              dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceCmdArmAreaUse,FindField('DE_ECUID').AsString,FindField('DE_ARMAREAUSE').AsString);
            end;
          end;
          Application.ProcessMessages;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
    L_bNodeLock := False;
    L_bCardPermitLoad := False;
  End;
end;

procedure TfmMain.LoadCardPermit(aPrograss: Boolean; aNodeNo, aEcuID: string);
var
  stSql : string;
  oNode : TNode;
  TempAdoQuery : TAdoQuery;
  stNodeNo : string;
  nIndex : integer;
  stTemp : string;
begin
  if L_bNodeLock then Exit;
  L_bCardPermitLoad := True;
  dmDBUpdate.UpdateTB_CARDPERMIT_MEMLOAD('N','R',aNodeNo,aEcuID);
  L_bNodeLock := True;
  Try
    stSql := ' select a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.CA_CARDNO,a.CP_PERMIT,f.EM_STATE,a.CP_DOOR1,a.CP_DOOR2,a.CP_DOOR3,';
    stSql := stSql + ' a.CP_DOOR4,a.CP_DOOR5,a.CP_DOOR6,a.CP_DOOR7,a.CP_DOOR8,a.CP_ARMAREA0,a.CP_ARMAREA1,a.CP_ARMAREA2,';
    stSql := stSql + ' a.CP_ARMAREA3,a.CP_ARMAREA4,a.CP_ARMAREA5,a.CP_ARMAREA6,a.CP_ARMAREA7,a.CP_ARMAREA8,a.CP_RCVACK,';
    stSql := stSql + ' b.CA_POSITIONNUM,b.CA_STATECODE,c.EM_SEQ,c.EM_NAME,c.CO_COMPANYCODE,c.EM_ACUSE,c.EM_ATUSE,c.EM_FDUSE,';
    stSql := stSql + ' e.EM_TIMECODEUSE,e.TC_GROUP,e.TC_TIME1,e.TC_TIME2,e.TC_TIME3,e.TC_TIME4,e.TC_WEEKCODE,c.EM_REGDATE,c.EM_ENDDATE ';
    stSql := stSql + ' from TB_CARDPERMIT a  ';
    stSql := stSql + ' Left Join TB_CARD b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEE c ';
    stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND b.EM_SEQ = c.EM_SEQ) ';
    stSql := stSql + ' Inner Join TB_DEVICE d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID ';
    stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEEDEVICETIMECODE e ';
    stSql := stSql + ' ON(b.EM_SEQ = e.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = e.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = e.DE_ECUID ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEESTATECODE f ';
    stSql := stSql + ' ON(c.EM_STATECODE = f.EM_STATECODE ) ';
    stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + '''';
    if aEcuID = '' then stSql := stSql + ' AND a.CP_MEMLOAD = ''R'' ';
    if aEcuID <> '' then
    begin
      stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + '';
      stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + '''';
    end;

    if NodeList = nil then Exit;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          //����ó��
          Exit;
        End;
        if RecordCount < 1 then Exit;
        First;
        while Not Eof do
        begin
          if G_bApplicationTerminate then Exit;

          stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
          nIndex := NodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            TNode(NodeList.Objects[nIndex]).SetNodeToCardPermitInitialize(FindField('DE_ECUID').AsString,
            FindField('DE_EXTENDID').AsString,FindField('CA_CARDNO').AsString,FindField('CP_PERMIT').AsString,FindField('CA_STATECODE').AsString,
            FindField('CP_DOOR1').AsString,FindField('CP_DOOR2').AsString,FindField('CP_DOOR3').AsString,
            FindField('CP_DOOR4').AsString,FindField('CP_DOOR5').AsString,FindField('CP_DOOR6').AsString,
            FindField('CP_DOOR7').AsString,FindField('CP_DOOR8').AsString,FindField('CP_ARMAREA0').AsString,
            FindField('CP_ARMAREA1').AsString,FindField('CP_ARMAREA2').AsString,FindField('CP_ARMAREA3').AsString,
            FindField('CP_ARMAREA4').AsString,FindField('CP_ARMAREA5').AsString,FindField('CP_ARMAREA6').AsString,
            FindField('CP_ARMAREA7').AsString,FindField('CP_ARMAREA8').AsString,FindField('CP_RCVACK').AsString,
            FindField('CA_POSITIONNUM').AsString,FindField('EM_TIMECODEUSE').AsString,FindField('TC_GROUP').AsString,
            FindField('TC_TIME1').AsString,FindField('TC_TIME2').AsString,FindField('TC_TIME3').AsString,
            FindField('TC_TIME4').AsString,FindField('TC_WEEKCODE').AsString,FindField('EM_REGDATE').AsString,FindField('EM_ENDDATE').AsString,
            FindField('EM_STATE').AsString
            );
          end else
          begin
            nIndex := ServerNodeList.IndexOf(stNodeNo);
            if nIndex > -1 then
            begin
              dmNodeServer.LoadDeviceNodeServer_CardPermitSetting(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,
                FindField('DE_EXTENDID').AsString,FindField('CA_CARDNO').AsString,FindField('CP_PERMIT').AsString,FindField('CA_STATECODE').AsString,
                FindField('CP_DOOR1').AsString,FindField('CP_DOOR2').AsString,FindField('CP_DOOR3').AsString,
                FindField('CP_DOOR4').AsString,FindField('CP_DOOR5').AsString,FindField('CP_DOOR6').AsString,
                FindField('CP_DOOR7').AsString,FindField('CP_DOOR8').AsString,FindField('CP_ARMAREA0').AsString,
                FindField('CP_ARMAREA1').AsString,FindField('CP_ARMAREA2').AsString,FindField('CP_ARMAREA3').AsString,
                FindField('CP_ARMAREA4').AsString,FindField('CP_ARMAREA5').AsString,FindField('CP_ARMAREA6').AsString,
                FindField('CP_ARMAREA7').AsString,FindField('CP_ARMAREA8').AsString,FindField('CP_RCVACK').AsString,
                FindField('CA_POSITIONNUM').AsString,FindField('EM_TIMECODEUSE').AsString,FindField('TC_GROUP').AsString,
                FindField('TC_TIME1').AsString,FindField('TC_TIME2').AsString,FindField('TC_TIME3').AsString,
                FindField('TC_TIME4').AsString,FindField('TC_WEEKCODE').AsString,FindField('EM_REGDATE').AsString,FindField('EM_ENDDATE').AsString,
                FindField('EM_STATE').AsString);
            end;
          end;
          Application.ProcessMessages;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
    dmDBUpdate.UpdateTB_CARDPERMIT_MEMLOAD('R','Y',aNodeNo,aEcuID);
  Finally
    L_bNodeLock := False;
    L_bCardPermitLoad := False;
  End;
end;

(*
procedure TfmMain.LoadDevice(aNodeNo, aEcuID: string);
var
  stSql : string;
  oNode : TNode;
  TempAdoQuery : TAdoQuery;
  nDeviceType : integer;
  nIndex : integer;
begin
  if L_bNodeLock then Exit;
  L_bNodeLock := True;
  Try
    stSql := ' select a.* from TB_DEVICE a ';
    stSql := stSql + ' INNER JOIN (select * from TB_NODE where ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ') c';
    stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO )';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + '''';
    stSql := stSql + ' AND ND_DECODERNO = ' + inttostr(G_nDecoderNo) + '';
    if aNodeNo <> '' then
      stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then
      stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + 'DE_DEVICEUSE = ''1'' ';
    stSql := stSql + ' Order by ND_NODENO,DE_ECUID ';

    if NodeList = nil then NodeList := TStringList.Create;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          //����ó��
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadNode');
          Exit;
        End;
        if RecordCount < 1 then Exit;
        First;
        while Not Eof do
        begin
          if G_bApplicationTerminate then Exit;

          stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
          nIndex := NodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdArmAreaUse,FindField('DE_ECUID').AsString,FindField('DE_ARMAREAUSE').AsString);
          end else
          begin
            nIndex := ServerNodeList.IndexOf(stNodeNo);
            if nIndex > -1 then
            begin
              dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceCmdArmAreaUse,FindField('DE_ECUID').AsString,FindField('DE_ARMAREAUSE').AsString);
            end;
          end;
          Application.ProcessMessages;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
    L_bNodeLock := False;
  End;
end;
*)

procedure TfmMain.LoadDeviceChange(aNodeNo, aEcuID: string);
var
  stNodeNo : string;
  nIndex : integer;
begin
  stNodeNo := FillZeroStrNum(aNodeNo,G_nNodeCodeLength);
  nIndex := NodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdDeviceVersion,aEcuID,'');
    TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdDeviceCode,aEcuID,'');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdDeviceVersion,aEcuID,'R');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdDeviceCode,aEcuID,'R');
  end else
  begin
    nIndex := ServerNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceCmdDeviceVersion,aEcuID,'');
      dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceCmdDeviceCode,aEcuID,'');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceCmdDeviceVersion,aEcuID,'R');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceCmdDeviceCode,aEcuID,'R');
    end;
  end;
end;

procedure TfmMain.LoadDOOR(aNodeNo, aEcuID: string;aMemLoad:string='');
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  stNodeNo : string;
  stAntiGroupCode : string;
  nIndex : integer;
  nTempIndex : integer;
  oAntiPassGroup : TAntiPassGroup;
begin
  stSql := ' Select a.* from TB_DOOR a ';
  stSql := stSql + ' INNER Join (select * from TB_DEVICE where DE_DEVICEUSE = ''1'') b ';
  stSql := stSql + ' ON(a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ) ';
  stSql := stSql + ' INNER JOIN (select * from TB_NODE where ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ') c';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO )';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.DE_EXTENDID = 0 ';
  stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  if isDigit(aNodeNo) then
  begin
    stSql := stSql + ' AND a.ND_NODENO = ' +  aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.DE_ECUID = ''' +  aEcuID + ''' ';
  end;
  if aMemLoad <> '' then stSql := stSql + ' AND a.DO_MEMLOAD = ''' + aMemLoad + ''' ';


  Try
    if NodeList = nil then Exit;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          //����ó��
          Exit;
        End;
        if RecordCount < 1 then Exit;
        First;
        while Not Eof do
        begin
          if G_bApplicationTerminate then Exit;

          stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
          stAntiGroupCode := FillZeroNumber(FindField('AG_CODE').AsInteger,G_nAntiGroupCodeLength);
          nIndex := NodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdInfoInitialize,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,'1');
            TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdLTCODE,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_LTSTATE').AsString);
            TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCurrentDSState,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_DOOROPENSTATE').AsString);
            TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdAntiGROUPCODE,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,stAntiGroupCode);
            //TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdFIREDOOROPEN,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_FIREDOOROPEN').AsString);
            TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdInfoInitialize,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,'0');
          end else
          begin
            nIndex := ServerNodeList.IndexOf(stNodeNo);
            if nIndex > -1 then
            begin
              dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdInfoInitialize,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,'1');
              dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdLTCODE,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_LTSTATE').AsString);
              dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCurrentDSState,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_DOOROPENSTATE').AsString);
              dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdAntiGROUPCODE,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,stAntiGroupCode);
              //dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdFIREDOOROPEN,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_FIREDOOROPEN').AsString);
              dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeDoor,con_DoorCmdInfoInitialize,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,'0');
            end;
          end;
          nTempIndex := AntiPassGroupList.IndexOf(stAntiGroupCode);
          if nTempIndex > -1 then
          begin
            TAntiPassGroup(AntiPassGroupList.Objects[nTempIndex]).DeviceAdd(stNodeNo + FindField('DE_ECUID').AsString);
          end else
          begin
            oAntiPassGroup := TAntiPassGroup.Create(nil);
            oAntiPassGroup.AntiPassGroup := stAntiGroupCode;
            AntiPassGroupList.AddObject(stAntiGroupCode,oAntiPassGroup);
          end;
          //if aMemLoad <> '' then
          dmDBUpdate.UpdateTB_DOOR_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('DO_DOORNO').AsString,'DO_MEMLOAD','Y');
          Application.ProcessMessages;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
    L_bNodeLock := False;
    L_bCardPermitLoad := False;
  End;
end;

procedure TfmMain.LoadHoliday;
var
  i : integer;
  nWinSock : integer;

  stSql : string;
  TempAdoQuery : TADOQuery;
  stNodeNo : string;
  stEcuID : string;
  nIndex : integer;
  stYear : string;
  stHoType : string;
begin
  stYear := FormatDateTime('yyyy',Now);
  if NodeList.Count > 0 then
  begin
    for i := 0 to NodeList.Count - 1 do
    begin
      TNode(NodeList.Objects[i]).SetHolidayClear;
    end;
  end;
  if ServerNodeList.Count > 1 then
  begin
    for i := 0 downto ServerNodeList.Count - 1 do
    begin
      nWinSock := TServerNode(ServerNodeList.Objects[i]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetHolidayClear(nWinSock);
    end;
  end;

  stSql := ' Select a.* from TB_HOLIDAYDEVICE a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'' ) ';
  stSql := stSql + ' INNER JOIN TB_NODE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND c.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND SUBSTRING(a.HO_DAY,1,4) = ''' + stYear + ''' '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND SUBSTR(a.HO_DAY,1,4) = ''' + stYear + ''' '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND SUBSTRING(a.HO_DAY From 1 for 4) = ''' + stYear + ''' ';
  stSql := stSql + ' Order by a.ND_NODENO,a.DE_ECUID ';

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
        TDataBaseConfig.GetObject.DBConnected := False;
        LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','LoadHoliday');
        Exit;
      End;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
        stHoType := FindField('HO_TYPE').AsString;
        if FindField('HD_USE').AsString = '0' then stHoType := '0';
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).SetDeviceHoliday(FindField('DE_ECUID').AsString,copy(FindField('HO_DAY').AsString,5,4),stHoType);
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            dmNodeServer.DeviceNodeServer_SetDeviceHoliday(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,FindField('DE_ECUID').AsString,copy(FindField('HO_DAY').AsString,5,4),stHoType);
          end;
        end;
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

procedure TfmMain.LoadNode(aNodeNo:string);
var
  stSql : string;
  oNode : TNode;
  TempAdoQuery : TAdoQuery;
  nDeviceType : integer;
  nIndex : integer;
begin
  UnLoadNode(aNodeNo);
  if L_bNodeLock then Exit;
  L_bNodeLock := True;
  Try
    stSql := ' select * from TB_NODE  ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + '''';
    if G_nDecoderSockType = 1 then //Server -> Device
    begin
      stSql := stSql + ' AND ND_SOCKETTYPE = ''1'' ';
    end else if G_nDecoderSockType = 2 then
    begin
      stSql := stSql + ' AND ND_SOCKETTYPE = ''2'' ';
    end else
    begin
      Exit;
    end;
    stSql := stSql + ' AND ND_DECODERNO = ' + inttostr(G_nDecoderNo) + '';
    if aNodeNo <> '' then
      stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' Order by ND_NODENO ';

    if NodeList = nil then NodeList := TStringList.Create;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          //����ó��
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadNode');
          Exit;
        End;
        if RecordCount < 1 then Exit;
        First;
        while Not Eof do
        begin
          if G_bApplicationTerminate then Exit;
          nDeviceType := 0;
          if isIPTypeCheck(FindField('ND_NODEIP').AsString) then
          begin
            if Not FindField('ND_DEVICETYPE').IsNull then nDeviceType := FindField('ND_DEVICETYPE').AsInteger;

            nIndex := NodeList.IndexOf(FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength));
            if nIndex < 0 then
            begin
              oNode := TNode.Create(nil);
              oNode.InfoInitialize := True;
              oNode.No := FindField('ND_NODENO').asInteger;
              oNode.NodeName := FindField('ND_NODENAME').AsString;
              oNode.SocketType := G_nDecoderSockType;
              oNode.DeviceID := FindField('ND_DEVICEID').AsString;
              oNode.NODEIP := FindField('ND_NODEIP').AsString;
              oNode.NodePort := FindField('ND_NODEPORT').AsInteger;
              oNode.LastNetworkState := FindField('ND_LASTNETSTATE').AsString;
              oNode.FIREGUBUNCODE := FindField('FG_GROUPCODE').AsString;

              oNode.OnArmAreaPacketChange := ArmAreaPacketChange;

              oNode.OnCardPermitChange := CardPermitChange;
              oNode.OnCardPermitLoading := EmployeeCardPermitLoad;
              oNode.OnCardRcvAckChange := CardRcvAckChange;  //ī�� ���� ����

              oNode.OnCardReaderPacketChange := CardReaderPacketChange;

              oNode.OnCurrentAlarmEvent := CurrentAlarmEvent;
              oNode.OnCurrentDoorState := CurrentDoorState;


              oNode.OnDeviceCardAccessEvent := DeviceCardAccessEvent;
              oNode.OnDeviceConnected :=  DeviceConnected;
              oNode.OnDevicePacketChange := DevicePacketChange;
              oNode.OnDeviceUsed := DeviceUsedEvent;

              oNode.OnDoorHolidaySend := DoorHolidaySend;
              oNode.OnDoorPacketChange := DoorPacketChange;

              oNode.OnNodePacket := NodePacketEvent;
              oNode.OnReceiveData := DeviceReceiveData;
              oNode.OnReceiveTypeChage := DeviceReceiveTypeChage;

              oNode.OnZONEEXTENDTYPEChange := ZONEEXTENDTYPEChange;
              oNode.OnZonePacketChange := ZonePacketChange;

              oNode.OnAutoDownLoadStart := NodeAutoDownLoadStart;
              oNode.OnCardPermitAllLoading := CardPermitAllLoading;   //FTP �ٿ�ε� �ϱ� ���� ���� ������ �ε�����...
              oNode.OnEmployeePermitAllLoading := EmployeePermitAllLoading; //FTP �ٿ�ε� �ϱ� ���� ���� ������ �ε�����...

              oNode.SocketOpen := False;
              oNode.InfoInitialize := False;

              NodeList.AddObject(FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength),oNode);
            end else
            begin
              TNode(NodeList.Objects[nIndex]).NODEIP := FindField('ND_NODEIP').AsString;
              TNode(NodeList.Objects[nIndex]).NodePort := FindField('ND_NODEPORT').AsInteger;
              TNode(NodeList.Objects[nIndex]).SocketOpen := False;
            end;
          end;
          dmDBUpdate.UpdateTB_NODE_Field_StringValue(FindField('ND_NODENO').AsString,'ND_MEMLOAD','Y');

          Application.ProcessMessages;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
    L_bNodeLock := False;
  End;
end;

procedure TfmMain.LoadTB_CONFIG;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    G_nCardNoType := 0; //����Ʈ�� ���� 4Byte ���
    G_nFormLanguageType := 1;       //�� ��� Ÿ�� 1.KOR,2.ENG
    G_nCompanyCodeLength := 3;       //
    G_nBuildingCodeLength := 3;       //
    G_nNodeCodeLength := 4;

//    G_stDaemonControlServerIP := '127.0.0.1';
//    G_stDaemonFTPPort := '3001';
//    G_stDaemonControlPort := '5101';
//    G_stLongTimeStateCode := '';

    G_bCardPositionUse := False; //ī�� ��ġ���� ��� ����
    G_bExitButtonEventUse := False;   //�����̷¸� ������.
    G_bDoorLongTimeOpenEventUse := False;  //��ð����Թ������� �˶� �̺�Ʈ ������ ����
    G_bDeviceCommLogSave := False;
    G_nScheduleDevice := 0;  //0.��Ʈ�ѷ�������,1.PC������
    G_bAlarmEventLengthUse := False; //�˶� �̺�Ʈ ó���� �������� ó����(STX/KT/��Ÿ)
    G_nAlarmEventLength := 10;

    G_bDataBaseAutoBackup := TRUE;
    G_stDataBaseBackupDir := 'c:\Backup';
    G_nDataBaseBackupCycle := 10;
    G_nDataBaseACEventdeleteDay := 360;
    G_nDataBasePTEventdeleteDay := 360;
    G_nProgramType := 0;
    G_nAccessEventButtonSearch := 1;
    G_bCardSync := True;
//    G_bAlarmMonitoringUse := False;

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
(*    stSql := stSql + ' AND (CO_CONFIGGROUP = ''DAEMON'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''COMMON'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''CARD'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''FIRE'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''DATABASE'') ';  *)

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','GetTB_Config');
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGGROUP').AsString = 'DAEMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ALARMLEN' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nAlarmEventLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'COMMLOG' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then G_bDeviceCommLogSave := False
            else G_bDeviceCommLogSave := True;
//          else if FindField('CO_CONFIGCODE').AsString = 'CONTROLPORT' then G_stDaemonControlPort := FindField('CO_CONFIGVALUE').asstring
//          else if FindField('CO_CONFIGCODE').AsString = 'DEVICESERVERPORT' then G_stDaemonDeviceServerPort := FindField('CO_CONFIGVALUE').asstring
//          else if FindField('CO_CONFIGCODE').AsString = 'FTPPORT' then G_stDaemonFTPPort := FindField('CO_CONFIGVALUE').AsString
          end else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMEALARMUSE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bDoorLongTimeOpenEventUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMECD' then
          begin
            G_stLongTimeStateCode := Trim(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMERC' then
          begin
            G_stLongTimeRecoveryCode := Trim(FindField('CO_CONFIGVALUE').AsString);
//          end else if FindField('CO_CONFIGCODE').AsString = 'MULTI' then
//          begin
//            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMultiDaemon := strtoint(FindField('CO_CONFIGVALUE').AsString);
//          end else if FindField('CO_CONFIGCODE').AsString = 'MULTISOCK' then G_nMultiSocket := strtoint(FindField('CO_CONFIGVALUE').asstring)
          end else if FindField('CO_CONFIGCODE').AsString = 'SCHDEVICE' then G_nScheduleDevice := strtoint(FindField('CO_CONFIGVALUE').AsString)
//          else if FindField('CO_CONFIGCODE').AsString = 'SERVERIP' then G_stDaemonControlServerIP := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'USEARMLEN' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'TRUE' then G_bAlarmEventLengthUse := False
            else G_bAlarmEventLengthUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'HOLIDAYSENDYEAR' + inttostr(G_nDecoderNo) then
          begin
            L_stHolidaySendYear := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'PACKETTYPE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nProgramType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'COMMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ACEVENT' then G_nAccessEventButtonSearch := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then G_nCardNoType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CAPOSINUM' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bCardPositionUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'ACEVENT' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bExitButtonEventUse := False
            else G_bExitButtonEventUse := True;
          end
          else if FindField('CO_CONFIGCODE').AsString = 'LANGUAGE' then G_nFormLanguageType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'COMPANYCODELENGTH' then G_nCompanyCodeLength := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'BUILDINGCODELENGTH' then G_nBuildingCodeLength := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'ATAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAttendDedicateDoorUse := True
            else G_bAttendDedicateDoorUse := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFoodDedicateDoorUse := True
            else G_bFoodDedicateDoorUse := False;
//          end else if FindField('CO_CONFIGCODE').AsString = 'ALARMMONITORING' then
//          begin
//            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAlarmMonitoringUse := True;   //����͸��� ini �� ����Ǵ� �׸�
          end else if FindField('CO_CONFIGCODE').AsString = 'PROTOCOL' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMonitoringProtocol := FindField('CO_CONFIGVALUE').AsInteger
            else G_nMonitoringProtocol := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'MAXDOORCOUNT' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMonitoringOnlyDoorCount := FindField('CO_CONFIGVALUE').AsInteger
            else G_nMonitoringOnlyDoorCount := 1;
          end else if FindField('CO_CONFIGCODE').AsString = 'ONLYMAINCOUNT' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMonitoringOnlyMainCount := FindField('CO_CONFIGVALUE').AsInteger
            else G_nMonitoringOnlyMainCount := 100;
          end else if FindField('CO_CONFIGCODE').AsString = 'PGTYPE' then
          begin
            G_nMonitoringType := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'NODELENGTH' then
          begin
            G_nNodeCodeLength := FindField('CO_CONFIGVALUE').AsInteger;
          end
          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'CARD' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'DEFAULTDOORPERMITTYPE' then
          begin
            G_nCardDefaultDoorPermitType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'DEFAULTARMPERMITTYPE' then
          begin
            G_nCardDefaultArmPermitType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'SYNC' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '0' then G_bCardSync := False;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'DATABASE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'AUTO' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'FALSE' then G_bDataBaseAutoBackup := False;
          end
          else if FindField('CO_CONFIGCODE').AsString = 'BACKDIR' then G_stDataBaseBackupDir := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'BACKCYCLE' then  G_nDataBaseBackupCycle := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'AC_DELETE' then G_nDataBaseACEventdeleteDay := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'PT_DELETE' then G_nDataBasePTEventdeleteDay := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGGROUP').AsString = 'FIRE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'LASTFIRECHECK' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then G_bLastFireCheck := False
            else G_bLastFireCheck := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'USEFIREOPEN' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then G_bFireDoorOpenUse := False
            else G_bFireDoorOpenUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'STATECODE' then
          begin
            G_stFireStateCode := FindField('CO_CONFIGVALUE').AsString;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'ANTIPASS' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ANTIFREE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
               G_nAntiFreeTimeUse := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'ANTIFREETIME' then
          begin
            G_stAntiFreeTime := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'ANTISTIME' then
          begin
            G_stGlobalAntiInitStartTime := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'ANTIETIME' then
          begin
            G_stGlobalAntiInitEndTime := FindField('CO_CONFIGVALUE').AsString;
          end;

        end;
//        Application.ProcessMessages;  //Form Show ���� ����ؼ� Hide ���¿����� ��� �ȵ�
        Next;
      end;
    end;
    FireDoorOpenTimer.Enabled := G_bFireDoorOpenUse;

(*
    dmMonitoringServer.DBSocketInitialize;
    if G_nPCComType = 1 then ClientDBSocketClearTimer.Enabled := True;
*)

    if G_nAntiFreeTimeUse = 0 then G_stAntiFreeTime := '0'
    else
    begin
      if Not isDigit(G_stAntiFreeTime) then G_stAntiFreeTime := '1';
    end;
    if G_nMonitoringType = 1 then G_nDefaultDoorCount := 1; //�бⱹ��� ���Թ� 1���� ��������.



  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.ManagerControlProcessTimerTimer(Sender: TObject);
var
  stData : string;
begin
  inherited;
//(*TEST20160518
  if L_bMangerControlProcess then Exit;
  if G_bApplicationTerminate then Exit;

  ManagerControlProcessTimer.Enabled := False;
  Try
    L_bMangerControlProcess := True;
    if ManagerControlReceiveList.Count > 0 then
    begin
      stData := ManagerControlReceiveList.Strings[0];
      ManagerControlReceiveList.Delete(0);
      ReceiveManagerControlProcess(stData);  //�̺κ� �׽�Ʈ��
    end;
    if ManagerEventReceiveList.Count > 0 then
    begin
      stData := ManagerEventReceiveList.Strings[0];
      ManagerEventReceiveList.Delete(0);
      ReceiveManagerEventProcess(stData);
    end;
  Finally
    ManagerControlProcessTimer.Enabled := Not G_bApplicationTerminate;
    L_bMangerControlProcess := False;
  End;
//*)
end;

procedure TfmMain.ManagerReceiveAccessEvent(aData: string);
var
  stAccessData : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stReaderNo : string;
  stInOut : string;
  stTime : string;
  stCardMode : string;
  stDoorMode : string;
  stChangeState : string;
  stAccessResult : string;
  stDoorState : string;
  stATButton : string;
  stCardNo : string;
  stType : string;
  stArmAreaNo : string;

  stCompanyCode : string;
  stCompanyName : string;
  stEmSeq : string;
  stEmCode : string;
  stEmName : string;
  stPosiCode : string;
  stPosiName : string;
  stPrintNo : string;
  stHandPhone : string;
begin
  stAccessData := FindCharCopy(aData,1,DATADELIMITER);
  stNodeNo := copy(stAccessData,1,G_nNodeCodeLength);
  stEcuID := copy(stAccessData,1 + G_nNodeCodeLength,2);
  stDoorNo := stAccessData[1 + G_nNodeCodeLength + 2];
  stReaderNo := stAccessData[1 + G_nNodeCodeLength + 3];
  stInOut := stAccessData[1 + G_nNodeCodeLength + 4];
  stTime := copy(stAccessData,1 + G_nNodeCodeLength + 5,14);
  stCardMode := stAccessData[1 + G_nNodeCodeLength + 5 + 14];
  stDoorMode := stAccessData[1 + G_nNodeCodeLength + 5 + 15];
  stChangeState := stAccessData[1 + G_nNodeCodeLength + 5 + 16];
  stAccessResult := stAccessData[1 + G_nNodeCodeLength + 5 + 17];
  stDoorState := stAccessData[1 + G_nNodeCodeLength + 5 + 18];
  stATButton := stAccessData[1 + G_nNodeCodeLength + 5 + 19];
  stCardNo := copy(stAccessData,1 + G_nNodeCodeLength + 5 + 20,16);
  stType := stAccessData[1 + G_nNodeCodeLength + 5 + 20 + 16];
  stArmAreaNo := stAccessData[1 + G_nNodeCodeLength + 5 + 20 + 17];
  stCompanyCode := FindCharCopy(aData,2,DATADELIMITER);
  stCompanyName := FindCharCopy(aData,3,DATADELIMITER);
  stEmSeq := FindCharCopy(aData,4,DATADELIMITER);
  stEmCode := FindCharCopy(aData,5,DATADELIMITER);
  stEmName := FindCharCopy(aData,6,DATADELIMITER);
  stPosiCode := FindCharCopy(aData,7,DATADELIMITER);
  stPosiName := FindCharCopy(aData,8,DATADELIMITER);
  stPrintNo := FindCharCopy(aData,9,DATADELIMITER);
  stHandPhone := FindCharCopy(aData,10,DATADELIMITER);

  dmMonitoringServer.DeviceCardAccessEvent(stNodeNo,stEcuID,stDoorNo,stReaderNo,stInOut,stTime,stCardMode,stDoorMode,stChangeState,stAccessResult,stDoorState,stATButton,stCardNo,stType,stArmAreaNo,stCompanyCode,stCompanyName, stEmSeq,stEmCode, stEmName,stPosiCode,stPosiName,stPrintNo,stHandPhone);

end;

procedure TfmMain.ManagerReceiveAlarmEvent(aData: string);
var
  stTemp : string;
  stNodeNo : string;
  stEcuID : string;
  stCmd : string;
  stExtendID : string;
  stMsgNo : string;
  stTime : string;
  stSubCLass : string;
  stSubAddr : string;
  stArmArea : string;
  stMode : string;
  stAlarmStateCode : string;
  stLoop : string;
  stZoneState : string;
  stOperater : string;
  stAlarmStatePCCode : string;
  stArmModeChange : string;
  stAlarmView : string;
  stAlarmSound : string;
  stAlarmColor : string;
  stAlarmStateCodeName : string;
  stAlarmStatePCCodeName : string;
begin
  stTemp := FindCharCopy(aData,1,DATADELIMITER);
(*  stNodeNo := copy(stTemp,1,G_nNodeCodeLength);
  stEcuID := copy(stTemp,1 + G_nNodeCodeLength,2);
  stCmd := stTemp[1 + G_nNodeCodeLength + 2];
  stMsgNo := stTemp[1 + G_nNodeCodeLength + 3];
  stTime := copy(stTemp,1 + G_nNodeCodeLength + 4,14);
  stSubCLass := copy(stTemp,1 + G_nNodeCodeLength + 4 + 14,2);
  stSubAddr := copy(stTemp,1 + G_nNodeCodeLength + 4 + 14 + 2,2);
  stArmArea := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 2];
  stMode := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 3];
  stAlarmStateCode := copy(stTemp,1 + G_nNodeCodeLength + 4 + 14 + 2 + 4,2);
  stLoop := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2];
  stZoneState := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1];
  stAlarmStatePCCode := copy(stTemp,1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1,8);
  stArmModeChange := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1 + 8];
  stAlarmView := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1 + 9];
  stAlarmSound := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1 + 10];
  stAlarmColor := copy(stTemp,1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1 + 11,10);
  //stInsertTime := copy(stTemp,1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1 + 11 + 10,17);
  Delete(stTemp,1,1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1 + 11 + 10 + 16 );
  stOperater := stTemp;
*)
  stNodeNo := copy(stTemp,1,G_nNodeCodeLength);
  stEcuID := copy(stTemp,1 + G_nNodeCodeLength,2);
  Delete(stTemp,1,G_nNodeCodeLength + 2);
  stExtendID := stTemp[1];
  Delete(stTemp,1,1);
  stCmd := stTemp[1];
  Delete(stTemp,1,1);
  stMsgNo := stTemp[1];
  Delete(stTemp,1,1);
  stTime := copy(stTemp,1,14);
  Delete(stTemp,1,14);
  stSubCLass := copy(stTemp,1,2);
  Delete(stTemp,1,2);
  stSubAddr := copy(stTemp,1,2);
  Delete(stTemp,1,2);
  stArmArea := copy(stTemp,1,2);
  Delete(stTemp,1,2);
  stMode := copy(stTemp,1,1);
  Delete(stTemp,1,1);
  stAlarmStateCode := copy(stTemp,1,2);
  Delete(stTemp,1,2);
  stLoop := copy(stTemp,1,2);
  if isDigit(stLoop) then stLoop := inttostr(strtoint(stLoop))
  else stLoop := '0';
  Delete(stTemp,1,2);
  stZoneState := copy(stTemp,1,1);
  Delete(stTemp,1,1);
  Delete(stTemp,1,1); //',' ����
  stOperater := FindCharCopy(stTemp,0,',');
  stAlarmStateCodeName := FindCharCopy(stTemp,1,',');
  stAlarmStatePCCode := FindCharCopy(stTemp,2,',');
  stAlarmStatePCCodeName := FindCharCopy(stTemp,3,',');
  stArmModeChange := FindCharCopy(stTemp,4,',');
  stAlarmView := FindCharCopy(stTemp,5,',');
  stAlarmSound := FindCharCopy(stTemp,6,',');
  stAlarmColor := FindCharCopy(stTemp,7,',');

  //stExtendID := '0';
  if stSubCLass = 'EL' then
  begin
    if isDigit(stSubAddr) then stExtendID := inttostr(strtoint(stSubAddr));
  end;
  //���⼭ ����͸��� �̺�Ʈ �߻�
  dmMonitoringServer.CurrentAlarmEvent(stNodeNo,stEcuID,stExtendID,stCmd,stMsgNo,stTime,stSubCLass,stSubAddr,stArmArea,stMode,stAlarmStateCode,stLoop,stZoneState,stOperater,
                                       stAlarmStateCodeName,stAlarmStatePCCode,stAlarmStatePCCodeName,stArmModeChange,stAlarmView,stAlarmSound,stAlarmColor);
end;

procedure TfmMain.MDIChildShow(FormName: String);
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        if Screen.ActiveForm = Screen.Forms[i] then
        begin
          //Screen.Forms[i].WindowState := wsMaximized;
          Exit;
        end;
        Screen.Forms[i].Show;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    tmpForm.Show;
  end;
end;

function TfmMain.MDIForm(FormName: string): TForm;
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  result := nil;
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        result := Screen.Forms[i];
        Exit;
      end;
    end;
  end;
end;

procedure TfmMain.MemoryClearTimerTimer(Sender: TObject);
var
  hProcess:THandle;
begin
  inherited;
//��ŷ �� �޸� Clear;
  hProcess := OpenProcess(PROCESS_SET_QUOTA,false,GetCurrentProcessId);   //�޸� ������ ������ �ɱ�?
  try
    SetProcessWorkingSetSize(hProcess, $FFFFFFFF, $FFFFFFFF);
  finally
    CloseHandle(hProcess);
  end;

end;

procedure TfmMain.MemoryCreate;
begin
  G_bApplicationTerminate := False;

  dmDataBase.OnAdoConnected := DataBaseAdoConnected;
  TDataBaseConfig.GetObject.OnAdoConnected := DataBaseAdoConnected;

  dmMonitoringServer.OnClientPacketView := ClientPacketView;

  AlarmEventStateCodeList := TStringList.Create;
  CardEmList := TStringList.Create;
  DeviceCardGradeList := TStringList.Create;
  FireEventGubunList := TStringList.Create;
  ManagerControlReceiveList := TStringList.Create;
  ManagerEventReceiveList := TStringList.Create;
  MonitorClientList := TStringList.Create;
  NodeList := TStringList.Create;
  ServerNodeList := TStringList.Create;
  AntiPassGroupList := TStringList.Create;


  oControlSendMemory := TfisSharedMemory.Create(nil);
  oControlSendMemory.ShareName := 'DEVICESERVERCONTROL'+inttostr(G_nDecoderNo);
  oControlSendMemory.CreateMMF_Info;

  oEventSendMemory := TfisSharedMemory.Create(nil);
  oEventSendMemory.ShareName := 'DEVICESERVEREVENT'+inttostr(G_nDecoderNo);
  oEventSendMemory.CreateMMF_Info;

  oControlRecvMemory := TfisSharedMemory.Create(nil);
  oControlRecvMemory.ShareName := 'DEVICESERVERMANAGERCONTROL'+inttostr(G_nDecoderNo);
  oControlRecvMemory.CreateMMF_Info;

  oEventRecvMemory := TfisSharedMemory.Create(nil);
  oEventRecvMemory.ShareName := 'DEVICESERVERMANAGEREVENT'+inttostr(G_nDecoderNo);
  oEventRecvMemory.CreateMMF_Info;
end;

procedure TfmMain.MemoryFree;
var
  i : integer;
begin

  AdoConnectCheckTimer.Enabled := False;
  DeviceServerManagerCheckTimer.Enabled := False;
  FireDoorOpenTimer.Enabled := False;
  MemoryReadTimer.Enabled := False;
  TrayTimer.Enabled := False;
  ManagerControlProcessTimer.Enabled := False;


  UnLoadNode('');
  if AlarmEventStateCodeList.Count > -1 then
  begin
    for i := AlarmEventStateCodeList.Count - 1 downto 0 do
    begin
      TAlarmEventStateCode(AlarmEventStateCodeList.Objects[i]).Free;
    end;
    AlarmEventStateCodeList.Clear;
  end;
  if CardEmList.Count > -1 then
  begin
    for i := CardEmList.Count - 1 downto 0 do
    begin
      TCard(CardEmList.Objects[i]).Free;
    end;
    CardEmList.Clear;
  end;
  if DeviceCardGradeList.Count > -1 then
  begin
    for i := DeviceCardGradeList.Count - 1 downto 0 do
    begin
      TDeviceCardGrade(DeviceCardGradeList.Objects[i]).Free;
    end;
    DeviceCardGradeList.Clear;
  end;

  CardEmList.Free;
  DeviceCardGradeList.Free;
  AlarmEventStateCodeList.Free;
  FireEventGubunList.Free;
  AntiPassGroupList.Free;

  ManagerControlReceiveList.Free;
  ManagerEventReceiveList.Free;
  MonitorClientList.Free;

  oControlSendMemory.Free;
  oEventSendMemory.Free;
  oControlRecvMemory.Free;
  oEventRecvMemory.Free;
end;

procedure TfmMain.MemoryReadTimerTimer(Sender: TObject);
var
  mmf_data : array [0..k_max_info_size-1] of char;
  i : integer;
  nIndex : integer;
begin
//(*TEST20160518
  if G_bApplicationTerminate then Exit;
  if L_bMemoryRead then Exit;

  Try
    L_bMemoryRead := True;
    if oControlRecvMemory.Read_Info(mmf_data) = true then
    begin
      L_dtDeviceServerManagerAliveTime := Now;
      nIndex := ManagerControlReceiveList.indexof(UnicodeString(mmf_data));
      if nIndex < 0 then
      begin
        ManagerControlReceiveList.Add(UnicodeString(mmf_data));
      end;
      //��������.
      MIAMS_DeviceServerManagerControlAckMessageDataSend(0,UnicodeString(mmf_data));
      //LogSave(G_stLogDirectory + '\MemoryServer' + FormatDateTime('yyyymmdd',now) +inttostr(G_nDecoderNo)+ '.log',String(mmf_data));

      for i := Low (mmf_data) to High (mmf_data) do
      begin
        mmf_data[i] := char (0);
      end;
      oControlRecvMemory.Write_Info(mmf_data);
    end;
    if oEventRecvMemory.Read_Info (mmf_data) = true then
    begin
      L_dtDeviceServerManagerAliveTime := Now;
      nIndex := ManagerEventReceiveList.indexof(UnicodeString(mmf_data));
      if nIndex < 0 then
      begin
        ManagerEventReceiveList.Add(UnicodeString(mmf_data));
      end;
      //��������.
      MIAMS_DeviceServerManagerEventAckMessageDataSend(0,UnicodeString(mmf_data));
      //LogSave(G_stLogDirectory + '\MemoryServer' + FormatDateTime('yyyymmdd',now) +inttostr(G_nDecoderNo)+ '.log',String(mmf_data));

      for i := Low (mmf_data) to High (mmf_data) do
      begin
        mmf_data [i] := char (0);
      end;
      oEventRecvMemory.Write_Info(mmf_data);
    end;
  Finally
    L_bMemoryRead := False;
  End;
//  *)
end;


procedure TfmMain.MIAMS_DeviceServerManagerControlAckMessageDataSend(aCmd: integer;
  aMessage: UnicodeString);
var
  mmf_data : array [0..k_max_info_size-1] of Widechar;
begin
  StrPCopy(mmf_data, aMessage);
  if aCmd = 0 then
  begin
    oControlSendMemory.Write_Info(mmf_data);
  end;
end;

procedure TfmMain.MIAMS_DeviceServerManagerEventAckMessageDataSend(
  aCmd: integer; aMessage: UnicodeString);
var
  mmf_data : array [0..k_max_info_size-1] of Widechar;
begin
  StrPCopy(mmf_data, aMessage);
  if aCmd = 0 then
  begin
    oEventSendMemory.Write_Info(mmf_data);
  end;
end;

function TfmMain.MIAMS_DeviceServerManagerExecute: Boolean;
var
  hProcess:THandle;
begin
  result := False;
  L_dtDeviceServerManagerAliveTime := now;

  //���⿡�� ���α׷� ���� ��Ű��.
  if FileExists(G_stExeFolder + '\GMS_DeviceServerManager' +inttostr(G_nDecoderNo) + '.exe') then
  begin
    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\GMS_DeviceServerManager' +inttostr(G_nDecoderNo) + '.exe'),'','', SW_Normal);  //--> �̰� ����ϴٰ�  MyRunDosCommand �� ������ ������ Ȥ�� �޸� ������ ���� ȿ���� ������ �ؼ�...
//    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\MyExec.exe'),pchar('"' +G_stExeFolder + '\GMS_DeviceServerManager' +inttostr(G_nDecoderNo) + '.exe"'),'', SW_HIDE);
//    MyRunDosCommand(G_stExeFolder + '\GMS_DeviceServerManager' +inttostr(G_nDecoderNo) + '.exe',False,False);
    sb_Status.Panels[2].Text := G_stExeFolder + '\GMS_DeviceServerManager' +inttostr(G_nDecoderNo) + '.exe';
    result := True;
  end;

  hProcess := OpenProcess(PROCESS_SET_QUOTA,false,GetCurrentProcessId);   //�޸� ������ ������ �ɱ�?
  try
    SetProcessWorkingSetSize(hProcess, $FFFFFFFF, $FFFFFFFF);
  finally
    CloseHandle(hProcess);
  end;

end;


function TfmMain.MIAMS_DeviceServerManagerTerminate: Boolean;
var
  hMutex : LongInt;
  DaemonGubun:string;
  FindHandle: THandle;
  ProcessList : TStringList;
  i : integer;
  ProcId: DWORD;
  hProcess: THandle;
  pSelfID : DWORD;
begin
  Try
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := ProcessList.Count - 1 downto 0 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('GMS_DeviceServerManager' +inttostr(G_nDecoderNo) + '.exe') then  //���� �ǰ� ������
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            // ������ process�� ���� �����Ų��
            TerminateProcess(hProcess, 0);
          end;
        end;
//        TObject(ProcessList.Objects[i]).free;
      end;
    end;
  Finally
    ProcessList.Clear;
    ProcessList.Free;
  End;
end;

procedure TfmMain.mn_DeviceMonitoringClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmDeviceComMonitoring');
  self.FindClassForm('TfmDeviceComMonitoring').FindCommand('MENUID').Params.Values['ID'] := 'BM3_011';
  self.FindClassForm('TfmDeviceComMonitoring').FindCommand('MENUID').Execute;
  self.FindClassForm('TfmDeviceComMonitoring').FindCommand('FORMNAME').Params.Values['CAPTION'] := mn_DeviceMonitoring.Caption;
  self.FindClassForm('TfmDeviceComMonitoring').FindCommand('FORMNAME').Execute;

end;

procedure TfmMain.mn_PCMonitorClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmPCComMonitoring');
  self.FindClassForm('TfmPCComMonitoring').FindCommand('MENUID').Params.Values['ID'] := 'BM3_012';
  self.FindClassForm('TfmPCComMonitoring').FindCommand('MENUID').Execute;
  self.FindClassForm('TfmPCComMonitoring').FindCommand('FORMNAME').Params.Values['CAPTION'] := mn_PCMonitor.Caption;
  self.FindClassForm('TfmPCComMonitoring').FindCommand('FORMNAME').Execute;

end;

procedure TfmMain.mn_Test1Click(Sender: TObject);
begin
  inherited;
  pan_TEST.Visible := Not pan_TEST.Visible;
end;

procedure TfmMain.mn_trayCloseClick(Sender: TObject);
begin
  inherited;
  mn_trayClose.Enabled := False;
  L_bClose := True;
  Close;

end;

procedure TfmMain.mn_trayVisibleClick(Sender: TObject);
begin
  inherited;
  TrayIcon1DblClick(self);

end;

procedure TfmMain.NFCheckTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
//(*TEST20160518
  if G_bApplicationTerminate then Exit;
  Try
    Try
      NFCheckTimer.Enabled := False;
      for i := 0 to NodeList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if TNode(NodeList.Objects[i]).NodeConnected <> csConnected then
        begin
          TNode(NodeList.Objects[i]).NFCheckTimer;
        end;
        Application.ProcessMessages;
      end;
    Finally
      NFCheckTimer.Enabled := Not G_bApplicationTerminate;
    End;
  Except
    LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','NFCheckTimer');
  End;
//*)
end;

procedure TfmMain.NodeAutoDownLoadStart(Sender: TObject; aNodeNo: integer;
  aData: string);
begin
//
//  if G_bDebug then  sb_Status.panels[2].Text := 'AutoDownLoadStart' + inttostr(aNodeNo) + ':' + aData;
end;

function TfmMain.NodeDataChange(aNodeNo, aCmd: string): Boolean;
var
  nIndex : integer;
begin
  case aCmd[1] of
    '0' : begin   //��� ����
      nIndex := NodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength));
      if nIndex > -1 then
      begin
        TNode(NodeList.Objects[nIndex]).SocketOpen := False;
        TNode(NodeList.Objects[nIndex]).Free;
        NodeList.Delete(nIndex);
      end;
    end;
    '1' : begin
      LoadNode(aNodeNo);
      LoadArmAreaUse(aNodeNo,'');
    end;
  end;
end;

procedure TfmMain.NodeOpenCheckTimerTimer(Sender: TObject);
var
  i : integer;
  dtPollingTime: TDatetime;
  dtTimeOut: TDatetime;
begin
  inherited;
//(*TEST20160518
  if G_bApplicationTerminate then Exit;
  Try
    Try
      NodeOpenCheckTimer.Enabled := False;
      for i := 0 to NodeList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if (TNode(NodeList.Objects[i]).SocketType = 1) and TNode(NodeList.Objects[i]).SocketOpen then
        begin
          Try
            dtPollingTime:= TNode(NodeList.Objects[i]).LastReceiveTime;
            dtTimeOut:= IncTime(dtPollingTime,0,0,con_NODESOCKETDELAYTIME,0);
            if Now > dtTimeOut then
            begin
               TNode(NodeList.Objects[i]).SocketOpen := False; //30�ʰ� �ƹ� �����Ͱ� ������ ���� ���� ������ �� ����
               //20180308 ���������� �ٷ� NF�� ������ ����. - ����
               if TNode(NodeList.Objects[i]).LastNetworkState = 'NR' then TNode(NodeList.Objects[i]).LastNetworkState := 'NF';
               TNode(NodeList.Objects[i]).LastReceiveTime := Now; //�����ð� �Ŀ� �ٽ� Open �õ�
            end;
          Except
            LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','NodeOpenCheckTimerTimer');
            //
          End;
        end;
      end;

      if L_nReConnectSeq > (NodeList.Count - 1)  then
      begin
        L_nReConnectSeq := 0;
        GMSSeverSocketOpen := True;
      end;

      for i := L_nReConnectSeq to NodeList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if (TNode(NodeList.Objects[i]).SocketType = 1) and Not TNode(NodeList.Objects[i]).SocketOpen then
        begin
          TNode(NodeList.Objects[i]).SocketOpen := True;
          L_nReConnectSeq := i + 1;
          break;
        end;
        L_nReConnectSeq := i + 1;
      end;
    Finally
      NodeOpenCheckTimer.Enabled := Not G_bApplicationTerminate;
    End;
  Except
    LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','NodeOpenCheckTimerTimer');
  End;
//*)
end;

procedure TfmMain.NodePacketEvent(Sender: TObject; aNodeNo: integer; aNodeName,aEcuID, aCmd, aMsgNo, aDeviceVer, aData, aType: string);
var
  fmTemp : TForm;
begin
//��Ŷ �ۼ��� �κ� üũ
  if G_bFormEnabled[conFORMDEVICECOMMONITORING] then
  begin
    fmTemp := MDIForm('TfmDeviceComMonitoring');
    if fmTemp <> nil then TfmDeviceComMonitoring(fmTemp).NodePacketEvent(aNodeNo , aNodeName,aEcuID,aCmd,aMsgNo,aDeviceVer,aData,aType);
  end;
end;

procedure TfmMain.NodeRcvPacketTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
//(*TEST20160518

 Exit;
  if G_bApplicationTerminate then Exit;
  Try
    Try
      NodeRcvPacketTimer.Enabled := False;
      for i := 0 to NodeList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
//        if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
        begin
          //TNode(NodeList.Objects[i]).NodeDataPacketProcess;
        end;
        Application.ProcessMessages;
      end;
    Finally
      NodeRcvPacketTimer.Enabled := Not G_bApplicationTerminate;
    End;
  Except
    LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','NodeRcvPacketTimer');
  End;
//*)
end;

procedure TfmMain.NodeSendPacketTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
//(*TEST20160518
  if G_bApplicationTerminate then Exit;
  Try
    Try
      NodeSendPacketTimer.Enabled := False;
      for i := 0 to NodeList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
        begin
          TNode(NodeList.Objects[i]).NodeSendPacketTimer;
        end;
        Application.ProcessMessages;
      end;
      inc(L_nCount);
      if L_nCount > 100 then
      begin
        L_nCount := 0;
        sb_Status.Panels[2].Text := 'NodeSendPacketTimerTimer(' + FormatDateTime('yyyymmddhhnnss',now) + ')';
      end;
    Finally
      NodeSendPacketTimer.Enabled := Not G_bApplicationTerminate;
    End;
  Except
    LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','NodeSendPacketTimer');
  End;
//*)
end;

procedure TfmMain.NRCheckTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
//(*TEST20160518
  if G_bApplicationTerminate then Exit;
  Try
    Try
      NRCheckTimer.Enabled := False;
      for i := 0 to NodeList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
        begin
          TNode(NodeList.Objects[i]).NRCheckTimer;
        end;
        Application.ProcessMessages;
      end;
    Finally
      NRCheckTimer.Enabled := Not G_bApplicationTerminate;
    End;
  Except
    LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','NRCheckTimer');
  End;
//*)
end;

procedure TfmMain.RcvCheckTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
//(*TEST20160518
  if G_bApplicationTerminate then Exit;
  Try
    Try
      RcvCheckTimer.Enabled := False;
      for i := 0 to NodeList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
        begin
          TNode(NodeList.Objects[i]).RcvCheckTimer;
        end;
        Application.ProcessMessages;
      end;
    Finally
      RcvCheckTimer.Enabled := Not G_bApplicationTerminate;
    End;
  Except
    LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','RcvCheckTimerTimer');
  End;
//*)
end;

procedure TfmMain.ReaderTelNumberChange(aData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stReaderNo : string;
  stTelNo : string;
  stTelNumber : string;
  nIndex : integer;
  nCmd : integer;
begin
  if aData = '' then Exit;

  stNodeNo := copy(aData,1,G_nNodeCodeLength);                      //stNodeNo
  stEcuID := copy(aData,1 + G_nNodeCodeLength,2);
  stReaderNo := copy(aData,1 + G_nNodeCodeLength + 2,1);
  stTelNo := copy(aData,1 + G_nNodeCodeLength + 2 + 1,1);
  case stTelNo[1] of
    '0' : begin nCmd := con_CardReaderCmdTelNumber0; end;
    '1' : begin nCmd := con_CardReaderCmdTelNumber1; end;
    '2' : begin nCmd := con_CardReaderCmdTelNumber2; end;
    '3' : begin nCmd := con_CardReaderCmdTelNumber3; end;
    '4' : begin nCmd := con_CardReaderCmdTelNumber4; end;
    '5' : begin nCmd := con_CardReaderCmdTelNumber5; end;
    '6' : begin nCmd := con_CardReaderCmdTelNumber6; end;
    '7' : begin nCmd := con_CardReaderCmdTelNumber7; end;
    '8' : begin nCmd := con_CardReaderCmdTelNumber8; end;
    '9' : begin nCmd := con_CardReaderCmdTelNumber9; end;
  end;
  stTelNumber := aData;
  Delete(stTelNumber,1,1 + G_nNodeCodeLength + 2 + 1);
  nIndex := NodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,nCmd,stEcuID,stReaderNo,stTelNumber);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeCardReader,nCmd,stEcuID,stReaderNo,'U');
  end else
  begin
    nIndex := ServerNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket, //aWinSock
            con_DeviceTypeCardReader,nCmd,stEcuID,stReaderNo,stTelNumber);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceTypeCardReader,nCmd,stEcuID,stReaderNo,'U');
    end;
  end;
end;

procedure TfmMain.ReceiveManagerControlProcess(aData: string);
var
  stCmd : string;
  stReceiveData : string;
  stCurrentYear : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  nIndex : integer;
  nWinSock : integer;
begin
  stCmd := FindCharCopy(aData,0,DATADELIMITER);
  stReceiveData := FindCharCopy(aData,1,DATADELIMITER);

  if Not isDigit(stCmd) then Exit;

  case strtoint(stCmd) of
    con_cmdManagerToServerFormShow :
    begin
      TrayIcon1DblClick(TrayIcon1);
    end;
    con_cmdManagerToServerCardFTP :
    begin
      //FTP Card ����
      CardFTPSend(stReceiveData,1);
    end;
    con_cmdManagerToServerCardSend :
    begin
      //ī���̺�Ʈ�� ���� ���Ѱ� ���� �ʴ�... ��� ����
      CardPermitDeviceSend(stReceiveData,1);
    end;
    con_cmdManagerToServerCardUpdate :
    begin
      //ī������� ���� �Ǿ��� ��������.
      CardPermitDeviceSend(stReceiveData,0);
    end;
    con_cmdManagerToServerDeviceHoliday :
    begin
      //�����ϴٿ�ε�
      stCurrentYear := FormatDateTime('yyyy',now);
      if L_stHolidaySendYear <> stCurrentYear then
      begin
        L_stHolidaySendYear := stCurrentYear;
        //������ �ٲ�����Ƿ� ����� �������� Clear �� �� ���� ����.
        if NodeList.Count > 0 then
        begin
          for i := 0 to NodeList.Count - 1 do
          begin
            TNode(NodeList.Objects[i]).SetHolidayClear;
            //���⼭ �ش� �⵵�� Ư������ ��� ���� ���� ���·� ����
            dmDBUpdate.UpdateTB_HOLIDAYDEVICE_DeviceYearSendStatus(NodeList.Strings[i],'',stCurrentYear,'N');
          end;
        end;

        if ServerNodeList.Count > 1 then
        begin
          for i := 0 downto ServerNodeList.Count - 1 do
          begin
            nWinSock := TServerNode(ServerNodeList.Objects[i]).WinSocket;
            dmNodeServer.DeviceNodeServer_SetHolidayClear(nWinSock);
            //���⼭ �ش� �⵵�� Ư������ ��� ���� ���� ���·� ����
            dmDBUpdate.UpdateTB_HOLIDAYDEVICE_DeviceYearSendStatus(ServerNodeList.Strings[i],'',stCurrentYear,'N');
          end;
        end;
      end;
      if DeviceHolidaySend(stCurrentYear) then
      begin
        dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('DAEMON','HOLIDAYSENDYEAR' + inttostr(G_nDecoderNo),'CO_CONFIGVALUE',stCurrentYear);
      end;
    end;
    con_cmdManagerToServerDeviceArmAreaUseChange : //������� ��������� ���� �Ǿ���.
    begin
      LoadArmAreaUse(FindCharCopy(aData,1,DATADELIMITER),FindCharCopy(aData,2,DATADELIMITER));
    end;
    con_cmdManagerToServerDeviceChange : //��Ʈ�ѷ� ��ü �Ǿ���.
    begin
      LoadDeviceChange(FindCharCopy(aData,1,DATADELIMITER),FindCharCopy(aData,2,DATADELIMITER));
    end;
    con_cmdManagerToServerDoorMemLoadChange :
    begin
      LoadDoor('','','N');
    end;
    con_cmdManagerToServerDoorOpen :
    begin
      //���Ա����� �ִµ� ������ �ȵ� ��춧���� ó��
      if G_nMonitoringType = 1 then  //�бⱹ��Ǹ� ó������.
      begin
        stNodeNo := copy(stReceiveData,1,G_nNodeCodeLength);
        stEcuID := copy(stReceiveData,1 + G_nNodeCodeLength,2);
        stExtendID := copy(stReceiveData,1 + G_nNodeCodeLength + 2,1);
        stDoorNo := copy(stReceiveData,1 + G_nNodeCodeLength + 2 + 1,G_nDoorCodeLength);
        if Not isDigit(stDoorNo) then Exit;

        stSendData := 'C' +
                  '0' +  //  Msg Count
                  inttostr(strtoint(stDoorNo)) +
                  #$30+
                  #$33+ //  RecordCount(���Թ� ���� #$33)
                  #$31;
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).SendPacket(stEcuID,'c',TNode(NodeList.Objects[nIndex]).GetSendMsgNo,TNode(NodeList.Objects[nIndex]).GetDeviceVer,stSendData,0);
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            dmNodeServer.DeviceNodeServer_SendPacket(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID,'c',stSendData,0);
          end;
        end;
      end;
    end;
    con_cmdManagerToServerDoorScheduleChange :   //���Թ� ������ ���� ������ �ٿ�ε� ����.
    begin
      DoorScheduleSend;
    end;
    con_cmdManagerToServerDoorSettingRegist : //���Թ����� ������ ��������.
    begin
      DoorSettingRegist(stReceiveData);
    end;
    con_cmdManagerToServerDoorSettingSearch : //���Թ����� ������ ��ȸ ����.
    begin
      DoorSettingSearch(stReceiveData);
    end;

    con_cmdManagerToServerDoorTimeCodeUseChange :
    begin
      DoorTimeCodeUseChangeSend;
    end;

    con_cmdManagerToServerNodeChange :
    begin
      NodeDataChange(FindCharCopy(aData,1,DATADELIMITER),FindCharCopy(aData,2,DATADELIMITER));
    end;

    con_cmdManagerToServerReaderTelNumber :
    begin
      ReaderTelNumberChange(stReceiveData);
    end;

    con_cmdManagerToServerTimeDeviceCodeChange :
    begin
      TimeDeviceCodeSend;
    end;
  end;
end;

procedure TfmMain.ReceiveManagerEventProcess(aData: string);
var
  stCmd : string;
begin
  stCmd := FindCharCopy(aData,0,DATADELIMITER);
  if Not isDigit(stCmd) then Exit;
  case strtoint(stCmd) of
    con_cmdManagerToServerAccessEvent : begin
      ManagerReceiveAccessEvent(aData);
    end;
    con_cmdManagerToServerAlarmEvent : begin
      ManagerReceiveAlarmEvent(aData);
    end;
  end;

end;

procedure TfmMain.SetGMSSeverSocketOpen(const Value: Boolean);
begin
  if FGMSSeverSocketOpen = Value then Exit;
  //��� ������ ��� ���� �� �Ŀ� ���� ���� �����...

  FGMSSeverSocketOpen := Value;
  dmMonitoringServer.ServerPort := G_nDecoderControlServerPort;
  Try
    dmMonitoringServer.ServerStart := Value;
  Except
  End;
  dmDirectServer.ServerPort := G_nDecoderDirectServerPort;
  Try
    dmDirectServer.ServerStart := Value;
  Except
  End;

end;

procedure TfmMain.SetToDayDate(const Value: string);
var
  i : integer;
  nWinSock : integer;
begin
  if FToDayDate = Value then Exit;
  if FToDayDate = '' then
  begin
    FToDayDate := Value;
    Exit;
  end;
  FToDayDate := Value;

  if G_bApplicationTerminate then Exit;
  if NodeList.Count > 0 then
  begin
    for i := 0 to NodeList.Count - 1 do
    begin
      if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
        TNode(NodeList.Objects[i]).DeviceCardSort;
    end;
  end;

  if ServerNodeList.Count > 1 then
  begin
    for i := 0 downto ServerNodeList.Count - 1 do
    begin
      nWinSock := TServerNode(ServerNodeList.Objects[i]).WinSocket;
      dmNodeServer.DeviceNodeServer_DeviceCardSort(nWinSock);
    end;
  end;
end;

procedure TfmMain.StateCheckTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
//(*TEST20160518
  if G_bApplicationTerminate then Exit;
  Try
    Try
      StateCheckTimer.Enabled := False;
      for i := 0 to NodeList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
        begin
          TNode(NodeList.Objects[i]).StateCheckTimer;
        end;
        Application.ProcessMessages;
      end;
    Finally
      StateCheckTimer.Enabled := Not G_bApplicationTerminate;
    End;
  Except
    LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','StateCheckTimer');
  End;
//*)
end;

Function TfmMain.TimeDeviceCodeSend:Boolean;
var
  st:         string;
  stNodeNo : string ;
  stEcuID : string ;
  stOldNodeNo : string ;
  stOldEcuID : string ;
  stData:      String;
  nIndex:     Integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
  i : integer;
  bSendExcute : Boolean;
  nRecordCount : integer;
  nCount : integer;
begin
  result := True;
  //dmDBUpdate.UpdateTB_TIMECODEDEVICE_SendStatus('N','R'); //Manager ���� ���� ó�� ��.

  Try
    stSql := 'SELECT a.ND_NODENO,a.DE_ECUID,a.TC_GROUP,a.TC_TIME1,a.TC_TIME2,a.TC_TIME3,a.TC_TIME4';
    stSql := stSql + ' FROM TB_TIMECODEDEVICE a ';
    stSql := stSql + ' INNER JOIN TB_NODE b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND b.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' INNER JOIN TB_NODE c ';
    stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND c.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.TC_SEND = ''R'' ' ;
    stSql := stSql + ' order by a.ND_NODENO,a.DE_ECUID ';

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;

      with TempAdoQuery do
      begin
        Close;
        Sql.Text := stSql;
        Try
          Open;
        Except
          on E : EDatabaseError do
          begin
            LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','TimeDeviceCodeSend' +  E.Message);
          end;
          else
          begin
            LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','TimeDeviceCodeSend');
          end;
          Exit;
        End;

//        dmDBUpdate.UpdateTB_TIMECODEDEVICE_SendStatus('R','S');
        if RecordCount > 0 then
        begin
          First;
          nRecordCount := RecordCount;
          nCount := 1;
          While not eof do
          begin
            if G_bApplicationTerminate then Exit;
            stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
            stEcuID := FindField('DE_ECUID').AsString;
            bSendExcute := False;

            if nRecordCount = nCount then bSendExcute := True;

            if stOldNodeNo <> '' then
            begin
              if stOldNodeNo <> stNodeNo then
              begin
                bSendExcute := True;
              end else
              begin
                if stOldEcuID <> stEcuID then
                begin
                  bSendExcute := True;
                end;
              end;
            end;
            if bSendExcute then
            begin
              nIndex := NodeList.IndexOf(stOldNodeNo);
              if nIndex > -1 then
              begin
                TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdTimeCodeSend,stOldEcuID,'U');
              end else
              begin
                nIndex := ServerNodeList.IndexOf(stOldNodeNo);
                if nIndex > -1 then
                begin
                  if bSendExcute then dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceCmdTimeCodeSend,stOldEcuID,'U');
                end;
              end;
            end;

            stOldNodeNo := stNodeNo;
            stOldEcuID := stEcuID;
            stData:= FindField('TC_GROUP').asString[1] +
                     FillZeroStrNum(FindField('TC_TIME1').asString,8) +
                     FillZeroStrNum(FindField('TC_TIME2').asString,8) +
                     FillZeroStrNum(FindField('TC_TIME3').asString,8) +
                     FillZeroStrNum(FindField('TC_TIME4').asString,8) ;

            nIndex := NodeList.IndexOf(stNodeNo);
            if nIndex > -1 then
            begin
              TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdTimeCodeSend,stEcuID,stData);
            end else
            begin
              nIndex := ServerNodeList.IndexOf(stNodeNo);
              if nIndex > -1 then
              begin
                dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceCmdTimeCodeSend,stEcuID,stData);
              end;
            end;
            inc(nCount);

            dmDBUpdate.UpdateTB_TIMECODEDEVICE_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'TC_SEND','S');
            Application.ProcessMessages;
            Next;
          end;
          nIndex := NodeList.IndexOf(stOldNodeNo);
          if nIndex > -1 then
          begin
            TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdTimeCodeSend,stOldEcuID,'U');
          end else
          begin
            nIndex := ServerNodeList.IndexOf(stOldNodeNo);
            if nIndex > -1 then
            begin
              if bSendExcute then dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceCmdTimeCodeSend,stOldEcuID,'U');
            end;
          end;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Send_DoorScheduleInfo');
  End;
end;

procedure TfmMain.TimeSyncTimerTimer(Sender: TObject);
var
  i : integer;
  nWinSock : integer;
begin
  inherited;
//(*TEST20160518
    if G_bApplicationTerminate then Exit;
    if NodeList.Count > 0 then
    begin
      for i := 0 to NodeList.Count - 1 do
      begin
        if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
          TNode(NodeList.Objects[i]).ControlNodeToDeviceTimeSync;
      end;
    end;

    if ServerNodeList.Count > 1 then
    begin
      for i := 0 downto ServerNodeList.Count - 1 do
      begin
        nWinSock := TServerNode(ServerNodeList.Objects[i]).WinSocket;
        dmNodeServer.DeviceNodeServer_ControlNodeToDeviceTimeSync(nWinSock);
      end;
    end;
    LogSave(G_stLogDirectory + '\TimeSync' + FormatDateTime('yyyymm',Now) + '.log',FormatDateTime('yyyymmddhhnnss',Now));
//*)
end;

procedure TfmMain.ToDayTimerTimer(Sender: TObject);
begin
  inherited;
//(*TEST20160518
  ToDayDate := FormatDateTime('yyyymmdd',now);
//*)
end;

procedure TfmMain.TrayIcon1DblClick(Sender: TObject);
begin
  inherited;
  { Hide the tray icon and show the window,
  setting its state property to wsNormal. }
  Show();
  WindowState := wsNormal;
  Application.BringToFront();

end;

procedure TfmMain.TrayTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if Not L_bFormAcive then Exit;

  TrayTimer.Enabled := False;
  { Hide the window and set its state variable to wsMinimized. }
  Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
//(*TEST20160518
  Exit;
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;

procedure TfmMain.UnLoadNode(aNodeNo: string);
var
  i : integer;
  nIndex : integer;
begin
  if NodeList.Count < 1 then Exit;
  if L_bNodeLock then Exit;
  L_bNodeLock := True;
  Try
    if aNodeNo = '' then
    begin
      for i := NodeList.Count - 1 downto 0 do
      begin
        TNode(NodeList.Objects[i]).Free;
      end;
      NodeList.Clear;
    end else
    begin
      nIndex := NodeList.IndexOf(aNodeNo);
      if nIndex > -1 then
      begin
        TNode(NodeList.Objects[nIndex]).Free;
        NodeList.Delete(nIndex);
      end;
    end;
  Finally
    L_bNodeLock := False;
  End;

end;

procedure TfmMain.WndProc(var Message: TMessage);
begin
  inherited;
  if Message.Msg=WM_ENDSESSION then begin
    if Not G_bApplicationTerminate then
    begin
      L_bClose := True;
      Close;
    end;
  end else if Message.Msg = WM_QUERYENDSESSION then begin
    if Not G_bApplicationTerminate then
    begin
      L_bClose := True;
      Close;
    end;
    Message.Result := 1;
  end;
end;

procedure TfmMain.ZONEEXTENDTYPEChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
(*  dmDBUpdate.UpdateTB_ZONEEXTENTION_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,'ZE_TYPE',aData);
  dmDBInsert.InsertIntoTB_SETTINGINFO_All('TB_ZONEEXTENTION','ZE_TYPE',inttostr(aNodeNo),aEcuID,aExtendID,'0',aData);
*)
end;

procedure TfmMain.ZonePacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
(*
  case aCmd of
    con_ZoneCmdArmArea : begin
      if Not isDigit(aData) then aData := '0';
      dmDBUpdate.UpdateTB_ZONE_Field_IntValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'AR_ARMAREANO',aData);
      dmDBInsert.InsertIntoTB_SETTINGINFO_All('TB_ZONE','AR_ARMAREANO',inttostr(aNodeNo),aEcuID,aExtendID,aNumber,aData);
    end;
    con_ZoneCmdAlarmEventType : begin
      dmDBUpdate.UpdateTB_ZONE_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'ZN_ALARMEVENTTYPE',aData);
      dmDBInsert.InsertIntoTB_SETTINGINFO_All('TB_ZONE','ZN_ALARMEVENTTYPE',inttostr(aNodeNo),aEcuID,aExtendID,aNumber,aData);
    end;
    con_ZoneCmdDelayUse : begin
      dmDBUpdate.UpdateTB_ZONE_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'ZN_ZONEDELAY',aData);
      dmDBInsert.InsertIntoTB_SETTINGINFO_All('TB_ZONE','ZN_ZONEDELAY',inttostr(aNodeNo),aEcuID,aExtendID,aNumber,aData);
    end;
    con_ZoneCmdEventStateCode : begin
      dmDBUpdate.UpdateTB_ZONE_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'AE_EVENTSTATECODE',aData);
      dmDBInsert.InsertIntoTB_SETTINGINFO_All('TB_ZONE','AE_EVENTSTATECODE',inttostr(aNodeNo),aEcuID,aExtendID,aNumber,aData);
    end;
    con_ZoneCmdRecovery : begin
      dmDBUpdate.UpdateTB_ZONE_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'ZN_ZONERECOVERY',aData);
      dmDBInsert.InsertIntoTB_SETTINGINFO_All('TB_ZONE','ZN_ZONERECOVERY',inttostr(aNodeNo),aEcuID,aExtendID,aNumber,aData);
    end;
    con_ZoneCmdSenseTime : begin
      dmDBUpdate.UpdateTB_ZONE_Field_StringValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'ZN_ZONESENSETIME',aData);
      dmDBInsert.InsertIntoTB_SETTINGINFO_All('TB_ZONE','ZN_ZONESENSETIME',inttostr(aNodeNo),aEcuID,aExtendID,aNumber,aData);
    end;
    con_ZoneCmdType : begin
      if Not isDigit(aData) then aData := '0';
      dmDBUpdate.UpdateTB_ZONE_Field_IntValue(inttostr(aNodeNo),aEcuID,aExtendID,aNumber,'ZN_ZONETYPE',aData);
      dmDBInsert.InsertIntoTB_SETTINGINFO_All('TB_ZONE','ZN_ZONETYPE',inttostr(aNodeNo),aEcuID,aExtendID,aNumber,aData);
    end;
  end;
*)
end;

{ TNodePacketSendThread }

constructor TNodePacketSendThread.Create;
begin
  // ������ ������ ������ ����
  FreeOnTerminate := False;
  inherited Create( true );
end;

destructor TNodePacketSendThread.Destroy;
begin
  // ����������� �۾� �� ����.
  inherited;
end;

procedure TNodePacketSendThread.Execute;
var
  i : integer;
begin
  inherited;
  while not Terminated do  // �����带 ���� �ϱ��� ����
  begin
    if G_bApplicationTerminate then Exit;
    Try
      for i := 0 to NodeList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if TNode(NodeList.Objects[i]).NodeConnected = csConnected then
        begin
          TNode(NodeList.Objects[i]).NodeSendPacketTimer;
        end;
        Application.ProcessMessages;
      end;
    Except
      LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','NodeSendPacketTimer');
    End;
    Application.ProcessMessages;
    WaitForSingleObject( handle, 20 );
  end;
end;

{ TDeviceCardGrade }

function TDeviceCardGrade.CardGradeAdd(aCardNo, aPermit, aDoor1, aDoor2, aDoor3,
  aDoor4, aDoor5, aDoor6, aDoor7, aDoor8, aArmArea0, aArmArea1, aArmArea2,
  aArmArea3, aArmArea4, aArmArea5, aArmArea6, aArmArea7, aArmArea8,
  aEndDate: string): Boolean;
var
  nIndex : integer;
  oCardGrade : TCardGrade;
begin
  nIndex := CardGradeList.IndexOf(aCardNo);
  if nIndex < 0 then
  begin
    oCardGrade := TCardGrade.Create(nil);
    oCardGrade.Permit := aPermit;
    oCardGrade.ENDDATE := aEndDate;
    oCardGrade.DOOR1 := aDoor1;
    oCardGrade.DOOR2 := aDoor2;
    oCardGrade.DOOR3 := aDoor3;
    oCardGrade.DOOR4 := aDoor4;
    oCardGrade.DOOR5 := aDoor5;
    oCardGrade.DOOR6 := aDoor6;
    oCardGrade.DOOR7 := aDoor7;
    oCardGrade.DOOR8 := aDoor8;
    oCardGrade.DOOR8 := aDoor8;
    oCardGrade.ARMAREA0 := aArmArea0;
    oCardGrade.ARMAREA1 := aArmArea1;
    oCardGrade.ARMAREA2 := aArmArea2;
    oCardGrade.ARMAREA3 := aArmArea3;
    oCardGrade.ARMAREA4 := aArmArea4;
    oCardGrade.ARMAREA5 := aArmArea5;
    oCardGrade.ARMAREA6 := aArmArea6;
    oCardGrade.ARMAREA7 := aArmArea7;
    oCardGrade.ARMAREA8 := aArmArea8;
    CardGradeList.AddObject(aCardNo,oCardGrade);
  end else
  begin
    TCardGrade(CardGradeList.Objects[nIndex]).Permit := aPermit;
    TCardGrade(CardGradeList.Objects[nIndex]).ENDDATE := aEndDate;
    TCardGrade(CardGradeList.Objects[nIndex]).DOOR1 := aDoor1;
    TCardGrade(CardGradeList.Objects[nIndex]).DOOR2 := aDoor2;
    TCardGrade(CardGradeList.Objects[nIndex]).DOOR3 := aDoor3;
    TCardGrade(CardGradeList.Objects[nIndex]).DOOR4 := aDoor4;
    TCardGrade(CardGradeList.Objects[nIndex]).DOOR5 := aDoor5;
    TCardGrade(CardGradeList.Objects[nIndex]).DOOR6 := aDoor6;
    TCardGrade(CardGradeList.Objects[nIndex]).DOOR7 := aDoor7;
    TCardGrade(CardGradeList.Objects[nIndex]).DOOR8 := aDoor8;
    TCardGrade(CardGradeList.Objects[nIndex]).DOOR8 := aDoor8;
    TCardGrade(CardGradeList.Objects[nIndex]).ARMAREA0 := aArmArea0;
    TCardGrade(CardGradeList.Objects[nIndex]).ARMAREA1 := aArmArea1;
    TCardGrade(CardGradeList.Objects[nIndex]).ARMAREA2 := aArmArea2;
    TCardGrade(CardGradeList.Objects[nIndex]).ARMAREA3 := aArmArea3;
    TCardGrade(CardGradeList.Objects[nIndex]).ARMAREA4 := aArmArea4;
    TCardGrade(CardGradeList.Objects[nIndex]).ARMAREA5 := aArmArea5;
    TCardGrade(CardGradeList.Objects[nIndex]).ARMAREA6 := aArmArea6;
    TCardGrade(CardGradeList.Objects[nIndex]).ARMAREA7 := aArmArea7;
    TCardGrade(CardGradeList.Objects[nIndex]).ARMAREA8 := aArmArea8;
  end;
end;

function TDeviceCardGrade.CheckDoorMemoryGrade(aCardNo,
  aDoorNo: string): integer;
var
  nIndex : integer;
begin
  result := -1;
  nIndex := CardGradeList.IndexOf(aCardNo);
  if nIndex < 0 then Exit;
  result := 0;
  if TCardGrade(CardGradeList.Objects[nIndex]).Permit <> '1' then Exit; //������ ����.
  if TCardGrade(CardGradeList.Objects[nIndex]).ENDDATE < FormatDateTime('yyyymmdd',now) then Exit; //��ȿ�Ⱓ�� ������.
  case aDoorNo[1] of
    '1' : begin
      if TCardGrade(CardGradeList.Objects[nIndex]).DOOR1 <> '1' then  Exit;
    end;
    '2' : begin
      if TCardGrade(CardGradeList.Objects[nIndex]).DOOR2 <> '1' then  Exit;
    end;
    '3' : begin
      if TCardGrade(CardGradeList.Objects[nIndex]).DOOR3 <> '1' then  Exit;
    end;
    '4' : begin
      if TCardGrade(CardGradeList.Objects[nIndex]).DOOR4 <> '1' then  Exit;
    end;
    '5' : begin
      if TCardGrade(CardGradeList.Objects[nIndex]).DOOR5 <> '1' then  Exit;
    end;
    '6' : begin
      if TCardGrade(CardGradeList.Objects[nIndex]).DOOR6 <> '1' then  Exit;
    end;
    '7' : begin
      if TCardGrade(CardGradeList.Objects[nIndex]).DOOR7 <> '1' then  Exit;
    end;
    '8' : begin
      if TCardGrade(CardGradeList.Objects[nIndex]).DOOR8 <> '1' then  Exit;
    end;
    else begin
      Exit;
    end;
  end;
  result := 1;
end;

constructor TDeviceCardGrade.Create(AOwner: TComponent);
begin
  inherited;
  CardGradeList := TStringList.Create;
end;

destructor TDeviceCardGrade.Destroy;
begin
  CardGradeList.Free;
  inherited;
end;

end.