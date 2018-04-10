unit uCommonVariable;

interface
uses System.Classes,Vcl.Graphics,Winapi.Messages,u_c_byte_buffer,Winapi.WinSock;

const
  MDB = 1;
  MSSQL = 2;
  POSTGRESQL = 3;
  FireBird = 4;

const
  WM_SERVERMANAGERMESSAGE = WM_USER + 1;
  SM_ALIVE = 1024; //SeverManage Alive
  SM_DIE = 1025; //Server Die

const
  con_ComLogTYPE_PROGRAM = '0';
  con_ComLogTYPE_DOOR = '1';
  con_ComLogTYPE_ARMAREA = '2';
  con_ComLogTYPE_DEVICE = '3';
  con_ComLogTYPE_ZONE = '4';

const
  con_ComWorkType_INSERT = '1';
  con_ComWorkType_UPDATE = '2';
  con_ComWorkType_DELETE = '3';

const
  con_MaxDoorCount = 8;

const
  con_DoorNothing = 0;
  con_DoorPMC = 3;
  con_DoorPMO = 4;
  con_DoorPMT = 5;
  con_DoorPMD = 5;
  con_DoorPMU = 6;
  con_DoorPML = 7;
  con_DoorNMC = 9;
  con_DoorNMO = 8;
  con_DoorNMT = 5;
  con_DoorNMD = 5;
  con_DoorNMU = 6;
  con_DoorNML = 7;
  con_DoorPOC = 1;
  con_DoorPOO = 2;
  con_DoorPOT = 5;
  con_DoorPOD = 5;
  con_DoorPOU = 6;
  con_DoorPOL = 7;
  con_DoorNOC = 1;
  con_DoorNOO = 2;
  con_DoorNOT = 5;
  con_DoorNOD = 5;
  con_DoorNOU = 6;
  con_DoorNOL = 7;
  con_DoorPCC = 10;
  con_DoorPCO = 11;
  con_DoorPCT = 5;
  con_DoorPCD = 5;
  con_DoorPCU = 6;
  con_DoorPCL = 7;
  con_DoorNCC = 10;
  con_DoorNCO = 11;
  con_DoorNCT = 5;
  con_DoorNCD = 5;
  con_DoorNCU = 6;
  con_DoorNCL = 7;

type

TMapAlarm = class(TComponent)
  private
    FName: string;
    FCode: string;
    Fhobj: integer;
  public
    property hobj : integer read Fhobj write Fhobj;
    property Code : string read FCode write FCode;
    property Name : string read FName write FName;
  end;

TMapDoor = class(TComponent)
  private
    FName: string;
    FCode: string;
    Fhobj: integer;
  public
    property hobj : integer read Fhobj write Fhobj;
    property Code : string read FCode write FCode;
    property Name : string read FName write FName;
  end;

var
  G_bAccessMonitoringUse : Boolean;   //���� ����͸� ��� ����
  G_bAccessAlarmEventSoundOnUse : Boolean=True; //���Ծ˶��̺�Ʈ �߻��� �˶����� ���
  G_bACMonitorEventSoundOnUse : Boolean; //���� ���� ����͸� �˶� �߻�
  G_bAlarmEventLengthUse : Boolean; //�˶��̺�Ʈ ó���� ���� ���� ���
  G_bAlarmEventMessageUse : Boolean; //�˶��̺�Ʈ �߻��� �޽��� �ڽ� ���
  G_bAlarmEventSoundOnUse : Boolean; //�˶��̺�Ʈ �߻��� �˶� ���� ���
  G_bAlarmMonitoringUse : Boolean;   //�˶� ����͸� ��� ����
  G_bApplicationTerminate : Boolean;
  G_bAttendDedicateDoorUse : Boolean;         //�����������Թ� ������� ���� ���� ����ڸ� �ش� ���Թ��� ��� ������ �ο� �Ѵ�.
  G_bBuildingMonitoringShow : Boolean; //����͸��� ���� ǥ�� ����
  G_bCardButtonEventStatictcs : Boolean; //ī���ư ��� �������
  G_bCardModeShow : Boolean; //ī����� ǥ�� ����
  G_bDataBaseAutoBackup : Boolean; //�����ͺ��̽� �ڵ� ��� ��� ����
  G_bCardAutoDownLoadUse : Boolean; //ī�� �ڵ� �ٿ�ε�
  G_bCardPositionUse : Boolean; //ī�� ��ġ���� �������
  G_bDeviceCommLogSave : Boolean; //����� ��ŵ����� ��������
  G_bDeviceServerUse : Boolean;  //��Ⱑ ���� ���� �����ϴ°�?
  G_bDoorAccessEventSoundOnUse : Boolean; //�̽��� ���� �̺�Ʈ �߻��� �˶��߻�
  G_bDoorColseModeUse : Boolean;  //���Թ� ��� ��� �������
