/**
 *  API for BEPlus
 *
 *  @author sjlee@suprema.co.kr
 *  @see    
 */

/*  
 *  Copyright (c) 2007 Suprema Co., Ltd. All Rights Reserved.
 * 
 *  This software is the confidential and proprietary information of 
 *  Suprema Co., Ltd. ("Confidential Information").  You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into
 *  with Suprema.
 */

#ifndef __BS_BEPLUS_H__
#define __BS_BEPLUS_H__

#include "BS_SecureIO.h"
#include "BS_Wiegand.h"
#include "BS_Zone.h"
#include <time.h>

#define BEPLUS_CONFIG			0x50
#define BEPLUS_CONFIG_SYS_INFO	0x51
#define BEPLUS_CONFIG_CARD_READER 0x53

#define BIOLITE_CONFIG			0x70
#define BIOLITE_CONFIG_SYS_INFO	0x71
#define BIOLITE_CONFIG_CARD_READER 0x72

#define BE_MAX_ENROLL_USER	64

typedef struct {
	int baudrate;
	bool isMaster;

	int apbType;
	int fallbackMode;
	int reserved[6];
} BE485Config;

typedef struct {
	unsigned slaveID;
	unsigned slaveType;
} BE485Slave;

typedef struct {
	enum {
		ENROLL_CARD = 0x01,
		DELETE_CARD = 0x02,
		DELETE_ALL_CARD = 0x03,
	};

	unsigned cardID;
	unsigned char customID;
	unsigned char commandType;
	unsigned char needAdminFinger;
	unsigned char reserved;
	unsigned int fullCardCustomID;
} BECommandCard;


struct BEOutputPattern {
	enum {
		MAX_ARG = 3,

		// LED color
		RED = 0x00,
    	YELLOW,
		GREEN,
		CYAN,
		BLUE,
		MAGENTA,
		WHITE,

		FADEOUT = 0x01000000,

		// Buzzer frequency
		HIGH_FREQ = 3136,
		MIDDLE_FREQ = 2637,
		LOW_FREQ = 2093,
	};

	int repeat; // 0: indefinite, -1: don't user
	int arg[MAX_ARG]; // color for LED, frequency for Buzzer, -1 for last 
	short high[MAX_ARG]; // msec
	short low[MAX_ARG]; // msec
};

struct BEOutputPatternBLN {
	enum {
		MAX_ARG = 3,

        // Priority
        NORMAL = 0,
        HIGH = 1,

		// LED color
		RED = 0x00,
    	YELLOW,
		GREEN,
		CYAN,
		BLUE,
		MAGENTA,
		WHITE,

		FADEOUT = 0x01000000,

		// Buzzer frequency
		HIGH_FREQ = 3136,
		MIDDLE_FREQ = 2637,
		LOW_FREQ = 2093,

        //LCD LED
		OFF = 0x00,
		ON = 0x01,

		//KEYPAD LED
		NUMERIC = 0x01,
		OK_ARROW = 0x02,
	};

	int repeat; // 0: indefinite, -1: don't user
	int priority;
	int arg[MAX_ARG]; // color for LED, frequency for Buzzer, -1 for last 
	short high[MAX_ARG]; // msec
	short low[MAX_ARG]; // msec
};

struct BELEDBuzzerConfig {
	enum {
		MAX_SIGNAL	= 48,

		//
		// Signal Index
		//
		
		//  STATUS
		STATUS_NORMAL			= 0x00,
		STATUS_LOCKED,			
		STATUS_TAMPER_ON,		
		STATUS_RTC_ERROR,		
		STATUS_WAITING_INPUT,	
		STATUS_WAITING_DHCP,
		STATUS_DHCP_FAILED,
		STATUS_WRONG_CRYPT,
        STATUS_ARMED,

		// Misc. Event
		SCAN_FINGER			= 0x0C,
		SCAN_CARD,

		// Output Event: Same as BSOutputEvent
		AUTH_SUCCESS		= 0x10,
		AUTH_FAIL,
		AUTH_DURESS,
		ANTI_PASSBACK_FAIL,
		ACCESS_NOT_GRANTED,
		ENTRANCE_LIMITATION,
		ADMIN_AUTH_SUCCESS,

