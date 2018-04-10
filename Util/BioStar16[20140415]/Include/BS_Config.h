/**
 *  Configuration
 *
 *  @author sjlee@suprema.co.kr
 *  @see    
 */


/*  
 *  Copyright (c) 2006 Suprema Co., Ltd. All Rights Reserved.
 * 
 *  This software is the confidential and proprietary information of 
 *  Suprema Co., Ltd. ("Confidential Information").  You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into
 *  with Suprema.
 */

#ifndef __BS_CONFIG_H__
#define __BS_CONFIG_H__

#include "BS_Error.h"

#define BS_CONFIG_FINGERPRINT		0x01
#define BS_CONFIG_IO				0x02
#define BS_CONFIG_RELAY				0x03
#define BS_CONFIG_ENCRYPTION		0x04
#define BS_CONFIG_TCPIP				0x10
#define BS_CONFIG_WLAN				0x11
#define BS_CONFIG_SERIAL			0x12
#define BS_CONFIG_USB				0x13
#define BS_CONFIG_DISPLAY			0x20
#define BS_CONFIG_OP_MODE			0x30
#define BS_CONFIG_TNA_EVENT			0x31
#define BS_CONFIG_TNA_EVENT_EX		0x32
#define BS_CONFIG_ENTRANCE_LIMIT	0x33
#define BS_CONFIG_INFO				0x40
#define BS_CONFIG_SYS_INFO			0x41
#define BS_CONFIG_WIEGAND			0x42

#define BS_CONFIG_DOOR				0x60
#define BS_CONFIG_INPUT				0x61
#define BS_CONFIG_OUTPUT			0x62
#define BS_CONFIG_ZONE				0x63
#define BS_CONFIG_ZONE_EX			0x64
#define BS_CONFIG_485_NET			0x65
#define BS_CONFIG_SSL				0x66
#define BS_CONFIG_CARD_READER_ZONE	0x67
#define BS_CONFIG_CARD_READER		0x68

#define DS_CONFIG_FACE				0x70
#define DS_CONFIG_IMAGE_EVENT		0x71
#define DS_CONFIG_INPUT				0x72
#define DS_CONFIG_WIEGAND			0x73
#define DS_CONFIG_485_NET			0x74
#define DS_CONFIG_SERIAL			0x75
#define DS_CONFIG_OP_MODE			0x76
#define DS_CONFIG_DISPLAY			0x77
#define DS_CONFIG_FINGERPRINT		0x78
#define DS_CONFIG_WLAN				0x79

#define XS_CONFIG_IMAGE_EVENT		DS_CONFIG_IMAGE_EVENT		
#define XS_CONFIG_INPUT				DS_CONFIG_INPUT				
#define XS_CONFIG_WIEGAND			DS_CONFIG_WIEGAND			
#define XS_CONFIG_485_NET			DS_CONFIG_485_NET			
#define XS_CONFIG_SERIAL			DS_CONFIG_SERIAL			
#define XS_CONFIG_OP_MODE			DS_CONFIG_OP_MODE			
#define XS_CONFIG_DISPLAY			DS_CONFIG_DISPLAY			

#define BS2_CONFIG_INTERPHONE		0x80
#define BS2_CONFIG_USB			    0x81 


#define FS_CONFIG_IMAGE_EVENT		DS_CONFIG_IMAGE_EVENT		
#define FS_CONFIG_INPUT				DS_CONFIG_INPUT				
#define FS_CONFIG_WIEGAND			DS_CONFIG_WIEGAND			
#define FS_CONFIG_485_NET			DS_CONFIG_485_NET			
#define FS_CONFIG_SERIAL			DS_CONFIG_SERIAL			
#define FS_CONFIG_OP_MODE			DS_CONFIG_OP_MODE			
#define FS_CONFIG_DISPLAY			DS_CONFIG_DISPLAY

#define FS_CONFIG_INTERPHONE		BS2_CONFIG_INTERPHONE
#define FS_CONFIG_USB			    BS2_CONFIG_USB 
#define FS_CONFIG_FACE				0x83

#define BS_CONFIG_VIDEOPHONE		0x84

#define BS_CONFIG_CAMERA_POS		0xFFFF
#define BS_CONFIG_CAMERA_POS_Y		0xFFFD
#define BS_CONFIG_IR_STRENGTH		0xFFFE
#define BS_CONFIG_LIGHT_CENTER_Y	0xFFFC
#define BS_CONFIG_LIGHT_CENTER_X	0xFFFB

#if defined(SUPPORT_32_TNA_EVENTS)
#define BS_MAX_TNA_FUNCTION_KEY		32
#else
#define BS_MAX_TNA_FUNCTION_KEY		16
#endif
#define BS_MAX_TNA_EVENT_LEN		16
#define BS_MAX_NETWORK_ADDR_LEN		32
#define BS_MAX_WLAN_PRESET			4

typedef struct {
	unsigned ID;
	char macAddr[32];
	char productName[32];
	char boardVer[16];
	char firmwareVer[16];
	char blackfinVer[16];
	char kernelVer[16];
	int language;
	char privateKey[32];
} BSSysInfoConfig;

#define BS_UI_LANG_KOREAN	1220
#define BS_UI_LANG_ENGLISH	1221
#define BS_UI_LANG_CUSTOM	1222

#define BS_UI_BG_LOGO		1240
#define BS_UI_BG_NOTICE		1242
#define BS_UI_BG_PICTURE	1244

