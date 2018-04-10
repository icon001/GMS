unit uNode;

interface

uses
  System.SysUtils, System.Classes,Web.Win.Sockets,Vcl.ExtCtrls,System.SyncObjs,
  uDeviceVariable,Winapi.WinSock,Vcl.Controls,Winapi.Messages,Forms,
  Vcl.Graphics,u_c_byte_buffer;

const wm_asynch_select= wm_User;
const k_buffer_max= 1024; //k_buffer_max= 4096; 65536;  �� 65536 �̾�����?
      k_tcp_ip_chunk= 1500;

type
  TNode = Class(TComponent)
  private
    CardDownLoadTimer : TTimer;
    FireRecoveryTimer : TTimer;
    FTPCardDownLoadTimer : TTimer;
    NFCheckTimer : TTimer;
    NRCheckTimer : TTimer;
    RcvCheckTimer: TTimer;
    StateCheckTimer : TTimer;
    L_cNodeRCVSTATE: Array [0..MAXNODERCVCOUNT] of char;     //���Ż���
    ConnectDeviceList : TStringList;
    FTPDownEcuList : TStringList;
    NodeDeviceList : TStringList;
    NodeSendPacketTimer : TTimer;
    Send1stDataList : TStringList;
    Send2ndDataList : TStringList;
    Send3rdDataList : TStringList;
    Send4thDataList : TStringList;
    procedure AddDevice(aEcuID:string;aDeviceUse:Boolean);
    procedure ArmAreaPacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure CardPermitAllLoading(Sender: TObject;  aNodeNo : integer; aData:string);
    procedure CardPermitChange(Sender: TObject;  aNodeNo : integer;aEcuID,aCardNo,aPermit,aDoorPermit,aArmAreaPermit,aTimeCodeUse,aTimeCodeGroup,aTimeData,aWeekCode:string);
    procedure CardPermitLoading(Sender: TObject;aCardNo:string);
    procedure CardRcvAckChange(Sender: TObject;  aNodeNo : integer;aEcuID,aCardNo,aRcvAck:string;aPermit:Boolean);
    procedure CardReaderPacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure CurrentAlarmEvent(Sender: TObject;  aNodeNo,aECUID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                                            aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor:string);
    procedure CurrentDoorState(Sender: TObject;  aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aCardMode,aDoorMode,aDoorState,aLockState,aDoorFire:string);
    procedure DeviceCardAccessEvent(Sender: TObject; aNodeNo,aECUID,aDoorNo,aReaderNo,aInOut,aTime,aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState,aATButton,aCardNo,aType,aArmAreaNo,aAntiGroup:string);
    procedure DeviceConnectedEvent(Sender: TObject; aSocketNo, aNodeNo : integer;aEcuID:string; aConnected:TConnectedState;aAntiGroupCode:string);
    procedure DevicePacketChange(Sender: TObject; aCmd, aNodeNo : integer;aEcuID:string; aData:string);
    procedure DeviceUsedEvent(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string; aUsed:Boolean);
    procedure DeviceReceiveData(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string;aRcvInfoType:integer; aData: string);
    procedure DeviceReceiveTypeChage(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string;aRcvInfoType:integer; aData: string);
    procedure DoorPacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure DoorHolidaySend(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure EmployeePermitAllLoading(Sender: TObject;  aNodeNo : integer; aData:string);
    procedure NodeInformationCheck(aInformationType:integer);
    procedure NodeInformationSend(aInformationType:integer);
    procedure ZONEEXTENDTYPEChange(Sender: TObject;  aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure ZonePacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
  private

    FTCSDeviceSender : TCriticalSection;
    //Handle ���� �κ�
    FHandle : THandle;
    function GetHandle : THandle;
    function GetRegEcuUseData : string; //ECU ������� ���
    procedure CardDownLoadTimerTimer(Sender:TObject);
    procedure FireRecoveryTimerTimer(Sender:TObject);
    procedure FTPCardDownLoadTimerTimer(Sender:TObject);
    procedure NodeSendPacketTimerTimer(Sender: TObject);
    procedure NFCheckTimerTimer(Sender: TObject);
    procedure NRCheckTimerTimer(Sender: TObject);
    procedure RcvCheckTimerTimer(Sender: TObject);
    procedure StateCheckTimerTimer(Sender:TObject);
  private
    FNo: Integer;
    FSocketType: integer;
    FDeviceID: string;
    FInfoInitialize: Boolean;
    FNODEIP: string;
    FNodePort: integer;
    FLastNetworkState: string;
    FSocketOpen: Boolean;
    FWinSocket: tSocket;
    FNodeConnected: TConnectedState;
    FLastReceiveTime: TDateTime;
    FNodeDestory: Boolean;
    FOnNodePacket: TNodePacket;
    FDoorArmAreaStateRCV: Boolean;
    FCardDownLoadStart: Boolean;
    FKTTCDMADATARCV: string;
    FKTTCDMAUSERCV: string;
    FKTTREMOTERINGCOUNTRCV: string;
    FARMEXTENTIONMAINFROMLOCALRCV: string;
    FARMEXTENTIONMAINFROMLOCAL: string;
    FARMEXTENTIONMAINTOLOCALRCV: string;
    FARMEXTENTIONMAINTOLOCAL: string;
    FDVRDATARCV: string;
    FDVRIP: string;
    FDVRPORT: string;
    FDVRUSERCV: string;
    FDVRUSE: string;
    FECUUSERCV: string;
    FKTTCDMAMIN: string;
    FKTTCDMAMUX: string;
    FKTTCDMAIP: string;
    FKTTCDMAPORT: string;
    FKTTCDMACHECKTIME: string;
    FKTTCDMARSSI: string;
    FKTTCDMAUSE: string;
    FKTTREMOTEARMRINGCOUNT: integer;
    FKTTREMOTEDISARMRINGCOUNT: integer;
    FKTTSYSTEMIDRCV: string;
    FKTTSYSTEMID: string;
    FKTTTELNUMBERRCV: string;
    FKTTTELNUMBER2: string;
    FKTTTELNUMBER1: string;
    FFireEvent: Boolean;
    FARMEXTENTIONSKILL: Boolean;
    FDVRSKILL: Boolean;
    FReciveStateChange: Boolean;
    FMaxEcuCount: integer;
    FKTTCDMASKILL: Boolean;
    FARMEXTENTIONGUBUN: string;
    FOnDevicePacketChange: TDevicePacket;
    FOnReceiveTypeChage: TReceiveTypeChange;
    FOnAutoDownLoadStart: TNotifyReceive;
    FOnReceiveData: TReceiveTypeChange;
    FFIREGUBUNCODE: string;
    FOnCurrentAlarmEvent: TAlarmEvent;
    FNodeName: string;
    FOnDeviceNodeServerPacketChange: TDeviceNodeServerPacket;
    FOnAntiPassDataEvent: TAntiPassEvent;
    FOnArmAreaPacketChange: TArmAreaPacket;
    FOnCardPermitChange: TCardPermitPacket;
    FOnCardPermitLoading: TCardPermitLoading;
    FOnCardRcvAckChange: TCardRcvPacket;
    FOnCardReaderPacketChange: TCardReaderPacket;
    FOnCurrentDoorState: TDoorStatePacket;
    FOnDeviceCardAccessEvent: TDeviceCardAccessEvent;
    FOnDeviceConnected: TDeviceConnect;
    FOnDeviceUsed: TDeviceUsed;
    FOnDoorPacketChange: TDoorPacket;
    FOnRcvData: TNotifyReceive;
    FOnRcvInvalidDevice: TNotifyReceive;
    FOnSendData: TNotifyReceive;
    FOnZONEEXTENDTYPEChange: TZoneExtentionPacket;
    FOnEmployeePermitAllLoading: TNotifyReceive;
    FOnCardPermitAllLoading: TNotifyReceive;
    FOnZonePacketChange: TZonePacket;
    FOnDoorHolidaySend: TDoorPacket;
    FOnArmAreaModeChange: TArmAreaPacket;
    procedure SetNo(const Value: Integer);
    procedure SetDeviceID(const Value: string);
    procedure SetLastNetworkState(const Value: string);
    procedure SetSocketOpen(const Value: Boolean);
    procedure SetNodeConnected(const Value: TConnectedState);
    procedure SetDoorArmAreaStateRCV(const Value: Boolean);
    procedure SetCardDownLoadStart(const Value: Boolean);
    procedure SetKTTCDMADATARCV(const Value: string);
    procedure SetKTTCDMAUSERCV(const Value: string);
    procedure SetKTTREMOTERINGCOUNTRCV(const Value: string);
    procedure SetARMEXTENTIONMAINFROMLOCALRCV(const Value: string);
    procedure SetARMEXTENTIONMAINFROMLOCAL(const Value: string);
    procedure SetARMEXTENTIONMAINTOLOCALRCV(const Value: string);
    procedure SetARMEXTENTIONMAINTOLOCAL(const Value: string);
    procedure SetDVRDATARCV(const Value: string);
    procedure SetDVRIP(const Value: string);
    procedure SetDVRPORT(const Value: string);
    procedure SetDVRUSERCV(const Value: string);
    procedure SetDVRUSE(const Value: string);
    procedure SetECUUSERCV(const Value: string);
    procedure SetKTTCDMAMIN(const Value: string);
    procedure SetKTTCDMAMUX(const Value: string);
    procedure SetKTTCDMAIP(const Value: string);
    procedure SetKTTCDMAPORT(const Value: string);
    procedure SetKTTCDMACHECKTIME(const Value: string);
    procedure SetKTTCDMARSSI(const Value: string);
    procedure SetKTTCDMAUSE(const Value: string);
    procedure SetKTTREMOTEARMRINGCOUNT(const Value: integer);
    procedure SetKTTREMOTEDISARMRINGCOUNT(const Value: integer);
    procedure SetKTTSYSTEMIDRCV(const Value: string);
    procedure SetKTTSYSTEMID(const Value: string);
    procedure SetKTTTELNUMBERRCV(const Value: string);
    procedure SetKTTTELNUMBER1(const Value: string);
    procedure SetKTTTELNUMBER2(const Value: string);
    procedure SetFireEvent(const Value: Boolean);
    procedure SetARMEXTENTIONSKILL(const Value: Boolean);
    procedure SetDVRSKILL(const Value: Boolean);
    procedure SetReciveStateChange(const Value: Boolean);
    procedure SetKTTCDMASKILL(const Value: Boolean);
    procedure SetARMEXTENTIONGUBUN(const Value: string);
    procedure SetFIREGUBUNCODE(const Value: string);
  protected
    procedure WndProc ( var Message : TMessage ); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function  ECUConnected(aECUID:string;aConnected:TConnectedState):Boolean;
    function  ECUUsed(aECUID:string;aUsed:Boolean):Boolean;
    function  HandleAllocated : Boolean;
    procedure HandleNeeded;
    procedure handle_fd_close_notification(p_socket: Integer);
    procedure handle_fd_connect_notification(p_socket: Integer);
    procedure handle_fd_read_notification(p_socket: tSocket);
    procedure handle_fd_write_notification(p_socket: Integer);
    procedure handle_wm_async_select(var Msg: TMessage); message wm_asynch_select;
    Function  NodeDataPacketProcess(aPacketData:RawByteString):Boolean;
    procedure NodeDataReadingProcessing;
    function  PutString(aData:string):Boolean;
    Procedure SendPacket(aEcuId: String;aCmd:Char;aMsgNo:char;aDeviceVer, aData: String;aPriority:integer=0);
    procedure SocketError(Sender: TObject; SocketError: Integer);
    procedure SocketReceive(Sender: TObject; Buf: PAnsiChar;var DataLen: Integer);
  public
    function GetDeviceDoorArmaAreaState(aEcuID:string):string;
    function GetDeviceIDArmAreaInformation(aCmd:integer;aEcuID,aSubNo:string):string;
    function GetDeviceIDCardReaderInformation(aCmd:integer;aEcuID,aSubNo:string):string;
    function GetDeviceIDDoorInformation(aCmd:integer;aEcuID,aSubNo:string):string;
    function GetDeviceIDExtentionInformation(aCmd:integer;aEcuID,aSubNo:string):string;
    function GetDeviceIDInformation(aCmd:integer;aEcuID:string):string;  //ECU ����
    function GetDeviceIDSubInformation(aSubType,aCmd:integer;aEcuID,aSubNo:string):string;  // ����
    function GetDeviceIDZoneInformation(aCmd:integer;aEcuID,aZoneID:string):string;
    function GetDeviceIndexArmAreaInformation(aCmd,aIndex,aSubIndex:integer):string;
    function GetDeviceIndexCardReaderInformation(aCmd,aIndex,aSubIndex:integer):string;
    function GetDeviceIndexDoorInformation(aCmd,aIndex,aSubIndex:integer):string;
    function GetDeviceIndexExtentionInformation(aCmd,aIndex,aSubIndex:integer):string;
    function GetDeviceIndexInformation(aCmd,aIndex:integer):string;  //ECU ����
    function GetDeviceIndexSubInformation(aSubType,aCmd,aIndex,aSubIndex:integer):string;  //�������
    function GetDeviceIndexZoneInformation(aCmd,aEcuIndex,aExtentionIndex,aZoneNo:integer):string;  //�������
    function GetDeviceVer:string;
    function GetNodeIndexInformation(aCmd:integer):string;  //ECU ����
    function GetSendMsgNo:char;
    function SetDeviceHoliday(aEcuID,aDay,aValue:string):Boolean;
    function SetDeviceIDInformation(aCmd:integer;aEcuID,aValue:string):Boolean;
    function SetDeviceIDSubInformation(aSubType,aCmd:integer;aEcuID,aSubNo,aValue:string):Boolean;  //�������
    function SetDeviceRcvIDInformation(aCmd:integer;aEcuID,aValue:string):Boolean;
    function SetDeviceRcvIDSubInformation(aSubType,aCmd:integer;aEcuID,aSubNo,aValue:string):Boolean;  //�������
    function SetHolidayClear:Boolean;
    function SetNodeIndexInformation(aCmd,aIndex:integer;aValue:string):string;  //ECU ����
    procedure SetNodeToCardPermitExcute(aEcuID,aCardNo,aRcvAck:string);
    procedure SetNodeToCardPermitSetting(aEcuID,aExtendID,aCardNo,aPermit,aCardState,aType,aNumber,
          aPositionNum,aTimeCodeUse,aTCGroup,aTime1,aTime2,aTime3,aTime4,aWeekCode,aRegDate,aEndDate,aEmState:string);
    //��Ʈ�ѷ� �ʱ����
    procedure SetNodeToCardPermitInitialize(aEcuID,aExtendID,aCardNo,aCardPermit,aCardState,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
            aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8,aRcvAck,aPositionNum,
            aTimeCodeUse,aTCGroup,aTime1,aTime2,aTime3,aTime4,aTCWeekCode,aRegDate,aEndDate,aEmState:string);
    procedure ControlNodeToDeviceRegDeviceID(aDeviceID:string);  //��Ʈ�ѷ� ID ����
  public
    procedure ServerSocketClose;
    //Server Socket
    procedure ServerSocketRead;
  public
    //����
    procedure DeviceCardSort;
    procedure ControlNodeToDeviceArmAreaStateCheck(aEcuID,aArmAreaNo :string); //������� ���� ������
    procedure ControlNodeToDeviceCardResend(aEcuID :string); //��Ʈ�ѷ� ī�� ������
    procedure ControlNodeToDeviceReset(aEcuID:string);   //��Ʈ�ѷ�����
    procedure ControlNodeToDeviceTimeSync;               //��Ʈ�ѷ� �ð� ����ȭ
    procedure FireDoorOpen(aFireGubunCode:string);
    procedure FireRecovery;

  published
    property Handle : THandle read GetHandle;
    property LastReceiveTime : TDateTime read FLastReceiveTime write FLastReceiveTime;
    property NodeConnected : TConnectedState read FNodeConnected write SetNodeConnected;
    property NodeDestory : Boolean read FNodeDestory write FNodeDestory;
    property SocketOpen : Boolean read FSocketOpen write SetSocketOpen;
    property WinSocket : tSocket read FWinSocket write FWinSocket;
  published
    //���� ���α׷� ����
    property ARMEXTENTIONGUBUN : string read FARMEXTENTIONGUBUN write SetARMEXTENTIONGUBUN;
    property ARMEXTENTIONMAINFROMLOCAL : string read FARMEXTENTIONMAINFROMLOCAL write SetARMEXTENTIONMAINFROMLOCAL;
    property ARMEXTENTIONMAINTOLOCAL : string read FARMEXTENTIONMAINTOLOCAL write SetARMEXTENTIONMAINTOLOCAL;
    property ARMEXTENTIONSKILL : Boolean read FARMEXTENTIONSKILL write SetARMEXTENTIONSKILL;
    property DVRIP : string read FDVRIP write SetDVRIP; //DVR IP
    property DVRPORT : string read FDVRPORT write SetDVRPORT; //DVR Port
    property DVRSKILL : Boolean read FDVRSKILL write SetDVRSKILL;   //DVR ��� ����
    property DVRUSE : string read FDVRUSE write SetDVRUSE; //DVR ��� ���� 0.�̻��,1.���
    property FIREGUBUNCODE : string read FFIREGUBUNCODE write SetFIREGUBUNCODE; //ȭ��׷��ڵ�
    property FireEvent : Boolean read FFireEvent write SetFireEvent;
    property KTTCDMACHECKTIME : string read FKTTCDMACHECKTIME write SetKTTCDMACHECKTIME; //CDMA check time
    property KTTCDMAMIN : string read FKTTCDMAMIN write SetKTTCDMAMIN;
    property KTTCDMAMUX : string read FKTTCDMAMUX write SetKTTCDMAMUX;
    property KTTCDMAIP : string read FKTTCDMAIP write SetKTTCDMAIP;     //CDMA IP
    property KTTCDMAPORT : string read FKTTCDMAPORT write SetKTTCDMAPORT; //CDMA Port
    property KTTCDMARSSI : string read FKTTCDMARSSI write SetKTTCDMARSSI; //CDMA rssi
    property KTTCDMASKILL : Boolean read FKTTCDMASKILL write SetKTTCDMASKILL;   //CDMA ��� ����
    property KTTCDMAUSE : string read FKTTCDMAUSE write SetKTTCDMAUSE; //CDMA ��� ���� 0.�̻��,1.���
    property KTTREMOTEARMRINGCOUNT : integer read FKTTREMOTEARMRINGCOUNT write SetKTTREMOTEARMRINGCOUNT;  //���ݰ��� ��Ƚ��
    property KTTREMOTEDISARMRINGCOUNT : integer read FKTTREMOTEDISARMRINGCOUNT write SetKTTREMOTEDISARMRINGCOUNT;  //���������� ��Ƚ��
    property KTTSYSTEMID : string read FKTTSYSTEMID write SetKTTSYSTEMID;  //���� �ý��� ���̵�
    property KTTTELNUMBER1 : string read FKTTTELNUMBER1 write SetKTTTELNUMBER1;  //���� ���ڴ� ��ȭ��ȣ1
    property KTTTELNUMBER2 : string read FKTTTELNUMBER2 write SetKTTTELNUMBER2;  //���� ���ڴ� ��ȭ��ȣ2
    property MaxEcuCount : integer read FMaxEcuCount write FMaxEcuCount;
  published
    //���Ż��� ����
    property ARMEXTENTIONMAINTOLOCALRCV : string read FARMEXTENTIONMAINTOLOCALRCV write SetARMEXTENTIONMAINTOLOCALRCV;
    property ARMEXTENTIONMAINFROMLOCALRCV : string read FARMEXTENTIONMAINFROMLOCALRCV write SetARMEXTENTIONMAINFROMLOCALRCV;
    property CardDownLoadStart : Boolean Read FCardDownLoadStart write SetCardDownLoadStart;
    property DVRDATARCV : string read FDVRDATARCV write SetDVRDATARCV; //DVR IP
    property DVRUSERCV : string read FDVRUSERCV write SetDVRUSERCV; //DVR ��� ���� 0.�̻��,1.���
    property DoorArmAreaStateRCV : Boolean read FDoorArmAreaStateRCV write SetDoorArmAreaStateRCV;
    property ECUUSERCV : string read FECUUSERCV write SetECUUSERCV;  //ECU ������� ����
    property KTTCDMADATARCV : string read FKTTCDMADATARCV write SetKTTCDMADATARCV;     //CDMA DATA
    property KTTCDMAUSERCV : string read FKTTCDMAUSERCV write SetKTTCDMAUSERCV; //CDMA ��� ���� 0.�̻��,1.���
    property KTTREMOTERINGCOUNTRCV : string read FKTTREMOTERINGCOUNTRCV write SetKTTREMOTERINGCOUNTRCV;  //���ݰ��� ��Ƚ��
    property KTTSYSTEMIDRCV : string read FKTTSYSTEMIDRCV write SetKTTSYSTEMIDRCV;  //���� �ý��� ���̵�
    property KTTTELNUMBERRCV : string read FKTTTELNUMBERRCV write SetKTTTELNUMBERRCV;  //���� ���ڴ� ��ȭ��ȣ1

    property ReciveStateChange : Boolean read FReciveStateChange write SetReciveStateChange; //���� ���� ���� ����
  published
    Property DeviceID:string Read FDeviceID write SetDeviceID;   //��� ���̵� 7�ڸ�
    property InfoInitialize : Boolean Read FInfoInitialize write FInfoInitialize;
    property LastNetworkState:string Read FLastNetworkState write SetLastNetworkState;
    Property No: Integer Read FNo write SetNo;
    property NodeName : string read FNodeName write FNodeName;
    property NODEIP : string Read FNODEIP write FNODEIP;
    property NodePort : integer Read FNodePort Write FNodePort;
    property SocketType : integer read FSocketType write FSocketType;  //���� Ÿ�� 1.PC -> ���,2.PC <- ���
  published
    //AntiPass �̺�Ʈ
    property OnAntiPassDataEvent : TAntiPassEvent read FOnAntiPassDataEvent write FOnAntiPassDataEvent;               //������ ����
    //��� �̺�Ʈ
    property OnArmAreaPacketChange : TArmAreaPacket read FOnArmAreaPacketChange write FOnArmAreaPacketChange;
    property OnAutoDownLoadStart : TNotifyReceive read FOnAutoDownLoadStart write FOnAutoDownLoadStart;
    //ī�嵥���� �̺�Ʈ �߻�
    property OnCardPermitAllLoading: TNotifyReceive read FOnCardPermitAllLoading write FOnCardPermitAllLoading;
    property OnCardPermitChange : TCardPermitPacket read FOnCardPermitChange write FOnCardPermitChange;
    property OnCardPermitLoading : TCardPermitLoading read FOnCardPermitLoading write FOnCardPermitLoading;
    property OnCardRcvAckChange : TCardRcvPacket read FOnCardRcvAckChange write FOnCardRcvAckChange;
    property OnCardReaderPacketChange : TCardReaderPacket read FOnCardReaderPacketChange write FOnCardReaderPacketChange;
    property OnCurrentAlarmEvent: TAlarmEvent read FOnCurrentAlarmEvent write FOnCurrentAlarmEvent;
    property OnCurrentDoorState : TDoorStatePacket read FOnCurrentDoorState write FOnCurrentDoorState;
    property OnDeviceCardAccessEvent : TDeviceCardAccessEvent read FOnDeviceCardAccessEvent write FOnDeviceCardAccessEvent;
    ProPerty OnDeviceConnected : TDeviceConnect read FOnDeviceConnected Write FOnDeviceConnected;
    property OnDeviceNodeServerPacketChange : TDeviceNodeServerPacket read FOnDeviceNodeServerPacketChange write FOnDeviceNodeServerPacketChange;
    property OnDevicePacketChange : TDevicePacket read FOnDevicePacketChange write FOnDevicePacketChange;
    ProPerty OnDeviceUsed : TDeviceUsed read FOnDeviceUsed Write FOnDeviceUsed;
    property OnDoorPacketChange:TDoorPacket read FOnDoorPacketChange write FOnDoorPacketChange;
    property OnDoorHolidaySend:TDoorPacket read FOnDoorHolidaySend write FOnDoorHolidaySend;
    property OnEmployeePermitAllLoading: TNotifyReceive read FOnEmployeePermitAllLoading write FOnEmployeePermitAllLoading;
    property OnNodePacket : TNodePacket read FOnNodePacket write FOnNodePacket;
    ProPerty OnRcvData : TNotifyReceive read FOnRcvData write FOnRcvData;
    ProPerty OnRcvInvalidDevice: TNotifyReceive read FOnRcvInvalidDevice write FOnRcvInvalidDevice;
    property OnReceiveData : TReceiveTypeChange read FOnReceiveData write FOnReceiveData;                //������ ����
    property OnReceiveTypeChage : TReceiveTypeChange read FOnReceiveTypeChage write FOnReceiveTypeChage; //���Ż��� ����
    ProPerty OnSendData : TNotifyReceive read FOnSendData write FOnSendData;
    property OnZONEEXTENDTYPEChange :TZoneExtentionPacket read FOnZONEEXTENDTYPEChange write FOnZONEEXTENDTYPEChange;
    property OnZonePacketChange : TZonePacket read FOnZonePacketChange write FOnZonePacketChange;
  End;

  TdmNode = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmNode: TdmNode;

implementation
uses
  uAlarmEventStateCode,
  uCommonFunction,
  uCommonVariable,
  uDevice,
  uDevicePacket;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TNode }

procedure TNode.AddDevice(aEcuID: string;aDeviceUse:Boolean);
var
  oDevice : TDevice;
  nIndex : integer;
begin
  nIndex := NodeDeviceList.IndexOf(aEcuID);
  if nIndex < 0 then
  begin
    oDevice := TDevice.Create(nil);
    oDevice.DeviceNode := self;
    oDevice.EcuID := aEcuID;
    oDevice.DeviceUse := aDeviceUse;
    oDevice.OnArmAreaPacketChange := ArmAreaPacketChange;
    oDevice.OnCardPermitChange := CardPermitChange;
    ODevice.OnCardPermitLoading := CardPermitLoading;
    oDevice.OnCardRcvAckChange := CardRcvAckChange;
    oDevice.OnCardReaderPacketChange := CardReaderPacketChange;
    oDevice.OnCardPermit := CardPermitAllLoading; //��Ʈ�ѷ��� ī������� ��� �ε� ����.
    oDevice.OnCurrentAlarmEvent := CurrentAlarmEvent;
    oDevice.OnCurrentDoorState  := CurrentDoorState;
    oDevice.OnDeviceCardAccessEvent := DeviceCardAccessEvent;
    oDevice.OnDeviceConnected := DeviceConnectedEvent;
    oDevice.OnDevicePacketChange := DevicePacketChange;
    oDevice.OnDeviceUsed := DeviceUsedEvent;
    oDevice.OnDeviceReceiveDataEvent := DeviceReceiveData;
    oDevice.OnDoorPacketChange := DoorPacketChange;
    oDevice.OnDoorHolidaySend := DoorHolidaySend;
    oDevice.OnEmployeePermit := EmployeePermitAllLoading; //��Ʈ�ѷ��� ��������� ��� �ε�����.
    oDevice.OnReceiveTypeChage := DeviceReceiveTypeChage;
    oDevice.OnZONEEXTENDTYPEChange := ZONEEXTENDTYPEChange;
    oDevice.OnZonePacketChange := ZonePacketChange;

    NodeDeviceList.AddObject(aEcuID,oDevice);
  end else
  begin
    TDevice(NodeDeviceList.objects[nIndex]).DeviceUse := aDeviceUse;
  end;
end;

procedure TNode.ArmAreaPacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
  if Assigned(FOnArmAreaPacketChange) then
  begin
    OnArmAreaPacketChange(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
  end;
end;

procedure TNode.CardDownLoadTimerTimer(Sender: TObject);
var
  i : integer;
  bResult : Boolean;
begin
  if G_bApplicationTerminate then Exit;

  if G_bCardDownLoading[NO] then Exit;
  if NodeDestory then Exit;
  CardDownLoadTimer.Enabled := False;
  Try
    G_bCardDownLoading[NO] := True;
    //���⼭ ī�嵥���� �ٿ�ε� ����.
    if G_nCardDownLoadEcuSeq[NO] > NodeDeviceList.Count - 1 then G_nCardDownLoadEcuSeq[NO] := 0;

    Try
      for i := G_nCardDownLoadEcuSeq[NO] to NodeDeviceList.Count - 1 do
      begin
        if NodeDestory then Exit;
        if (TDevice(NodeDeviceList.Objects[i]).DEVICECONNECTED = csConnected) and Not TDevice(NodeDeviceList.Objects[i]).CardDownloadRCV then
        begin
          TDevice(NodeDeviceList.Objects[i]).AutoCardDownloadStart;
          if NodeDestory then Exit;
          if Assigned(FOnAutoDownLoadStart) then
            OnAutoDownLoadStart(self,NO,TDevice(NodeDeviceList.Objects[i]).EcuId + ' CardDownLoad Start ');

          break;
        end else G_nCardDownLoadEcuSeq[NO] := i;
      end;

      if G_nCardDownLoadEcuSeq[NO] = NodeDeviceList.Count - 1 then
      begin
        bResult := True;
        for i := 0 to NodeDeviceList.Count - 1 do
        begin
          if NodeDestory then Exit;
          if Not TDevice(NodeDeviceList.Objects[i]).CardDownloadRCV then //�ٿ�ε� ���� ���� ��Ʈ�ѷ��� ������
          begin
            bResult := False;
            break;
          end;
        end;
        //if bResult then CardDownLoadTimer.Enabled := False;  //��ü �ٿ�ε� �Ϸ�� Ÿ�̸� ����
      end;
      G_nCardDownLoadEcuSeq[NO] := G_nCardDownLoadEcuSeq[NO] + 1;
    Except
      G_nCardDownLoadEcuSeq[NO] := G_nCardDownLoadEcuSeq[NO] + 1;
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.CardDownLoadTimerTimer');
    End;
  Finally
    CardDownLoadTimer.Enabled := Not G_bApplicationTerminate;
    G_bCardDownLoading[NO] := False;
  End;
end;

procedure TNode.CardPermitAllLoading(Sender: TObject; aNodeNo: integer;
  aData: string);
begin
  if Assigned(FOnCardPermitAllLoading) then
  begin
    OnCardPermitAllLoading(Self,aNodeNo,aData);
  end;

end;

procedure TNode.CardPermitChange(Sender: TObject; aNodeNo: integer; aEcuID,
  aCardNo, aPermit, aDoorPermit, aArmAreaPermit, aTimeCodeUse, aTimeCodeGroup,
  aTimeData, aWeekCode: string);
begin
  if Assigned(FOnCardPermitChange) then
  begin
    OnCardPermitChange(Self,aNodeNo,aEcuID,aCardNo,aPermit,aDoorPermit,aArmAreaPermit,aTimeCodeUse,aTimeCodeGroup,aTimeData,aWeekCode);
  end;
end;

procedure TNode.CardPermitLoading(Sender: TObject; aCardNo: string);
begin
  if Assigned(FOnCardPermitLoading) then
  begin
    OnCardPermitLoading(Self,aCardNo);
  end;

end;

procedure TNode.CardRcvAckChange(Sender: TObject; aNodeNo: integer; aEcuID,
  aCardNo, aRcvAck: string;aPermit:Boolean);
begin
  if Assigned(FOnCardRcvAckChange) then
  begin
    OnCardRcvAckChange(Self,aNodeNo,aEcuID,aCardNo,aRcvAck,aPermit);
  end;
end;

procedure TNode.CardReaderPacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
    if Assigned(FOnCardReaderPacketChange) then
    begin
      OnCardReaderPacketChange(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
    end;
end;

procedure TNode.ControlNodeToDeviceArmAreaStateCheck(aEcuID,
  aArmAreaNo: string);
var
  nIndex : integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    if Not isDigit(aArmAreaNo) then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).DeviceArmAreaStateCheck(strtoint(aArmAreaNo));
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ControlNodeToDeviceArmAreaStateCheck');
  End;
end;

procedure TNode.ControlNodeToDeviceCardResend(aEcuID: string);
var
  nIndex : integer;
begin
  Try
    nIndex := FTPDownEcuList.IndexOf(aEcuID);
    if nIndex > -1 then Exit;
    FTPDownEcuList.Add(aEcuID);
    FTPCardDownLoadTimer.Enabled := True;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ControlNodeToDeviceArmAreaStateCheck');
  End;
end;

procedure TNode.ControlNodeToDeviceRegDeviceID(aDeviceID: string);
var
  nIndex : integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf('00'); //���θ� �ش� �ϴ°���
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceID(aDeviceID);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ControlNodeToDeviceRegDeviceID');
  End;
end;

procedure TNode.ControlNodeToDeviceReset(aEcuID: string);
var
  nIndex : integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).DeviceReset;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ControlNodeToDeviceReset');
  End;
end;

procedure TNode.ControlNodeToDeviceTimeSync;
var
  nIndex : integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf('00');
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).TimeSync;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ControlNodeToDeviceTimeSync');
  End;
