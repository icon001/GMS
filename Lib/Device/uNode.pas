unit uNode;

interface

uses
  System.SysUtils, System.Classes,Web.Win.Sockets,Vcl.ExtCtrls,System.SyncObjs,
  uDeviceVariable,Winapi.WinSock,Vcl.Controls,Winapi.Messages,Forms,
  Vcl.Graphics,u_c_byte_buffer;

const wm_asynch_select= wm_User;
const k_buffer_max= 4096;//k_buffer_max= 4096; 65536;  왜 65536 이었을까?
      k_tcp_ip_chunk= 1500;
const SocketConnectRetryCount = 3;

type
  TNode = Class(TComponent)
  private
    L_cNodeRCVSTATE: Array [0..MAXNODERCVCOUNT] of char;     //수신상태
    L_c_reception_buffer : c_byte_buffer;
    L_nFtpDownLoadEcuSeq : integer;
    ConnectDeviceList : TStringList;
    FTPDownEcuList : TStringList;
    NodeDeviceList : TStringList;
    RcvDataList : TStringList;
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
    L_bCardDownLoading :Boolean;
    L_bFireEvent : Boolean;
    L_bRcvChecking : Boolean;
    L_bSocketWriting : Boolean;
    L_bStateChecking : Boolean;
    L_n1stCount : integer;
    L_n2ndCount : integer;
    L_n3rdCount : integer;
    L_n4thCount : integer;
    L_nCardDownLoadEcuSeq : integer;
    L_nDebugCnt : integer;
    L_nDeviceSearchIndex : integer;
    L_nNodeSearchIndex : integer;
    L_nNodeUpdateIndex : integer;
    L_nSendDelayCount : integer;
    L_nSendMsgNo : integer;
    L_nStateCheckCount : integer;
    L_nStateCheckEcuSeq : integer;
    L_stComBuffer : string;
    L_stDeviceVer : string;
    L_stReceivedLastpacket : string;
    L_wsa_data : twsaData;
    FTCSDeviceSender : TCriticalSection;
    //Handle 생성 부분
    FHandle : THandle;
    function GetHandle : THandle;
    function GetRegEcuUseData : string; //ECU 사용유무 등록
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
    FNodeDisConnectTime: TDateTime;
    FNodeConnectTime: TDateTime;
    FConnectRetryCount: integer;
    FFTPComplete: Boolean;
    FECUNETWORKRCV: string;
    FFireReceive: integer;
    procedure SetNo(const Value: Integer);
    procedure SetDeviceID(const Value: string);
    procedure SetLastNetworkState(const Value: string);
    procedure SetSocketOpen(const Value: Boolean);
    procedure SetNodeConnected(const Value: TConnectedState);
    procedure SetDoorArmAreaStateRCV(const Value: Boolean);
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
    procedure SetECUNETWORKRCV(const Value: string);
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
    Function  NodeDataPacketProcess(aPacket:RawByteString):Boolean;
    procedure NodeDataReadingProcessing;
    function  PutString(aData:string):Boolean;
    Procedure SendPacket(aEcuId: String;aCmd:Char;aMsgNo:char;aDeviceVer, aData: String;aPriority:integer=0);
    procedure SocketError(Sender: TObject; SocketError: Integer);
    procedure SocketReceive(Sender: TObject; Buf: PAnsiChar;var DataLen: Integer);
  public
    function GetDeviceDoorArmaAreaState(aEcuID:string):string;
    function GetDeviceDoorState(aEcuID,aDoorNo:string;var aCardMode,aDoorMode,aDoorState,aLockState,aDoorFire:string):Boolean;
    function GetDeviceDoorStateResend(aEcuID,aDoorNo:string):Boolean;
    function GetDeviceIDArmAreaInformation(aCmd:integer;aEcuID,aSubNo:string):string;
    function GetDeviceIDCardReaderInformation(aCmd:integer;aEcuID,aSubNo:string):string;
    function GetDeviceIDDoorInformation(aCmd:integer;aEcuID,aSubNo:string):string;
    function GetDeviceIDExtentionInformation(aCmd:integer;aEcuID,aSubNo:string):string;
    function GetDeviceIDInformation(aCmd:integer;aEcuID:string):string;  //ECU 정보
    function GetDeviceIDSubInformation(aSubType,aCmd:integer;aEcuID,aSubNo:string):string;  // 정보
    function GetDeviceIDZoneInformation(aCmd:integer;aEcuID,aZoneID:string):string;
    function GetDeviceIndexArmAreaInformation(aCmd,aIndex,aSubIndex:integer):string;
    function GetDeviceIndexCardReaderInformation(aCmd,aIndex,aSubIndex:integer):string;
    function GetDeviceIndexDoorInformation(aCmd,aIndex,aSubIndex:integer):string;
    function GetDeviceIndexExtentionInformation(aCmd,aIndex,aSubIndex:integer):string;
    function GetDeviceIndexInformation(aCmd,aIndex:integer):string;  //ECU 정보
    function GetDeviceIndexSubInformation(aSubType,aCmd,aIndex,aSubIndex:integer):string;  //기기정보
    function GetDeviceIndexZoneInformation(aCmd,aEcuIndex,aExtentionIndex,aZoneNo:integer):string;  //기기정보
    function GetDeviceVer:string;
    function GetNodeIndexInformation(aCmd:integer):string;  //ECU 정보
    function GetSendMsgNo:char;
    function SetDeviceHoliday(aEcuID,aDay,aValue:string):Boolean;
    function SetDeviceIDInformation(aCmd:integer;aEcuID,aValue:string):Boolean;
    function SetDeviceIDSubInformation(aSubType,aCmd:integer;aEcuID,aSubNo,aValue:string):Boolean;  //기기정보
    function SetDeviceRcvIDInformation(aCmd:integer;aEcuID,aValue:string):Boolean;
    function SetDeviceRcvIDSubInformation(aSubType,aCmd:integer;aEcuID,aSubNo,aValue:string):Boolean;  //기기정보
    function SetHolidayClear:Boolean;
    function SetNodeIndexInformation(aCmd,aIndex:integer;aValue:string):string;  //ECU 정보
    procedure SetNodeToCardPermitExcute(aEcuID,aCardNo,aRcvAck:string);
    procedure SetNodeToCardPermitSetting(aEcuID,aExtendID,aCardNo,aPermit,aCardState,aType,aNumber,
          aPositionNum,aTimeCodeUse,aTCGroup,aTime1,aTime2,aTime3,aTime4,aWeekCode,aRegDate,aEndDate,aEmState:string);
    //컨트롤러 초기셋팅
    procedure SetNodeToCardPermitInitialize(aEcuID,aExtendID,aCardNo,aCardPermit,aCardState,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
            aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8,aRcvAck,aPositionNum,
            aTimeCodeUse,aTCGroup,aTime1,aTime2,aTime3,aTime4,aTCWeekCode,aRegDate,aEndDate,aEmState:string;aSendType:integer=0);
    procedure ControlNodeToDeviceRegDeviceID(aDeviceID:string);  //컨트롤러 ID 셋팅
    function CheckFtpDownLoadData : Boolean;
    function FTPCompleteCheck : Boolean; //FTP 전송 완료 되었는지 체크 하자.
  public
    procedure ServerSocketClose;
    //Server Socket
    procedure ServerSocketRead;
  public
    //내부 타이머를 외부에서 돌리자
    procedure CardDownLoadTimer;
    procedure FireRecoveryTimer;
    procedure FTPCardDownLoadTimer;
    procedure NRCheckTimer;
    procedure NFCheckTimer;
    procedure NodeSendPacketTimer;
    procedure StateCheckTimer;
    procedure RcvCheckTimer;
  public
    //제어
    procedure DeviceCardSort;
    procedure ControlNodeToDeviceArmAreaStateCheck(aEcuID,aArmAreaNo :string); //방범구역 상태 재전송
    procedure ControlNodeToDeviceCardResend(aEcuID :string); //컨트롤러 카드 재전송
    procedure ControlNodeToDeviceReset(aEcuID:string);   //컨트롤러리셋
    procedure ControlNodeToDeviceTimeSync;               //컨트롤러 시간 동기화
    procedure FireDoorOpen(aFireGubunCode:string);
    procedure FireRecovery;
    function ServerDoorControl(aECUID,aReaderNo,aDoorNo,aATButton,aCardNo,aAuth,aVoice:string):integer;
  published
    property Handle : THandle read GetHandle;
    property NodeConnectTime : TDateTime read FNodeConnectTime write FNodeConnectTime;
    property NodeDisConnectTime : TDateTime read FNodeDisConnectTime write FNodeDisConnectTime;
    property LastReceiveTime : TDateTime read FLastReceiveTime write FLastReceiveTime;
    property NodeConnected : TConnectedState read FNodeConnected write SetNodeConnected;
    property NodeDestory : Boolean read FNodeDestory write FNodeDestory;
    property SocketOpen : Boolean read FSocketOpen write SetSocketOpen;
    property WinSocket : tSocket read FWinSocket write FWinSocket;
  published
    //설정 프로그램 정보
    property ARMEXTENTIONGUBUN : string read FARMEXTENTIONGUBUN write SetARMEXTENTIONGUBUN;
    property ARMEXTENTIONMAINFROMLOCAL : string read FARMEXTENTIONMAINFROMLOCAL write SetARMEXTENTIONMAINFROMLOCAL;
    property ARMEXTENTIONMAINTOLOCAL : string read FARMEXTENTIONMAINTOLOCAL write SetARMEXTENTIONMAINTOLOCAL;
    property ARMEXTENTIONSKILL : Boolean read FARMEXTENTIONSKILL write SetARMEXTENTIONSKILL;
    property DVRIP : string read FDVRIP write SetDVRIP; //DVR IP
    property DVRPORT : string read FDVRPORT write SetDVRPORT; //DVR Port
    property DVRSKILL : Boolean read FDVRSKILL write SetDVRSKILL;   //DVR 기능 유무
    property DVRUSE : string read FDVRUSE write SetDVRUSE; //DVR 사용 유무 0.미사용,1.사용
    property FIREGUBUNCODE : string read FFIREGUBUNCODE write SetFIREGUBUNCODE; //화재그룹코드
    property FireEvent : Boolean read FFireEvent write SetFireEvent;
    property KTTCDMACHECKTIME : string read FKTTCDMACHECKTIME write SetKTTCDMACHECKTIME; //CDMA check time
    property KTTCDMAMIN : string read FKTTCDMAMIN write SetKTTCDMAMIN;
    property KTTCDMAMUX : string read FKTTCDMAMUX write SetKTTCDMAMUX;
    property KTTCDMAIP : string read FKTTCDMAIP write SetKTTCDMAIP;     //CDMA IP
    property KTTCDMAPORT : string read FKTTCDMAPORT write SetKTTCDMAPORT; //CDMA Port
    property KTTCDMARSSI : string read FKTTCDMARSSI write SetKTTCDMARSSI; //CDMA rssi
    property KTTCDMASKILL : Boolean read FKTTCDMASKILL write SetKTTCDMASKILL;   //CDMA 기능 유무
    property KTTCDMAUSE : string read FKTTCDMAUSE write SetKTTCDMAUSE; //CDMA 사용 유무 0.미사용,1.사용
    property KTTREMOTEARMRINGCOUNT : integer read FKTTREMOTEARMRINGCOUNT write SetKTTREMOTEARMRINGCOUNT;  //원격경계시 링횟수
    property KTTREMOTEDISARMRINGCOUNT : integer read FKTTREMOTEDISARMRINGCOUNT write SetKTTREMOTEDISARMRINGCOUNT;  //원격해제시 링횟수
    property KTTSYSTEMID : string read FKTTSYSTEMID write SetKTTSYSTEMID;  //관제 시스템 아이디
    property KTTTELNUMBER1 : string read FKTTTELNUMBER1 write SetKTTTELNUMBER1;  //관제 데코더 전화번호1
    property KTTTELNUMBER2 : string read FKTTTELNUMBER2 write SetKTTTELNUMBER2;  //관제 데코더 전화번호2
    property MaxEcuCount : integer read FMaxEcuCount write FMaxEcuCount;
    property ConnectRetryCount : integer read FConnectRetryCount write FConnectRetryCount;
  published
    //수신상태 정보
    property ARMEXTENTIONMAINTOLOCALRCV : string read FARMEXTENTIONMAINTOLOCALRCV write SetARMEXTENTIONMAINTOLOCALRCV;
    property ARMEXTENTIONMAINFROMLOCALRCV : string read FARMEXTENTIONMAINFROMLOCALRCV write SetARMEXTENTIONMAINFROMLOCALRCV;
    property DVRDATARCV : string read FDVRDATARCV write SetDVRDATARCV; //DVR IP
    property DVRUSERCV : string read FDVRUSERCV write SetDVRUSERCV; //DVR 사용 유무 0.미사용,1.사용
    property DoorArmAreaStateRCV : Boolean read FDoorArmAreaStateRCV write SetDoorArmAreaStateRCV;
    property ECUUSERCV : string read FECUUSERCV write SetECUUSERCV;  //ECU 사용유무 설정
    property ECUNETWORKRCV : string read FECUNETWORKRCV write SetECUNETWORKRCV; //ECU 네트웍 상태 조회 유무
    property KTTCDMADATARCV : string read FKTTCDMADATARCV write SetKTTCDMADATARCV;     //CDMA DATA
    property KTTCDMAUSERCV : string read FKTTCDMAUSERCV write SetKTTCDMAUSERCV; //CDMA 사용 유무 0.미사용,1.사용
    property KTTREMOTERINGCOUNTRCV : string read FKTTREMOTERINGCOUNTRCV write SetKTTREMOTERINGCOUNTRCV;  //원격경계시 링횟수
    property KTTSYSTEMIDRCV : string read FKTTSYSTEMIDRCV write SetKTTSYSTEMIDRCV;  //관제 시스템 아이디
    property KTTTELNUMBERRCV : string read FKTTTELNUMBERRCV write SetKTTTELNUMBERRCV;  //관제 데코더 전화번호1

    property ReciveStateChange : Boolean read FReciveStateChange write SetReciveStateChange; //수신 상태 변경 여부
  published
    Property DeviceID:string Read FDeviceID write SetDeviceID;   //노드 아이디 7자리
    property InfoInitialize : Boolean Read FInfoInitialize write FInfoInitialize;
    property LastNetworkState:string Read FLastNetworkState write SetLastNetworkState;
    Property No: Integer Read FNo write SetNo;
    property NodeName : string read FNodeName write FNodeName;
    property NODEIP : string Read FNODEIP write FNODEIP;
    property NodePort : integer Read FNodePort Write FNodePort;
    property SocketType : integer read FSocketType write FSocketType;  //소켓 타입 1.PC -> 기기,2.PC <- 기기
    property FTPComplete : Boolean read FFTPComplete write FFTPComplete;
    property FireReceive : integer read FFireReceive write FFireReceive;  //0:화재발생 없음,1:화재발생송신중,2:화재발생수신
  published
    //AntiPass 이벤트
    property OnAntiPassDataEvent : TAntiPassEvent read FOnAntiPassDataEvent write FOnAntiPassDataEvent;               //데이터 수신
    //노드 이벤트
    property OnArmAreaPacketChange : TArmAreaPacket read FOnArmAreaPacketChange write FOnArmAreaPacketChange;
    property OnAutoDownLoadStart : TNotifyReceive read FOnAutoDownLoadStart write FOnAutoDownLoadStart;
    //카드데이터 이벤트 발생
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
    property OnReceiveData : TReceiveTypeChange read FOnReceiveData write FOnReceiveData;                //데이터 수신
    property OnReceiveTypeChage : TReceiveTypeChange read FOnReceiveTypeChage write FOnReceiveTypeChage; //수신상태 변경
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
  //if (G_nMonitoringType = 1) and (aEcuID <> '00') then Exit;  //분기국사 타입에서는 확장기는 등록하지 말자.

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
    oDevice.OnCardPermit := CardPermitAllLoading; //컨트롤러의 카드권한을 모두 로딩 하자.
    oDevice.OnCurrentAlarmEvent := CurrentAlarmEvent;
    oDevice.OnCurrentDoorState  := CurrentDoorState;
    oDevice.OnDeviceCardAccessEvent := DeviceCardAccessEvent;
    oDevice.OnDeviceConnected := DeviceConnectedEvent;
    oDevice.OnDevicePacketChange := DevicePacketChange;
    oDevice.OnDeviceUsed := DeviceUsedEvent;
    oDevice.OnDeviceReceiveDataEvent := DeviceReceiveData;
    oDevice.OnDoorPacketChange := DoorPacketChange;
    oDevice.OnDoorHolidaySend := DoorHolidaySend;
    oDevice.OnEmployeePermit := EmployeePermitAllLoading; //컨트롤러의 사원권한을 모두 로딩하자.
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