//  G_bDoorLongTimeOpenAlarmUse : Boolean; //��ð� ���� �߻��� �˶� �߻�
//  G_bDoorLongTimeOpenAlarmEventUse : Boolean = True; //��ð� ���� �߻��� �̺�Ʈ �߻� - ���󿡼� ó��
  G_bDoorFireRecoveryUse : Boolean; //ȭ�纹�� �������
  G_bDoorFireRelayUse : Boolean;    //ȭ��� Ÿ �ý��� ���� ��� ����
  G_bDoorLongTimeOpenEventUse : Boolean = False; //��ð� ������ �˶� �̺�Ʈ �߻� ����
  G_bDoorOpenModeOpenStateUse : Boolean;  //������� ���Թ� ���� ǥ��
  G_bExitButtonEventUse : Boolean;              //��ǹ�ư �̷��� ��������� ����
  G_bFingerRelayUse : Boolean;       //���� ��������
  G_bFingerDeleteUse : Boolean = False; //���� üũ ������ ���� ����
  G_bFireAlarmUse : Boolean = False; //ȭ��߻��� �˶� �������
  G_bFireDoorOpenUse : Boolean = False; //ȭ��߻��� ���Թ� �������
  G_bFoodDupEvent : Boolean = True;     //�ļ��̺�Ʈ �ߺ� ���
  G_bFoodDedicateDoorUse : Boolean;             //�ļ��������Թ� ������� ���� �ļ� ����ڸ� �ش� ���Թ��� ��� ������ �ο� �Ѵ�.
  G_bFoodUse : Boolean;                 //�ļ��������
  G_bFTPCardDownLoading : Boolean;  //FTP Card DownLoading �Ѱ����� �ٿ�ε� ���� ���� ���� ����
  G_bFTPZeronServerUse : Boolean;
  G_bInOutCountUse : Boolean;       //��Ǻ��� ��� ����
  G_bIsMaster : Boolean;  //Master ����
  G_bKeyCheck : Boolean;
  G_bKTDupCardReg : Boolean;    // KT ī�� �߱޽� ���� �̻� ī�� �߱�
  G_bLastFireCheck : Boolean = True; //�������¸� üũ�ؼ� ȭ�� ���� ǥ�� ����
  G_bMonitorIntroView : Boolean;  //����͸� ���� ǥ��
  G_bTest : Boolean = False;
  G_bTypeAccessUse : Boolean; //���� �������
  G_bTypeAttendUse : Boolean; //���� �������
  G_bTypeFoodUse : Boolean;   //�ļ� �������
  G_bTypePatrolUse : Boolean; //��� �������
  G_bTypeSensorUse : Boolean; //���� �������

  G_nACAMVersion : integer = 1;
  G_nACAMServerVersion : integer = 1; //���� ����
  G_nAccessEventButtonSearch : integer = 1; //0:��ư,��� �̺�Ʈ ��ȸ,1:ī���̺�Ʈ�� ��ȸ
  G_nAccessSoundCount : integer = 1;
  G_nAckSendType : integer;           //ACK �ٷ� ����(-1),First ����(0)
  G_nAdminBuildingType : integer;     //0:����,1:���Թ�����
  G_nAdminCompanyGrade : integer;     //0.��ü����
  G_nAdminClassCodeLength : integer = 3;  //������ ����ڵ����
  G_nAlarmEventLength : integer;      //��� �̺�Ʈ ī�� ����
  G_nAlarmRefreshDate : integer = 2;  //QUERY Ÿ���� �˶� �̺�Ʈ ��ȸ�� 2���� ������ ������ ��ȸ ����.
  G_nAlarmSoundCount : integer = 1;   //�˶��߻� Ƚ��
  G_nAntiGroupCodeLength : integer = 3;
  G_nAntiFreeTimeUse : integer = 0;     //Anti Free Ÿ�� �������
  G_nAntiLog : integer = 0;             //Anti Log ���� ����
  G_nBMSType : integer = 2;        //2.����,3.����,4.�ļ�
  G_nBuildingCodeLength : integer = 3;
  G_nBuildingStep : integer = 2;      //������ ����͸��� �������� 1:����,2:��,3:����
  G_nCardCreatePort : integer;         // �߱ޱ� ��Ʈ
  G_nCardDefaultArmPermitType : integer = 2;     //1.��ü������ ������ ����,2.��ü���� ���� ����
  G_nCardDefaultGroupType : integer = 1;     //1.ȸ�纰����,2.�׷캰����,3.���κ�����
  G_nCardDefaultDOORPermitType : integer = 2;     //1.��ü������ ������ ����,2.��ü���� ���� ����
  G_nCardFPType : integer = 1;  //1.��������ī�� Ÿ��,2.����+ī��-ī�� ���常 ����Ѵ�.
  G_nCardLength : integer = 16;
  G_nCardNoType : integer = 1;                //'0.4Byte,1.16BYTE,2.KT���'
  G_nCardRegistForm : integer = 0;            //ī��߱� �޴�
  G_nCardRegisterPort : integer;   //��ϱ���Ʈ
  G_nCardRegisterType : integer;   //��ϱ����� 0.�Ϲ�,1.��������
  G_nCompanyCodeLength : integer = 3;
  G_nColorCompany : integer = clWhite;
  G_nColorEmGroup : integer = clSkyBlue;
  G_nColorEmployee : integer = clYellow;
  G_nDaemonGubun : integer;             //���󱸺� ���� n���� ����� ���ս�
  G_nDaemonServerVersion : integer = 0; //��ŵ��� ����
  G_nDataBaseACEventdeleteDay :integer; //���Ե����� ����� �Ⱓ
  G_nDataBaseBackupCycle : integer; //�����ͺ��̽� ���
  G_nDataBasePTEventdeleteDay :integer; //��������� ����� �Ⱓ
  G_nDBTYPE : integer;
  G_nDebugMode : integer = 0;             //����� ���
  G_nDecoderCodeLength : integer = 2;
  G_nDecoderNo : integer = 1;  //Decoder ��ȣ
  G_nDecoderDeviceServerPort : integer;
  G_nDecoderControlServerPort : integer;
  G_nDecoderFTPServerPort : integer;
  G_nDecoderSockType : integer = 1;  //Decoder ���� Ÿ�� 1.Decoder -> Device,2.Decoder <- Device
  G_nDefaultArmAreaCount : integer = 8;  //�ʱ���� ����Ʈ ������� ����
  G_nDefaultDoorCount : integer = 8;  //�ʱ���� ����Ʈ ���Թ� ����
  G_nDefaultECUCount : integer = 63;
  G_nDefaultExtentionCount : integer = 8;  //�ʱ���� ����Ʈ ��Ʈ�ѷ�Ȯ��� ����
  G_nDefaultReaderCount : integer = 8; //�ʱ���� ����Ʈ ��������
  G_nDefaultZoneCount : integer = 8; //�ʱ���� ����Ʈ ������
  G_nDoorCodeLength : integer = 1;   //���Թ��ڵ� ����
  G_nDoorStateUse : integer = 1;     //���Թ� ��� �������
  G_nEncrypt : integer = 0; //0 : ��ȣȭ ����,1:��ȣȭ ��
  G_nEmployeeAPPROVE : integer = 0; //0.�����Ͻ�������������,1.�����Ͻ������������
  G_nEmployeeSearchType : integer = 1;  //1.��ð˻�,2�̺�Ʈ�߻��� �˻�(��뷮)
  G_nEmployeeGroupLength : integer = 3; //����׷��ڵ� ����
  G_nEmployeeRelayType : integer = 0; //0.�̻��,1.�泲
  G_nFireRelayNumber : integer = 6; //ȭ�纹���� ������ ��ȣ
  G_nFireRelayTime : integer = 2;    //ȭ�纹���� ������ ���� �ð�(��)
  G_nFoodGradePosition : integer = 0; //�ļ��������� 0:���,1:����
  G_nFormLanguageType : integer = 1;  //1.KOR,2.ENG,3.CHINA
  G_nFPMSLength : integer = 4;        //������ȣ ����
  G_nFontSize : integer;
  G_nFoodCodeLength : integer = 3;    //�ļ��ڵ� ����
  G_nIDLength : integer = 7;          //��Ʈ�ѷ� ID ����
  G_nMaxComPort : integer = 40;