end;

constructor TNode.Create(AOwner: TComponent);
var
  i : integer;
begin
  inherited;

  FTCSDeviceSender := TCriticalSection.Create;
  NodeDestory := False;

  NodeDeviceList := TStringList.Create;
  ConnectDeviceList := TStringList.Create;

  Send1stDataList := TStringList.Create;
  Send2ndDataList := TStringList.Create;
  Send3rdDataList := TStringList.Create;
  Send4thDataList := TStringList.Create;

  FTPDownEcuList := TStringList.Create;

  CardDownLoadTimer := TTimer.Create(nil);
  CardDownLoadTimer.Interval := 500;
  CardDownLoadTimer.OnTimer := CardDownLoadTimerTimer;
  CardDownLoadTimer.Enabled := False;

  FireRecoveryTimer := TTimer.Create(nil);
  FireRecoveryTimer.Interval := 10000;
  FireRecoveryTimer.OnTimer := FireRecoveryTimerTimer;
  FireRecoveryTimer.Enabled := False;
  G_bFireEvent[NO] := False;

  FTPCardDownLoadTimer := TTimer.Create(nil);
  FTPCardDownLoadTimer.Interval := 10000;
  FTPCardDownLoadTimer.OnTimer := FTPCardDownLoadTimerTimer;
  FTPCardDownLoadTimer.Enabled := False;

  NodeSendPacketTimer := TTimer.Create(nil);
  NodeSendPacketTimer.Interval := 20;
  NodeSendPacketTimer.OnTimer := NodeSendPacketTimerTimer;
  NodeSendPacketTimer.Enabled := False;

  NRCheckTimer := TTimer.Create(nil);
  NRCheckTimer.Interval := 60000;
  NRCheckTimer.OnTimer := NRCheckTimerTimer;
  NRCheckTimer.Enabled := False;

  NFCheckTimer := TTimer.Create(nil);
  NFCheckTimer.Interval := 60000;
  NFCheckTimer.OnTimer := NFCheckTimerTimer;
  NFCheckTimer.Enabled := False;

  RcvCheckTimer := TTimer.Create(nil);
  RcvCheckTimer.Interval := 20000;
  RcvCheckTimer.OnTimer := RcvCheckTimerTimer;
  RcvCheckTimer.Enabled := False;

  StateCheckTimer := TTimer.Create(nil);
  StateCheckTimer.Interval := 5000;
  StateCheckTimer.OnTimer := StateCheckTimerTimer;
  StateCheckTimer.Enabled := False;

  G_nSendMsgNo[NO] := 0;
  for i := 0 to HIGH(L_cNodeRCVSTATE) do
  begin
    L_cNodeRCVSTATE[i] := 'Y';
  end;
  AddDevice(FillZeroNumber(0,2),True);  //��� �߰��� ���� �������� ����...