#define BS_UI_INFO_NONE		1260
#define BS_UI_INFO_TIME		1261
#define BS_UI_INFO_NOTICE	1263
	
#define BS_UI_TIMEOUT_INDEFINITE	1280
//#define BS_UI_TIMEOUT_5		1281
#define BS_UI_TIMEOUT_10	1282
//#define BS_UI_TIMEOUT_15	1283
#define BS_UI_TIMEOUT_20	1284
//#define BS_UI_TIMEOUT_25	1285
#define BS_UI_TIMEOUT_30	1286

// Message timeout
#define BS_MSG_TIMEOUT_500MS	0
#define BS_MSG_TIMEOUT_1000MS	1
#define BS_MSG_TIMEOUT_2000MS	2
#define BS_MSG_TIMEOUT_3000MS	3
#define BS_MSG_TIMEOUT_4000MS	4
#define BS_MSG_TIMEOUT_5000MS	5

#define BS_UI_DATE_TYPE_AM 1320
#define BS_UI_DATE_TYPE_EU 1321
typedef struct {
	int language;
	int background;
	int bottomInfo;
	int reserved1; // bool useSound;
	int timeout; // 0 for indefinite
	int volume; // 0 ~ 100
	int msgTimeout;
	int usePrivateAuth;
	int dateType;
	int disableAuthResult;
	int theme;	// 0 ~ 10 Theme Index
    int reserved2[5];
} BSDisplayConfig;


#define BS_AUTH_FINGER_ONLY			1020
#define BS_AUTH_FINGER_N_PASSWORD	1021
#define BS_AUTH_FINGER_OR_PASSWORD	1022
#define BS_AUTH_PASS_ONLY			1023
#define BS_AUTH_CARD_ONLY			1024

#define BS_1TON_FREESCAN	1040
#define BS_1TON_BUTTON		1041
#define BS_1TON_DISABLE		1042

#define BS_TNA_DISABLE		1060
#define BS_TNA_FUNCTION_KEY	1061
#define BS_TNA_AUTO			1062

#define	BS_TNA_AUTO_CHANGE 1070
#define	BS_TNA_MANUAL_CHANGE 1071
#define BS_TNA_FIXED 1072

#define MAX_AUTH_COUNT 4
#define FINGER_INDEX 0
#define PIN_INDEX 1
#define FINGER_PIN_INDEX 2
#define CARD_INDEX 3

#define MAX_AUTH_EX_COUNT 1
#define FINGER_N_PIN_INDEX 0

#define OP_CONFIG_VERSION14 0x14
#define OP_CONFIG_VERSION15 0x15

#define BS_COMMON_DISABLE 135
#define BS_OP_CARD_CSN 1073
#define BS_OP_CARD_TEMPLATE 1074

typedef struct {
	enum
	{
		CARD_ID_FORMAT_NORMAL = 0,
		CARD_ID_FORMAT_WIEGAND = 1,

		CARD_ID_MSB = 0,
		CARD_ID_LSB = 1,
	};

	int authMode;
	int identificationMode;
	int tnaMode;
	int tnaChange;
	unsigned char authSchedule[MAX_AUTH_COUNT];
	unsigned char identificationSchedule;
	unsigned char dualMode;
	unsigned char dualSchedule;
	unsigned char version;
	unsigned short cardMode;
	unsigned char useFastIDMatching;
	unsigned char cardIdFormatType;
	unsigned char authScheduleEx[MAX_AUTH_EX_COUNT];
	unsigned char usePrivateAuthMode;
	unsigned char cardIdByteOrder;
	unsigned char cardIdBitOrder;
} BSOPModeConfig ;

#define BS_TNA_F1	0
#define BS_TNA_F2	1
#define BS_TNA_F3	2
#define BS_TNA_F4	3
#define BS_TNA_1	4
#define BS_TNA_2	5
#define BS_TNA_3	6
#define BS_TNA_4	7
#define BS_TNA_5	8
#define BS_TNA_6	9
#define BS_TNA_7	10
#define BS_TNA_8	11
#define BS_TNA_9	12
#define BS_TNA_CALL	13
#define BS_TNA_0	14	
#define BS_TNA_ESC	15

//Not published
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#if defined(SUPPORT_32_TNA_EVENTS)
#define BS_TNA_EXT_1 16
#define BS_TNA_EXT_2 17
#define BS_TNA_EXT_3 18
#define BS_TNA_EXT_4 19
#define BS_TNA_EXT_5 20
#define BS_TNA_EXT_6 21
#define BS_TNA_EXT_7 22
#define BS_TNA_EXT_8 23
#define BS_TNA_EXT_9 24
#define BS_TNA_EXT_10 25
#define BS_TNA_EXT_11 26
#define BS_TNA_EXT_12 27
#define BS_TNA_EXT_13 28
#define BS_TNA_EXT_14 29
#define BS_TNA_EXT_15 30
#define BS_TNA_EXT_16 31
#endif


typedef struct {
	unsigned char enabled[BS_MAX_TNA_FUNCTION_KEY]; 
	unsigned char useRelay[BS_MAX_TNA_FUNCTION_KEY];
	unsigned short reserved[BS_MAX_TNA_FUNCTION_KEY];  
	char eventStr[BS_MAX_TNA_FUNCTION_KEY][BS_MAX_TNA_EVENT_LEN];
} BSTnaEventConfig;

