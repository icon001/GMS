unit uServerClientVariable;

interface

const
  SCSTX = #$2;    //서버클라이언트 송수신 전문 START
  SCETX = #$3;    //서버클라이언트 송수신 전문 END

  SCNODE = '1';
  SCECU = '2';
  SCDOOR = '3';
  SCARMAREA = '4';
  SCMONITORING = '5';

//************ Event Cmd 정의 ************//
  //RcvDeviceChangeEvent CMD
  SCCMDCONNECTED = '1';
  //RcvDoorChangeEvent CMD
  SCCMDDOORCARDMODE = '1';
  SCCMDDOORMANAGEMODE = '2';
  SCCMDDOORDSSTATE = '3';
  SCCMDDOORLSSTATE = '4';
  SCCMDDOORFIREEVENT = '5';

type
  TSCExcEvent = procedure(Sender: TObject) of object;
  TSCDeviceCardAccessEvent = procedure(Sender: TObject;aDecoderNo:integer;aTime,aNodeNo, aEcuID,aDoorNo,aReaderNo,aInOut,aCardMode,aDoorMode,
                             aChangeState,aAccessResult,aDoorState,aATButton,aType,aArmAreaNo,aCardno,aCompanyCode,
                             aCompanyName,aEmSeq,aEmCode,aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone:string) of object;
  TSCDeviceAlarmEvent = procedure(Sender: TObject;aDecoderNo:integer;aNodeNo,aECUID,aExtendID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                             aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor:string;aRealTime:Boolean=True) of object;
  TSCPacket = procedure(Sender: TObject;  aTxRx,aClientIP,aData,aResult:string) of object;
  TSCSocketClose = procedure(Sender: TObject;  aWinSocket:integer) of object;
  TSCNetworkState = procedure(Sender: TObject;  aDecoderNo:integer;aServerIP,aData:string) of object;

  TArmAreaSecurityModeChange = procedure(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string) of object;
  TBuildingSecurityModeChange = procedure(Sender: TObject;  aBuildingCode:string;aMode : integer) of object;
  TBuildingDoorStateCountChange = procedure(Sender: TObject;  aBuildingCode:string;aState,aCount : integer) of object;
  TDeviceChangeEvent = procedure(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aType,aNo,aCmd,aData:string) of object;
  TDoorChangeEvent = procedure(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string) of object;


implementation

end.