(*  for i := 0 to 63 do
  begin
    AddDevice(FillZeroNumber(i,2),True);  //��� �߰��� ���� �������� ����...
  end;  *)

  if G_nMonitoringType = 1 then ECUUSERCV := 'Y'
  else ECUUSERCV := 'N';
end;

procedure TNode.CurrentAlarmEvent(Sender: TObject; aNodeNo, aECUID, aCmd,
  aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
  aAlarmColor: string);
begin
  if (aZoneState <> 'N') and (aAlarmStateCode = G_stFireStateCode) then
  begin
    FireRecoveryTimer.Enabled := False;
    G_bFireEvent[NO] := True;
  end;

  if Assigned(FOnCurrentAlarmEvent) then
  begin
    OnCurrentAlarmEvent(Self,aNodeNo,aECUID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                        aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor);
  end;

end;

procedure TNode.CurrentDoorState(Sender: TObject; aNodeNo: integer; aEcuID,
  aExtendID, aNumber, aCardMode, aDoorMode, aDoorState, aLockState,
  aDoorFire: string);
begin
  if Assigned(FOnCurrentDoorState) then
  begin
    OnCurrentDoorState(self,aNodeNo,aEcuID,aExtendID,aNumber, aCardMode, aDoorMode, aDoorState, aLockState,aDoorFire);
  end;
end;

destructor TNode.Destroy;
var
  i : integer;
begin
  NodeDestory := True;

  FTCSDeviceSender.Free;

  ConnectDeviceList.free;
  if NodeDeviceList.count > 0 then
  begin
    for i := 0 to NodeDeviceList.count - 1 do
      TDevice(NodeDeviceList.objects[i]).free;
  end;

  CardDownLoadTimer.Enabled := False;
  FireRecoveryTimer.Enabled := False;
  FTPCardDownLoadTimer.Enabled := False;
  NodeSendPacketTimer.Enabled := False;
  RcvCheckTimer.Enabled := False;
  StateCheckTimer.Enabled := False;
  NFCheckTimer.enabled := False;
  NRCheckTimer.enabled := False;

  CardDownLoadTimer.Free;
  FireRecoveryTimer.Free;
  FTPCardDownLoadTimer.Free;
  NodeSendPacketTimer.Free;
  RcvCheckTimer.Free;
  StateCheckTimer.Free;
  NFCheckTimer.free;
  NRCheckTimer.free;

  NodeDeviceList.Free;
  Send1stDataList.Free;
  Send2ndDataList.Free;
  Send3rdDataList.Free;
  Send4thDataList.Free;

  FTPDownEcuList.Free;

  G_c_reception_buffer[NO].Free;
  inherited;
end;

procedure TNode.DeviceCardAccessEvent(Sender: TObject; aNodeNo, aECUID, aDoorNo,
  aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
  aDoorState, aATButton, aCardNo, aType, aArmAreaNo, aAntiGroup: string);
begin
    if Assigned(FOnDeviceCardAccessEvent) then
    begin
      OnDeviceCardAccessEvent(Self,aNodeNo, aECUID, aDoorNo,aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
                    aDoorState, aATButton, aCardNo, aType, aArmAreaNo,aAntiGroup);
    end;

end;

procedure TNode.DeviceCardSort;
begin
  SendPacket('00','R',GetSendMsgNo,GetDeviceVer, 'SM2699Rst0000',1); //ī�� ��Ʈ ����
end;

procedure TNode.DeviceConnectedEvent(Sender: TObject; aSocketNo,
  aNodeNo: integer; aEcuID: string; aConnected: TConnectedState;
  aAntiGroupCode: string);
begin
    ECUConnected(aEcuID,aConnected);
    if Assigned(FOnDeviceConnected) then
    begin
      OnDeviceConnected(Self,aSocketNo,aNodeNo,aEcuID,aConnected,aAntiGroupCode);
    end;
end;

procedure TNode.DevicePacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aData: string);
begin
    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,aCmd,aNodeNo,aEcuID,aData);
    end;

end;

procedure TNode.DeviceReceiveData(Sender: TObject; aNodeNo: integer; aType,
  aEcuID, aExtendID, aNumber: string; aRcvInfoType: integer; aData: string);
var
  i : integer;
  nIndex : integer;
begin
  Try
    if aType = 'DEVICE' then
    begin
      case aRcvInfoType of
        con_DeviceCmdNetworkState :
        begin //��Ʈ�� ���� üũ��
          for i := 1 to Length(aData) do
          begin
            nIndex := NodeDeviceList.IndexOf(FillZeroNumber(i-1,2));
            if nIndex > -1 then
            begin
              if aData[i] = 'u' then
              begin
                //TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := False;   //������� üũ �Ͽ� ���� ����.
                TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected := csNothing;
              end else
              begin
                //TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := True;
                if aData[i] = '1' then
                  TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected := csConnected
                else TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected := csDisConnected;
              end;
            end else
            begin
              if aData[i] = '0' then
              begin
                AddDevice(FillZeroNumber(i-1,2),True);
                nIndex := NodeDeviceList.IndexOf(FillZeroNumber(i-1,2));
                if nIndex > -1 then
                begin
                  TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected := csDisConnected;
                end;
              end else if aData[i] = '1' then
              begin
                AddDevice(FillZeroNumber(i-1,2),True);
                nIndex := NodeDeviceList.IndexOf(FillZeroNumber(i-1,2));
                if nIndex > -1 then
                begin
                  TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected := csConnected;
                end;
              end;
            end;
          end;
        end;
        con_DeviceCmdUseState :  //Ecu ������� üũ��...
        begin
          for i := 2 to Length(aData) do
          begin
            nIndex := NodeDeviceList.IndexOf(FillZeroNumber(i-1,2));
            if nIndex > -1 then
            begin
              if aData[i] = '1' then
              begin
                TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := True;
              end else
              begin
                TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := False;
              end;
            end else
            begin
              if aData[i] = '1' then AddDevice(FillZeroNumber(i-1,2),True);
            end;
          end;
        end;
      end;
    end;
    if Assigned(FOnReceiveData) then
    begin
      OnReceiveData(Self,aNodeNo,aType,aEcuID,aExtendID,aNumber,aRcvInfoType,aData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.DeviceReceiveData');
  End;
end;

procedure TNode.DeviceReceiveTypeChage(Sender: TObject; aNodeNo: integer; aType,
  aEcuID, aExtendID, aNumber: string; aRcvInfoType: integer; aData: string);
begin
  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,aNodeNo,aType,aEcuID,aExtendID,aNumber,aRcvInfoType,aData);
  end;

end;

procedure TNode.DeviceUsedEvent(Sender: TObject; aNodeNo: integer; aType,
  aEcuID, aExtendID, aNumber: string; aUsed: Boolean);
begin
  if Assigned(FOnDeviceUsed) then
  begin
    OnDeviceUsed(Self,aNodeNo,aType,aEcuID,aExtendID,aNumber,aUsed);
  end;
end;

procedure TNode.DoorHolidaySend(Sender: TObject; aCmd, aNodeNo: integer; aEcuID,
  aExtendID, aNumber, aData: string);
begin
  if Assigned(FOnDoorHolidaySend) then
  begin
    OnDoorHolidaySend(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
  end;
end;

procedure TNode.DoorPacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
    if Assigned(FOnDoorPacketChange) then
    begin
      OnDoorPacketChange(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
    end;

end;

function TNode.ECUConnected(aECUID: string;
  aConnected: TConnectedState): Boolean;
var
  nIndex : integer;
begin
  result := True;
  Try
    if (aConnected = csConnected) then
    begin
      if ConnectDeviceList.IndexOf(aEcuID) < 0 then
      begin
        ConnectDeviceList.Add(aEcuID);
        DoorArmAreaStateRCV := False;
      end;
    end else
    begin
      if ConnectDeviceList.IndexOf(aEcuID) > -1 then ConnectDeviceList.Delete(ConnectDeviceList.IndexOf(aEcuID));
    end;

    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then
    begin
      AddDevice(aEcuID,True);
      nIndex := NodeDeviceList.IndexOf(aEcuID);
    end;
    if TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected = aConnected then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected := aConnected;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ECUConnected');
  End;
end;

function TNode.ECUUsed(aECUID: string; aUsed: Boolean): Boolean;
var
  nIndex : integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    if TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse = aUsed then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := aUsed;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ECUUsed');
  End;
end;

procedure TNode.EmployeePermitAllLoading(Sender: TObject; aNodeNo: integer;
  aData: string);
begin
  if Assigned(FOnEmployeePermitAllLoading) then
  begin
    OnEmployeePermitAllLoading(Self,aNodeNo,aData);
  end;

end;

procedure TNode.FireDoorOpen(aFireGubunCode: string);
begin
  if FireGubunCode = '' then Exit; //ȭ��׷� ��� ���ϴ� ���
  if FireGubunCode <> aFireGubunCode then Exit;
  FireRecoveryTimer.Enabled := False;
  G_bFireEvent[NO] := True;
  SendPacket('00','R',GetSendMsgNo,GetDeviceVer, 'SM2900Fire',1);

end;

procedure TNode.FireRecovery;
begin
  G_bFireEvent[NO] := False;
  SendPacket('00','R',GetSendMsgNo,GetDeviceVer, 'SM2699RSM2500',1);
  FireRecoveryTimer.Enabled := True;

end;

procedure TNode.FireRecoveryTimerTimer(Sender: TObject);
var
  i : integer;
  bResult : Boolean;
begin
  if G_bApplicationTerminate then Exit;
  if NodeDestory then Exit;

  FireRecoveryTimer.Enabled := False;
  if NodeDeviceList.Count < 1 then
  begin
    FireEvent := False;
    Exit;
  end;
  bResult := False;
  for i := 0 to NodeDeviceList.Count - 1 do
  begin
    if (TDevice(NodeDeviceList.Objects[i]).DEVICECONNECTED = csConnected) and
       (TDevice(NodeDeviceList.Objects[i]).FireEvent) then bResult := True;
  end;

  if bResult and Not G_bFireEvent[NO] then FireRecovery;

  FireEvent := bResult;
end;

procedure TNode.FTPCardDownLoadTimerTimer(Sender: TObject);
var
  nIndex : integer;
  i,j : integer;
begin
  if G_bApplicationTerminate then Exit;
  if NodeDestory then Exit;
  if G_bFTPCardDownLoading then Exit;
  G_bFTPCardDownLoading := True;
  Try
    Try
      if FTPDownEcuList.Count < 1 then
      begin
        FTPCardDownLoadTimer.Enabled := False;
        Exit;
      end;
      for i := 0 to FTPDownEcuList.Count - 1 do
      begin
        nIndex := NodeDeviceList.IndexOf(FTPDownEcuList.strings[i]);
        if nIndex < 0 then Exit;
        for j := 1 to 3 do // ���н� 3�� ������ �� ����
        begin
          if j = 1 then TDevice(NodeDeviceList.Objects[nIndex]).FTPFirst := True;

          if TDevice(NodeDeviceList.Objects[nIndex]).DeviceFTPCardDownLoadStart then
          begin
            FTPDownEcuList.Delete(i);
            break;
          end;
          if j > 2 then  //3 �� ���ۿ��� ���� �ϸ� ��ü�� ���� Ÿ������ ���� ó��
          begin
            TDevice(NodeDeviceList.Objects[nIndex]).DeviceCardAllResend;
          end;
        end;
      end;
    Except
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.FTPCardDownLoadTimerTimer');
    End;
  Finally
    G_bFTPCardDownLoading := False;
  End;
end;

function TNode.GetDeviceDoorArmaAreaState(aEcuID: string): string;
var
  nIndex : integer;
  stData : string;
  nTemp : integer;
  i : integer;
  nDoorFormatLength :integer;
  nArmAreaFormatLength :integer;
  nCardReaderFormatLength :integer;
begin
  Try
    nDoorFormatLength := 5;
    nArmAreaFormatLength := 1;
    nCardReaderFormatLength := 1;

    stData := '';
    result := '00'; //�����߻��� 0 ��ó��
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    nTemp := TDevice(NodeDeviceList.Objects[nIndex]).MaxDoorCount;
    stData := stData + char($30 + nTemp); //���Թ� �ִ� ����
    stData := stData + char($30 + nDoorFormatLength);     //���Թ��������˱���
    for i := 0 to nTemp - 1 do
    begin
      stData := stData + TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToDoorIndexState(i,nDoorFormatLength);
    end;
    stData := stData + char($30 + 9); //������� �ִ� ����  - 9
    stData := stData + char($30 + nArmAreaFormatLength);     //��������������˱���
    for i := 0 to 8 do
    begin
      stData := stData + TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToArmAreaIndexMode(i,nArmAreaFormatLength);
    end;
    nTemp := TDevice(NodeDeviceList.Objects[nIndex]).MaxReaderCount;
    stData := stData + char($30 + nTemp); //ī�帮�� �ִ� ����
    stData := stData + char($30 + nCardReaderFormatLength);     //ī�帮���������˱���
    for i := 0 to nTemp - 1 do
    begin
      stData := stData + TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToCardReaderIndexState(i,nCardReaderFormatLength);
    end;
    result := stData;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceDoorArmaAreaState');
  End;
end;

function TNode.GetDeviceIDArmAreaInformation(aCmd: integer; aEcuID,
  aSubNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToArmAreaIDInformation(aCmd,aSubNo);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDArmAreaInformation');
  End;
end;

function TNode.GetDeviceIDCardReaderInformation(aCmd: integer; aEcuID,
  aSubNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;

    case aCmd of
      con_CardReaderCmdBuildingPositionCode : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToCardReaderIDBuildingPosition(aSubNo);
      end;
      con_CardReaderCmdDoorPosition : begin  //���Թ� ��ġ
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToCardReaderIDDoorPosition(aSubNo);
      end;
      con_CardReaderCmdType : begin   //ī�帮�� Ÿ��
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToCardReaderIDType(aSubNo);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDCardReaderInformation');
  End;
end;

function TNode.GetDeviceIDDoorInformation(aCmd: integer; aEcuID,
  aSubNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToDoorIDInformation(aCmd,aSubNo);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDDoorInformation');
  End;
end;

function TNode.GetDeviceIDExtentionInformation(aCmd: integer; aEcuID,
  aSubNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToExtentionIDInformation(aCmd,aSubNo);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDExtentionInformation');
  End;
end;

function TNode.GetDeviceIDInformation(aCmd: integer; aEcuID: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    case aCmd of
      con_DeviceCmdArmAreaSKill : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).ARMAREASKILL then result := '1'
        else result := '0'
      end;
      con_DeviceCmdArmAreaState : begin
        result := GetDeviceDoorArmaAreaState(aEcuID);
      end;
      con_DeviceCmdArmAreaUse : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).ARMAREASKILL then result := TDevice(NodeDeviceList.Objects[nIndex]).ARMAREAUSE
        else result := '0';
      end;
      con_DeviceCmdArmInDelay : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[nIndex]).ARMINDELAY);
      end;
      con_DeviceCmdArmOutDelay : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[nIndex]).ARMOUTDELAY);
      end;
      con_DeviceCmdArmRelay : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).ARMRELAY;
      end;
      con_DeviceCmdDeviceDoor2RelayType : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).DOOR2RELAY;
      end;
      con_DeviceCmdDeviceDoor2Skill : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).DOOR2RELAYSKILL then result := '1'
        else result := '0';
      end;
      con_DeviceCmdDeviceType : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).DEVICETYPE;
      end;
      con_DeviceCmdDoorCount : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToDoorCount);
      end;
      con_DeviceCmdExtentionSkill : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).ExtendSkill then result := '1'
        else result := '0';
      end;
      con_DeviceCmdJaeJungDelaySkill : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).JAEJUNGSKILL then result := '1'
        else result := '0';
      end;
      con_DeviceCmdJaeJungDelayUse : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).JAEJUNGDELAYUSE;
      end;
      con_DeviceCmdDoorScheduleSkill : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).DEVICEScheduleSkill then result := '1'
        else result := '0';
      end;
      con_DeviceCmdJAVARAARMCLOSE : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).JAVARAARMCLOSE;
      end;
      con_DeviceCmdJAVARAAUTOCLOSE : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).JAVARAAUTOCLOSE;
      end;
      con_DeviceCmdTimeCodeSkill : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).TimeCodeSkill then result := '1'
        else result := '0';
      end;
      con_DeviceCmdWATCHACPOWER : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).WATCHACPOWER;
      end;
      con_DeviceDoorStateRCV : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).DoorStateRCV then result := 'TRUE'
        else result := 'FALSE';
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDInformation');
  End;