procedure TNode.CardDownLoadTimer;
var
  i : integer;
begin
  if G_bApplicationTerminate then Exit;

  if L_bCardDownLoading then Exit;
  if NodeDestory then Exit;
  Try
    L_bCardDownLoading := True;
    //여기서 카드데이터 다운로드 하자.
    if L_nCardDownLoadEcuSeq > NodeDeviceList.Count - 1 then L_nCardDownLoadEcuSeq := 0;

    Try
      for i := L_nCardDownLoadEcuSeq to NodeDeviceList.Count - 1 do
      begin
        if NodeDestory then Exit;
        if (TDevice(NodeDeviceList.Objects[i]).DEVICECONNECTED = csConnected) and Not TDevice(NodeDeviceList.Objects[i]).CardDownloadRCV then
        begin
          TDevice(NodeDeviceList.Objects[i]).AutoCardDownloadStart;
          if NodeDestory then Exit;
          if Assigned(FOnAutoDownLoadStart) then
            OnAutoDownLoadStart(self,NO,TDevice(NodeDeviceList.Objects[i]).EcuId + ' CardDownLoad Start ');

          break;
        end else L_nCardDownLoadEcuSeq := i;
      end;

(*      if L_nCardDownLoadEcuSeq = NodeDeviceList.Count - 1 then
      begin
        for i := 0 to NodeDeviceList.Count - 1 do
        begin
          if NodeDestory then Exit;
          if Not TDevice(NodeDeviceList.Objects[i]).CardDownloadRCV then //다운로드 되지 않은 컨트롤러가 있으면
          begin
            break;
          end;
        end;
        //if bResult then CardDownLoadTimer.Enabled := False;  //전체 다운로드 완료시 타이머 스톱
      end;
*)
      L_nCardDownLoadEcuSeq := L_nCardDownLoadEcuSeq + 1;
    Except
      L_nCardDownLoadEcuSeq := L_nCardDownLoadEcuSeq + 1;
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.CardDownLoadTimerTimer');
    End;
  Finally
    L_bCardDownLoading := False;
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