typedef struct {
	int fixedTnaIndex;
	int manualTnaIndex;
	int timeSchedule[BS_MAX_TNA_FUNCTION_KEY];
} BSTnaEventExConfig;


typedef struct {
	unsigned char enabled[BS_MAX_TNA_FUNCTION_KEY]; 
	unsigned char useRelay[BS_MAX_TNA_FUNCTION_KEY];
	unsigned short reserved[BS_MAX_TNA_FUNCTION_KEY];  
	char eventStr[BS_MAX_TNA_FUNCTION_KEY][BS_MAX_TNA_EVENT_LEN];
} DSTnaEventConfig, XSTnaEventConfig, BS2TnaEventConfig, FSTnaEventConfig;

typedef struct {
	unsigned char fixedTnaIndex;
	unsigned char leftFixedTnaIndex;
	unsigned char rightFixedTnaIndex;
	unsigned char reserved[1];
	unsigned char manualTnaIndex;
	unsigned char reserved2[3];
	int timeSchedule[BS_MAX_TNA_FUNCTION_KEY];
} DSTnaEventExConfig;

typedef struct {
	unsigned char fixedTnaIndex;
	unsigned char reserved[3];
	unsigned char manualTnaIndex;
	unsigned char reserved2[3];
	int timeSchedule[BS_MAX_TNA_FUNCTION_KEY];
} XSTnaEventExConfig, BS2TnaEventExConfig, FSTnaEventExConfig;

typedef struct {
	unsigned reserved1;
	unsigned char masterPassword[16];
	char reserved2[44];
} BSInfoConfig;


#define BS_IP_DISABLE 0
#define BS_IP_ETHERNET 1
#define BS_IP_WLAN 2

#define BS_SERVER_DISABLE 0
#define BS_SERVER_ADMIN 1
#define BS_SERVER_STAR 2        

typedef struct {
	int lanType;
	bool useDHCP;
	unsigned port; 
	char ipAddr[BS_MAX_NETWORK_ADDR_LEN];
	char gateway[BS_MAX_NETWORK_ADDR_LEN];
	char subnetMask[BS_MAX_NETWORK_ADDR_LEN];
	char serverIP[BS_MAX_NETWORK_ADDR_LEN];
	int	 maxConnection;
	unsigned char useServer;
	unsigned serverPort;
	bool syncTimeWithServer;
	char reserved[48];
} BSIPConfig;


#define BS_WLAN_MANAGED 2060
#define BS_WLAN_AD_HOC	2061

// authType
#define BS_WLAN_AUTH_OPEN		2080
#define BS_WLAN_AUTH_SHARED		2081
#define BS_WLAN_AUTH_WPA_PSK	2082

// encryptionType
#define BS_WLAN_NO_ENCRYPTION	2090
#define BS_WLAN_WEP				2091
#define BS_WLAN_TKIP_AES		2092
#define BS_WLAN_AES				2093
#define BS_WLAN_TKIP			2094

#define BS_WLAN_KEY_ASCII		2100
#define BS_WLAN_KEY_HEX			2101

typedef struct {
	char name[BS_MAX_NETWORK_ADDR_LEN];
	int operationMode;
	short authType;
	short encryptionType;
	int keyType;
	char essid[BS_MAX_NETWORK_ADDR_LEN];
	char key1[BS_MAX_NETWORK_ADDR_LEN];
	char key2[BS_MAX_NETWORK_ADDR_LEN];
	char wpaPassphrase[64];
} BSWLANPreset;


typedef struct {
	int selected;
	BSWLANPreset preset[BS_MAX_WLAN_PRESET];
} BSWLANConfig;


#define BS_SECURITY_NORMAL		1680
#define BS_SECURITY_SECURE		1681
#define BS_SECURITY_MORE_SECURE	1682

#define BS_USER_SECURITY_READER	1700
#define BS_USER_SECURITY_USER	1701

#define BS_FAST_MODE_NORMAL		1720
#define BS_FAST_MODE_FAST		1721
#define BS_FAST_MODE_FASTER		1722
#define BS_FAST_MODE_AUTO		1723

#define BS_IMAGE_QUALITY_WEAK		320
#define BS_IMAGE_QUALITY_MODERATE	321
#define BS_IMAGE_QUALITY_STRONG		322

#define BS_FREESCAN_0 1910
#define BS_FREESCAN_1 1911
#define BS_FREESCAN_2 1912
#define BS_FREESCAN_3 1913
#define BS_FREESCAN_4 1914
#define BS_FREESCAN_5 1915
#define BS_FREESCAN_6 1916
#define BS_FREESCAN_7 1917
#define BS_FREESCAN_8 1918
#define BS_FREESCAN_9 1919
#define BS_FREESCAN_10 1920

typedef struct {
	int security;
	int userSecurity;
	int fastMode;
	int sensitivity; // 0(Least) ~ 7(Most)
	int timeout; // 0 for indefinite, 1 ~ 20 sec
	int imageQuality;
	bool viewImage;
	int freeScanDelay;
	int useCheckDuplicate;
	int matchTimeout;
	short templateType;  //0(Suprema), 1(ISO), 2(ANSI378)
	short useFakeDetect;
	bool useServerMatching;
    char useOneTemplate; //true, false
    char reserved[2];
} BSFingerprintConfig;


#define BS_NUM_OF_INPUT	2
#define BS_NUM_OF_OUTPUT 2