end;

function TNode.GetDeviceIDSubInformation(aSubType, aCmd: integer; aEcuID,
  aSubNo: string): string;
begin
  Try
    result := '';
    case aSubType of
      con_DeviceTypeArmArea : begin
        result := GetDeviceIDArmAreaInformation(aCmd,aEcuID,aSubNo);
      end;
      con_DeviceTypeDoor : begin
        result := GetDeviceIDDoorInformation(aCmd,aEcuID,aSubNo);
      end;
      con_DeviceTypeCardReader : begin
        result := GetDeviceIDCardReaderInformation(aCmd,aEcuID,aSubNo);
      end;
      con_DeviceTypeExtention : begin
        result := GetDeviceIDExtentionInformation(aCmd,aEcuID,aSubNo);
      end;
      con_DeviceTypeZone : begin
        result := GetDeviceIDZoneInformation(aCmd,aEcuID,aSubNo);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDSubInformation');
  End;
end;

function TNode.GetDeviceIDZoneInformation(aCmd: integer; aEcuID,
  aZoneID: string): string;
var
  nIndex : integer;
  stExtendID : string;
  stZoneNo : string;
begin
  Try
    result := '';
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    stExtendID := copy(aZoneID,1,2);
    stZoneNo := copy(aZoneID,3,2);
    if isDigit(stExtendID) then stExtendID := inttostr(strtoint(stExtendID))
    else stExtendID := '0';
    if isDigit(stZoneNo) then stZoneNo := inttostr(strtoint(stZoneNo))
    else stZoneNo := '0';

    case aCmd of
      con_ZoneCmdArmArea : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToZoneIDArmArea(stExtendID,stZoneNo);
      end;
      con_ZoneCmdDelayUse : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToZoneIDDelayUse(stExtendID,stZoneNo);
      end;
      con_ZoneCmdRecovery : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToZoneIDRecovery(stExtendID,stZoneNo);
      end;
      con_ZoneCmdType : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToZoneIDType(stExtendID,stZoneNo);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDZoneInformation');
  End;
end;

function TNode.GetDeviceIndexArmAreaInformation(aCmd, aIndex,
  aSubIndex: integer): string;
begin
  Try
    result := '';
    if aIndex > NodeDeviceList.Count - 1 then Exit;
    case aCmd of
      con_ArmAreaCmdName : begin
        result := TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToArmAreaName(aSubIndex);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexArmAreaInformation');
  End;
end;

function TNode.GetDeviceIndexCardReaderInformation(aCmd, aIndex,
  aSubIndex: integer): string;
begin
  Try
    result := '';
    if aIndex > NodeDeviceList.Count - 1 then Exit;
    case aCmd of
      con_CardReaderCmdArmAreaNo : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToCardReaderIndexArmAreaNo(aSubIndex));
      end;
      con_CardReaderCmdUse : begin
        if TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToCardReaderIndexUse(aSubIndex) then result := '1'
        else result := '0';
      end;
      con_CardReaderCmdDoorNo : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToCardReaderIndexDoorNo(aSubIndex));
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexCardReaderInformation');
  End;
end;

function TNode.GetDeviceIndexDoorInformation(aCmd, aIndex,
  aSubIndex: integer): string;
begin
  Try
    result := '';
    if aIndex > NodeDeviceList.Count - 1 then Exit;
    result := TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToDoorIndexInformation(aCmd,aSubIndex);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexDoorInformation');
  End;
end;

function TNode.GetDeviceIndexExtentionInformation(aCmd, aIndex,
  aSubIndex: integer): string;
begin
  Try
    result := '';
    if aIndex > NodeDeviceList.Count - 1 then Exit;
    case aCmd of
      con_ExtentionCmdZoneUse : begin
        result := TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToExtentionIndexUse(aSubIndex);
      end;
      con_ExtentionCmdZoneCount : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToExtentionIndexZoneCount(aSubIndex));
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexExtentionInformation');
  End;
end;

function TNode.GetDeviceIndexInformation(aCmd, aIndex: integer): string;
begin
  Try
    result := '';
    if aIndex > NodeDeviceList.Count - 1 then Exit;

    case aCmd of
      con_DeviceCmdDeviceID : begin
        result := TDevice(NodeDeviceList.Objects[aIndex]).EcuID;
      end;
      con_DeviceCmdDeviceName : begin
        result := TDevice(NodeDeviceList.Objects[aIndex]).DEVICENAME;
      end;
      con_DeviceCmdDeviceUSE : begin
        if TDevice(NodeDeviceList.Objects[aIndex]).DeviceUse then result := '1'
        else result := '0';
      end;
      con_DeviceCmdArmAreaUse : begin
        if TDevice(NodeDeviceList.Objects[aIndex]).ARMAREASKILL then result := TDevice(NodeDeviceList.Objects[aIndex]).ARMAREAUSE
        else result := '0';
      end;
      con_DeviceCmdArmAreaCount : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToArmAreaCount);
      end;
      con_DeviceCmdDoorCount : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToDoorCount);
      end;
      con_DeviceCmdCardReaderCount : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToCardReaderCount);
      end;
      con_DeviceCmdDeviceConnected : begin
        if TDevice(NodeDeviceList.Objects[aIndex]).DEVICECONNECTED = csConnected then result := '1'
        else result := '0';
      end;
      con_DeviceCmdZoneExtentionCount : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToExtentionCount);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexInformation');
  End;
end;

function TNode.GetDeviceIndexSubInformation(aSubType, aCmd, aIndex,
  aSubIndex: integer): string;
begin
  Try
    result := '';
    case aSubType of
      con_DeviceTypeArmArea : begin
        result := GetDeviceIndexArmAreaInformation(aCmd,aIndex,aSubIndex);
      end;
      con_DeviceTypeDoor : begin
        result := GetDeviceIndexDoorInformation(aCmd,aIndex,aSubIndex);
      end;
      con_DeviceTypeCardReader : begin
        result := GetDeviceIndexCardReaderInformation(aCmd,aIndex,aSubIndex);
      end;
      con_DeviceTypeExtention : begin
        result := GetDeviceIndexExtentionInformation(aCmd,aIndex,aSubIndex);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexSubInformation');
  End;
end;

function TNode.GetDeviceIndexZoneInformation(aCmd, aEcuIndex, aExtentionIndex,
  aZoneNo: integer): string;
begin
  Try
    result := '';
    if aEcuIndex > NodeDeviceList.Count - 1 then Exit;
    case aCmd of
      con_ZoneCmdName : begin
        result := TDevice(NodeDeviceList.Objects[aEcuIndex]).GetDeviceToExtentionIndexZoneName(aExtentionIndex,aZoneNo);
      end;
      con_ZoneCmdArmArea : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aEcuIndex]).GetDeviceToExtentionIndexZoneArmArea(aExtentionIndex,aZoneNo));
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexZoneInformation');
  End;
end;

function TNode.GetDeviceVer: string;
begin
  if G_stDeviceVer[NO] = '' then G_stDeviceVer[NO] := 'K1';

  Result := G_stDeviceVer[NO];
end;

function TNode.GetHandle: THandle;
begin
  HandleNeeded;
  Result := FHandle;
end;

function TNode.GetNodeIndexInformation(aCmd: integer): string;
begin
  Try
    result := '';
    case aCmd of
      con_DeviceCmdARMEXTENTIONGUBUN : begin
        result := ARMEXTENTIONGUBUN;
      end;
      con_DeviceCmdARMEXTENTIONMAINFROMLOCAL : begin
        result := ARMEXTENTIONMAINFROMLOCAL;
      end;
      con_DeviceCmdARMEXTENTIONMAINTOLOCAL : begin
        result := ARMEXTENTIONMAINTOLOCAL;
      end;
      con_DeviceCmdARMEXTENTIONSKILL : begin
        if ARMEXTENTIONSKILL then result := '1'
        else result := '0';
      end;
      con_DeviceCmdDVRIP : begin
        result := DVRIP;
      end;
      con_DeviceCmdDVRPORT : begin
        result := DVRPORT;
      end;
      con_DeivceCmdDVRSKILL : begin
        if DVRSKILL then result := '1'
        else result := '0';
      end;
      con_DeivceCmdDVRUSE : begin
        result := DVRUSE;
      end;
      con_DeviceCmdKTTREMOTEARMRINGCOUNT : begin
        result := inttostr(KTTREMOTEARMRINGCOUNT);
      end;
      con_DeviceCmdKTTREMOTEDisARMRINGCOUNT : begin
        result := inttostr(KTTREMOTEDISARMRINGCOUNT);
      end;
      con_DeviceCmdKTTSystemID : begin
        result := KTTSYSTEMID;
      end;
      con_DeviceCmdKTTTelNumber1 : begin
        result := KTTTELNUMBER1;
      end;
      con_DeviceCmdKTTTelNumber2 : begin
        result := KTTTELNUMBER2;
      end;
      con_NodeCmdDeviceCount : begin
        result := inttostr(NodeDeviceList.Count);
      end;
      con_NodeCmdDeviceRegState : begin
        result := GetRegEcuUseData;
      end;
      con_NodeCmdEcuMaxCount : begin
        result := inttostr(MaxEcuCount);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetNodeIndexInformation');
  End;
end;

function TNode.GetRegEcuUseData: string;
var
  i : integer;
  aData : String[100];
  aNo : integer;
begin
  aData :='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  for I:= 1 to NodeDeviceList.Count - 1  do
  begin
    Try
      aNo:= StrtoInt(NodeDeviceList.Strings[i]);
      if (aNo + 1) > Length(aData) then continue;
      if TDevice(NodeDeviceList.Objects[i]).DeviceUse then
         aData[aNo + 1]:= '1';
    Except
      continue;
    End;
  end;
  Result:= aData;
end;

function TNode.GetSendMsgNo: char;
begin
  result := inttostr(G_nSendMsgNo[NO])[1];
  G_nSendMsgNo[NO] := G_nSendMsgNo[NO] + 1;
  if G_nSendMsgNo[NO] > 9 then G_nSendMsgNo[NO] := 0;
end;

function TNode.HandleAllocated: Boolean;
begin
  Result := ( FHandle <> 0 );
end;

procedure TNode.HandleNeeded;
begin
  if not HandleAllocated
   then FHandle := AllocateHWND ( WndProc );
end;

procedure TNode.handle_fd_close_notification(p_socket: Integer);
var l_status: Integer;
    l_linger: TLinger;
    l_absolute_linger: array[0..3] of char absolute l_linger;
begin
  Try
    if WSAIsBlocking
      then
        begin
          WSACancelBlockingCall;
        end;

    ShutDown(p_socket, 2);
    l_linger.l_onoff:= 1;
    l_linger.l_linger:= 0;

    SetSockOpt(p_socket, Sol_Socket, So_Linger, pAnsichar(AnsiString(l_absolute_linger)), sizeof(l_linger));  //l_absolute_linger[0] -> AnsiString(l_absolute_linger) ���� ����

    l_status:= CloseSocket(p_socket);
    //if l_status <> 0 then
    NodeConnected := csDisConnected;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','handle_fd_close_notification');
  End;
end;

procedure TNode.handle_fd_connect_notification(p_socket: Integer);
begin
  NodeConnected := csConnected;
end;

procedure TNode.handle_fd_read_notification(p_socket: tSocket);
var l_remaining: Integer;
    l_pt_start_reception: Pointer;
    l_packet_bytes: Integer;
    l_eol_position: Integer;