function TNode.CheckFtpDownLoadData: Boolean;
begin
  if FTPDownEcuList.Count > 0 then result := True
  else result := False;
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
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ControlNodeToDeviceArmAreaStateCheck');
  End;
end;

procedure TNode.ControlNodeToDeviceRegDeviceID(aDeviceID: string);
var
  nIndex : integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf('00'); //메인만 해당 하는것임
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

  RcvDataList := TStringList.Create;
  Send1stDataList := TStringList.Create;
  Send2ndDataList := TStringList.Create;
  Send3rdDataList := TStringList.Create;
  Send4thDataList := TStringList.Create;

  FTPDownEcuList := TStringList.Create;
  FTPComplete := True;
  FireReceive := 0;

  L_nSendMsgNo := 0;
  for i := 0 to HIGH(L_cNodeRCVSTATE) do
  begin
    L_cNodeRCVSTATE[i] := 'Y';
  end;
  AddDevice(FillZeroNumber(0,2),True);  //기기 추가는 가장 마지막에 하자...

(*  for i := 0 to 63 do
  begin
    AddDevice(FillZeroNumber(i,2),True);  //기기 추가는 가장 마지막에 하자...
  end;  *)

  //if G_nMonitoringType = 1 then  //분기국사 이면
  if G_nMonitoringProtocol = 1 then  //주장치 전용이면
  begin
    ECUUSERCV := 'Y';
    ECUNETWORKRCV := 'Y';
  end else
  begin
    ECUUSERCV := 'N';
    ECUNETWORKRCV := 'N';
  end;

  L_nFtpDownLoadEcuSeq := 0;
end;

procedure TNode.CurrentAlarmEvent(Sender: TObject; aNodeNo, aECUID, aCmd,
  aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
  aAlarmColor: string);
begin
  if (aZoneState <> 'N') and (aAlarmStateCode = G_stFireStateCode) then
  begin
    L_bFireEvent := True;
    if FireReceive = 1 then FireReceive := 2; //송신중이면 수신으로 처리하자.
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


  NodeDeviceList.Free;
  RcvDataList.Free;
  Send1stDataList.Free;
  Send2ndDataList.Free;
  Send3rdDataList.Free;
  Send4thDataList.Free;

  FTPDownEcuList.Free;

  //G_c_reception_buffer[NO].Free;
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
  SendPacket('00','R',GetSendMsgNo,GetDeviceVer, 'SM2699Rst0000',1); //카드 소트 전송
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
        begin //네트웍 상태 체크중
          ECUNETWORKRCV := 'Y';
          for i := 1 to Length(aData) do
          begin
            nIndex := NodeDeviceList.IndexOf(FillZeroNumber(i-1,2));
            if nIndex > -1 then
            begin
              if aData[i] = 'u' then
              begin
                //TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := False;   //사용유무 체크 하여 설정 하자.
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
        con_DeviceCmdUseState :  //Ecu 사용유무 체크중...
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
  if FireGubunCode = '' then Exit; //화재그룹 사용 안하는 경우
  if (aFireGubunCode <> '999') and (FireGubunCode <> aFireGubunCode) then Exit;
  if FireReceive = 0 then FireReceive := 1;  //화재 발생 하지 않은것으로 설정 되어 있으면 화재발생 수신해야 한다.
  L_bFireEvent := True;
  SendPacket('00','R',GetSendMsgNo,GetDeviceVer, 'SM2900Fire',1);
  LogSave(G_stLogDirectory + '\Fire' + FormatDateTime('yyyymmdd',now) + '.log',NODEIP + ' Fire ');
end;

procedure TNode.FireRecovery;
begin
  FireReceive := 0; //화재 복구로 무조건 처리하자.
  L_bFireEvent := False;
  SendPacket('00','R',GetSendMsgNo,GetDeviceVer, 'SM2699RSM2500',1);
  LogSave(G_stLogDirectory + '\Fire' + FormatDateTime('yyyymmdd',now) + '.log',NODEIP + ' Fire Recovery');

end;

procedure TNode.FireRecoveryTimer;
var
  i : integer;
  bResult : Boolean;
begin
  if G_bApplicationTerminate then Exit;
  if NodeDestory then Exit;
  if Not FireEvent then Exit;


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

  if bResult and Not L_bFireEvent then FireRecovery;

  FireEvent := bResult;
end;