		TAMPER_ON,			
		DOOR_OPEN,			
		DOOR_CLOSED,		
		DOOR_FORCED_OPEN,	
		DOOR_HELD_OPEN_WARNING,

		INPUT0_ON,
		INPUT1_ON,
		INPUT2_ON,
		INPUT3_ON,

        ARM,
        DISARM, 

        ALARM_ON,

		// Generic Event
		GENERIC_SUCCESS = 0x2A,
		GENERIC_FAIL,

		ARM_DISARM_READY,
	};

	int reserved[4];

	BEOutputPattern ledPattern[MAX_SIGNAL];
	BEOutputPattern buzzerPattern[MAX_SIGNAL];
	unsigned short signalReserved[MAX_SIGNAL];
};

struct BELEDBuzzerConfigBLN {
	enum {
		MAX_SIGNAL	= 50,

		//
		// Signal Index
		//
		
		//  STATUS
		STATUS_NORMAL			= 0x00,
		STATUS_LOCKED,			
		STATUS_TAMPER_ON,		
		STATUS_RTC_ERROR,		
		STATUS_WAITING_INPUT,	
		STATUS_WAITING_DHCP,
		STATUS_DHCP_FAILED,
		STATUS_WRONG_CRYPT,
		STATUS_KEY_PRESSED,
        STATUS_ARMED,

		// Misc. Event
		SCAN_FINGER			= 0x0C,
		SCAN_CARD,

        LIGHT_ON,
		LIGHT_OFF,

		// Output Event: Same as BSOutputEvent
		AUTH_SUCCESS		= 0x10,
		AUTH_FAIL,
		AUTH_DURESS,
		ANTI_PASSBACK_FAIL,
		ACCESS_NOT_GRANTED,
		ENTRANCE_LIMITATION,
		ADMIN_AUTH_SUCCESS,

		TAMPER_ON,			
		DOOR_OPEN,			
		DOOR_CLOSED,		
		DOOR_FORCED_OPEN,	
		DOOR_HELD_OPEN_WARNING,
        DOOR_FORCED_OPEN_CLOSED,

		INPUT0_ON,
		INPUT1_ON,
		INPUT2_ON,
		INPUT3_ON,

        ARM,
        DISARM, 

        COMM,


        ALARM_ON,
		ALARM_OFF,

		// Generic Event
		GENERIC_SUCCESS = 0x2A,
		GENERIC_FAIL,

		ARM_DISARM_READY,
	};

	int reserved[4];

	BEOutputPatternBLN ledPattern[MAX_SIGNAL];
	BEOutputPatternBLN buzzerPattern[MAX_SIGNAL];
	BEOutputPatternBLN lcdLedPattern[MAX_SIGNAL];
	BEOutputPatternBLN keypadLedPattern[MAX_SIGNAL];
	unsigned short signalReserved[MAX_SIGNAL];
};

#define MAX_TNA_FUNCTION_KEY 16
#define MAX_TNA_EVENT_LEN 16

struct BETnaEventConfig {
	unsigned char enabled[MAX_TNA_FUNCTION_KEY]; 
	unsigned char useRelay[MAX_TNA_FUNCTION_KEY];
    unsigned short key[MAX_TNA_FUNCTION_KEY];  
	char eventStr[MAX_TNA_FUNCTION_KEY][MAX_TNA_EVENT_LEN];
};

struct BETnaEventExConfig {
	int fixedTnaIndex;
	int manualTnaIndex;
	int timeSchedule[MAX_TNA_FUNCTION_KEY];
};