//  G_nMultiDaemon : integer = 0;     //���������� 0: ���� �ܵ� ���� 1:��Ƽ����(���� �ȵ�)
//  G_nMultiSocket : integer = 0;
  G_nMonitorGubun : integer;        //����͸� ��ﶧ Ÿ��
  G_nMonitoringOnlyDoorCount : integer = 1;    //����͸� ��Ž� ���Թ��ִ밹��
  G_nMonitoringOnlyMainCount : integer = 100;    //����͸� ��Ž� ���� ��Ʈ�ѷ� �ִ� ����
  G_nMonitoringProtocol : integer = 0;           //0.������ Ȯ��� ����,1.����ġ����
  G_nMonitoringType : integer = 0;  //0.�Ϲ� Ÿ��,1.�бⱹ�� Ÿ��,2.SK
  G_nMoitorLoginStart : integer;    //�α��ν� ����͸� ȭ�� ����� ����  0 ���,1 �ȶ��
  G_nMonitorMapBuilding : integer;      //0.����������,1.�����ʹ�����
  G_nMonitorMapType : integer;      //0.�˶��̺�Ʈ,1.�˶�+�����̺�Ʈ
  G_nNodeCodeLength : integer = 4;   //99999 ���� ��带 �߰� �� �� �ִ�.
  G_nPCComType : integer = 0;        //0.TCPIPŸ��,1.DBŸ��
  G_nPersonRelayType : integer = 0; //�������� ����������� 0:��������,1:������ ����,2:KT���ʻ��,3:����� ,4:LOMOS,5:������
  G_nProgramGrade : integer = 1;    //0.���� ���� ��� ���Է�,1.���� ���� ��� �Է�
  G_nProgramType : integer = 0; //0 : KTTelecop,1:S-TEC,2:SKT
  G_nReportSearchType : integer = 1; // ���� ��ȸ�� 1.�ٷΰ˻�,2.�˻���ư Ŭ���� ��ȸ
  G_nScheduleDevice : integer;    //������ 0:��Ʈ�ѷ���ü����,1:PC������
  G_nSocketReciveTime : integer = 100; //���� ���� Ÿ��
  G_nSystmRelayCustomerNo : integer = 0;
  G_nSystmRelayCyle :integer = 5;  //�����ֱ�
  G_nSystmRelayUse : integer = 0;  //0.�����̻��,1.�������
  G_nVisitUse : integer = 0;       //0.�湮�� �̻��,1.�湮�� ���

  G_stAccessEventAlaramFile : string; //���Ծ˶�����
  G_stACMonitorAlaramFile : string; //�������� �˶�����
  G_stACMonitorEventCode : string; //�������� ����͸����� �˶��߻��ڵ�
  G_stAdminBuildingCode : string; //���� ��ġ�ڵ�
  G_stAdminCompanyCode : string; //���� ȸ���ڵ�
  G_stAdminEmGroupCode : string = '0';  //������ �����ڵ�
  G_stAdminUserID : string; //������ �α��� ���̵�
  G_stAdminUserName : string; //������ ��
  G_stAlarmEventAlaramFile : string; //�˶��̺�Ʈ �߻� ����
  G_stAlarmViewType : string; //REAL:�ǽð� �˶�,QUERY:DB Type
  G_stAntiFreeTime : string;   //AntiPassFree �ð�
  G_stDataBaseBackupTime : string;
  G_stCardDeleteApplyType : string = '4';  //'1'.��ü,'2'.�Ҽ�,'3'.�׷�,'4'.�Ҽ�+�׷�
  G_stCardDeleteCount : string = '2';      //Ƚ��
  G_stCardDeleteDayTerm : string = '7';    //�Ⱓ
  G_stCardDeleteStopType : string = '0';      //0.��ȿ�Ⱓ����,1.��������� ī�����
  G_stCardDeleteType : string = '1';       //1.Ƚ��,2.�̻�� �Ⱓ
  G_stCardDeleteUse : string = '0';      //�������
  G_stCardDeleteWorkSchedule : string = '1000000';
  G_stCardDeleteWorkTime : string = '0000';
  G_stCardRegisterIP : string;//RawByteString; //��ϱ�IP
  G_stCardRegisterFingerPort : string; //��ϱ� ��Ʈ
  G_stDBName : string;
  G_stDBHost : string;
  G_stDBPort : string;
  G_stDBUserID : string;
  G_stDBUserPw : string;