procedure TNode.FTPCardDownLoadTimer;
var
//  nIndex : integer;
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
        Exit;
      end;

      //if L_nFtpDownLoadEcuSeq > FTPDownEcuList.Count - 1 then L_nFtpDownLoadEcuSeq := 0;
      L_nFtpDownLoadEcuSeq := NodeDeviceList.IndexOf(FTPDownEcuList.strings[0]);
      if L_nFtpDownLoadEcuSeq < 0 then Exit;
      FTPComplete := False;
      TDevice(NodeDeviceList.Objects[L_nFtpDownLoadEcuSeq]).FTPFirst := True;
      TDevice(NodeDeviceList.Objects[L_nFtpDownLoadEcuSeq]).DeviceFTPCardDownLoadStart;
      (*
      for i := 0 to FTPDownEcuList.Count - 1 do
      begin
        nIndex := NodeDeviceList.IndexOf(FTPDownEcuList.strings[i]);
        if nIndex < 0 then Exit;
        FTPComplete := False;
        for j := 1 to 3 do // 실패시 3번 재전송 해 보자
        begin
          if j = 1 then TDevice(NodeDeviceList.Objects[nIndex]).FTPFirst := True;

          if TDevice(NodeDeviceList.Objects[nIndex]).DeviceFTPCardDownLoadStart then
          begin
            FTPDownEcuList.Delete(i);
            FTPComplete := True;
            break;
          end;
          if j > 2 then  //3 번 전송에서 실패 하면 전체를 전문 타입으로 전송 처리
          begin
            TDevice(NodeDeviceList.Objects[nIndex]).DeviceCardAllResend;
            FTPComplete := True;
            FTPDownEcuList.Delete(i);
          end;
        end;
        break;
      end;
      *)
    Except
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.FTPCardDownLoadTimerTimer');
    End;
  Finally
    G_bFTPCardDownLoading := False;
  End;
end;

function TNode.FTPCompleteCheck: Boolean;
begin
  result := False;
  if NodeDeviceList.Count < 1 then Exit;

  if TDevice(NodeDeviceList.Objects[L_nFtpDownLoadEcuSeq]).FTPCardDownLoadEnd or TDevice(NodeDeviceList.Objects[L_nFtpDownLoadEcuSeq]).FTPCardDownLoadFail then
  begin
    FTPComplete := True;
    if TDevice(NodeDeviceList.Objects[L_nFtpDownLoadEcuSeq]).FTPCardDownLoadFail then TDevice(NodeDeviceList.Objects[L_nFtpDownLoadEcuSeq]).DeviceCardAllResend;
    if FTPDownEcuList.count > 0 then FTPDownEcuList.Delete(0);
  end;

  result := True;
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
    result := '00'; //오류발생시 0 건처리
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    nTemp := TDevice(NodeDeviceList.Objects[nIndex]).MaxDoorCount;
    stData := stData + char($30 + nTemp); //출입문 최대 갯수
    stData := stData + char($30 + nDoorFormatLength);     //출입문상태포맷길이
    for i := 0 to nTemp - 1 do
    begin
      stData := stData + TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToDoorIndexState(i,nDoorFormatLength);
    end;
    stData := stData + char($30 + 9); //방범구역 최대 갯수  - 9
    stData := stData + char($30 + nArmAreaFormatLength);     //방범구역상태포맷길이
    for i := 0 to 8 do
    begin
      stData := stData + TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToArmAreaIndexMode(i,nArmAreaFormatLength);
    end;
    nTemp := TDevice(NodeDeviceList.Objects[nIndex]).MaxReaderCount;
    stData := stData + char($30 + nTemp); //카드리더 최대 갯수
    stData := stData + char($30 + nCardReaderFormatLength);     //카드리더상태포맷길이
    for i := 0 to nTemp - 1 do
    begin
      stData := stData + TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToCardReaderIndexState(i,nCardReaderFormatLength);
    end;
    result := stData;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceDoorArmaAreaState');
  End;
end;

function TNode.GetDeviceDoorState(aEcuID, aDoorNo: string; var aCardMode,
  aDoorMode, aDoorState, aLockState, aDoorFire: string): Boolean;
var
  nIndex : integer;
begin
  result := False;
  nIndex := NodeDeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceDoorState(aDoorNo,aCardMode,aDoorMode,aDoorState,aLockState,aDoorFire);
end;

function TNode.GetDeviceDoorStateResend(aEcuID, aDoorNo: string): Boolean;
var
  nIndex : integer;
begin
  result := False;
  nIndex := NodeDeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceDoorStateResend(aDoorNo);

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
      con_CardReaderCmdDoorPosition : begin  //출입문 위치
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToCardReaderIDDoorPosition(aSubNo);
      end;
      con_CardReaderCmdType : begin   //카드리더 타입
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

  if L_stDeviceVer = '' then L_stDeviceVer := 'K1';

  Result := L_stDeviceVer;
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
  result := inttostr(L_nSendMsgNo)[1];
  L_nSendMsgNo := L_nSendMsgNo + 1;
  if L_nSendMsgNo > 9 then L_nSendMsgNo := 0;
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

    NodeConnected := csDisConnected;
    ShutDown(p_socket, 2);
    l_linger.l_onoff:= 1;
    l_linger.l_linger:= 0;

    SetSockOpt(p_socket, Sol_Socket, So_Linger, pAnsichar(AnsiString(l_absolute_linger)), sizeof(l_linger));  //l_absolute_linger[0] -> AnsiString(l_absolute_linger) 으로 변경

    l_status:= CloseSocket(p_socket);
    //if l_status <> 0 then
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
    if L_c_reception_buffer = nil then Exit;
    if NodeDestory then Exit;
    with L_c_reception_buffer do
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
//TEST1
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
  if NO>=0 then L_bSocketWriting := False; //전송 완료
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

procedure TNode.NFCheckTimer;
begin
  if G_bApplicationTerminate then Exit;
  if NodeDestory then Exit;
  if NodeConnected = csConnected then Exit;   //접속 상태이면 빠져 나감
  if LastNetworkState = 'NF' then Exit;
  if ConnectRetryCount < SocketConnectRetryCount then Exit; //처음 접속 시도 를 3회 까지는 NF를 만들지 말자.


  if Now < IncTime(NodeDisConnectTime,0,0,60,0)  then Exit; //끊어진 후 1분 미만이면 NF 을 만들지 말자.

  LastNetworkState := 'NF';
end;

function TNode.NodeDataPacketProcess(aPacket:RawByteString): Boolean;
var
  stECUID : string;
  stRealData : string;
  chCMD : char;
  chMsgNo : char;
  cKey : char;
  nIndex : integer;
  stTemp : String;
  stPacket : RawByteString;
