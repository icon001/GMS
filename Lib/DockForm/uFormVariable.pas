unit uFormVariable;

interface
uses  System.Classes;

const
  con_CMDArmAreaName = 1;
  con_CMDArmAreaUsed = 2;
  con_CMDArmAreaArmMode = 3;

const
  MAXFORMCOUNT  = 200;
  MAX_LISTCOUNT = 100; //����Ʈ ��� count

  //Common
  conFORMPCCOMMONITORING = 1;
  conFormREMOTECONTROL = 2;

  //BMSSever
  conFORMCONFIG = 4;
  conFORMNODEADMIN = 5;
  conFORMDEVICECOMMONITORING = 6;

  //BMSMonitoring
  con_FormBMOSACCESSMONITOR = 10;
  con_FormBMOSACCESSHISREPORT = 11;
  con_FormBMOSACCESSREPORT = 12;
  con_FormBMOSACCESSTIME = 13;
  con_FormBMOSADMINCLASSCODE = 15;
  con_FormBMOSADMINCLASSGRADE = 16;
  con_FormBMOSADMINUSERID = 17;
  con_FormBMOSALARMEVENTREPORT = 20;
  con_FormBMOSALARMSTATECODE = 21;
  con_FormBMOSARMAREAACCESSREPORT = 22;
  con_FormBMOSARMAREACODE = 23;
  con_FormBMOSArmAreaMangementREPORT = 24;
  con_FormBMOSARMAREAMAP = 25;
  con_FormBMOSATREPORT = 26;
  con_FormBMOSBUILDINGCODE = 30;
  con_FormBMOSBUILDINGMAP = 31;
  con_FormBMOSBUILDINGMONITOR = 32;
  con_FormBMOSBUTTONEVENTREPORT = 33;
  con_FormBMOSCARDGUBUN = 34;
  con_FormBMOSCARDREGESTFORM = 35;
  con_FormBMOSCOMPANYCODE = 36;
  con_FormBMOSCOMPANYGRADE = 37;
  con_FormBMOSDECODERMANAGER = 40;
  con_FormBMOSDEVICEMANAGER = 41;
  con_FormBMOSDeviceVersionREPORT = 42;
  con_FormBMOSDOORCODE = 45;
  con_FormBMOSDoorMangementREPORT = 46;
  con_FormBMOSDOORMAP = 47;
  con_FormBMOSDOOROPENREPORT = 48;
  con_FormBMOSDOORSCHEDULEADMIN = 49;
  con_FormBMOSEMGROUPCODE = 50;
  con_FormBMOSEMGROUPGRADE = 51;
  con_FormBMOSEMPLOYEE = 52;
  con_FormBMOSEMPLOYEEGRADE = 53;
  con_FormBMOSEMPLOYEEGRADESEARCH = 54;
  con_FormBMOSEMPLOYEEGUBUN = 55;
  con_FormBMOSFPCARDEMPLOYEE = 56;
  con_FormBMOSFOODDEPARTSTATEREPORT = 57;
  con_FormBMOSFOODEVENTREPORT = 58;
  con_FormBMOSFOODMONITOR = 59;
  con_FormBMOSFOODSTATEREPORT = 60;
  con_FormBMOSHOLIDAYADMIN = 61;
  con_FormBMOSKTEMPLOYEE = 62;
  con_FormBMOSMAPACCESS = 65;
  con_FormBMOSMAPMONITOR = 66;
  con_FormBMOSMAPSECURITYACCESS = 67;
  con_FormBMOSMAPSECURITYMONITOR = 68;
  con_FormBMOSMAPZONEMONITOR = 69;
  con_FormBMOSMERGEMONITOR = 70;
  con_FormBMOSMONITOR = 71;
  con_FormBMOSNODEMANAGER = 75;
  con_FormBMOSNOTCARDUSEREPORT = 76;
  con_FormBMOSPERMITRESEND = 80;
  con_FormBMOSPOSICODE = 81;
  con_FormBMOSSECURITYMONITOR = 85;
  con_FormBMOSTELACCESSREPORT = 86;
  con_FormBMOSTIMECODEADMIN = 87;
  con_FormBMOSZONECODE = 90;


  //AFServer
  con_FormAFSConfig = 1;
  con_FormAFSATReader = 2;
  con_FormAFSFoodReader = 3;

  //FingerServer
  conFORMFINGERDEVICE = 1;
  conFORMFINGERDEVICESTATE = 2;
  conFORMFINGERCOMMONITORING = 3;

  //AcademyProgram
  con_FormLectureList = 1;

type
  TMyData=record
    BuildingID:string[50];
    BuildingName:string[50];
    ArmAreaID:string[50];
    ArmAreaName:string[50];
    NormalColor : integer;
    AlarmColor : integer;

    DisArmColor : integer;
    SelectDisArmColor : integer;
    ArmColor : integer;
    SelectArmColor : integer;
  end;
  PMyData=^TMyData;

  TAlarmDeviceType = class(TComponent)
  private
    FAlarmDeviceTypeCode: string;
    FAlarmDeviceTypeName: string;
  public
    property AlarmDeviceTypeCode : string read FAlarmDeviceTypeCode write FAlarmDeviceTypeCode;
    property AlarmDeviceTypeName : string read FAlarmDeviceTypeName write FAlarmDeviceTypeName;
  end;

  TAlarmMode = class(TComponent)
  private
    FAlarmModeCode: string;
    FAlarmModeName: string;
  public
    property AlarmModeCode : string read FAlarmModeCode write FAlarmModeCode;
    property AlarmModeName : string read FAlarmModeName write FAlarmModeName;
  end;

  TCardNo = class(TComponent)
  private
    FCOMPANYNAME: string;
    FCOMPANYCODE: string;
    FEMSEQ: integer;
    FPOSINAME: string;
    FEMCODE: string;
    FPOSICODE: string;
    FCARDNO: string;
    FEMNAME: string;
  public
    property CARDNO : string read FCARDNO write FCARDNO;
    property EMSEQ : integer read FEMSEQ write FEMSEQ;
    property EMCODE : string read FEMCODE write FEMCODE;
    property EMNAME : string read FEMNAME write FEMNAME;
    property COMPANYCODE : string read FCOMPANYCODE write FCOMPANYCODE;
    property COMPANYNAME : string read FCOMPANYNAME write FCOMPANYNAME;
    property POSICODE : string read FPOSICODE write FPOSICODE;
    property POSINAME : string read FPOSINAME write FPOSINAME;
  end;

var
  AlarmDeviceTypeCodeList : TStringList;
  AlarmModeCodeList : TStringList;
  CardList : TStringList;

  G_bFormEnabled: Array [0..MAXFORMCOUNT] of Boolean;     //�� Ȱ��ȭ ����
  G_MonitoringBuildingList : TStringList; //������ ����Ʈ
//  G_MonitoringNodeList : TStringList; //����͸���帮��Ʈ
  G_DoorBuildingList : TStringList;   //�ش� ���Թ��� �����ڵ� ����Ʈ
  G_ArmAreaBuildingList : TStringList;   //�ش� ��������� �����ڵ� ����Ʈ



implementation

end.