begin
  Try
    if G_c_reception_buffer[NO] = nil then Exit;
    if NodeDestory then Exit;

    with G_c_reception_buffer[NO] do
    begin
      l_remaining:= m_buffer_size- m_write_index;

      // -- if not at least a tcp-ip chunk, increase the room
      if l_remaining < k_tcp_ip_chunk then
      begin
        // -- reallocate
        double_the_capacity;
        l_remaining:= m_buffer_size- m_write_index;
      end;

      // -- add the received data to the current buffer
      l_pt_start_reception:= @ m_oa_byte_buffer[m_write_index];

      // -- get the data from the client socket
      l_packet_bytes:= Recv(WinSocket, l_pt_start_reception^, l_remaining, 0);
      if l_packet_bytes < 0 then SocketError(self,WSAGetLastError)
      else
      begin
        m_write_index:= m_write_index+ l_packet_bytes;
        SocketReceive(self, l_pt_start_reception, l_packet_bytes);
        (*
        if l_packet_bytes > 0 then
        begin
          m_write_index := m_write_index + l_packet_bytes;

          // -- fetch the size
          l_eol_position:= f_return_line_feed_position(0);
          if (g_file_size= 0) and (l_eol_position> 0) then
          begin
            g_file_size:= StrToInt(f_extract_string_start_end(0, l_eol_position- 3));
            remove_from_start(l_eol_position);
          end;

        end; // if l_packet_bytes
        *)
      end;
    end; // with g_c_reception_buffer
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','handle_fd_read_notification');
  End;
end;

procedure TNode.handle_fd_write_notification(p_socket: Integer);
begin
  G_bSocketWriting[NO] := False; //���� �Ϸ�
end;

procedure TNode.handle_wm_async_select(var Msg: TMessage);
// -- wParam: hSocket, lo(lParam): notification, hi(lParam): error
var l_param: Integer;
    l_error, l_notification: Integer;
    l_socket_handle: Integer;

begin // handle_wm_async_select
  Try
    l_param:= Msg.lParam;
    l_socket_handle:= Msg.wParam;

    // -- extract the error and the notification code from l_param
    l_error:= wsaGetSelectError(l_param);
    l_notification:= wsaGetSelectEvent(l_param);

    if l_error <= wsaBaseErr then
    begin
        case l_notification of
          FD_CONNECT: handle_fd_connect_notification(l_socket_handle);
          FD_ACCEPT: {display_bug_stop('no_client_accept')} ;
          FD_WRITE: handle_fd_write_notification(l_socket_handle);
          FD_READ: handle_fd_read_notification(l_socket_handle);
          FD_CLOSE: handle_fd_close_notification(l_socket_handle);
        end // case
    end else
    begin
      if l_notification= FD_CLOSE then handle_fd_close_notification(l_socket_handle)
      else SocketError(self,l_error) ;//TcpClientError(self,WSAGetLastError);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.handle_wm_async_select');
  End;
end;

procedure TNode.NFCheckTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  if NodeDestory then Exit;
  NFCheckTimer.Enabled := False;
  LastNetworkState := 'NF';
end;

function TNode.NodeDataPacketProcess(aPacketData: RawByteString): Boolean;
var
  stECUID : string;
  stRealData : string;
  chCMD : char;
  chMsgNo : char;
  cKey : char;
  nIndex : integer;
  stTemp : String;
  stPacket : string;
begin
  stPacket := String(aPacketData);
  Try
    result := False;
    if aPacketData = '' then Exit;
    stTemp := copy(aPacketData,5,1);
    cKey := stTemp[1];
    DeviceID := Copy(aPacketData, 8, G_nIDLength);
    stECUID := copy(aPacketData,8 + G_nIDLength,2);
    stTemp := copy(aPacketData,G_nIDLength + 10,1);
    chCMD:= stTemp[1];
    stTemp := copy(aPacketData,G_nIDLength + 11,1);
    chMsgNo:= stTemp[1];
    G_stDeviceVer[NO] := copy(aPacketData,6,2);
    if Assigned(FOnNodePacket) then
    begin
      OnNodePacket(Self,No,NodeName,stECUID,chCMD,chMsgNo,G_stDeviceVer[NO],stPacket,'RX');
    end;
    //066*SK000000000Arn20140113144756MN0000d00***160000000000******81

    stRealData := Copy(aPacketData,G_nIDLength + 12,Length(aPacketData)-(G_nIDLength + 14));

    if G_stReceivedLastpacket[NO] = stPacket then
    begin
      if (chCMD <> 'c') AND (chCMD <> 'A') then   //�˶� ������ �Ǵ� �����̺�Ʈ�� �ƴϸ� Ack ����
      begin
        SendPacket(stECUID,'a',chMsgNo,G_stDeviceVer[NO], 'w000', 0); //Ack ����
      end;
      //���� ��Ŷ�� ���� ��Ŷ�� ������ ��������
      Exit;
    end;
    G_stReceivedLastpacket[NO] := stPacket;

    //if (pos('Bad Command',aPacketData) > 0) or (pos('COMM ERROR',aPacketData) > 0 ) or (pos('UNUSED',aPacketData) > 0 ) then
    if (pos('COMM ERROR',aPacketData) > 0 ) then
    begin
      ECUConnected(stECUID,csDisConnected);
    end else if (pos('UNUSED',aPacketData) > 0 ) then
    begin
      ECUUsed(stECUID,False);
      ECUConnected(stECUID,csDisConnected);
    end else
    begin
      if (chCMD <> 'A') and (chCMD <> 'o') then ECUConnected(stECUID,csConnected);//��ſ��� ������ ��쵵 ����
    end;

    if (chCMD = 'a') then
    begin
      Exit;
    end;

    {���� ������ Ŀ�ǵ庰 ó��}
    { ================================================================================
    "A" = Alarm Data
    "I" = Initial Data
    "R" = Remote Command
    "e" = ENQ
    "E" = ERROR
    "a" = ACK
    "n" = NAK
    "r" = Remote Answer
    "c" = Access Control data
    �� c(�������� ������)�ΰ�쿡�� ACK �� 'c' command�� ����� ������ �ؾ� �Ѵ�.
    �� ACK ������ �ι� �־�� �Ѵ�.(����ü ��Ŷ����,���������� ����)
    ================================================================================ }
    nIndex := NodeDeviceList.IndexOf(stECUID);
    if nIndex > -1 then
    begin
      case chCMD of
        'A','o':{�˶�}      begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceAlarmData(stECUID,G_stDeviceVer[NO],chMsgNo,chCMD,stRealData)         end;
        'i':{Initial}       begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRegDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)             end;
        'R':{Remote}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRemoteDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)          end;
        'r':{Remote Answer} begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRemoteDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)          end;
        'c':{��������}      begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceAccessDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)          end;
        'f':{�߿���}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceFirmwareProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)            end;
        'F':{�߿���}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceFirmwareProcess2(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)           end;
        '*':{��ε�ĳ��Ʈ}  begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceBroadCastProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)           end;
        'E':{ERROR}         begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceErrorDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)       end;
        'm':{���������� ����͸� } begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDevicePTMonitoringProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)  end;
        'M':{�޼������� }   begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceMessageProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)  end;
        '#':{������ �� ����͸�} begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceGageMonitor(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)            end;
        'e':{ENQ}           begin {ErrorDataProcess(stECUID,G_stDeviceVer,stRealData) }           end;
        else {error �߻�: [E003]���� ���� ���� Ŀ�ǵ�}  begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceErrorDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData) end;
      end;
    end else
    begin
      AddDevice(stECUID,True);
      nIndex := NodeDeviceList.IndexOf(stECUID);
      if nIndex > -1 then
      begin
        case chCMD of
          'A','o':{�˶�}      begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceAlarmData(stECUID,G_stDeviceVer[NO],chMsgNo,chCMD,stRealData)         end;
          'i':{Initial}       begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRegDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)             end;
          'R':{Remote}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRemoteDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)          end;
          'r':{Remote Answer} begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRemoteDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)          end;
          'c':{��������}      begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceAccessDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)          end;
          'f':{�߿���}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceFirmwareProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)            end;
          'F':{�߿���}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceFirmwareProcess2(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)           end;
          '*':{��ε�ĳ��Ʈ}  begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceBroadCastProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)           end;
          'E':{ERROR}         begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceErrorDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)       end;
          'm':{���������� ����͸� } begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDevicePTMonitoringProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)  end;
          'M':{�޼������� }   begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceMessageProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)  end;
          '#':{������ �� ����͸�} begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceGageMonitor(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)            end;
          'e':{ENQ}           begin {ErrorDataProcess(stECUID,G_stDeviceVer,stRealData) }           end;
          else {error �߻�: [E003]���� ���� ���� Ŀ�ǵ�}  begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceErrorDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData) end;
        end;
      end
    end;

    if (chCMD <> 'c') then
    begin
      SendPacket(stECUID,'a',chMsgNo,G_stDeviceVer[NO], 'w000', 0); //Ack ����
    end;

    Result:= True;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeDataPacketProcess');
  End;
end;

procedure TNode.NodeDataReadingProcessing;
var
  nFormat : integer;
  bLoop : Boolean;
  stLeavePacketData : RawByteString;
  stPacketData : RawByteString;
  bDecoderFormat : Boolean;
begin
  Try
    bLoop := False;
    repeat
      if Trim(G_stComBuffer[NO]) = '' then Exit;
      nFormat := dmDevicePacket.PacketFormatCheck(G_stComBuffer[NO],G_nProgramType,stLeavePacketData,stPacketData);
      if nFormat < 0 then
      begin
        if G_stComBuffer[NO] = '' then break;
        if nFormat = -1 then  //������ ���� �ΰ��
        begin
           Delete(G_stComBuffer[NO],1,1);
           continue;
        end else break;   //���� ���̰� �۰� ���� ���
      end;
      G_stComBuffer[NO]:= stLeavePacketData;
      bDecoderFormat := False;
      if nFormat = 1 then bDecoderFormat := False
      else if nFormat = 2 then bDecoderFormat := True
      else continue;
      if bDecoderFormat then continue;   //���ڴ� ������ ��� ó�� ���� ����
      if stPacketData <> '' then
      begin
        NodeDataPacketProcess(stPacketData);
      end;

      if pos(ETX,G_stComBuffer[NO]) = 0 then bLoop := True
      else bLoop := False;
      Application.ProcessMessages;
    until bLoop;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeDataReadingProcessing');
  End;
end;

procedure TNode.NodeInformationCheck(aInformationType: integer);
var
  nIndex : integer;
begin
  Try
    case aInformationType of
      con_DeviceCmdKTTSystemID: begin
        KTTSYSTEMIDRCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTSystemIDCheck;
        end;
        if KTTSYSTEMIDRCV = 'R' then KTTSYSTEMIDRCV := 'N'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end;  //���� �ý��� ���̵�
      con_DeviceCmdKTTTelNumber1: begin
        KTTTELNUMBERRCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTTelNumberCheck('0');
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTTelNumberCheck('1');
        end;
        if KTTTELNUMBERRCV = 'R' then KTTTELNUMBERRCV := 'N'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end;  //���� ���ڴ� ��ȭ��ȣ
      con_DeviceCmdKTTREMOTEARMRINGCOUNT: begin
        KTTREMOTERINGCOUNTRCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTRingCountCheck;
        end;
        if KTTREMOTERINGCOUNTRCV = 'R' then KTTREMOTERINGCOUNTRCV := 'N'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end;  //���ݰ��ؽ� ��Ƚ��
      con_DeviceCmdKttCdmaUse: begin
        KTTCDMAUSERCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTCDMAUSECheck;
        end;
        if KTTCDMAUSERCV = 'R' then KTTCDMAUSERCV := 'Y'; //���� ���� ���� ��� ���� ���� ����.
      end; //CDMA ��� ���� 0.�̻��,1.���
      con_DeviceCmdKttCDMADATA: begin
        KTTCDMADATARCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTCDMADATACheck;
        end;
        if KTTCDMADATARCV = 'R' then KTTCDMADATARCV := 'Y'; //CDMA ����� ���� ��� �ƹ��� �޽����� ���� ����
      end;     //CDMA IP
      con_DeivceCmdDVRUSE: begin
        DVRUSERCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceDVRUseCheck;
        end;
        if DVRUSERCV = 'R' then DVRUSERCV := 'N'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end; //DVR ��� ���� 0.�̻��,1.���
      con_DeviceCmdDVRIP: begin
        DVRDATARCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceDVRDataCheck;
        end;
        if DVRDATARCV = 'R' then DVRDATARCV := 'N'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end; //DVR IP
      con_DeviceCmdARMEXTENTIONMAINTOLOCAL : begin
        if Not ARMEXTENTIONSKILL then
        begin
          ARMEXTENTIONMAINTOLOCALRCV := 'Y';
          Exit;
        end;
        ARMEXTENTIONMAINTOLOCALRCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceARMEXTENTIONMAINTOLOCALCheck;
        end;
        if ARMEXTENTIONMAINTOLOCALRCV = 'R' then ARMEXTENTIONMAINTOLOCALRCV := 'Y'; //���� ���� ���� ��� ���� ���� ����
      end;
      con_DeviceCmdARMEXTENTIONMAINFROMLOCAL : begin
        if Not ARMEXTENTIONSKILL then
        begin
          ARMEXTENTIONMAINFROMLOCALRCV := 'Y';
          Exit;
        end;
        ARMEXTENTIONMAINFROMLOCALRCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceARMEXTENTIONMAINFromLOCALCheck;
        end;
        if ARMEXTENTIONMAINFROMLOCALRCV = 'R' then ARMEXTENTIONMAINFROMLOCALRCV := 'Y'; //���� ���� ���� ��� ����� ���� ����
      end;
      con_DeviceCmdUseState : begin
        ECUUSERCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceECUUseCheck;
        end;
        if ECUUSERCV = 'R' then ECUUSERCV := 'N'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeInformationCheck');
  End;
end;

procedure TNode.NodeInformationSend(aInformationType: integer);
var
  nIndex : integer;
  stTemp : string;
  i : integer;
begin
  Try
    case aInformationType of
      con_DeviceCmdKTTSystemID: begin
        KTTSYSTEMIDRCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTSystemID(KTTSYSTEMID);
        end;
        if KTTSYSTEMIDRCV = 'S' then KTTSYSTEMIDRCV := 'U'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end;  //���� �ý��� ���̵�
      con_DeviceCmdKTTTelNumber1: begin
        KTTTELNUMBERRCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTTelNumber('0',KTTTELNUMBER1);
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTTelNumber('1',KTTTELNUMBER2);
        end;
        if KTTTELNUMBERRCV = 'S' then KTTTELNUMBERRCV := 'U'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end;  //���� ���ڴ� ��ȭ��ȣ
      con_DeviceCmdKTTREMOTEARMRINGCOUNT: begin
        KTTREMOTERINGCOUNTRCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTRingCount(inttostr(KTTREMOTEARMRINGCOUNT),inttostr(KTTREMOTEDISARMRINGCOUNT));
        end;
        if KTTREMOTERINGCOUNTRCV = 'S' then KTTREMOTERINGCOUNTRCV := 'U'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end;  //���ݰ��ؽ� ��Ƚ��
      con_DeviceCmdKttCdmaUse: begin
        KTTCDMAUSERCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTCDMAUSE(KTTCDMAUSE);
        end;
        if KTTCDMAUSERCV = 'S' then KTTCDMAUSERCV := 'U'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end; //CDMA ��� ���� 0.�̻��,1.���
      con_DeviceCmdKttCDMADATA: begin
        KTTCDMADATARCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTCDMADATA(KTTCDMAMIN,KTTCDMAMUX,KTTCDMAIP,KTTCDMAPORT,KTTCDMACHECKTIME,KTTCDMARSSI);
        end;
        if KTTCDMADATARCV = 'S' then KTTCDMADATARCV := 'U'; //CDMA ����� ���� ��� �ƹ��� �޽����� ���� ����
      end;     //CDMA IP
      con_DeivceCmdDVRUSE: begin
        DVRUSERCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceDVRUse(DVRUSE);
        end;
        if DVRUSERCV = 'S' then DVRUSERCV := 'U'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end; //DVR ��� ���� 0.�̻��,1.���
      con_DeviceCmdDVRIP: begin
        DVRDATARCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceDVRData(DVRIP,DVRPORT);
        end;
        if DVRDATARCV = 'S' then DVRDATARCV := 'U'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end; //DVR IP
      con_DeviceCmdARMEXTENTIONMAINTOLOCAL : begin
        if Not ARMEXTENTIONSKILL then
        begin
          ARMEXTENTIONMAINTOLOCALRCV := 'Y';
          Exit;
        end;
        ARMEXTENTIONMAINTOLOCALRCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          if ARMEXTENTIONGUBUN = '0' then
          begin
            stTemp := '';
            for i := 0 to 63 do stTemp := stTemp + '0';
          end else
          begin
            stTemp := ARMEXTENTIONMAINTOLOCAL;
          end;
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceARMEXTENTIONMAINTOLOCAL(stTemp);
        end;
        if ARMEXTENTIONMAINTOLOCALRCV = 'S' then ARMEXTENTIONMAINTOLOCALRCV := 'U'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end;
      con_DeviceCmdARMEXTENTIONMAINFROMLOCAL : begin
        if Not ARMEXTENTIONSKILL then
        begin
          ARMEXTENTIONMAINFROMLOCALRCV := 'Y';
          Exit;
        end;
        ARMEXTENTIONMAINFROMLOCALRCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          if ARMEXTENTIONGUBUN = '0' then
          begin
            stTemp := '';
            for i := 0 to 63 do stTemp := stTemp + '0';
          end else
          begin
            stTemp := ARMEXTENTIONMAINFROMLOCAL;
          end;
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceARMEXTENTIONMAINFromLOCAL(stTemp);
        end;
        if ARMEXTENTIONMAINFROMLOCALRCV = 'S' then ARMEXTENTIONMAINFROMLOCALRCV := 'U'; //�۽� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end;
      con_DeviceCmdUseState : begin
        ECUUSERCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceECUUse(GetRegEcuUseData);
        end;
        if ECUUSERCV = 'S' then ECUUSERCV := 'U'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeInformationSend');
  End;