typedef struct {
	enum {
		VALID_MAGIC_NO = 0x1f2f3f00,
		CONFIG_V01 = 0x01,

        MAX_OPMODE = 4,

		MAX_COMMAND_CARD = 16,

        MAX_485_DEVICE = 8,
        MAX_485_SECURE_IO = 4,

		// entrance type
		BI_READER = 0,
		IN_READER = 1,
		OUT_READER = 2,

		// operation mode
		CARD_OR_FINGER = 0,
		CARD_N_FINGER = 1,
		CARD_ONLY = 2,
		FINGER_ONLY = 3,
		DISABLED = 4,

		// operation mode per user 
        PROHIBITED = 0,
        ALLOWED = 1,

		// security level
		AUTOMATIC_NORMAL = 0x00,
		AUTOMATIC_SECURE = 0x01,
		AUTOMATIC_MORE_SECURE = 0x02,

		// fast mode
		FAST_MODE_AUTO	= 0x00,
		FAST_MODE_NORMAL = 0x01,
		FAST_MODE_FAST	= 0x02,
		FAST_MODE_FASTER = 0x03,

		// template type
		TEMPLATE_SUPREMA = 0x00,
		TEMPLATE_SIF = 0x01,
		TEMPLATE_ANSI378 = 0x02,

		// serial mode
		SERIAL_DISABLED = 0x00,
		SERIAL_IO_HOST = 0x01,
		SERIAL_IO_SLAVE = 0x02,
		SERIAL_PC = 0x03,
		SERIAL_IO_HOST_EX = 0x04,
		SERIAL_IO_SLAVE_EX = 0x05,

		// serial baudrate
		BAUDRATE_115200 = 0,
		BAUDRATE_57600 = 1,
		BAUDRATE_38400 = 2,
		BAUDRATE_19200 = 3,
		BAUDRATE_9600 = 4,

		// tna mode
		TNA_NONE 	= 0x00,
		TNA_FIX_IN	= 0x01,
		TNA_FIX_OUT	= 0x02,
		TNA_AUTO	= 0x03,

		// default access group
		DEFAULT_NO_ACCESS 	= 0x00,
		DEFAULT_FULL_ACCESS = 0x01,

        // Wiegand ID type
        WIEGAND_USER = 0x00,
        WIEGAND_CARD = 0x01,

 		// Wiegand Mode
		WIEGAND_MODE_NORMAL = 0x00,
		WIEGAND_MODE_EXTENDED = 0x01,

		CARD_ID_FORMAT_NORMAL = 0,
		CARD_ID_FORMAT_WIEGAND = 1,

		CARD_ID_FORMAT_MSB = 0,
		CARD_ID_FORMAT_LSB = 1,
	};

	// header
	unsigned magicNo;
	int version;
	unsigned timestamp;
	unsigned checksum;
	int headerReserved[4];

	// operation mode
	int opMode[4];
	int opModeSchedule[4];
	unsigned char opDualMode[4]; // DoubleMode[4];
    int opModePerUser; /* PROHIBITED, ALLOWED */
	int opReserved[7];

	// ip
	bool useDHCP;
	unsigned ipAddr;
	unsigned gateway;
	unsigned subnetMask;
	unsigned serverIpAddr;
	int port;
	bool useServer;
	bool synchTime;
	int support100BaseT;
	int ipReserved[7];

	// fingerprint
	int securityLevel;
	int fastMode;
	int fingerReserved1;
	int timeout; // 1 ~ 20 sec
	int matchTimeout; // Infinite(0) ~ 10 sec
	int templateType;
	int fakeDetection;
    bool useServerMatching;
	int fingerReserved[8];

	// I/O
	BSInputConfig inputConfig;
	BSOutputConfig outputConfig;
	BSDoorConfig doorConfig;
	int ioReserved[3];

	//extended serial
	unsigned hostID;
	unsigned slaveIDEx[MAX_485_DEVICE];
    unsigned slaveType;    // 0 : BST, 1 : BEPL

	// serial
	int serialMode; 
	int serialBaudrate;
	unsigned char serialReserved1; 
	unsigned char secureIO; // 0x01 - Secure I/O 0, 0x02, 0x04, 0x08
	unsigned char useTermination;
	unsigned char serialReserved2[5];
	unsigned slaveID; // 0 for no slave

	int reserved1[17];

	// entrance limit
	int minEntryInterval; // 0 for no limit
	int numOfEntranceLimit; // MAX 4
	int maxEntry[4]; // 0 (no limit) ~ 16
	unsigned entryLimitInterval[4];
    int bypassGroupId;
	int entranceLimitReserved[7]; 

	// command card
	int numOfCommandCard;
	BECommandCard commandCard[MAX_COMMAND_CARD];
	int commandCardReserved[3];

	// tna
	int tnaMode;
	int autoInSchedule;
	int autoOutSchedule;
	int tnaReserved[5];

	// user
	int defaultAG;
	int userReserved[7];

	int reserved2[21];

	int isLocked;

	// wiegand
	bool useWiegandOutput;
	int useWiegandInput;
	int wiegandMode;
	unsigned wiegandReaderID;
	int wiegandReserved[3];
    int wiegandIdType;
	BSWiegandConfig wiegandConfig;

	// LED/Buzzer
	BELEDBuzzerConfig ledBuzzerConfig;
	
	int reserved3[38];

	int cardIdFormatType;	/* CARD_ID_FORMAT_NORMAL, CARD_ID_FORMAT_WIEGAND */
	int cardIdByteOrder;	/* CARD_ID_MSB, CARD_ID_LSB */
	int cardIdBitOrder;		/* CARD_ID_MSB, CARD_ID_LSB */

    int padding[174];
} BEConfigData;