begin
  //if RcvDataList.Count < 1 then Exit; //수신 데이터가 없다.

  //stPacket := RcvDataList.Strings[0];
  //RcvDataList.Delete(0);;
  stPacket := aPacket ;
  //G_nDebugRcvPacketCount := G_nDebugRcvPacketCount - 1;
  if stPacket = '' then Exit;
  Try
    result := False;
    stTemp := copy(stPacket,5,1);
    cKey := stTemp[1];
    DeviceID := Copy(stPacket, 8, G_nIDLength);
    stECUID := copy(stPacket,8 + G_nIDLength,2);
    stTemp := copy(stPacket,G_nIDLength + 10,1);
    chCMD:= stTemp[1];
    stTemp := copy(stPacket,G_nIDLength + 11,1);
    chMsgNo:= stTemp[1];
    L_stDeviceVer := copy(stPacket,6,2);
    if Assigned(FOnNodePacket) then
    begin
      OnNodePacket(Self,No,NodeName,stECUID,chCMD,chMsgNo,L_stDeviceVer,stPacket,'RX');
    end;
    //066*SK000000000Arn20140113144756MN0000d00***160000000000******81

    stRealData := Copy(stPacket,G_nIDLength + 12,Length(stPacket)-(G_nIDLength + 14));

    if L_stReceivedLastpacket = stPacket then
    begin
      if (chCMD <> 'c') AND (chCMD <> 'A') then   //알람 데이터 또는 출입이벤트가 아니면 Ack 전송
      begin
        SendPacket(stECUID,'a',chMsgNo,L_stDeviceVer, 'w000', 0); //Ack 전송
      end;
      //최종 패킷과 현재 패킷이 같으면 무시하자
      Exit;
    end;
    L_stReceivedLastpacket := stPacket;

    //if (pos('Bad Command',aPacketData) > 0) or (pos('COMM ERROR',aPacketData) > 0 ) or (pos('UNUSED',aPacketData) > 0 ) then
    if (pos('COMM ERROR',stPacket) > 0 ) then
    begin
      ECUConnected(stECUID,csDisConnected);
    end else if (pos('UNUSED',stPacket) > 0 ) then
    begin
      ECUUsed(stECUID,False);
      ECUConnected(stECUID,csDisConnected);
    end else
    begin
      if (chCMD <> 'A') and (chCMD <> 'o') then ECUConnected(stECUID,csConnected);//통신에러 나오는 경우도 있음
    end;

    if (chCMD = 'a') then
    begin
      Exit;
    end;

    {받은 데이터 커맨드별 처리}
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
    ★ c(출입통제 데이터)인경우에는 ACK 를 'c' command를 만들어 응답을 해야 한다.
    즉 ACK 응답을 두번 주어야 한다.(①전체 패킷응답,②출입통제 응답)
    ================================================================================ }
    nIndex := NodeDeviceList.IndexOf(stECUID);
    if nIndex > -1 then
    begin
      case chCMD of
        'A','o':{알람}      begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceAlarmData(stECUID,L_stDeviceVer,chMsgNo,chCMD,stRealData)         end;
        'i':{Initial}       begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRegDataProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)             end;
        'R':{Remote}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRemoteDataProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)          end;
        'r':{Remote Answer} begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRemoteDataProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)          end;
        'c':{출입통제}      begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceAccessDataProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)          end;
        'f':{펌웨어}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceFirmwareProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)            end;
        'F':{펌웨어}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceFirmwareProcess2(stECUID,L_stDeviceVer,chMsgNo,stRealData)           end;
        '*':{브로드캐스트}  begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceBroadCastProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)           end;
        'E':{ERROR}         begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceErrorDataProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)       end;
        'm':{관제데이터 모니터링 } begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDevicePTMonitoringProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)  end;
        'M':{메세지참조 }   begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceMessageProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)  end;
        '#':{게이지 값 모니터링} begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceGageMonitor(stECUID,L_stDeviceVer,chMsgNo,stRealData)            end;
        'e':{ENQ}           begin {ErrorDataProcess(stECUID,G_stDeviceVer,stRealData) }           end;
        else {error 발생: [E003]정의 되지 않은 커맨드}  begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceErrorDataProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData) end;
      end;
    end else
    begin
      AddDevice(stECUID,True);
      nIndex := NodeDeviceList.IndexOf(stECUID);
      if nIndex > -1 then
      begin
        case chCMD of
          'A','o':{알람}      begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceAlarmData(stECUID,L_stDeviceVer,chMsgNo,chCMD,stRealData)         end;
          'i':{Initial}       begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRegDataProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)             end;
          'R':{Remote}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRemoteDataProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)          end;
          'r':{Remote Answer} begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRemoteDataProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)          end;
          'c':{출입통제}      begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceAccessDataProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)          end;
          'f':{펌웨어}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceFirmwareProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)            end;
          'F':{펌웨어}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceFirmwareProcess2(stECUID,L_stDeviceVer,chMsgNo,stRealData)           end;
          '*':{브로드캐스트}  begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceBroadCastProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)           end;
          'E':{ERROR}         begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceErrorDataProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)       end;
          'm':{관제데이터 모니터링 } begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDevicePTMonitoringProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)  end;
          'M':{메세지참조 }   begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceMessageProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData)  end;
          '#':{게이지 값 모니터링} begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceGageMonitor(stECUID,L_stDeviceVer,chMsgNo,stRealData)            end;
          'e':{ENQ}           begin {ErrorDataProcess(stECUID,G_stDeviceVer,stRealData) }           end;
          else {error 발생: [E003]정의 되지 않은 커맨드}  begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceErrorDataProcess(stECUID,L_stDeviceVer,chMsgNo,stRealData) end;
        end;
      end
    end;
    if (chCMD <> 'c') then
    begin
      SendPacket(stECUID,'a',chMsgNo,L_stDeviceVer, 'w000', 0); //Ack 전송
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
  stPacket : string;