//  G_stDaemonControlServerIP : string; //��ŵ��� ���� IP
  G_stDaemonControlPort : string;
//  G_stDaemonDeviceServerPort : string; //��Ʈ�ѷ� ���� ��Ʈ
  G_stDaemonEventPort : string;
//  G_stDaemonFTPPort : string;
  G_stDaemonStatePort : string;
  G_stDataBaseBackupDir : string; //�����ͺ��̽� �ڵ� ��� ���丮
  G_stDecoderServerIP : string;
  G_stDefaultRelayCode : string;   //����Ʈ ���� �ڵ�
  G_stExeFolder : string;
  G_stEventDataDir : string;       //�̺�Ʈ �α� ������ ���� ���
  G_stFileServerIP : string; //�̹��� ���� ����
  G_stFileServerDir : string;
  G_stFireStateCode : string = 'FI';
  G_stFontName : string;
  G_stFoodDeviceType : string;  //DOOR/READER ����
  G_stFormStyle : string;
  G_stGuestAreaCode : string;       //�湮�� ����� �ڵ�
  G_stGroupCode : string;
  G_stLogDirectory : string;
  G_stLongTimeRecoveryCode : string = 'LR';
  G_stLongTimeStateCode : string = 'LT';
  G_stMapBuildingAlarmEventIconFile : string;
  G_stMapBuildingArmModeIconFile : string;
  G_stMapBuildingDisArmModeIconFile : string;
  G_stMapBuildingNormalEventIconFile : string;
  G_stMenuCaption : string;
  //������ ������ �ִ� ��
  G_stRelayCode1 : string = 'F000';
  G_stRelayCode2 : string = '01';
  G_stRelayCode3 : string = 'LIBS';
  G_stRelayCode4 : string = '01';
  G_stSystmRelayDB1Type : string;
  G_stSystmRelayDB1IP : string;
  G_stSystmRelayDB1PORT : string;
  G_stSystmRelayDB1USERID : string;
  G_stSystmRelayDB1USERPW : string;
  G_stSystmRelayDB1NAME : string;
  G_stSystmRelayDB2Type : string;
  G_stSystmRelayDB2IP : string;
  G_stSystmRelayDB2PORT : string;
  G_stSystmRelayDB2USERID : string;
  G_stSystmRelayDB2USERPW : string;
  G_stSystmRelayDB2NAME : string;
  G_stVisitCode : string = '0003';       //0.�湮�� �̻��,1.�湮�� ���


  NodeList : TStringList;
  PCClientSocketList : TStringList;
  ServerNodeList : TStringList;
  SupremaFingerList : TStringList; //�������� �������� ����Ʈ