typedef struct {
	enum {
		VALID_MAGIC_NO = 0x1f2f3f00,
		CONFIG_V01 = 0x01,

		MAX_COMMAND_CARD = 16,

        MAX_485_DEVICE = 8,
        MAX_485_SECURE_IO = 4,

		// entrance type
		BI_READER = 0,
		IN_READER = 1,
		OUT_READER = 2,

		// operation mode
        MAX_OPMODE = 5,

        FINGER_ONLY = 0,
        PASSWORD_ONLY = 1,
        FINGER_OR_PASSWORD = 2,
        FINGER_AND_PASSWORD = 3,
        CARD_ONLY = 4,
        DISABLED = 5,

        // private auth mode
        PRIV_AUTH_DISABLED = 135,   //? ¤»
        PRIV_AUTH_FINGER_ONLY = 1020,
        PRIV_AUTH_FINGER_N_PASSWORD = 1021,
        PRIV_AUTH_FINGER_OR_PASSWORD = 1022,
        PRIV_AUTH_PASS_ONLY = 1023,
        PRIV_AUTH_CARD_ONLY = 1024,

		// operation mode per user 
        PROHIBITED = 0,
        ALLOWED = 1,

		// security level
		AUTOMATIC_NORMAL = 0x00,
		AUTOMATIC_SECURE = 0x01,
		AUTOMATIC_MORE_SECURE = 0x02,

		// fast mode
		FAST_MODE_AUTO	= 0x00,
		FAST_MODE_NORMAL = 0x01,
		FAST_MODE_FAST	= 0x02,
		FAST_MODE_FASTER = 0x03,

		// template type
		TEMPLATE_SUPREMA = 0x00,
		TEMPLATE_SIF = 0x01,
		TEMPLATE_ANSI378 = 0x02,

		// finger quality
		FINGER_QUALITY_WEAK = 0x00,
		FINGER_QUALITY_MODERATE = 0x01,
		FINGER_QUALITY_STRONG = 0x02,

		// operation mode (1:N mode)
        MAX_IDENTIFYMODE = 3,

		OP_1TON_FREESCAN = 0x00,
        OP_1TON_OK_KEY = 0x01,
		OP_1TON_NONE = 0x02, // ID or Card first

		// serial mode
		SERIAL_DISABLED = 0x00,
		SERIAL_IO_HOST = 0x01,
		SERIAL_IO_SLAVE = 0x02,
		SERIAL_PC = 0x03,
		SERIAL_IO_HOST_EX = 0x04,
		SERIAL_IO_SLAVE_EX = 0x05,

		// serial baudrate
		BAUDRATE_115200 = 0,
		BAUDRATE_57600 = 1,
		BAUDRATE_38400 = 2,
		BAUDRATE_19200 = 3,
		BAUDRATE_9600 = 4,

		// tna mode
		TNA_NONE 	= 0x00,
		TNA_FIX_IN	= 0x01,
		TNA_FIX_OUT	= 0x02,
		TNA_AUTO	= 0x03,

		// default access group
		DEFAULT_NO_ACCESS 	= 0x00,
		DEFAULT_FULL_ACCESS = 0x01,

		// com encryption
		COM_PASSWORD_LEN = 16,

        // Wiegand ID type
        WIEGAND_USER = 0x00,
        WIEGAND_CARD = 0x01,

 		// Wiegand Mode
		WIEGAND_MODE_NORMAL = 0x00,
		WIEGAND_MODE_EXTENDED = 0x01,

		BACKLIGHT_ALWAYS_ON = 0x00,
		BACKLIGHT_ALWAYS_OFF = 0x01,
		BACKLIGHT_ON_AT_USE = 0x02,

		SOUND_ALWAYS_ON = 0x00,
		SOUND_ALWAYS_OFF = 0x01,

		CARD_ID_FORMAT_NORMAL = 0,
		CARD_ID_FORMAT_WIEGAND = 1,

		CARD_ID_FORMAT_MSB = 0,
		CARD_ID_FORMAT_LSB = 1,
	};

	// header
	unsigned magicNo;
	int version;
	unsigned timestamp;
	unsigned checksum;
	int headerReserved[4];

	// operation mode
	int opMode[MAX_OPMODE];
	int opModeSchedule[MAX_OPMODE];
	unsigned char opDualMode[MAX_OPMODE]; // DoubleMode[4];
    unsigned char opReserved1[3];
    int opModePerUser; /* PROHIBITED, ALLOWED */
    int identificationMode[MAX_IDENTIFYMODE];
    int identificationModeSchedule[MAX_IDENTIFYMODE];
	int opReserved2[1];

	// ip
	bool useDHCP;
	unsigned ipAddr;
	unsigned gateway;
	unsigned subnetMask;
	unsigned serverIpAddr;
	int port;
	bool useServer;
	bool synchTime;
	int support100BaseT;
	int ipReserved[6];

	// fingerprint
	int imageQuality;
	int securityLevel;
	int fastMode;
	int fingerReserved1;
	int timeout; // 1 ~ 20 sec
	int matchTimeout; // Infinite(0) ~ 10 sec
	int templateType;
	int fakeDetection;
    bool useServerMatching;
    bool useCheckDuplicate;
	int fingerReserved[7];

	// I/O
	BSInputConfig inputConfig;
	BSOutputConfig outputConfig;
	BSDoorConfig doorConfig;
	int ioReserved[3];

	//extended serial
	unsigned hostID;
	unsigned slaveIDEx[MAX_485_DEVICE];
    unsigned slaveType;    // 0 : BST, 1 : BEPL

	// serial
	int serialMode; 
	int serialBaudrate;
	unsigned char serialReserved1; 
	unsigned char secureIO; // 0x01 - Secure I/O 0, 0x02, 0x04, 0x08
	unsigned char serialReserved2[6];
	unsigned slaveID; // 0 for no slave

	int reserved1[17];

	// entrance limit
	int minEntryInterval; // 0 for no limit
	int numOfEntranceLimit; // MAX 4
	int maxEntry[4]; // 0 (no limit) ~ 16
	unsigned entryLimitInterval[4];
    int bypassGroupId;
	int entranceLimitReserved[7]; 

	// command card
	int numOfCommandCard;
	BECommandCard commandCard[MAX_COMMAND_CARD];
	int commandCardReserved[3];

	// tna
	int tnaMode;
	int autoInSchedule;
	int autoOutSchedule;
	int tnaChange;
	int tnaReserved[4];

	// user
	int defaultAG;
	int userReserved[7];

	int reserved2[21];

	int isLocked;

	// wiegand
	bool useWiegandOutput;
    bool useWiegandInput;
	int wiegandMode;
	unsigned wiegandReaderID;
	int wiegandReserved[3];
    int wiegandIdType;
	BSWiegandConfig wiegandConfig;

	// LED/Buzzer
	BELEDBuzzerConfigBLN ledBuzzerConfig;

	int reserved3[38];

	int backlightMode;
	int soundMode;

    BETnaEventConfig tnaEventConfig;
    BETnaEventExConfig tnaEventExConfig;

        int reserved4[3];

	int cardIdFormatType;	/* CARD_ID_FORMAT_NORMAL, CARD_ID_FORMAT_WIEGAND */
	int cardIdByteOrder;	/* CARD_ID_MSB, CARD_ID_LSB */
	int cardIdBitOrder;		/* CARD_ID_MSB, CARD_ID_LSB */

	int padding[57];
} BEConfigDataBLN;