begin
  Try
    bLoop := False;
    repeat
      if Trim(L_stComBuffer) = '' then Exit;
      nFormat := dmDevicePacket.PacketFormatCheck(L_stComBuffer,G_nProgramType,stLeavePacketData,stPacketData);
      if nFormat < 0 then
      begin
        if L_stComBuffer = '' then break;
        if nFormat = -1 then  //비정상 전문 인경우
        begin
           Delete(L_stComBuffer,1,1);
           continue;
        end else break;   //포맷 길이가 작게 들어온 경우
      end;
      L_stComBuffer:= stLeavePacketData;
      bDecoderFormat := False;
      if nFormat = 1 then bDecoderFormat := False
      else if nFormat = 2 then bDecoderFormat := True
      else continue;
      if bDecoderFormat then continue;   //데코더 포맷인 경우 처리 하지 말자
      if stPacketData <> '' then
      begin
        (*stPacket := String(stPacketData);
        if RcvDataList.IndexOf(stPacket) < 0 then
        begin
          RcvDataList.Add(stPacket);
          inc(G_nDebugRcvPacketCount);
        end;   *)
        NodeDataPacketProcess(stPacketData);
      end;

      if pos(ETX,L_stComBuffer) = 0 then bLoop := True
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
        if KTTSYSTEMIDRCV = 'R' then KTTSYSTEMIDRCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;  //관제 시스템 아이디
      con_DeviceCmdKTTTelNumber1: begin
        KTTTELNUMBERRCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTTelNumberCheck('0');
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTTelNumberCheck('1');
        end;
        if KTTTELNUMBERRCV = 'R' then KTTTELNUMBERRCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;  //관제 데코더 전화번호
      con_DeviceCmdKTTREMOTEARMRINGCOUNT: begin
        KTTREMOTERINGCOUNTRCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTRingCountCheck;
        end;
        if KTTREMOTERINGCOUNTRCV = 'R' then KTTREMOTERINGCOUNTRCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;  //원격경해시 링횟수
      con_DeviceCmdKttCdmaUse: begin
        KTTCDMAUSERCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTCDMAUSECheck;
        end;
        if KTTCDMAUSERCV = 'R' then KTTCDMAUSERCV := 'Y'; //수신 하지 못한 경우 수신 하지 말자.
      end; //CDMA 사용 유무 0.미사용,1.사용
      con_DeviceCmdKttCDMADATA: begin
        KTTCDMADATARCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTCDMADATACheck;
        end;
        if KTTCDMADATARCV = 'R' then KTTCDMADATARCV := 'Y'; //CDMA 모듈이 없는 경우 아무런 메시지도 오지 않음
      end;     //CDMA IP
      con_DeivceCmdDVRUSE: begin
        DVRUSERCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceDVRUseCheck;
        end;
        if DVRUSERCV = 'R' then DVRUSERCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end; //DVR 사용 유무 0.미사용,1.사용
      con_DeviceCmdDVRIP: begin
        DVRDATARCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceDVRDataCheck;
        end;
        if DVRDATARCV = 'R' then DVRDATARCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
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
        if ARMEXTENTIONMAINTOLOCALRCV = 'R' then ARMEXTENTIONMAINTOLOCALRCV := 'Y'; //수신 하지 못한 경우 수신 하지 말자
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
        if ARMEXTENTIONMAINFROMLOCALRCV = 'R' then ARMEXTENTIONMAINFROMLOCALRCV := 'Y'; //수신 하지 못한 경우 재수신 하지 말자
      end;
      con_DeviceCmdUseState : begin
        ECUUSERCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceECUUseCheck;
        end;
        if ECUUSERCV = 'R' then ECUUSERCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
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
        if KTTSYSTEMIDRCV = 'S' then KTTSYSTEMIDRCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;  //관제 시스템 아이디
      con_DeviceCmdKTTTelNumber1: begin
        KTTTELNUMBERRCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTTelNumber('0',KTTTELNUMBER1);
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTTelNumber('1',KTTTELNUMBER2);
        end;
        if KTTTELNUMBERRCV = 'S' then KTTTELNUMBERRCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;  //관제 데코더 전화번호
      con_DeviceCmdKTTREMOTEARMRINGCOUNT: begin
        KTTREMOTERINGCOUNTRCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTRingCount(inttostr(KTTREMOTEARMRINGCOUNT),inttostr(KTTREMOTEDISARMRINGCOUNT));
        end;
        if KTTREMOTERINGCOUNTRCV = 'S' then KTTREMOTERINGCOUNTRCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;  //원격경해시 링횟수
      con_DeviceCmdKttCdmaUse: begin
        KTTCDMAUSERCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTCDMAUSE(KTTCDMAUSE);
        end;
        if KTTCDMAUSERCV = 'S' then KTTCDMAUSERCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end; //CDMA 사용 유무 0.미사용,1.사용
      con_DeviceCmdKttCDMADATA: begin
        KTTCDMADATARCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTCDMADATA(KTTCDMAMIN,KTTCDMAMUX,KTTCDMAIP,KTTCDMAPORT,KTTCDMACHECKTIME,KTTCDMARSSI);
        end;
        if KTTCDMADATARCV = 'S' then KTTCDMADATARCV := 'U'; //CDMA 모듈이 없는 경우 아무런 메시지도 오지 않음
      end;     //CDMA IP
      con_DeivceCmdDVRUSE: begin
        DVRUSERCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceDVRUse(DVRUSE);
        end;
        if DVRUSERCV = 'S' then DVRUSERCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end; //DVR 사용 유무 0.미사용,1.사용
      con_DeviceCmdDVRIP: begin
        DVRDATARCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceDVRData(DVRIP,DVRPORT);
        end;
        if DVRDATARCV = 'S' then DVRDATARCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
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
        if ARMEXTENTIONMAINTOLOCALRCV = 'S' then ARMEXTENTIONMAINTOLOCALRCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
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
        if ARMEXTENTIONMAINFROMLOCALRCV = 'S' then ARMEXTENTIONMAINFROMLOCALRCV := 'U'; //송신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;
      con_DeviceCmdUseState : begin
        ECUUSERCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceECUUse(GetRegEcuUseData);
        end;
        if ECUUSERCV = 'S' then ECUUSERCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeInformationSend');
  End;
end;

procedure TNode.NodeSendPacketTimer;
var
  stPacket : string;
  nCardDelayCount : integer;
begin
  if G_bApplicationTerminate then Exit;

  if L_bSocketWriting then
  begin
    if Assigned(FOnNodePacket) then
    begin
      OnNodePacket(Self,No,NodeName,'00','c','0','Er',stPacket,'rTX');
    end;
    L_nSendDelayCount := L_nSendDelayCount + 1;

    if (L_nSendDelayCount > 100) then SocketOpen := False;

    Exit; //전송 중에는 보내지 말자.  => 전송 완료 메시지 이벤트가 발생 안되어 무용지물
  end;

  if NodeDestory then Exit;
  if G_bDebug then
  begin
    inc(L_nDebugCnt);
  end;

  Try
    nCardDelayCount := 20;   //카드데이터 다운로드시 200ms 에 하나씩 전송 하기 위해서 400ms 안된 경우 전송 하지 말자.
    if L_nDebugCnt > 200 then
    begin
      LogSave(G_stLogDirectory + '\NodeSendPacketTimer' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(No) + ' SendNull(' +  inttostr(Send1stDataList.Count) + '/' + inttostr(Send2ndDataList.Count) + '/' + inttostr(Send3rdDataList.Count) + '/' + inttostr(Send4thDataList.Count) + ')' );
      L_nDebugCnt := 0;
    end;

    L_nSendDelayCount := L_nSendDelayCount + 1;
    stPacket := '';
    if (Send1stDataList.Count > 0) and (L_n1stCount < 5) then
    begin
      if L_nSendDelayCount > nCardDelayCount then L_nSendDelayCount := 0;
      stPacket := Send1stDataList.Strings[0];
      Send1stDataList.Delete(0);
      inc(L_n1stCount);
      G_nDebugSendPacketCount := G_nDebugSendPacketCount - 1;
      if Assigned(FOnNodePacket) then
      begin
        OnNodePacket(Self,No,NodeName,'00','c','0','D0',stPacket,'rTX');
      end;
      if L_nDebugCnt > 100 then
      begin
        LogSave(G_stLogDirectory + '\NodeSendPacketTimer' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(No) + ' Send1stDataList(' + inttostr(Send2ndDataList.Count) + '/' + inttostr(Send3rdDataList.Count) + '/' + inttostr(Send4thDataList.Count) + ')' );
        L_nDebugCnt := 0;
      end;
    end else if (Send2ndDataList.Count > 0) and (L_n2ndCount < 5) then
    begin
      L_n1stCount := 0;
      if L_nSendDelayCount > nCardDelayCount then L_nSendDelayCount := 0;
      stPacket := Send2ndDataList.Strings[0];
      Send2ndDataList.Delete(0);
      inc(L_n2ndCount);
      G_nDebugSendPacketCount := G_nDebugSendPacketCount - 1;
      if Assigned(FOnNodePacket) then
      begin
        OnNodePacket(Self,No,NodeName,'00','c','0','C0',stPacket,'rTX');
      end;
      if L_nDebugCnt > 50 then
      begin
        LogSave(G_stLogDirectory + '\NodeSendPacketTimer' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(No) + ' Send2ndDataList(' + inttostr(Send2ndDataList.Count) + '/' + inttostr(Send3rdDataList.Count) + '/' + inttostr(Send4thDataList.Count) + ')');
        L_nDebugCnt := 0;
      end;
    end else if (Send3rdDataList.Count > 0) and (L_n3rdCount < 5) then
    begin
      L_n1stCount := 0;
      L_n2ndCount := 0;
      if L_nSendDelayCount > nCardDelayCount then L_nSendDelayCount := 0;
      stPacket := Send3rdDataList.Strings[0];
      Send3rdDataList.Delete(0);
      inc(L_n3rdCount);
      G_nDebugSendPacketCount := G_nDebugSendPacketCount - 1;
      if Assigned(FOnNodePacket) then
      begin
        OnNodePacket(Self,No,NodeName,'00','c','0','C1',stPacket,'rTX');
      end;
      if L_nDebugCnt > 40 then
      begin
        LogSave(G_stLogDirectory + '\NodeSendPacketTimer' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(No) + ' Send3ndDataList(' + inttostr(Send2ndDataList.Count) + '/' + inttostr(Send3rdDataList.Count) + '/' + inttostr(Send4thDataList.Count) + ')');
        L_nDebugCnt := 0;
      end;
    end else if (Send4thDataList.Count > 0) and (L_n4thCount < 5) then
    begin
      L_n1stCount := 0;
      L_n2ndCount := 0;
      L_n3rdCount := 0;
      if L_nSendDelayCount < nCardDelayCount then Exit;       //카드데이터 다운로드시 200ms 에 하나씩 전송 하기 위해서 400ms 안된 경우 전송 하지 말자.
      L_nSendDelayCount := 0;
      stPacket := Send4thDataList.Strings[0];
      Send4thDataList.Delete(0);
      inc(L_n4thCount);
      G_nDebugSendPacketCount := G_nDebugSendPacketCount - 1;
      if Assigned(FOnNodePacket) then
      begin
        OnNodePacket(Self,No,NodeName,'00','c','0','C2',stPacket,'rTX');
      end;
      if L_nDebugCnt > 10 then
      begin
        LogSave(G_stLogDirectory + '\NodeSendPacketTimer' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(No) + ' Send4thDataList');
        L_nDebugCnt := 0;
      end;
    end else
    begin
      L_n1stCount := 0;
      L_n2ndCount := 0;
      L_n3rdCount := 0;
      L_n4thCount := 0;
    end;
    if stPacket <> '' then
    begin
      //L_bSocketWriting := True;   //Send 후 이벤트가 발생하지 않네...ㅠ.ㅠ
      PutString(stPacket); //소켓에 전송
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeSendPacketTimerTimer');
  End;