#define	BS_IO_INPUT_DISABLED		1840
#define	BS_IO_INPUT_EXIT			1841
#define	BS_IO_INPUT_WIEGAND_CARD 1842
#define	BS_IO_INPUT_WIEGAND_USER 1843

#define BS_IO_OUTPUT_DISABLED		1860
#define BS_IO_OUTPUT_DURESS			1861
#define BS_IO_OUTPUT_TAMPER			1862
#define BS_IO_OUTPUT_AUTH_SUCCESS	1863
#define	BS_IO_OUTPUT_AUTH_FAIL		1864
#define	BS_IO_OUTPUT_WIEGAND_USER 1865
#define	BS_IO_OUTPUT_WIEGAND_CARD 1866

#define BS_IO_TAMPER_NONE			1880
#define BS_IO_TAMPER_LOCK_SYSTEM	1881

#define BS_IO_WIEGAND_MODE_LEGACY	1890
#define BS_IO_WIEGAND_MODE_EXTENDED	1891

typedef struct {
	int input[BS_NUM_OF_INPUT];
	int output[BS_NUM_OF_OUTPUT];
	int tamper;
	int outputDuration;
	int inputDuration[BS_NUM_OF_INPUT];
	int inputSchedule[BS_NUM_OF_INPUT];
	short inputType[BS_NUM_OF_INPUT];
	int version;
	int wiegandMode;
	unsigned cardReaderID;
	int reserved[8];
	int reserved2[47];
} BSIOConfig;


#define	BS_RELAY_EVENT_ALL 1800
#define	BS_RELAY_EVENT_AUTH_TNA 1801
#define	BS_RELAY_EVENT_NONE 1802
#define	BS_RELAY_EVENT_AUTH 1803
#define	BS_RELAY_EVENT_TNA 1804

typedef struct {
	int event;
	int openDuration;
	int lockSchedule;
	int unlockSchedule;
	bool useInterphone;
	int reserved[7];
} BSRelayConfig;


#define BS_CHANNEL_DISABLED	 135

#define BS_485_HOST_DEIVCE	1
#define BS_485_SLAVE_DEVICE	2

typedef struct {
	int rs485;
	int rs232;
	int useSecureIO;
	char activeSecureIO[4]; // 0 ~ 3 - byte[0] ~ byte[3]
	unsigned slaveID;  
	int deviceType; 
	int reserved[2];
} BSSerialConfig;

typedef struct {
	bool connectToPC; 
	int reserved[7];
} BSUSBConfig;

typedef struct {
    unsigned char connectToPC;
    unsigned char connectToMemory;
    unsigned char reserved[2];
    int reserved2[7];
} BS2USBConfig, FSUSBConfig;

typedef struct {
	enum {
		NOT_USE = 0,
	};
	int rs485;
	int rs232;
	int reserved[6];
} DSSerialConfig, XSSerialConfig, BS2SerialConfig, FSSerialConfig;


#define BS_ENCRYPTION_PASSWORD_LEN	32

typedef struct {
	bool useEncryption;
	unsigned char password[BS_ENCRYPTION_PASSWORD_LEN];
	int useProtection;
	int reserved[2];
} BSEncryptionConfig;

typedef struct {
	int minEntryInterval; // 0 for no limit
	int numOfEntranceLimit; // MAX 4
	int maxEntry[4]; // 0 (no limit) ~ 16
	unsigned entryLimitInterval[4];
	int defaultAccessGroup;
    int bypassGroupId;
	int entranceLimitReserved[6]; 
} BSEntranceLimit;

typedef struct {
 	unsigned slaveID;
    int slaveType;
} BS485SlaveInfo;


typedef struct {
	enum 
    {
        TYPE_DISABLE = 0,
        TYPE_CONN_PC = 3,
        TYPE_HOST = 4,
        TYPE_SLAVE = 5,
 
        MAX_NUM_OF_SIO = 4,
        MAX_NUM_OF_SLAVE = 7,
    };
    
    unsigned short deviceType;
    unsigned short useIO;
	char activeSIO[MAX_NUM_OF_SIO];
 	BS485SlaveInfo slaveInfo[MAX_NUM_OF_SLAVE];
    int reserved[18];
} BS485NetworkConfig;

typedef struct {
	bool useSSL;
    unsigned char reserved[11];
} BSSSLConfig;

typedef struct {
	enum 
	{
        TYPE_DISABLE = 0,
			
        TYPE_HOST = 4,
        TYPE_SLAVE = 5,

        MAX_NUM_OF_SIO = 4,
        MAX_NUM_OF_SLAVE = 7,
    };
    
	int	baudRate;
	unsigned short	deviceType;
	unsigned short	reserved;
	unsigned char  	activeSIO[MAX_NUM_OF_SIO];
	BS485SlaveInfo slaveInfo[MAX_NUM_OF_SLAVE]; 
	int	reserved2[17];
} DS485NetworkConfig, XS485NetworkConfig, BS2485NetworkConfig, FS485NetworkConfig;