typedef struct {
	enum {
		VALID_MAGIC_NO = 0x1f2f3f01,
	};

	unsigned magicNo;
	int version;
	unsigned timestamp;
	unsigned checksum;
	int headerReserved[4];

	unsigned ID;
	unsigned char macAddr[8];
	char boardVer[16];
	char firmwareVer[16];
#if 1
	char productName[32];
	int reserved[32]; 
#else
	int language;
	int reserved[36];
#endif
} BESysInfoData;

typedef struct {
	enum {
		VALID_MAGIC_NO = 0x1f2f3f01,

		CONFIG_V01 = 0x01,

             LANG_KOR = 0x00,
		LANG_ENG = 0x01,
		LANG_CUSTOM = 0x02,
	};

	unsigned magicNo;
	int version;
	unsigned timestamp;
	unsigned checksum;
	int headerReserved[4];

	unsigned ID;
	unsigned char macAddr[8];
	char boardVer[16];
	char firmwareVer[16];
	char productName[32];
	int language;
	int reserved[31];
} BESysInfoDataBLN;

typedef struct {
	enum {
		VALID_MAGIC_NO = 0x1f2f3f02,
		CONFIG_V01 = 0x01,
	};

	unsigned magicNo;
	int version;
	unsigned timestamp;
	unsigned checksum;
	int headerReserved[4];

	BSZoneConfig zoneConfig;
} BEZoneInfoData;