end;

procedure TNode.NodeSendPacketTimerTimer(Sender: TObject);
var
  stPacket : string;
  nCardDelayCount : integer;
begin
  if G_bApplicationTerminate then Exit;
  if G_bSocketWriting[NO] then Exit; //���� �߿��� ������ ����.  => ���� �Ϸ� �޽��� �̺�Ʈ�� �߻� �ȵǾ� ��������

  if NodeDestory then Exit;

  Try
    nCardDelayCount := 20;   //ī�嵥���� �ٿ�ε�� 200ms �� �ϳ��� ���� �ϱ� ���ؼ� 400ms �ȵ� ��� ���� ���� ����.

    G_nSendDelayCount[NO] := G_nSendDelayCount[NO] + 1;
    stPacket := '';
    if (Send1stDataList.Count > 0) and (G_n1stCount[NO] < 5) then
    begin
      if G_nSendDelayCount[NO] > nCardDelayCount then G_nSendDelayCount[NO] := 0;
      stPacket := Send1stDataList.Strings[0];
      Send1stDataList.Delete(0);
      inc(G_n1stCount[NO]);
    end else if (Send2ndDataList.Count > 0) and (G_n2ndCount[NO] < 5) then
    begin
      G_n1stCount[NO] := 0;
      if G_nSendDelayCount[NO] > nCardDelayCount then G_nSendDelayCount[NO] := 0;
      stPacket := Send2ndDataList.Strings[0];
      Send2ndDataList.Delete(0);
      inc(G_n2ndCount[NO]);
    end else if (Send3rdDataList.Count > 0) and (G_n3rdCount[NO] < 5) then
    begin
      G_n1stCount[NO] := 0;
      G_n2ndCount[NO] := 0;
      if G_nSendDelayCount[NO] > nCardDelayCount then G_nSendDelayCount[NO] := 0;
      stPacket := Send3rdDataList.Strings[0];
      Send3rdDataList.Delete(0);
      inc(G_n3rdCount[NO]);
    end else if (Send4thDataList.Count > 0) and (G_n4thCount[NO] < 5) then
    begin
      G_n1stCount[NO] := 0;
      G_n2ndCount[NO] := 0;
      G_n3rdCount[NO] := 0;
      if G_nSendDelayCount[NO] < nCardDelayCount then Exit;       //ī�嵥���� �ٿ�ε�� 200ms �� �ϳ��� ���� �ϱ� ���ؼ� 400ms �ȵ� ��� ���� ���� ����.
      G_nSendDelayCount[NO] := 0;
      stPacket := Send4thDataList.Strings[0];
      Send4thDataList.Delete(0);
      inc(G_n4thCount[NO]);
    end else
    begin
      G_n1stCount[NO] := 0;
      G_n2ndCount[NO] := 0;
      G_n3rdCount[NO] := 0;
      G_n4thCount[NO] := 0;
    end;
    if stPacket <> '' then
    begin
      //L_bSocketWriting := True;   //Send �� �̺�Ʈ�� �߻����� �ʳ�...��.��
      PutString(stPacket); //���Ͽ� ����
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeSendPacketTimerTimer');
  End;
end;

procedure TNode.NRCheckTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  if NodeDestory then Exit;
  NRCheckTimer.Enabled := False;
  LastNetworkState := 'NR';
end;

function TNode.PutString(aData: string): Boolean;
var
  l_result: Integer;
  buf: TBytes;
begin
  if NodeDestory then Exit;
  Try
    Try
      FTCSDeviceSender.Enter;
      result := False;
      if Not (NodeConnected = csConnected) then Exit;

      Try
        Ascii2Bytes(aData,Length(aData),buf);
        l_result:= Send(WinSocket,buf[0], Length(aData), 0);

        if l_result < 0 then
        begin
          if l_result = wsaEWouldBlock  then
          begin
            G_bSocketWriting[NO] := True;  //Socket�� Full ���� Write
          end else
          begin
            SocketError(self,WSAGetLastError);
          end;
        end;
      Except
        LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log',NODEIP + ':PutString');
        Exit;
      End;
      result := True;
    Finally
      FTCSDeviceSender.Leave;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.PutString');
  End;
end;

procedure TNode.RcvCheckTimerTimer(Sender: TObject);
var
  i : integer;
  bReciveStateCheck : Boolean;
begin
  if G_bApplicationTerminate then Exit;
  if Not (NodeConnected = csConnected) then Exit; //��尡 ����Ǿ� ���� ������ ���� ����

  if G_bRcvChecking[NO] or G_bStateChecking[NO] then Exit; //�۾� ���̸� �ϴ� ���� ����
  if NodeDestory then Exit;
  RcvCheckTimer.Interval := 200;

  G_bRcvChecking[NO] := True;
  Try
    RcvCheckTimer.Enabled := False;
    Try
      if G_nNodeUpdateIndex[NO] > HIGH(L_cNodeRCVSTATE) then G_nNodeUpdateIndex[NO] := 0;

      for i := G_nNodeUpdateIndex[NO] to HIGH(L_cNodeRCVSTATE) do
      begin
        G_nNodeUpdateIndex[NO] := i + 1;
        if L_cNodeRCVSTATE[i] = 'U' then  //����� ���� ������ �۽� ����....
        begin
          if NodeDestory then Exit;
          NodeInformationSend(i);
          Exit;
        end;
        Application.ProcessMessages;
      end;
      if G_nNodeSearchIndex[NO] > HIGH(L_cNodeRCVSTATE) then G_nNodeSearchIndex[NO] := 0;
      for i := G_nNodeSearchIndex[NO] to HIGH(L_cNodeRCVSTATE) do
      begin
        G_nNodeSearchIndex[NO] := i + 1;
        if L_cNodeRCVSTATE[i] = 'N' then  //���¸� ������ ���� ������ ���� üũ ����....
        begin
          if NodeDestory then Exit;
          NodeInformationCheck(i);
          Exit;
        end;
        Application.ProcessMessages;
      end;

      if G_nDeviceSearchIndex[NO] > NodeDeviceList.Count - 1 then G_nDeviceSearchIndex[NO] := 0;

      for i := G_nDeviceSearchIndex[NO] to NodeDeviceList.Count - 1 do  //��Ʈ�ѷ��� ���°� ���� �Ǵ� üũ �Ұ��� �ִ��� Ȯ������
      begin
        G_nDeviceSearchIndex[NO] := i + 1;
        if TDevice(NodeDeviceList.Objects[i]).DeviceConnected  = csConnected then
        begin
          if TDevice(NodeDeviceList.Objects[i]).ReciveStateChange then
          begin
            if NodeDestory then Exit;
            TDevice(NodeDeviceList.Objects[i]).DeviceReciveCheck;
            ReciveStateChange := True; //���� ����� ���¸� üũ �ؾ� �ϹǷ�
            Exit;
          end;
        end;
        Application.ProcessMessages;
      end;

      //���⼭�� ���Ż��� üũ �ϴ� �� ==> ������ �ȵǸ� ���⼭ ���� ���� �߻�
      bReciveStateCheck := False;
      for i := 0 to HIGH(L_cNodeRCVSTATE) do
      begin
        if NodeDestory then Exit;
        if L_cNodeRCVSTATE[i] <> 'Y' then
        begin
          bReciveStateCheck := True;
          break;
        end;
        Application.ProcessMessages;
      end;
      if Not bReciveStateCheck then
      begin
        for i := 0 to NodeDeviceList.Count - 1 do  //���� ���°� ���� �Ǵ� üũ �Ұ��� �ִ��� Ȯ������
        begin
          if NodeDestory then Exit;
          if TDevice(NodeDeviceList.Objects[i]).DeviceConnected  = csConnected then
          begin
            if TDevice(NodeDeviceList.Objects[i]).ReciveStateChange then
            begin
              bReciveStateCheck := True;
              break;
            end;
          end;
          Application.ProcessMessages;
        end;
      end;
      ReciveStateChange := bReciveStateCheck;
    Except
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.RcvCheckTimerTimer');
    End;
  Finally
    G_bRcvChecking[NO] := False;
    RcvCheckTimer.Enabled := ReciveStateChange;  //���Ż��¸� ���� �ϸ鼭 ���� ��
  End;

end;

procedure TNode.SendPacket(aEcuId: String; aCmd, aMsgNo: char; aDeviceVer,
  aData: String; aPriority: integer);
var
  stDeviceID : string;
  nDataLength : integer;
  stLen : string;
  stPacket : string;
  cKey : char;
  stNormalPacket : string;
begin
  Try
    if Not (NodeConnected = csConnected) then Exit;

    if G_nEncrypt = 0 then cKey := #$20
    else cKey := #$19;

    stDeviceID := DeviceID ;
    if Length(stDeviceID) < G_nIDLength then stDeviceID := FillZeroStrNum(stDeviceID,G_nIDLength);
    stDeviceID := stDeviceID + aEcuID;
    nDataLength := (G_nIDLength + 14) + Length(aData);
    stLen := FillZeroNumber(nDataLength, 3);
    if aCmd = 'a' then {���� ó��}
       stPacket := dmDevicePacket.PacketCreate(G_nProgramType,stLen,aDeviceVer,stDeviceID,aCmd,aData,aMsgNo,cKey,stNormalPacket)
    else {���� or ��� }
    begin
      stPacket := dmDevicePacket.PacketCreate(G_nProgramType,stLen,aDeviceVer,stDeviceID,aCmd,aData,aMsgNo,cKey,stNormalPacket);
    end;
    if aPriority = 0 then    //ack �� ���� �ֿ켱 ���� ������
    begin
      PutString(stPacket);
    end else if aPriority = 1 then   //����,��ȸ ��ɰ� ���� �켱 ���� ������
    begin
      Send1stDataList.Add(stPacket);
    end else if aPriority = 2 then   //AccessEvent ���� ���� ������ ����ġ
    begin
      Send2ndDataList.Add(stPacket);
    end else if aPriority = 3 then
    begin
      Send3rdDataList.Add(stPacket);
    end else if aPriority = 4 then   //Auto CardData DownLoad
    begin
      Send4thDataList.Add(stPacket);
    end;

    if Assigned(FOnNodePacket) then
    begin
      OnNodePacket(Self,No,NodeName,aEcuID,aCmd,aMsgNo,aDeviceVer,stNormalPacket,'TX');
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SendPacket');
  End;
end;

procedure TNode.ServerSocketClose;
var
  l_result : integer;
begin
  Try
    if SocketType <> 2 then Exit; //PC ���� ���� Ÿ���� �ƴϸ� ������ Ÿ�� ����.

    if WinSocket <> INVALID_SOCKET then
    begin
      shutdown(WinSocket,SD_BOTH);
      l_result:= CloseSocket(WinSocket);
      //if l_result = 0 then
      WinSocket := INVALID_SOCKET;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ServerSocketClose');
  End;
end;

procedure TNode.ServerSocketRead;
var l_remaining: Integer;
    l_pt_start_reception: Pointer;
    l_packet_bytes: Integer;

    l_eol_position: Integer;
    l_file_name: String;
begin
  Try
    if SocketType <> 2 then Exit; //PC ���� ���� Ÿ���� �ƴϸ� ������ Ÿ�� ����.

    if G_c_reception_buffer[NO] = nil then Exit;
    with G_c_reception_buffer[NO] do
    begin
      l_remaining:= m_buffer_size- m_write_index;
      // -- if not at least a tcp-ip chunk, increase the room
      if l_remaining < k_tcp_ip_chunk then
      begin
        // -- reallocate
        double_the_capacity;
        l_remaining:= m_buffer_size- m_write_index;
      end;
      l_pt_start_reception:= @ m_oa_byte_buffer[m_write_index];
      l_packet_bytes:= Recv(WinSocket, l_pt_start_reception^, l_remaining, 0);
      if l_packet_bytes < 0 then SocketError(self,WSAGetLastError)
      else
      begin
        m_write_index:= m_write_index + l_packet_bytes;
        SocketReceive(self, l_pt_start_reception, l_packet_bytes);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ServerSocketRead');
  End;
end;

procedure TNode.SetARMEXTENTIONGUBUN(const Value: string);
begin
  if FARMEXTENTIONGUBUN = Value then Exit;
  FARMEXTENTIONGUBUN := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdARMEXTENTIONGUBUN,NO,'00',Value);
  end;

end;

procedure TNode.SetARMEXTENTIONMAINFROMLOCAL(const Value: string);
var
  bUsed : Boolean;
  i : integer;
begin
  if FARMEXTENTIONMAINFROMLOCAL = Value then Exit;
  FARMEXTENTIONMAINFROMLOCAL := Value;
  bUsed := False;
  if Value <> '' then
  begin
    for i := 1 to Length(Value) - 1 do
    begin
      if Value[i+1] = '1' then
      begin
        bUsed := True;
        break;
      End;
    end;
  end;

  if bUsed then
  begin
    ARMEXTENTIONGUBUN := '2';
  end else
  begin
    bUsed := False;
    for i := 1 to Length(ARMEXTENTIONMAINTOLOCAL) - 1 do
    begin
      if ARMEXTENTIONMAINTOLOCAL[i+1] = '1' then
      begin
        bUsed := True;
        break;
      end;
    end;
    if Not bUsed then ARMEXTENTIONGUBUN := '0';  //������
  end;

  if InfoInitialize then Exit;

  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdARMEXTENTIONMAINFROMLOCAL,NO,'00',Value);
  end;
end;

procedure TNode.SetARMEXTENTIONMAINFROMLOCALRCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdARMEXTENTIONMAINFROMLOCAL] := Value[1];
  if FARMEXTENTIONMAINFROMLOCALRCV = Value then Exit;
  FARMEXTENTIONMAINFROMLOCALRCV := Value;
  ReciveStateChange:=True;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdARMEXTENTIONMAINFROMLOCAL,Value);
  end;
end;

procedure TNode.SetARMEXTENTIONMAINTOLOCAL(const Value: string);
var
  bUsed : Boolean;
  i : integer;
begin
  if FARMEXTENTIONMAINTOLOCAL = Value then Exit;
  FARMEXTENTIONMAINTOLOCAL := Value;
  bUsed := False;
  if Value <> '' then
  begin
    for i := 1 to Length(Value) - 1 do
    begin
      if Value[i+1] = '1' then
      begin
        bUsed := True;
        break;
      End;
    end;
  end;

  if bUsed then
  begin
    ARMEXTENTIONGUBUN := '1';
  end else
  begin
    bUsed := False;
    for i := 1 to Length(ARMEXTENTIONMAINFROMLOCAL) - 1 do
    begin
      if ARMEXTENTIONMAINFROMLOCAL[i+1] = '1' then
      begin
        bUsed := True;
        break;
      end;
    end;
    if Not bUsed then ARMEXTENTIONGUBUN := '0';  //������
  end;

  if InfoInitialize then Exit;

  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdARMEXTENTIONMAINTOLOCAL,NO,'00',Value);
  end;