typedef struct {
	enum
	{
		NOT_USE = 0,
		USE = 1,

		//Auth Schedule
		DS_PRIVATE_AUTH_DISABLE = -1,
		DS_MAX_AUTH_COUNT = 5,
		DS_FINGER_INDEX = 0,
		DS_PIN_INDEX = 1,
		DS_FINGER_PIN_INDEX = 2,
		DS_CARD_INDEX = 3,
		DS_FINGER_N_PIN_INDEX = 4,

		//identificationMode
		IDENTIFY_DISABLE = 0,
		IDENTIFY_FREESCAN = 1,
		IDENTIFY_BUTTON = 2,

		//tnaMode 
		TNA_DISABLE = 0,
		TNA_FUNCTION_KEY = 1,
		TNA_AUTO_CHANGE = 2,
		TNA_MANUAL_CHANGE = 3,
		TNA_FIXED = 4,

		// cardMode
		CARD_DISABLE = 0,
		CARD_CSN = 1,
		CARD_TEMPLATE = 2,

		//cardIdFormatType
		CARD_ID_FORMAT_NORMAL = 0,
		CARD_ID_FORMAT_WIEGAND = 1,

		// cardIdByteOrder, cardIdBitOrder
		CARD_ID_MSB = 0,
		CARD_ID_LSB = 1,

		// enhancedMode
		FUSION_NOT_USE = 0,
		FUSION_FINGER_FINGER = 1,
		FUSION_FINGER_FACE = 2,
    };

	unsigned char identificationMode;
	unsigned char tnaMode;
	unsigned char cardMode;
	unsigned char authSchedule[DS_MAX_AUTH_COUNT];

	unsigned char identificationSchedule;
	unsigned char dualSchedule;
	unsigned char usePrivateAuthMode;
	unsigned char cardIdFormatType;

	unsigned char cardIdByteOrder;
	unsigned char cardIdBitOrder;
	unsigned char enhancedMode;
	unsigned char fusionType;

	unsigned char fusionTimeout;
	unsigned char useDetectFace;
	unsigned char reserved[82];
} DSOPModeConfig;


typedef struct   {
	enum
	{
		 NOT_USE = 0,
		 USE = 1,
     
		 //Auth Schedule
		 XS_MAX_AUTH_COUNT = 2,
		 XS_AUTH_DISABLE = -1,
		 XS_CARD_INDEX = 0, //card bypass
		 XS_PIN_INDEX = 1, //(card / id) + pin
     
		 //tnaMode 
		 TNA_DISABLE = 0,
		 TNA_FUNCTION_KEY = 1,
		 TNA_AUTO_CHANGE = 2,
		 TNA_MANUAL_CHANGE = 3,
		 TNA_FIXED = 4,
     
		 // cardMode
		 CARD_DISABLE = 0,
		 CARD_CSN = 1,
		 CARD_DATA = 2,
     
		 //cardIdFormatType
		 CARD_ID_FORMAT_NORMAL = 0,
		 CARD_ID_FORMAT_WIEGAND = 1,
     
		 // cardIdByteOrder, cardIdBitOrder
		 CARD_ID_MSB = 0,
		 CARD_ID_LSB = 1,
	};

	unsigned char reserved1;
	unsigned char tnaMode;
	unsigned char cardMode;
	unsigned char authSchedule[XS_MAX_AUTH_COUNT];
	unsigned char reserved2[4];
	unsigned char dualSchedule;
	unsigned char usePrivateAuthMode;
	unsigned char cardIdFormatType;

	unsigned char cardIdByteOrder;
	unsigned char cardIdBitOrder;
	unsigned char reserved3[3];
	unsigned char useDetectFace;
	unsigned char useServerMatching;
	unsigned char matchTimeout;
	unsigned char reserved[80];
} XSOPModeConfig;

typedef struct {
	enum
	{
		COLOR = 0,
		IR = 1,
		COLOR_IR = 2,
	};

	unsigned int numOfImage;
	unsigned int numOfAutoImage;
	unsigned int criticalValue;
	unsigned int carmeraInput;
	unsigned int reserved[32];
} DSFaceConfig ;

typedef struct {
	enum 
	{
		NUM_OF_IMG_EVENT = 256,
	};
	
	unsigned short event[NUM_OF_IMG_EVENT];
	unsigned short reserved[64];
	unsigned short schedule[NUM_OF_IMG_EVENT];
	unsigned short reserved2[64];
} DSSaveImageEventConfig, XSSaveImageEventConfig, BS2SaveImageEventConfig, FSSaveImageEventConfig;


typedef struct {
	enum
	{	
		//background
		BG_LOGO = 0,
		BG_NOTICE = 1,
		BG_SLIDE = 2,   //BG_PICTURE -> BG_SLIDE
	
		//timeout
		TIMEOUT_INDEFINITE = 0,		

		//dateType
		DATE_TYPE_AM = 0,
		DATE_TYPE_EU = 1,
	};

	unsigned char background;
	unsigned char theme; //0 ~ 100
	unsigned char timeout; //0 ~ 255 (sec)
	unsigned char volume; // 0 ~ 100 
	unsigned short msgTimeout; // 500~5000(ms)
   	unsigned char dateType;
	unsigned short backlightTimeout; 
	unsigned char reserved[79];
} DSDisplayConfig ;

typedef struct {
	enum
	{	
		//language
		KOREAN = 0,
		ENGLISH = 1,
		CUSTOM = 2, 

		//background
		BG_LOGO = 0,
		BG_NOTICE = 1,
		BG_SLIDE = 2,
	
		//bgTheme
	    BG_THEME_01 = 0,
		BG_THEME_02 = 1,

		//timeout
		TIMEOUT_INDEFINITE = 0,		

		//dateType
		DATE_TYPE_AM = 0,
		DATE_TYPE_EU = 1,

		//displayDateTime
		NOT_USE = 0,
		USE = 1,
	};

	unsigned char language;
	unsigned char background;
	unsigned char timeout; //0 ~ 255 (sec)
	unsigned char volume; // 0 ~ 100 
	unsigned short msgTimeout; // 500~5000(ms)
   	unsigned char dateType;
	unsigned short backlightTimeout; //sec
	unsigned char bgTheme;	// 0 ~ 1
	unsigned char displayDateTime;
	unsigned char reserved[77];
} XSDisplayConfig ;