end;

procedure TNode.NRCheckTimer;
begin
  if G_bApplicationTerminate then Exit;
  if NodeDestory then Exit;
  if NodeConnected <> csConnected then Exit;   //미접속 상태이면 빠져 나감
  if LastNetworkState = 'NR' then Exit;

  if Now < IncTime(NodeConnectTime,0,0,60,0)  then Exit; //접속 후 1분 미만이면 NR 을 만들지 말자.

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
            L_bSocketWriting := True;  //Socket에 Full 나면 Write
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

procedure TNode.RcvCheckTimer;
var
  i : integer;
  bReciveStateCheck : Boolean;
begin
  if G_bApplicationTerminate then Exit;
  if Not (NodeConnected = csConnected) then Exit; //노드가 연결되어 있지 않으면 빠져 나감

  if L_bRcvChecking or L_bStateChecking then Exit; //작업 중이면 일단 빠져 나감
  if NodeDestory then Exit;
  if Not ReciveStateChange  then Exit; //상태 변경된건이 없으면 빠져 나감.
  if L_nStateCheckCount > 0 then
  begin
    L_nStateCheckCount := L_nStateCheckCount - 1;
  end;

  L_bRcvChecking := True;
  Try

    Try
      if L_nNodeUpdateIndex > HIGH(L_cNodeRCVSTATE) then L_nNodeUpdateIndex := 0;

      for i := L_nNodeUpdateIndex to HIGH(L_cNodeRCVSTATE) do
      begin
        L_nNodeUpdateIndex := i + 1;
        if L_cNodeRCVSTATE[i] = 'U' then  //변경된 건이 있으면 송신 하자....
        begin
          if NodeDestory then Exit;
          NodeInformationSend(i);
          Exit;
        end;
        Application.ProcessMessages;
      end;
      if L_nNodeSearchIndex > HIGH(L_cNodeRCVSTATE) then L_nNodeSearchIndex := 0;
      for i := L_nNodeSearchIndex to HIGH(L_cNodeRCVSTATE) do
      begin
        L_nNodeSearchIndex := i + 1;
        if L_cNodeRCVSTATE[i] = 'N' then  //상태를 수신할 건이 있으면 수신 체크 하자....
        begin
          if NodeDestory then Exit;
          NodeInformationCheck(i);
          Exit;
        end;
        Application.ProcessMessages;
      end;

      if L_nDeviceSearchIndex > NodeDeviceList.Count - 1 then L_nDeviceSearchIndex := 0;

      for i := L_nDeviceSearchIndex to NodeDeviceList.Count - 1 do  //컨트롤러의 상태가 변경 또는 체크 할것이 있는지 확인하자
      begin
        L_nDeviceSearchIndex := i + 1;
        if TDevice(NodeDeviceList.Objects[i]).DeviceConnected  = csConnected then
        begin
          if TDevice(NodeDeviceList.Objects[i]).ReciveStateChange then
          begin
            if NodeDestory then Exit;
            TDevice(NodeDeviceList.Objects[i]).DeviceReciveCheck;
            ReciveStateChange := True; //다음 장비의 상태를 체크 해야 하므로
            Exit;
          end;
        end;
        Application.ProcessMessages;
      end;

      //여기서는 수신상태 체크 하는 곳 ==> 수신이 안되면 여기서 멈춤 현상 발생
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
        for i := 0 to NodeDeviceList.Count - 1 do  //존의 상태가 변경 또는 체크 할것이 있는지 확인하자
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
    L_bRcvChecking := False;
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
    if aCmd = 'a' then {응답 처리}
       stPacket := dmDevicePacket.PacketCreate(G_nProgramType,stLen,aDeviceVer,stDeviceID,aCmd,aData,aMsgNo,cKey,stNormalPacket)
    else {제어 or 등록 }
    begin
      stPacket := dmDevicePacket.PacketCreate(G_nProgramType,stLen,aDeviceVer,stDeviceID,aCmd,aData,aMsgNo,cKey,stNormalPacket);
    end;
    if aPriority = 0 then    //ack 와 같이 최우선 순위 데이터
    begin
      PutString(stPacket);
    end else if aPriority = 1 then   //제어,조회 명령과 같이 우선 순위 데이터
    begin
      Send1stDataList.Add(stPacket);
    end else if aPriority = 2 then   //AccessEvent 에서 권한 데이터 불일치
    begin
      Send2ndDataList.Add(stPacket);
    end else if aPriority = 3 then
    begin
      Send3rdDataList.Add(stPacket);
    end else if aPriority = 4 then   //Auto CardData DownLoad
    begin
      Send4thDataList.Add(stPacket);
    end;
    if aPriority <> 0 then
    begin
      inc(G_nDebugSendPacketCount);
    end;

    if Assigned(FOnNodePacket) then
    begin
      OnNodePacket(Self,No,NodeName,aEcuID,aCmd,aMsgNo,aDeviceVer,stNormalPacket,'TX');
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SendPacket');
  End;
end;

function TNode.ServerDoorControl(aECUID, aReaderNo, aDoorNo, aATButton, aCardNo,
  aAuth, aVoice: string): integer;
var
  nIndex : integer;
begin
  result := con_NOTDEVICESEND;
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    result := TDevice(NodeDeviceList.Objects[nIndex]).ServerDoorControl(aReaderNo, aDoorNo, aATButton, aCardNo,aAuth, aVoice);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ControlNodeToDeviceReset');
  End;

end;

procedure TNode.ServerSocketClose;
var
  l_result : integer;
begin
  Try
    if SocketType <> 2 then Exit; //PC 서버 소켓 타입이 아니면 이쪽을 타지 말자.

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
    if SocketType <> 2 then Exit; //PC 서버 소켓 타입이 아니면 이쪽을 타지 말자.

    if L_c_reception_buffer = nil then Exit;
    with L_c_reception_buffer do
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
    if Not bUsed then ARMEXTENTIONGUBUN := '0';  //사용안함
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
    if Not bUsed then ARMEXTENTIONGUBUN := '0';  //사용안함
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
    if nIndex < 0 then
    begin
      AddDevice(aEcuID,True);
      nIndex := NodeDeviceList.IndexOf(aEcuID);
    end;
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
    //DVR 기능이 없으면 DVR 상태를 체크 하지 말자.
    DVRUSERCV :='Y'; //DVR 사용 유무 0.미사용,1.사용
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