end;

procedure TNode.SetARMEXTENTIONMAINTOLOCALRCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdARMEXTENTIONMAINTOLOCAL] := Value[1];
  if FARMEXTENTIONMAINTOLOCALRCV = Value then Exit;
  FARMEXTENTIONMAINTOLOCALRCV := Value;
  ReciveStateChange:=True;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdARMEXTENTIONMAINTOLOCAL,Value);
  end;

end;

procedure TNode.SetARMEXTENTIONSKILL(const Value: Boolean);
begin
  if FARMEXTENTIONSKILL = Value then Exit;

  FARMEXTENTIONSKILL := Value;
  if Not Value then
  begin
    ARMEXTENTIONMAINTOLOCALRCV := 'Y';
    ARMEXTENTIONMAINFROMLOCALRCV := 'Y';
  end;

end;

procedure TNode.SetCardDownLoadStart(const Value: Boolean);
begin
  if FCardDownLoadStart = Value then Exit;

  FCardDownLoadStart := Value;
  CardDownLoadTimer.Enabled := Value;
end;

function TNode.SetDeviceHoliday(aEcuID, aDay, aValue: string): Boolean;
var
  nIndex :integer;
begin
  Try
    result := False;
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    result := TDevice(NodeDeviceList.Objects[nIndex]).setHoliday(aDay,aValue);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetDeviceHoliday');
  End;
end;

procedure TNode.SetDeviceID(const Value: string);
begin
  if FDeviceID = Value then Exit;
  FDeviceID := Value;

  if InfoInitialize then Exit;

//  if Assigned(FOnDeviceNodeServerPacketChange) then
//  begin
//    OnDeviceNodeServerPacketChange(Self,con_NodeServerCmdDeviceID,WinSocket,NO,NODEIP,'00',Value);
//  end;
end;

function TNode.SetDeviceIDInformation(aCmd: integer; aEcuID,
  aValue: string): Boolean;
var
  nIndex :integer;
begin
  Try
    result := False;
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    case aCmd of
      con_DeviceCmdInfoInitialize : begin
        if aValue = '1' then TDevice(NodeDeviceList.Objects[nIndex]).InfoInitialize := True
        else TDevice(NodeDeviceList.Objects[nIndex]).InfoInitialize := False;
      end;
      con_DeviceCmdArmAreaUse : begin
        TDevice(NodeDeviceList.Objects[nIndex]).ARMAREAUSE := aValue;
      end;
      con_DeviceCmdArmInDelay : begin
        if isDigit(aValue) then
          TDevice(NodeDeviceList.Objects[nIndex]).ARMINDELAY := strtoint(aValue);
      end;
      con_DeviceCmdArmOutDelay : begin
        if isDigit(aValue) then
          TDevice(NodeDeviceList.Objects[nIndex]).ARMOUTDELAY := strtoint(aValue);
      end;
      con_DeviceCmdArmRelay : begin
        TDevice(NodeDeviceList.Objects[nIndex]).ARMRELAY := aValue;
      end;
      con_DeviceCmdCardReaderType : begin
        TDevice(NodeDeviceList.Objects[nIndex]).CARDREADERTYPE := aValue;
      end;
      con_DeviceCmdDeviceCode : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICECODE := aValue;
      end;
      con_DeviceCmdDeviceDoor2RelayType : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DOOR2RELAY := aValue;
      end;
      con_DeviceCmdDeviceUSE : begin
        if aValue = '1' then
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := True
        else TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := False;
      end;
      con_DeviceCmdDeviceVersion : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEVER := aValue;
      end;
      con_DeviceCmdEMZONELAMP : begin
        TDevice(NodeDeviceList.Objects[nIndex]).EMZONELAMP := aValue;
      end;
      con_DeviceCmdEMZONESIREN : begin
        TDevice(NodeDeviceList.Objects[nIndex]).EMZONESIREN := aValue;
      end;
      con_DeviceCmdJaeJungDelayUse : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAEJUNGDELAYUSE := aValue;
      end;
      con_DeviceCmdJAVARAARMCLOSE : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAVARAARMCLOSE := aValue;
      end;
      con_DeviceCmdJAVARAAUTOCLOSE : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAVARAAUTOCLOSE := aValue;
      end;
      con_DeviceCmdJAVARADISARMOPEN : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAVARADISARMOPEN := aValue;
      end;
      con_DeviceCmdJAVARASERVERARMCLOSE : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAVARASERVERARMCLOSE := aValue;
      end;
      con_DeviceCmdJAVARASERVERDISARMOPEN : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAVARASERVERDISARMOPEN := aValue;
      end;
      con_DeviceCmdJAVARATYPEUSE : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAVARATYPEUSE := aValue;
      end;
      con_DeviceCmdLAMPONTIME : begin
        if isDigit(aValue) then
          TDevice(NodeDeviceList.Objects[nIndex]).LAMPONTIME := strtoint(aValue);
      end;
      con_DeviceCmdSIRENONTIME : begin
        if isDigit(aValue) then
          TDevice(NodeDeviceList.Objects[nIndex]).SIRENONTIME := strtoint(aValue);
      end;
      con_DeviceCmdTimeCodeSend : begin
        TDevice(NodeDeviceList.Objects[nIndex]).SetDeviceTimeCode(aValue);
      end;
      con_DeviceCmdTimeCodeSkill : begin
        if aValue = '1' then TDevice(NodeDeviceList.Objects[nIndex]).TimeCodeSkill := True
        else TDevice(NodeDeviceList.Objects[nIndex]).TimeCodeSkill := False;
      end;
      con_DeviceCmdWATCHACPOWER : begin
        TDevice(NodeDeviceList.Objects[nIndex]).WATCHACPOWER := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetDeviceIDInformation');
  End;
end;

function TNode.SetDeviceIDSubInformation(aSubType, aCmd: integer; aEcuID,
  aSubNo, aValue: string): Boolean;
var
  nIndex :integer;
begin
  Try
    result := false;
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).SetDeviceIDSubInformation(aSubType,aCmd,aSubNo, aValue);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetDeviceIDSubInformation');
  End;
end;

function TNode.SetDeviceRcvIDInformation(aCmd: integer; aEcuID,
  aValue: string): Boolean;
var
  nIndex :integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    case aCmd of
      con_DeviceCmdArmAreaUse : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEARMAREAUSERCV := aValue;
      end;
      con_DeviceCmdArmRelay : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEARMRELAYRCV := aValue;
      end;
      con_DeviceCmdCardReaderNetwork : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICECARDREADERNETWORKRcv := aValue;
      end;
      con_DeviceCmdCardReaderType : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICECARDREADERTYPERCV := aValue;
      end;
      con_DeviceCmdDeviceCode : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICECODERCV := aValue;
      end;
      con_DeviceCmdDeviceDoor2RelayType : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEDOOR2RELAYRCV := aValue;
      end;
      con_DeviceCmdDeviceDoorArmArea : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEDOORARMAREARCV := aValue;
      end;
      con_DeviceCmdDeviceVersion : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEVERRCV := aValue;
      end;
      con_DeviceCmdEMZONELAMP : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEEMZONELAMPRCV := aValue;
      end;
      con_DeviceCmdExtentionNetwork : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEExtentionNetworkRCV := aValue;
      end;
      con_DeviceCmdExtentionUse : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEDEVICEEXTENTIONUSERCV := aValue;
      end;
      con_DeviceCmdJaeJungDelayUse : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEJAEJUNGDELAYUSERCV := aValue;
      end;
      con_DeviceCmdJAVARAARMCLOSE : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEJAVARAARMCLOSERCV := aValue;
      end;
      con_DeviceCmdJAVARAAUTOCLOSE : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEJAVARAAUTOCLOSERCV := aValue;
      end;
      con_DeviceCmdLAMPONTIME : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICELAMPONTIMERCV := aValue;
      end;
      con_DeviceCmdSIRENONTIME : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICESIRENONTIMERCV := aValue;
      end;
      con_DeviceCmdSystemInformation : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICESYSTEMINFORMATIONRCV := aValue;
      end;
      con_DeviceCmdTimeCodeSend : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICETIMECODERCV := aValue;
      end;
      con_DeviceCmdTimeCodeUse : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICETIMECODEUSERCV := aValue;
      end;
      con_DeviceCmdWATCHACPOWER : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICESYSTEMINFORMATIONRCV := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetDeviceRcvIDInformation');
  End;
end;

function TNode.SetDeviceRcvIDSubInformation(aSubType, aCmd: integer; aEcuID,
  aSubNo, aValue: string): Boolean;
var
  nIndex :integer;
begin
  Try
    result := false;
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then
    begin
      AddDevice(aEcuID,True);
      nIndex := NodeDeviceList.IndexOf(aEcuID);
    end;
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).SetDeviceRcvIDSubInformation(aSubType,aCmd,aSubNo, aValue);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetDeviceRcvIDSubInformation');
  End;
end;

procedure TNode.SetDoorArmAreaStateRCV(const Value: Boolean);
begin
  if FDoorArmAreaStateRCV = Value then Exit;

  FDoorArmAreaStateRCV := Value;
  StateCheckTimer.Enabled := Not Value;
end;

procedure TNode.SetDVRDATARCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdDVRIP] := Value[1];
  if FDVRDATARCV = Value then Exit;
  FDVRDATARCV := Value;
  ReciveStateChange:=True;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdDVRIP,Value);
  end;

end;

procedure TNode.SetDVRIP(const Value: string);
begin
  if FDVRIP = Value then Exit;
  FDVRIP := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdDVRIP,NO,'00',Value);
  end;
end;

procedure TNode.SetDVRPORT(const Value: string);
begin
  if FDVRPORT = Value then Exit;
  FDVRPORT := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdDVRPORT,NO,'00',Value);
  end;

end;

procedure TNode.SetDVRSKILL(const Value: Boolean);
begin
  if FDVRSKILL = Value then Exit;
  FDVRSKILL := Value;
  if Not Value then
  begin
    //DVR ����� ������ DVR ���¸� üũ ���� ����.
    DVRUSERCV :='Y'; //DVR ��� ���� 0.�̻��,1.���
    DVRDATARCV :='Y'; //DVR IP
  end;

end;

procedure TNode.SetDVRUSE(const Value: string);
begin
  if FDVRUSE = Value then Exit;
  FDVRUSE := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeivceCmdDVRUSE,NO,'00',Trim(Value));
  end;
end;

procedure TNode.SetDVRUSERCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeivceCmdDVRUSE] := Value[1];
  if FDVRUSERCV = Value then Exit;
  FDVRUSERCV := Value;
  ReciveStateChange:=True;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeivceCmdDVRUSE,Value);
  end;

end;

procedure TNode.SetECUUSERCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdUseState] := Value[1];
  if FECUUSERCV = Value then Exit;
  ReciveStateChange:=True;
  FECUUSERCV := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdUseState,Value);
  end;
end;

procedure TNode.SetFireEvent(const Value: Boolean);
var
  i : integer;
begin
  if FFireEvent = Value then Exit;

  FFireEvent := Value;

  if NodeDeviceList.Count < 1 then Exit;
  if Not Value then Exit;

  for i := 0 to NodeDeviceList.Count - 1 do
  begin
    if TDevice(NodeDeviceList.Objects[i]).DEVICECONNECTED = csConnected then
       TDevice(NodeDeviceList.Objects[i]).FireEvent := Value;
  end;
end;

procedure TNode.SetFIREGUBUNCODE(const Value: string);
begin
  FFIREGUBUNCODE := Value;
end;

function TNode.SetHolidayClear: Boolean;
var
  i :integer;
begin
  for i := 0 to NodeDeviceList.Count - 1 do
  begin
    TDevice(NodeDeviceList.Objects[i]).HolidayClear;
  end;
end;

procedure TNode.SetKTTCDMACHECKTIME(const Value: string);
begin
  if FKTTCDMACHECKTIME = Value then Exit;
  FKTTCDMACHECKTIME := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKttCDMACHECKTIME,NO,'00',Value);
  end;
end;

procedure TNode.SetKTTCDMADATARCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdKttCDMADATA] := Value[1];
  if FKTTCDMADATARCV = Value then Exit;
  FKTTCDMADATARCV := Value;
  ReciveStateChange:=True;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdKttCDMADATA,Value);
  end;
end;

procedure TNode.SetKTTCDMAIP(const Value: string);
begin
  if FKTTCDMAIP = Value then Exit;
  FKTTCDMAIP := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKttCDMAIP,NO,'00',Value);
  end;

end;

procedure TNode.SetKTTCDMAMIN(const Value: string);
begin
  if FKTTCDMAMIN = Value then Exit;
  FKTTCDMAMIN := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKTTCDMAMIN,NO,'00',Value);
  end;
end;

procedure TNode.SetKTTCDMAMUX(const Value: string);
begin
  if FKTTCDMAMUX = Value then Exit;
  FKTTCDMAMUX := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKttCDMAMUX,NO,'00',Value);
  end;

end;

procedure TNode.SetKTTCDMAPORT(const Value: string);
begin
  if FKTTCDMAPORT = Value then Exit;
  FKTTCDMAPORT := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKttCDMAPORT,NO,'00',Value);
  end;
end;

procedure TNode.SetKTTCDMARSSI(const Value: string);
begin
  if FKTTCDMARSSI = Value then Exit;
  FKTTCDMARSSI := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKttCDMARSSI,NO,'00',Value);
  end;

end;

procedure TNode.SetKTTCDMASKILL(const Value: Boolean);
begin
  if FKTTCDMASKILL = Value then Exit;
  FKTTCDMASKILL := Value;
  if Not Value then
  begin
    //CDMA ����� ������ CDMA ���¸� üũ ���� ����.
    KTTCDMAUSERCV := 'Y'; //CDMA ��� ���� 0.�̻��,1.���
    KTTCDMADATARCV := 'Y';     //CDMA IP
  end;

end;

procedure TNode.SetKTTCDMAUSE(const Value: string);
begin
  if FKTTCDMAUSE = Value then Exit;
  FKTTCDMAUSE := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKttCdmaUse,NO,'00',Value);
  end;

end;

procedure TNode.SetKTTCDMAUSERCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdKttCdmaUse] := Value[1];
  if FKTTCDMAUSERCV = Value then Exit;
  ReciveStateChange:=True;
  FKTTCDMAUSERCV := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdKttCdmaUse,Value);
  end;

end;

procedure TNode.SetKTTREMOTEARMRINGCOUNT(const Value: integer);
begin
  if FKTTREMOTEARMRINGCOUNT = Value then Exit;
  FKTTREMOTEARMRINGCOUNT := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKTTREMOTEARMRINGCOUNT,NO,'00',inttostr(Value));
  end;
end;

procedure TNode.SetKTTREMOTEDISARMRINGCOUNT(const Value: integer);
begin
  if FKTTREMOTEDISARMRINGCOUNT = Value then Exit;
  FKTTREMOTEDISARMRINGCOUNT := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKTTREMOTEDisARMRINGCOUNT,NO,'00',inttostr(Value));
  end;

end;

procedure TNode.SetKTTREMOTERINGCOUNTRCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdKTTREMOTEARMRINGCOUNT] := Value[1];
  if FKTTREMOTERINGCOUNTRCV = Value then Exit;
  ReciveStateChange:=True;
  FKTTREMOTERINGCOUNTRCV := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdKTTREMOTEARMRINGCOUNT,Value);
  end;

end;

procedure TNode.SetKTTSYSTEMID(const Value: string);
begin
  if Trim(FKTTSYSTEMID) = Trim(Value) then Exit;

  FKTTSYSTEMID := Trim(Value);
  if InfoInitialize then Exit;

  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKTTSystemID,NO,'00',Trim(Value));
  end;
end;

procedure TNode.SetKTTSYSTEMIDRCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdKTTSystemID] := Value[1];
  if FKTTSYSTEMIDRCV = Value then Exit;
  ReciveStateChange:=True;
  FKTTSYSTEMIDRCV := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdKTTSystemID,Value);
  end;