typedef struct {
	enum
	{
		NOT_USE = 0,
		USE = 1,

		//security
		SECURITY_NORMAL = 0,
		SECURITY_SECURE = 1,
		SECURITY_MORE_SECURE = 2,

		//userSecurity
		USER_SECURITY_READER = 0,
		USER_SECURITY_USER = 1,

		//fastMode
		FAST_MODE_NORMAL = 0,
		FAST_MODE_FAST = 1,
		FAST_MODE_FASTER = 2,
		FAST_MODE_AUTO = 3,

		//imageQuality
		IMAGE_QUALITY_WEAK = 0,
		IMAGE_QUALITY_MODERATE	= 1,
		IMAGE_QUALITY_STRONG = 2,

		//template type
		TEMPLATE_TYPE_SUPREMA = 0,
		TEMPLATE_TYPE_ISO = 1,
		TEMPLATE_TYPE_ANSI = 2,

	};
	unsigned char security;
	unsigned char userSecurity;
	unsigned char fastMode;
	unsigned char sensitivity; //1~7

	unsigned char timeout; //1~20
	unsigned char imageQuality;
	unsigned char viewImage; //NOT_USE, USE
	unsigned char freeScanDelay; //0~10
		
	unsigned char useCheckDuplicate;//NOT_USE, USE
	unsigned char matchTimeout;//1~20 
	unsigned char templateType;// 0(Suprema), 1(ISO), 2(ANSI378)
	unsigned char useFakeDetect;//NOT_USE, USE

	unsigned char useServerMatching;//NOT_USE, USE
	unsigned char reserved[83];
} DSFingerprintConfig ;

typedef struct {
	enum
	{
		WLAN_MANAGED = 0,
		WLAN_AD_HOC = 1,

		AUTH_OPEN = 0,
		AUTH_SHARED = 1,
		AUTH_WPA_PSK = 2,

		NO_ENCRYPTION = 0,
		ENC_WEP = 1,
		ENC_TKIP_AES = 2,
		ENC_AES = 3,
		ENC_TKIP = 4,

		KEY_ASCII = 0,
		KEY_HEX = 1,
	};
			
	char name[BS_MAX_NETWORK_ADDR_LEN];
	unsigned char operationMode;
	unsigned char authType;
	unsigned char encryptionType;
	unsigned char keyType;
	char essid[BS_MAX_NETWORK_ADDR_LEN];
	char key1[BS_MAX_NETWORK_ADDR_LEN];
	char key2[BS_MAX_NETWORK_ADDR_LEN];
	char wpa_key[64];
	unsigned char reserved[40];
} DSWLANPreset, BS2WLANPreset, FSWLANPreset ;

typedef struct {
	int selected;
	DSWLANPreset preset[BS_MAX_WLAN_PRESET];
} DSWLANConfig, BS2WLANConfig, FSWLANConfig ;


typedef struct {
	enum
	{
		NOT_USE = 0,
		USE = 1,
		
		AUTH_TYPE_FINGER = 0,
		AUTH_TYPE_CARD = 1,
		AUTH_TYPE_ID = 2,

		AUTH_DISABLE = -1,

		//Auth Schedule
		FINGER_AUTH_COUNT = 4,
		CARD_AUTH_COUNT = 5,
		ID_AUTH_COUNT = 4,
		
		AUTH_FINGER_ONLY = 0,
		AUTH_FINGER_PIN = 1,
		AUTH_KEY_FINGER = 2,
		AUTH_KEY_FINGER_PIN = 3,
		
		AUTH_CARD_ONLY = 0,
		AUTH_CARD_PIN = 1,
		AUTH_CARD_FINGER = 2,
		AUTH_CARD_FINGER_PIN = 3,
		AUTH_CARD_FINGER_N_PIN = 4,

		AUTH_ID_PIN = 0,
		AUTH_ID_FINGER = 1,
		AUTH_ID_FINGER_PIN = 2,
		AUTH_ID_FINGER_N_PIN= 3,

		//Private Auth
		PAUTH_FINGER_ONLY = 0,
		PAUTH_FINGER_PIN = 1,
		PAUTH_CARD_ONLY = 2,
		PAUTH_CARD_PIN = 3,
		PAUTH_CARD_FINGER = 4,
		PAUTH_CARD_FINGER_PIN = 5,
		PAUTH_CARD_FINGER_N_PIN = 6,
		PAUTH_ID_PIN = 7,
		PAUTH_ID_FINGER = 8,
		PAUTH_ID_FINGER_PIN = 9,
		PAUTH_ID_FINGER_N_PIN = 10,

		//tnaMode 
		TNA_DISABLE = 0,
		TNA_FUNCTION_KEY = 1,
		TNA_AUTO_CHANGE = 2,
		TNA_MANUAL_CHANGE = 3,
		TNA_FIXED = 4,
		
		// cardMode
		CARD_DISABLE = 0,
		CARD_CSN = 1,
		CARD_DATA = 2,
		
		//cardIdFormatType
		CARD_ID_FORMAT_NORMAL = 0,
		CARD_ID_FORMAT_WIEGAND = 1,
		
		// cardIdByteOrder, cardIdBitOrder
		CARD_ID_MSB = 0,
		CARD_ID_LSB = 1,
	};

	unsigned char fingerAuthSchedule[FINGER_AUTH_COUNT];
	unsigned char cardAuthSchedule[CARD_AUTH_COUNT];
	unsigned char idAuthSchedule[ID_AUTH_COUNT];

	unsigned char tnaMode;
	unsigned char cardMode;
	unsigned char dualSchedule;
	unsigned char usePrivateAuthMode;
	unsigned char cardIdFormatType;

	unsigned char cardIdByteOrder;
	unsigned char cardIdBitOrder;
	unsigned char useDetectFace;
	unsigned char useServerMatching;
	unsigned char matchTimeout;
	unsigned char reserved[77];

} BS2OPModeConfig;


