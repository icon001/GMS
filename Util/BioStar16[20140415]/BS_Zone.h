/**
 *  Zone information
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
 
#ifndef __BS_ZONE_H__
#define __BS_ZONE_H__


#define BS_MAX_NODE_PER_ZONE	32
#define BS_MAX_ZONE_PER_MASTER	16

// node type
#define BS_STANDALONE_NODE	0x00
#define BS_MASTER_NODE		0x01
#define BS_MEMBER_NODE		0x02

// Auth-type 
#define BS_AUTH_STANDALONE 	0x00
#define BS_AUTH_NOTIFY 		0x01
#define BS_AUTH_DEFERRED	0x02

// APB type
#define BS_APB_NONE			0x00
#define BS_APB_SOFT			0x01
#define BS_APB_HARD			0x02

// IO processing
#define BS_IO_LOCAL			0x00
#define BS_IO_SERVER_FIRST	0x01
#define BS_IO_SERVER_ONLY	0x02

// Fallback mode
#define BS_FALLBACK_NONE	0x00
#define BS_FALLBACK_OPEN	0x01
#define BS_FALLBACK_CLOSE	0x02
#define BS_FALLBACK_LOCAL	0x03

#define BS_AUTO_MASTER_ADDR	0xffffffff

typedef struct {
	// set by BA
	unsigned masterIpAddr; 
	int reserved1[11];

	// set by master according to zone type
	int authMode;
	int ioMode;
	int reserved2[14];
} BSZoneMember;


typedef struct {
	int apbType;
	int apbResetInterval; // 0 for no limit
} BSAPBZoneProperty;


#define BS_MAX_ENTRANCE_LIMIT_PER_DAY 	4

typedef struct {
	int minEntryInterval; // 0 for no limit
	int numOfEntranceLimit; // MAX 4
	int maxEntry[BS_MAX_ENTRANCE_LIMIT_PER_DAY]; // 0 (no limit) ~ 16
	unsigned entryLimitInterval[BS_MAX_ENTRANCE_LIMIT_PER_DAY];
} BSEntranceLimitationZoneProperty;


typedef struct {
	int reserved[12];
} BSDummyZoneProperty;


typedef union {
	BSAPBZoneProperty apbZone;
	BSEntranceLimitationZoneProperty entLimitZone;
	BSDummyZoneProperty dummnZone;
} BSZoneProperty;


typedef struct {
	enum {
		// zone mask
		UNDEFINED			= 0,
		ACCESS_ZONE 		= 0x01,
		APB_ZONE			= 0x02,
		ALARM_ZONE			= 0x04,
		ENTRANCE_LIMIT_ZONE = 0x08,

		// slave status
		NORMAL 			= 0,
		DISCONNECTED 	= -1,

		// reader type for APB
		IN_READER = 0x01,
		OUT_READER = 0x02,
	};

	int type;
	int numOfMember;

	int reserved1; 

	unsigned zoneID; // 0 ~ 255

	BSZoneProperty zoneProperty;

	unsigned memberID[BS_MAX_NODE_PER_ZONE - 1];
	int memberInfo[BS_MAX_NODE_PER_ZONE - 1]; // reader type for APB
} BSZone;


typedef struct {
	int numOfmember;

	int reserved1[7];

	unsigned memberID[BS_MAX_NODE_PER_ZONE - 1];
	unsigned memberIpAddr[BS_MAX_NODE_PER_ZONE - 1];
	int memberStatus[BS_MAX_NODE_PER_ZONE - 1];

	int numOfZone;
	int reserved3[7];
	BSZone zoneInfo[BS_MAX_ZONE_PER_MASTER];
} BSZoneMaster;


typedef struct {
	// grouop information
	int nodeType;
	int fallbackMode;
	bool synchTime;
	bool synchUser;
	bool synchLog;
	int zoneReserved[11];

	BSZoneMaster zoneMaster;
	BSZoneMember zoneMember;
} BSZoneConfig;

// Extended for BioStar
#define BS_MAX_NODE_PER_ZONE_EX 64
#define BS_MAX_ZONE_PER_NODE    4

#define BS_ZONE_TYPE_ACCESS             1
#define BS_ZONE_TYPE_APB                2
#define BS_ZONE_TYPE_ENTRANCE_LIMIT     3
#define BS_ZONE_TYPE_ALARM              4
#define BS_ZONE_TYPE_FIRE_ALARM         5

#define BS_KEY_F1 282 
#define BS_KEY_F2 283
#define BS_KEY_F3 284
#define BS_KEY_F4 285

typedef struct {
    enum {
        //Common
        //member status
        NORMAL = 0,
        DISCONNECTED = -1,
       
        //APB zone
        //reader type
        IN_READER = 0x01,
        OUT_READER = 0x02,

        //Alarm zone
        //member type
        DUMMY_READER = 0x00,
        ARM_READER = 0x01,
        DISARM_READER = 0x02,
        //zone status
        ARMED = 0x01,
        DISARMED = 0x02,

        //Action
        ACTION_NONE = 0x00,
        ACTION_ARM = 0x01,
        ACTION_DISARM = 0x02,
        ACTION_ALARM = 0x03
    };
    //Common
    int numOfMember; //includes master node itself...
    unsigned memberId[BS_MAX_NODE_PER_ZONE_EX];
    unsigned memberIpAddr[BS_MAX_NODE_PER_ZONE_EX];
    int memberStatus[BS_MAX_NODE_PER_ZONE_EX];
    int memberInfo[BS_MAX_NODE_PER_ZONE_EX];
    int reserved1[8];

    //Alarm zone
    int zoneStatus;
   	int alarmStatus;  // 0 : disabled, 1 : enabled

    int reserved2[3];
} BSZoneMasterEx;

typedef struct {
    enum {
        //Process Type
		SUCCESS_PROCESS = 0x00,
		FAIL_PROCESS = 0x01,
		//Alarm zone
        //arm/disarm type
        ARM_BY_KEYPAD = 0x01,
        ARM_BY_CARD = 0x02,
        NUM_OF_CARD = 8,
        INTERLOCK_DOOR_MASK = 0x01,
        INTERLOCK_INPUT_MASK = 0x02,
    };
    //Common
    unsigned masterIpAddr;
    unsigned masterId;
    
    //Interlock zone
    unsigned char interlockIndex; //Interlock zone에 포함된 두개의 문을 각각 구분하기 위한 값(0 or 1)
    unsigned char reserved1[3];

    //APB zone
    int authMode;
    int ioMode;

    //Alarm zone
    int armType;
	int useSound;

    int armKey;
    int disarmKey;

    // Card for arm/disarm
    int cardID[8];
    unsigned char customID[8];

    int disconnProcessType;
	int needAuth;
	int reserved2[1];
} BSZoneMemberEx;

typedef struct {
	int fallbackMode;
	bool synchTime;
	bool synchUser;
	bool synchLog;
	int reserved[4];
} BSAccessZoneProperty;

typedef struct {
	int apbType;
	int apbResetInterval; // 0 for no limit
    int bypassGroupId;
} BSAPBZonePropertyEx;

#define BE_MAX_ENTRANCE_LIMIT_PER_DAY 	4

typedef struct {
	int minEntryInterval; // 0 for no limit
	int numOfEntranceLimit; // MAX 4
	int maxEntry[BE_MAX_ENTRANCE_LIMIT_PER_DAY]; // 0 (no limit) ~ 16
	unsigned entryLimitInterval[BE_MAX_ENTRANCE_LIMIT_PER_DAY];
    int bypassGroupId;
} BSEntranceLimitationZonePropertyEx;

typedef struct {
	int accessGroupId;
	int armDelay;
	int disarmDelay;
	int reserved[8];
} BSAlarmZoneProperty;

typedef struct {
	int reserved[8];
} BSFireAlarmZoneProperty;

typedef struct {
    union
    {
        BSAccessZoneProperty accessZoneProperty;
        BSAPBZonePropertyEx apbZoneProperty;
        BSEntranceLimitationZonePropertyEx entLimitZoneProperty;
        BSAlarmZoneProperty alarmZoneProperty;
        BSFireAlarmZoneProperty fireAlarmZoneProperty;
    };
} BSZonePropertyEx;


typedef struct {
    unsigned zoneId;    //0 ~ 255
    int zoneType;
    int nodeType;
    BSZoneMasterEx master;
    BSZoneMemberEx member;
    BSZonePropertyEx ZoneProperty;
} BSZoneEx;

typedef struct {
    int numOfZones; //0 ~ BS_MAX_ZONE_PER_NODE
    BSZoneEx zone[BS_MAX_ZONE_PER_NODE];
} BSZoneConfigEx;

typedef struct {
	enum {
		MAX_READER = 9,
	};
	int numOfCardReader;
	unsigned readerID[MAX_READER];
	BSZoneConfigEx zoneConfigEx[MAX_READER];
} BSCardReaderZoneConfig;
#endif