end;

procedure TNode.SetKTTTELNUMBER1(const Value: string);
begin
  if FKTTTELNUMBER1 = Value then Exit;
  FKTTTELNUMBER1 := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKTTTelNumber1,NO,'00',Value);
  end;
end;

procedure TNode.SetKTTTELNUMBER2(const Value: string);
begin
  if FKTTTELNUMBER2 = Value then Exit;
  FKTTTELNUMBER2 := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKTTTelNumber2,NO,'00',Value);
  end;
end;

procedure TNode.SetKTTTELNUMBERRCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdKTTTelNumber1] := Value[1];
  if FKTTTELNUMBERRCV = Value then Exit;
  ReciveStateChange:=True;
  FKTTTELNUMBERRCV := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdKTTTelNumber1,Value);
  end;
end;

procedure TNode.SetLastNetworkState(const Value: string);
var
  stAlarmEvent : string;
  nIndex : integer;
  stAlarmStateCodeName : string;
  stAlarmStatePCCode : string;
  stAlarmStatePCCodeName : string;
  stAlarmStateModeChange : string;
  stAlarmView : string;
  stAlarmSound : string;
  stAlarmColor : string;
begin
  if Value = '' then
  begin
    LastNetworkState := 'NR';
    Exit;
  end;

  if FLastNetworkState = Value then Exit;
  FLastNetworkState := Value;

  if InfoInitialize and (Value = 'NR') then NFCheckTimer.Enabled := True;  //ó�� DB���� �о����� ���� �����̸� NF üũ ����.

  if InfoInitialize then Exit;  //DB�о �������ΰ�쿡�� �̺�Ʈ �������� ���ڰ�...

  if (FLastNetworkState <> '') then  //'NR' �� ��� ó�� �ε� ���°� �ƴϸ�
  begin
    //���⿡�� NetworkAlarm���¸� ������.
    //stAlarmEvent := '066 K1000000000ABn' + formatDatetime('yyyymmddhhnnss',now) + 'MN0000n' + Value + '***16****************A3';
(*    stAlarmEvent := FillZeroNumber(No,G_nNodeCodeLength) + '00' + 'A' + '0' + formatDatetime('yyyymmddhhnnss',now) + 'MN' + '00' + '0' + 'n' +
                    Value + '0' + '*' + 'MN0' + Value+ '000' + '*' + '1' + '1' + FillZeroStrNum(inttostr(clFuchsia),10) + formatDatetime('yyyymmddhhnnsszzz',now) + '****************';

*)

    nIndex := AlarmEventStateCodeList.IndexOf(Value);
    if nIndex > -1 then
    begin
      TAlarmEventStateCode(AlarmEventStateCodeList.Objects[nIndex]).GetAlarmEventPCCodeInfo(Value,'MN','n','0','*','****************',
                                                                    stAlarmStateCodeName,stAlarmStatePCCode,stAlarmStatePCCodeName,stAlarmStateModeChange,stAlarmView,stAlarmSound,stAlarmColor);
    end;

    stAlarmEvent := FillZeroNumber(No,G_nNodeCodeLength) + '00' + '0' + 'A' + '0' + formatDatetime('yyyymmddhhnnss',now) + 'MN' + '00' +
                 '00' + 'n' + Value + '00' +
                 '*' + ',' + '****************' + ',' + stAlarmStateCodeName + ',' + stAlarmStatePCCode + ',' + stAlarmStatePCCodeName + ',' + stAlarmStateModeChange + ',' + stAlarmView + ',' +
                 stAlarmSound + ',' + stAlarmColor;

    FileAppend(G_stEventDataDir + '\AlarmEvent' + FormatDateTime('yyyymmddhhnnss',now) + inttostr(No),stAlarmEvent,False);

  end;

end;

procedure TNode.SetNo(const Value: Integer);
begin
  FNo := Value;
  G_bSocketWriting[Value] := False;

  G_c_reception_buffer[Value]:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);
end;

procedure TNode.SetNodeConnected(const Value: TConnectedState);
var
  i : integer;
  nIndex : integer;
begin
  Try
    if FNodeConnected = Value then Exit;
    FNodeConnected := Value;
    if G_bApplicationTerminate then Exit;

    if Value = csConnected then
    begin
      NodeSendPacketTimer.Enabled := True;
      G_bSocketWriting[NO] := False;
      DoorArmAreaStateRCV := False;
      StateCheckTimer.Interval := 2000; //2�� �ĺ��� ���� üũ ����.
      StateCheckTimer.Enabled := True;
      RcvCheckTimer.Interval := 20000; //20�� �ĺ��� ������� ���� üũ
      RcvCheckTimer.Enabled := True; //���Ż��� üũ
      if LastNetworkState <> 'NR' then
         NRCheckTimer.enabled:= True;
      NFCheckTimer.enabled:= False;
      ControlNodeToDeviceTimeSync;
    end else
    begin
      NRCheckTimer.enabled:= False; //NR CheckTimer
      if LastNetworkState <> 'NF' then NFCheckTimer.enabled:= True; //NF CheckTimer
      //LastNetworkState := 'NF';
      for i := 0 to NodeDeviceList.Count - 1 do
      begin
        if Not NodeDestory then TDevice(NodeDeviceList.Objects[i]).DeviceConnected := csDisConnected;
      end;

      NodeSendPacketTimer.Enabled := False;
      DoorArmAreaStateRCV := True;
      StateCheckTimer.Enabled := False;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetNodeConnected');
  End;
end;

function TNode.SetNodeIndexInformation(aCmd, aIndex: integer;
  aValue: string): string;
var
  stTemp : string;
begin
  Try
    case aCmd of
      con_DeviceCmdARMEXTENTIONMAINFROMLOCAL : begin
        stTemp := ARMEXTENTIONMAINTOLOCAL;
        if Length(stTemp) < aIndex  then Exit;
        stTemp[aIndex] := aValue[1];
        ARMEXTENTIONMAINTOLOCAL := stTemp;
      end;
      con_DeviceCmdARMEXTENTIONMAINTOLOCAL : begin
        stTemp := ARMEXTENTIONMAINFROMLOCAL;
        if Length(stTemp) < aIndex  then Exit;
        stTemp[aIndex] := aValue[1];
        ARMEXTENTIONMAINFROMLOCAL := stTemp;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetNodeIndexInformation');
  End;
end;

procedure TNode.SetNodeToCardPermitExcute(aEcuID, aCardNo, aRcvAck: string);
var
  nIndex :integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).SetNodeToCardPermitExcute(aCardNo,aRcvAck);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetNodeToCardPermitExcute');
  End;
end;

procedure TNode.SetNodeToCardPermitInitialize(aEcuID, aExtendID, aCardNo,
  aCardPermit, aCardState, aDoor1, aDoor2, aDoor3, aDoor4, aDoor5, aDoor6,
  aDoor7, aDoor8, aArmArea0, aArmArea1, aArmArea2, aArmArea3, aArmArea4,
  aArmArea5, aArmArea6, aArmArea7, aArmArea8, aRcvAck, aPositionNum,
  aTimeCodeUse, aTCGroup, aTime1, aTime2, aTime3, aTime4, aTCWeekCode, aRegDate,
  aEndDate, aEmState: string);
var
  nIndex :integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).SetNodeToCardPermitInitialize(aCardNo,
    aCardPermit,aCardState, aDoor1, aDoor2, aDoor3, aDoor4, aDoor5, aDoor6, aDoor7, aDoor8,
    aArmArea0, aArmArea1, aArmArea2, aArmArea3, aArmArea4, aArmArea5, aArmArea6,
    aArmArea7, aArmArea8, aRcvAck, aPositionNum, aTimeCodeUse, aTCGroup, aTime1, aTime2, aTime3,
    aTime4, aTCWeekCode,aRegDate,aEndDate,aEmState);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetNodeToCardPermitInitialize');
  End;
end;

procedure TNode.SetNodeToCardPermitSetting(aEcuID, aExtendID, aCardNo, aPermit,
  aCardState, aType, aNumber, aPositionNum, aTimeCodeUse, aTCGroup, aTime1,
  aTime2, aTime3, aTime4, aWeekCode, aRegDate, aEndDate, aEmState: string);
var
  nIndex :integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).SetNodeToCardPermitSetting(aCardNo, aPermit,
    aCardState, aType, aNumber, aPositionNum, aTimeCodeUse, aTCGroup, aTime1, aTime2, aTime3,
    aTime4, aWeekCode,aRegDate,aEndDate,aEmState);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetNodeToCardPermitSetting');
  End;
end;

procedure TNode.SetReciveStateChange(const Value: Boolean);
begin
  FReciveStateChange := Value;   //���Ż��� ���� �Ǿ����� �̰�����
  if Value then
  begin
    if NodeConnected = csConnected then
       RcvCheckTimer.Enabled := True; //���Ż��� üũ
  end;
end;

procedure TNode.SetSocketOpen(const Value: Boolean);
var
  l_result : Integer;
  l_error: Integer;
  l_version : Word;
  l_socket_address_in: tSockAddrIn;
  l_ip_z: array[0..255] of char;
  rset: TFDSet;
  t: TTimeVal;
  rslt: integer;
begin
  if FSocketOpen = Value then Exit;

  FSocketOpen := Value;
  if SocketType <> 1 then Exit;  //Server -> Device �� �ƴ� ��쿡�� ���� ������ ���� ����...
  if Value then
  begin
    LastReceiveTime := Now;
    l_version:= $0101;
    l_result := wsaStartup(l_version, G_wsa_data[NO]);
    if l_result <> 0 then
    begin
      SocketOpen := False;
      Exit;  //���ϻ��� ���� �ÿ� Open False
    end;
    WinSocket:= Socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
    if WinSocket = INVALID_SOCKET then
    begin
      SocketOpen := False;
      Exit;  //���ϻ��� ���� �ÿ� Open False
    end;
    l_result:= wsaAsyncSelect(WinSocket, Handle,
        wm_asynch_select,
        FD_CONNECT+ FD_READ+ FD_WRITE+ FD_CLOSE);

    FillChar(l_socket_address_in, sizeof(l_socket_address_in), 0);
    with l_socket_address_in do
    begin
      sin_family:= pf_Inet;
      // -- the requested service
      sin_port:= hToNs(NodePort);
      // -- the server IP address
      StrPCopy(l_ip_z, NODEIP);
      sin_addr.s_Addr:= inet_addr(PAnsichar(AnsiString(l_ip_z)));
    end; // with m_socket_address_in
    l_result:= Connect(WinSocket, l_socket_address_in,
        sizeof(l_socket_address_in));
    if l_result<> 0 then
    begin
      l_error:= WSAGetLastError;
      if l_error <> wsaEWouldBlock then
      begin
        SocketOpen := False;
        Exit;  //���ϻ��� ���� �ÿ� Open False
      end else
      begin
      end;
    end;
{    t.tv_sec:=5;
    t.tv_usec:=0;
    FD_Zero(rset);
    FD_Set(l_client_socket_handle,rset);
    rslt := select(-1, @rset, nil, nil, @t);
    if (rslt = 0) then
    begin
      SocketOpen := False;
      Exit;  //���ϻ��� ���� �ÿ� Open False
    end; }

//    l_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);
  end else
  begin
    if WinSocket <> INVALID_SOCKET then
    begin
      shutdown(WinSocket,SD_BOTH);
      l_result:= CloseSocket(WinSocket);
      if l_result = 0 then
      begin
        WinSocket:= INVALID_SOCKET;
//        l_c_reception_buffer.Free;
//        l_c_reception_buffer:= Nil;
      end else
      begin
        WinSocket:= INVALID_SOCKET;
        LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log',NODEIP + ':SocketCloseError');
      end;
      WSACleanup;
    end;
    NodeConnected := csDisConnected;
  end;
end;

procedure TNode.SocketError(Sender: TObject; SocketError: Integer);
begin
  if (SocketError = WSAEWOULDBLOCK) or (SocketError = 10038) then Tag := 0
  else begin
    NodeConnected := csDisConnected;
    Tag := SocketError;
  end;
end;

procedure TNode.SocketReceive(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
var
//  pTemp : AnsiString;
  stTemp : RawByteString;
begin
  Try
    //GetMem(pTemp,DataLen);
    stTemp := ByteCopy(Buf,DataLen);   //FD -> 3F �� ���ϴ� �κж�����...
//    pTemp := pCopy(Buf,DataLen);
    LastReceiveTime := Now;
    G_stComBuffer[NO] := G_stComBuffer[NO] + stTemp;
    NodeDataReadingProcessing;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.TcpClientReceive');
  End;
end;

procedure TNode.StateCheckTimerTimer(Sender: TObject);
var
  nIndex : integer;
  i : integer;
  bResult : Boolean;
begin
  if G_bApplicationTerminate then Exit;
  if Not (NodeConnected = csConnected) then Exit; //��尡 ����Ǿ� ���� ������ ���� ����

  if G_bRcvChecking[NO] or G_bStateChecking[NO] then Exit; //�۾� ���̸� �ϴ� ���� ����
  if NodeDestory then Exit;

  Try
    StateCheckTimer.Enabled := False;
    StateCheckTimer.Interval := 2000;
    if ECUUSERCV <> 'Y' then
    begin
      ECUUSERCV := 'R';
      nIndex := NodeDeviceList.IndexOf('00');
      if nIndex > -1 then
      begin
        TDevice(NodeDeviceList.Objects[nIndex]).DeviceECUUseCheck;
      end;
      if ECUUSERCV = 'R' then ECUUSERCV := 'N'; //���� ���� ���� ��� ���� �Ҷ� ���� Retry ����.
      Exit;
    end;

    StateCheckTimer.Interval := 200;
    G_bStateChecking[NO] := True;
    Try
      if G_nStateCheckEcuSeq[NO] < 0 then G_nStateCheckEcuSeq[NO] := 0;
      if ConnectDeviceList.Count < 1 then Exit;
      if G_nStateCheckEcuSeq[NO] > ConnectDeviceList.Count - 1  then G_nStateCheckEcuSeq[NO] := 0;

      nIndex := NodeDeviceList.IndexOf(ConnectDeviceList.Strings[G_nStateCheckEcuSeq[NO]]);
      if nIndex < 0 then Exit;
      if TDevice(NodeDeviceList.Objects[nIndex]).CurrentArmDoorStateCheckRCV = 'Y' then
      begin
        bResult := True;
        for i := 0 to NodeDeviceList.Count - 1 do
        begin
          if NodeDestory then Exit;
          if TDevice(NodeDeviceList.Objects[i]).DEVICECONNECTED = csConnected then
          begin
            if TDevice(NodeDeviceList.Objects[i]).CurrentArmDoorStateCheckRCV <> 'Y' then
            begin
              bResult := False;
              break;
            end;
          end;
        end;
        if bResult then DoorArmAreaStateRCV := True; //��ü ���¸� ��� ��ȸ �� ���¸� Ÿ�̸� ���� ����.
      end else
      begin
        //���⼭ ���Թ� ���¿� ��� ���� ��ȸ ����.
        TDevice(NodeDeviceList.Objects[nIndex]).DeviceCurrentArmDoorStateCheck;
      end;
    Finally
      G_nStateCheckEcuSeq[NO] := G_nStateCheckEcuSeq[NO] + 1;
      G_bStateChecking[NO] := False;
    End;
  Finally
    StateCheckTimer.Enabled := Not DoorArmAreaStateRCV;
  End;
end;

procedure TNode.WndProc(var Message: TMessage);
begin
  if G_bApplicationTerminate then Exit;

  Try
    Dispatch ( Message );
  Except
    Exit;
  End;
end;

procedure TNode.ZONEEXTENDTYPEChange(Sender: TObject; aNodeNo: integer; aEcuID,
  aExtendID, aNumber, aData: string);
begin
    if Assigned(FOnZONEEXTENDTYPEChange) then
    begin
      OnZONEEXTENDTYPEChange(Self,aNodeNo,aEcuID,aExtendID,aNumber,aData);
    end;

end;

procedure TNode.ZonePacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
  if Assigned(FOnZonePacketChange) then
  begin
    OnZonePacketChange(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
  end;

end;

end.