typedef struct {
	enum 
	{	
		//language
		KOREAN = 0,
		ENGLISH = 1,
		CUSTOM = 2,	

		//background
		BG_LOGO = 0,
		BG_NOTICE = 1,
		BG_PDF = 2,

		//bgTheme
		BG_THEME_01 = 0,
		BG_THEME_02 = 1,
		BG_THEME_03 = 2,
		BG_THEME_04 = 3,
	
		//timeout
		TIMEOUT_INDEFINITE = 0,		

		//dateType
		DATE_TYPE_AM = 0,
		DATE_TYPE_EU = 1,

		//displayDateTime
		NOT_USE = 0,
		USE = 1,
	};

	unsigned char language;
	unsigned char background;
	unsigned char timeout; //0 ~ 255 (sec)
	unsigned char volume; // 0 ~ 100 
	unsigned short msgTimeout; // 500~5000(ms)
    unsigned char dateType;
	unsigned short backlightTimeout; //sec
	unsigned char bgTheme;
	unsigned char displayDateTime;
    unsigned char useVoice;
	unsigned char reserved[76];

} BS2DisplayConfig, FSDisplayConfig;


typedef struct {
	enum 
	{
		NOT_USE = 0,
		USE = 1,

		//security
		SECURITY_NORMAL = 0,
		SECURITY_SECURE = 1,
		SECURITY_MORE_SECURE = 2,

		//userSecurity
		BS_PARAM_USER_SECURITY_READER = 0,
		BS_PARAM_USER_SECURITY_USER = 1,

		//fastMode
		FAST_MODE_NORMAL = 0,
		FAST_MODE_FAST = 1,
		FAST_MODE_FASTER = 2,
		FAST_MODE_AUTO = 3,

		TEMPLATE_TYPE_SUPREMA = 0,
		TEMPLATE_TYPE_ISO = 1,
		TEMPLATE_TYPE_ANSI = 2,
	};

	unsigned char security;
	unsigned char userSecurity;
	unsigned char fastMode;
	unsigned char sensitivity; //1~7
	
	unsigned char timeout; //1~20
	unsigned char viewImage;
	unsigned char reserved2; //NOT_USE, USE
    unsigned char reserved3; //0~20
	
	unsigned char reserved4;//NOT_USE, USE
	unsigned char matchTimeout;//1~20 
	unsigned char templateType;
	unsigned char useFakeDetect;//NOT_USE, USE
	unsigned char useProtection;//NOT_USE, USE
	
    unsigned char reserved5[84];

} BS2FingerprintConfig;

typedef struct {
	enum 
    {
             NOT_USE = 0,
             AN_INTERPHONE = 1,
             IP_INTERPHONE = 2,
			 VIDEOPHONE = 3,

             MAX_NETWORK_ADDR_LEN = 32,                
             MAX_SIP_SERVER_ID_LEN = 16,
             MAX_SIP_SERVER_PASSWORD_LEN = 16,
             MAX_SIP_PHONE_NO_LEN = 32,
             MAX_SIP_DISPLAY_NAME_LEN = 32,
   };
   
   unsigned int type; // 인터폰 타입
   char videoIpAddress[MAX_NETWORK_ADDR_LEN]; // 비디오 서버 IP
   unsigned int videoPort; // 비디오 서버 포트
   char sipServerAddress[MAX_NETWORK_ADDR_LEN]; // VoIP 서버 IP
   unsigned int sipServerPort; // VoIP 서버 포트 (UI에 넣지 말 것)
   char sipServerId[MAX_SIP_SERVER_ID_LEN]; // VoIP 서버 접속 아이디
   char sipServerPassword[MAX_SIP_SERVER_PASSWORD_LEN]; // VoIP 서버 접속 비밀번호
   char sipPhoneNo[MAX_SIP_PHONE_NO_LEN]; // VoIP 전화번호
   char sipDisplayName[MAX_SIP_DISPLAY_NAME_LEN]; // VoIP 표시 이름
   unsigned char speakerGain;  // 1 ~ 10 스피커 게인
   unsigned char micGain;                   // 1 ~ 10 마이크 게인
   unsigned int reserved[14];

} BS2InterphoneConfig, FSInterphoneConfig;