//��ż��� ���� �Լ� ���ſ�
  G_bCardDownLoading : array [0..10000] of  Boolean;  //ī�� �ٿ�ε� ��
  G_bFireEvent : array [0..10000] of  Boolean;        //ȭ�� �˶� �߻�
  G_bRcvChecking : array [0..10000] of Boolean;   //������� ������
  G_bSocketWriting : array [0..10000] of Boolean;
  G_bStateChecking : array [0..10000] of Boolean;    //��� ���� ���� Ȯ�� ��
  G_c_reception_buffer : array [0..10000] of c_byte_buffer;
  G_n1stCount : array [0..10000] of integer;
  G_n2ndCount : array [0..10000] of integer;
  G_n3rdCount : array [0..10000] of integer;
  G_n4thCount : array [0..10000] of integer;
  G_nCardDownLoadEcuSeq : array [0..10000] of integer; //ī�嵥���� �ٿ�ε� ��Ʈ�ѷ�
  G_nDeviceSearchIndex : array [0..10000] of integer;
  G_nNodeUpdateIndex : array [0..10000] of integer;
  G_nNodeSearchIndex : array [0..10000] of integer;
  G_nSendDelayCount : array [0..10000] of integer;
  G_nSendMsgNo : array [0..10000] of integer;        //�۽� �޽��� ��ȣ
  G_nStateCheckEcuSeq : array [0..10000] of integer;
  G_stComBuffer : array [0..10000] of RawByteString;
  G_stDeviceVer : array [0..10000] of string;
  G_stReceivedLastpacket : array [0..10000] of String;
  G_wsa_data : array [0..10000] of twsaData;


implementation

end.