typedef struct {
	enum {
		// card Flag
		NORMAL_CARD = 0x00,
		BYPASS_CARD = 0x01,

		// card Version
		CARD_VERSION_1	= 0x13, 

		// Admin level
		USER_LEVEL_NORMAL = 0,
		USER_LEVEL_ADMIN = 1,

		// Security leve
		USER_SECURITY_DEFAULT = 0,
		USER_SECURITY_LOWER = 1,
		USER_SECURITY_LOW = 2, 
		USER_SECURITY_NORMAL = 3,
		USER_SECURITY_HIGH = 4,
		USER_SECURITY_HIGHER = 5,
	};

	int version;

	unsigned userID;

	time_t startTime;
	time_t expiryTime;

	unsigned cardID;
	unsigned char cardCustomID;
	unsigned char commandCardFlag;
	unsigned char cardFlag;
	unsigned char cardVersion;

	unsigned short adminLevel;
	unsigned short securityLevel;

	unsigned accessGroupMask;

	unsigned short numOfFinger; // 0, 1, 2
	unsigned short fingerChecksum[2];
	unsigned char isDuress[2];

	int disabled;

	int opMode;
    int dualMode;
    char password[16];
	unsigned fullCardCustomID;
	int reserved2[14];
} BEUserHdr;


//Not published
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Encryption functions for BEPlus 
//
#define BE_ENCRYPTION_BLOCK_SIZE	16

void BE_InitInternalEncrypt();
void BE_InitEncrypt( const char* keyPhrase, int keyPhraseLen );

// inBuf and outBuf can be same
int BE_Encrypt( unsigned char* inBuf, int inLen, unsigned char* outBuf, int* outLen );
int BE_Decrypt( unsigned char* inBuf, int inLen, unsigned char* outBuf, int* outLen ); 

int BE_EncryptComm( unsigned char* inBuf, int inLen, unsigned char* outBuf, int* outLen );
int BE_DecryptComm( unsigned char* inBuf, int inLen, unsigned char* outBuf, int* outLen ); 

int BE_EncryptUDP( unsigned char* inBuf, int inLen, unsigned char* outBuf, int* outLen );
int BE_DecryptUDP( unsigned char* inBuf, int inLen, unsigned char* outBuf, int* outLen );

bool BE_IsEncryptedCommand( int command );

#endif