typedef struct {
   enum {
             SINGLE = 0,
             EXTENSION,

             MAX_DEVICE_PASSWORD_LEN = 16,
             MAX_NETWORK_ADDR_LEN = 32,            
             MAX_SESSION_PASSWORD_LEN = 16,

             MAX_CONNECTION = 8,

             NOT_USE = 0,
             USE = 1,
   };

   unsigned char mode;
   char devicePassword[MAX_DEVICE_PASSWORD_LEN];
   unsigned char doorControl;
   unsigned phoneNumber[MAX_CONNECTION];
   char ipAddress[MAX_CONNECTION][MAX_NETWORK_ADDR_LEN];
   char sessionPassword[MAX_CONNECTION][MAX_SESSION_PASSWORD_LEN];
   char singleIpAddress[MAX_NETWORK_ADDR_LEN];
   char reserved[6];
} BSVideophoneConfig;


typedef struct{
	enum{
		   NOT_USE = 0,
		   USE = 1,
       
		   AUTH_TYPE_FACE = 0,
		   AUTH_TYPE_CARD = 1,
		   AUTH_TYPE_ID = 2,

		   AUTH_DISABLE = -1,

		   //Auth Schedule
		   FACE_AUTH_COUNT = 6,
		   CARD_AUTH_COUNT = 5,
		   ID_AUTH_COUNT = 4,     
       
		   AUTH_FACE_ONLY = 0,
		   AUTH_FACE_PIN = 1,
		   AUTH_KEY_FACE = 2,
		   AUTH_KEY_FACE_PIN = 3,
		   AUTH_FACE_KEY = 4,
		   AUTH_FACE_PIN_KEY = 5,

		   AUTH_CARD_ONLY = 0,
		   AUTH_CARD_PIN = 1,
		   AUTH_CARD_FACE = 2,
		   AUTH_CARD_FACE_PIN = 3,
		   AUTH_CARD_FACE_N_PIN = 4,

		   AUTH_ID_PIN = 0,
		   AUTH_ID_FACE = 1,
		   AUTH_ID_FACE_PIN = 2,
		   AUTH_ID_FACE_N_PIN= 3,

		   //Private Auth
		   PAUTH_FACE_ONLY = 0,
		   PAUTH_FACE_PIN = 1,
		   PAUTH_CARD_ONLY = 2,
		   PAUTH_CARD_PIN = 3,
		   PAUTH_CARD_FACE = 4,
		   PAUTH_CARD_FACE_PIN = 5,
		   PAUTH_CARD_FACE_N_PIN = 6,
		   PAUTH_ID_PIN = 7,
		   PAUTH_ID_FACE = 8,
		   PAUTH_ID_FACE_PIN = 9,
		   PAUTH_ID_FACE_N_PIN = 10,
		   PAUTH_FACE_KEY = 11,
		   PAUTH_FACE_PIN_KEY = 12,

		   //tnaMode 
		   TNA_DISABLE = 0,
		   TNA_FUNCTION_KEY = 1,
		   TNA_AUTO_CHANGE = 2,
		   TNA_MANUAL_CHANGE = 3,
		   TNA_FIXED = 4,
       
		   // cardMode
		   CARD_DISABLE = 0,
		   CARD_CSN = 1,
		   CARD_DATA = 2,
       
		   //cardIdFormatType
		   CARD_ID_FORMAT_NORMAL = 0,
		   CARD_ID_FORMAT_WIEGAND = 1,
       
		   // cardIdByteOrder, cardIdBitOrder
		   CARD_ID_MSB = 0,
		   CARD_ID_LSB = 1,
	};

	unsigned char faceAuthSchedule[FACE_AUTH_COUNT];
	unsigned char cardAuthSchedule[CARD_AUTH_COUNT];
	unsigned char idAuthSchedule[ID_AUTH_COUNT];

	unsigned char tnaMode;
	unsigned char cardMode;
	unsigned char dualSchedule;
	unsigned char usePrivateAuthMode;
	unsigned char cardIdFormatType;

	unsigned char cardIdByteOrder;
	unsigned char cardIdBitOrder;
	unsigned char useDetectFace;
	unsigned char useServerMatching;
	unsigned char matchTimeout;
	unsigned char reserved[77];

} FSOPModeConfig;

typedef struct{
    enum{
           NOT_USE = 0,
           USE = 1,

           // security
           SECURITY_NORMAL = 0,
           SECURITY_SECURE = 1,
           SECURITY_MORE_SECURE = 2,

           // Mode
           FACE_MODE_SINGLE = 0,
           FACE_MODE_CONTINUE = 1,
    };

    unsigned char security;               // 0~14,2
    unsigned char sensitivity;            // 0~3,3
    unsigned char searchRange;            // 0~3,2
    unsigned char sizeRange;              // 0~3,8
    
    unsigned char authMode;               // 0~1,0
    unsigned char brightThreshold;		  // 0~255,64
    unsigned char lpfGain;                // 0~255,255

    int calPosX;                          // -208~208,0
    int calPosY;                          // -272~272,0

    int motionThreshold;                  // 0~4896000,30000
    int fakeThreshold;                    // 0~1024,50

    unsigned char enrollSensitivity;	  // 0~9,4
    unsigned char authFailSpeed;          // 0~255,30
    unsigned char enableIRCaptureLed;     // 0~1,1

	unsigned char reserved1;  
    unsigned char reserved2;
    unsigned char reserved3;
    unsigned char reserved4;
    unsigned char reserved5;
    unsigned char reserved6;
    
    unsigned char reserved7[64];

} FSFaceConfig;

#endif