procedure TNode.SetECUNETWORKRCV(const Value: string);
begin
  FECUNETWORKRCV := Value;
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
    //CDMA 기능이 없으면 CDMA 상태를 체크 하지 말자.
    KTTCDMAUSERCV := 'Y'; //CDMA 사용 유무 0.미사용,1.사용
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


  if InfoInitialize then Exit;  //DB읽어서 셋팅중인경우에는 이벤트 생성하지 말자고...

  if (FLastNetworkState <> '') then  //'NR' 인 경우 처음 로딩 상태가 아니면
  begin
    //여기에서 NetworkAlarm상태를 만들자.
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
  if FNO = Value then Exit;
  FNo := Value;


  L_bSocketWriting := False;
  L_bFireEvent := False;
  L_c_reception_buffer := nil;
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
      if (L_c_reception_buffer = nil) then
        L_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);  //소켓 연결시에 버퍼 생성하자.
      NodeConnectTime := Now;
      L_bSocketWriting := False;
      DoorArmAreaStateRCV := False;
      L_nStateCheckCount := 40;
//      RcvCheckTimer.Interval := 20000; //20초 후부터 기기정보 수신 체크
//      RcvCheckTimer.Enabled := True; //수신상태 체크
      ControlNodeToDeviceTimeSync;
      ConnectRetryCount := SocketConnectRetryCount; //처음 접속 한 이 후 부터는 통신 이상을 만들자.
//      ConnectRetryCount := 0; //20180308 접속 성공 후에 다시 3번 접속 시도 할 동안 NF를 만들지 말자. -원복
    end else
    begin
      if L_c_reception_buffer <> nil then
      begin
        L_c_reception_buffer.free;   //소켓 끊어지면 소켓 Clear 하자.
        L_c_reception_buffer := nil;
      end;
      L_stComBuffer := ''; //버퍼 Clear;
      NodeDisConnectTime := Now;
      if RcvDataList.Count > 0 then
      begin
        G_nDebugRcvPacketCount := G_nDebugRcvPacketCount - RcvDataList.Count;
        RcvDataList.Clear;
      end;
      if Send1stDataList.Count > 0 then
      begin
        G_nDebugSendPacketCount := G_nDebugSendPacketCount - Send1stDataList.Count;
        Send1stDataList.Clear;
      end;
      if Send2ndDataList.Count > 0 then
      begin
        G_nDebugSendPacketCount := G_nDebugSendPacketCount - Send2ndDataList.Count;
        Send2ndDataList.Clear;
      end;
      if Send3rdDataList.Count > 0 then
      begin
        G_nDebugSendPacketCount := G_nDebugSendPacketCount - Send3rdDataList.Count;
        Send3rdDataList.Clear;
      end;
      if Send4thDataList.Count > 0 then
      begin
        G_nDebugSendPacketCount := G_nDebugSendPacketCount - Send4thDataList.Count;
        Send4thDataList.Clear;
      end;
      //LastNetworkState := 'NF';
      for i := 0 to NodeDeviceList.Count - 1 do
      begin
        if Not NodeDestory then TDevice(NodeDeviceList.Objects[i]).DeviceConnected := csDisConnected;
      end;

      DoorArmAreaStateRCV := True;
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
  aEndDate, aEmState: string;aSendType:integer=0);
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
    aTime4, aTCWeekCode,aRegDate,aEndDate,aEmState,aSendType);
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
  FReciveStateChange := Value;   //수신상태 변경 되었을때 이곳으로
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
  if SocketType <> 1 then Exit;  //Server -> Device 가 아닌 경우에는 소켓 오픈을 하지 말자...
  if Value then
  begin
    ConnectRetryCount := ConnectRetryCount + 1;
    LastReceiveTime := Now;
    l_version:= $0101;
    l_result := wsaStartup(l_version, L_wsa_data);
    if l_result <> 0 then
    begin
      SocketOpen := False;
      LogSave(G_stLogDirectory + '\ErrSocket' + FormatDateTime('yyyymmdd',now) + '.log',NODEIP + ':wsaStartup');
      Exit;  //소켓생성 실패 시에 Open False
    end;
    WinSocket:= Socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
    if WinSocket = INVALID_SOCKET then
    begin
      SocketOpen := False;
      LogSave(G_stLogDirectory + '\ErrSocket' + FormatDateTime('yyyymmdd',now) + '.log',NODEIP + ':Socket');
      Exit;  //소켓생성 실패 시에 Open False
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
        LogSave(G_stLogDirectory + '\ErrSocket' + FormatDateTime('yyyymmdd',now) + '.log',NODEIP + ':' + inttostr(l_error));
        Exit;  //소켓생성 실패 시에 Open False
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
      Exit;  //소켓생성 실패 시에 Open False
    end; }

//    l_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);
  end else
  begin
    Try
      NodeConnected := csDisConnected;
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
    Except
      Exit;
    End;
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
    stTemp := ByteCopy(Buf,DataLen);   //FD -> 3F 로 변하는 부분때문에...
//    pTemp := pCopy(Buf,DataLen);
    LastReceiveTime := Now;
    L_stComBuffer := L_stComBuffer + stTemp;
    NodeDataReadingProcessing;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.TcpClientReceive');
  End;
end;

procedure TNode.StateCheckTimer;
var
  nIndex : integer;
  i : integer;
  bResult : Boolean;
begin
  if G_bApplicationTerminate then Exit;
  if Not (NodeConnected = csConnected) then Exit; //노드가 연결되어 있지 않으면 빠져 나감


  if L_bRcvChecking or L_bStateChecking then Exit; //작업 중이면 일단 빠져 나감
  if NodeDestory then Exit;

  Try
    if ECUUSERCV <> 'Y' then
    begin
      ECUUSERCV := 'R';
      nIndex := NodeDeviceList.IndexOf('00');
      if nIndex > -1 then
      begin
        if G_nMonitoringProtocol <> 1 then TDevice(NodeDeviceList.Objects[nIndex]).DeviceECUUseCheck;
      end;
      if ECUUSERCV = 'R' then ECUUSERCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      if G_nMonitoringProtocol = 1 then ECUUSERCV := 'Y';    //주장치 전용이면 체크할 필요 없다.
      Exit;
    end;
    if ECUNETWORKRCV <> 'Y' then
    begin
      ECUNETWORKRCV := 'R';
      nIndex := NodeDeviceList.IndexOf('00');
      if nIndex > -1 then
      begin
        if G_nMonitoringProtocol <> 1 then TDevice(NodeDeviceList.Objects[nIndex]).DeviceNetworkCheck;
      end;
      if ECUNETWORKRCV = 'R' then ECUNETWORKRCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      if G_nMonitoringProtocol = 1 then ECUNETWORKRCV := 'Y';    //주장치 전용이면 체크할 필요 없다.
      Exit;
    end;

    L_bStateChecking := True;
    Try
      if DoorArmAreaStateRCV then Exit; //전체 상태 수신 한 상태이면
      if L_nStateCheckEcuSeq < 0 then L_nStateCheckEcuSeq := 0;
      if ConnectDeviceList.Count < 1 then Exit;
      if L_nStateCheckEcuSeq > ConnectDeviceList.Count - 1  then L_nStateCheckEcuSeq := 0;


      nIndex := NodeDeviceList.IndexOf(ConnectDeviceList.Strings[L_nStateCheckEcuSeq]);
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
        if bResult then DoorArmAreaStateRCV := True; //전체 상태를 모두 조회 한 상태면 타이머 종료 하자.
      end else
      begin
        //여기서 출입문 상태와 방범 상태 조회 하자.
        TDevice(NodeDeviceList.Objects[nIndex]).DeviceCurrentArmDoorStateCheck;
      end;
    Finally
      L_nStateCheckEcuSeq := L_nStateCheckEcuSeq + 1;
      L_bStateChecking := False;
    End;
  Finally
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
