/**
 *  Secure I/O Configuration
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
 
#ifndef __BS_SECURE_IO_H__
#define __BS_SECURE_IO_H__


#define BS_NUM_OF_SECURE_IO     	4


// device id
#define BS_DEVICE_HOST	0x00
#define BS_DEVICE_SLAVE	0x01
#define BS_DEVICE_SECUREIO0	0x02
#define	BS_DEVICE_SECUREIO1	0x03
#define BS_DEVICE_SECUREIO2	0x04
#define BS_DEVICE_SECUREIO3	0x05

#define BS_DEVICE_ALL 0xFF

// input port id
#define BS_PORT_INPUT0	0x00
#define BS_PORT_INPUT1	0x01
#define BS_PORT_INPUT2	0x02
#define BS_PORT_INPUT3	0x03
#define BS_PORT_TAMPER	0x04

// relay id
#define BS_PORT_RELAY0	0x00
#define BS_PORT_RELAY1	0x01

struct BSDoor {
	enum {
		// relay
		RELAY_DISABLED 	= 0xFFFF,
		HOST_RELAY 	= (BS_DEVICE_HOST << 8) | BS_PORT_RELAY0,
		HOST_RELAY0 = (BS_DEVICE_HOST << 8) | BS_PORT_RELAY0,
		HOST_RELAY1 = (BS_DEVICE_HOST << 8) | BS_PORT_RELAY1,
		SLAVE_RELAY	= (BS_DEVICE_SLAVE << 8) | BS_PORT_RELAY0,
		SLAVE_RELAY0 = (BS_DEVICE_SLAVE << 8) | BS_PORT_RELAY0,
		SLAVE_RELAY1 = (BS_DEVICE_SLAVE << 8) | BS_PORT_RELAY1,
		SECUREIO0_RELAY0 = (BS_DEVICE_SECUREIO0 << 8) | BS_PORT_RELAY0,
		SECUREIO0_RELAY1 = (BS_DEVICE_SECUREIO0 << 8) | BS_PORT_RELAY1,
		SECUREIO1_RELAY0 = (BS_DEVICE_SECUREIO1 << 8) | BS_PORT_RELAY0,
		SECUREIO1_RELAY1 = (BS_DEVICE_SECUREIO1 << 8) | BS_PORT_RELAY1,
		SECUREIO2_RELAY0 = (BS_DEVICE_SECUREIO2 << 8) | BS_PORT_RELAY0,
		SECUREIO2_RELAY1 = (BS_DEVICE_SECUREIO2 << 8) | BS_PORT_RELAY1,
		SECUREIO3_RELAY0 = (BS_DEVICE_SECUREIO3 << 8) | BS_PORT_RELAY0,
		SECUREIO3_RELAY1 = (BS_DEVICE_SECUREIO3 << 8) | BS_PORT_RELAY1,
		
		// RTE
		HOST_INPUT0 = (BS_DEVICE_HOST << 8) | BS_PORT_INPUT0,
		SLAVE_INPUT0 = (BS_DEVICE_SLAVE << 8) | BS_PORT_INPUT0,
		SECUREIO0_RTE0 = (BS_DEVICE_SECUREIO0 << 8) | BS_PORT_INPUT0,
		SECUREIO0_RTE1 = (BS_DEVICE_SECUREIO0 << 8) | BS_PORT_INPUT2,
		SECUREIO1_RTE0 = (BS_DEVICE_SECUREIO1 << 8) | BS_PORT_INPUT0,
		SECUREIO1_RTE1 = (BS_DEVICE_SECUREIO1 << 8) | BS_PORT_INPUT2,
		SECUREIO2_RTE0 = (BS_DEVICE_SECUREIO2 << 8) | BS_PORT_INPUT0,
		SECUREIO2_RTE1 = (BS_DEVICE_SECUREIO2 << 8) | BS_PORT_INPUT2,
		SECUREIO3_RTE0 = (BS_DEVICE_SECUREIO3 << 8) | BS_PORT_INPUT0,
		SECUREIO3_RTE1 = (BS_DEVICE_SECUREIO3 << 8) | BS_PORT_INPUT2,

		// Door Sensor
		HOST_INPUT1 = (BS_DEVICE_HOST << 8) | BS_PORT_INPUT1,
		SLAVE_INPUT1 	= (BS_DEVICE_SLAVE << 8) | BS_PORT_INPUT1,
		SECUREIO0_DOOR_SENSOR0 = (BS_DEVICE_SECUREIO0 << 8) | BS_PORT_INPUT1,
		SECUREIO0_DOOR_SENSOR1 = (BS_DEVICE_SECUREIO0 << 8) | BS_PORT_INPUT3,
		SECUREIO1_DOOR_SENSOR0 = (BS_DEVICE_SECUREIO1 << 8) | BS_PORT_INPUT1,
		SECUREIO1_DOOR_SENSOR1 = (BS_DEVICE_SECUREIO1 << 8) | BS_PORT_INPUT3,
		SECUREIO2_DOOR_SENSOR0 = (BS_DEVICE_SECUREIO2 << 8) | BS_PORT_INPUT1,
		SECUREIO2_DOOR_SENSOR1 = (BS_DEVICE_SECUREIO2 << 8) | BS_PORT_INPUT3,
		SECUREIO3_DOOR_SENSOR0 = (BS_DEVICE_SECUREIO3 << 8) | BS_PORT_INPUT1,
		SECUREIO3_DOOR_SENSOR1 = (BS_DEVICE_SECUREIO3 << 8) | BS_PORT_INPUT3,

		HOST_INPUT2 = (BS_DEVICE_HOST << 8) | BS_PORT_INPUT2,
		HOST_INPUT3 = (BS_DEVICE_HOST << 8) | BS_PORT_INPUT3,

        // Generic definition for extended 485 configuration
        SECUREIO0_INPUT0 = (BS_DEVICE_SECUREIO0 << 8) | BS_PORT_INPUT0,
        SECUREIO0_INPUT1 = (BS_DEVICE_SECUREIO0 << 8) | BS_PORT_INPUT1,
        SECUREIO0_INPUT2 = (BS_DEVICE_SECUREIO0 << 8) | BS_PORT_INPUT2,
        SECUREIO0_INPUT3 = (BS_DEVICE_SECUREIO0 << 8) | BS_PORT_INPUT3,
        SECUREIO1_INPUT0 = (BS_DEVICE_SECUREIO1 << 8) | BS_PORT_INPUT0,
        SECUREIO1_INPUT1 = (BS_DEVICE_SECUREIO1 << 8) | BS_PORT_INPUT1,
        SECUREIO1_INPUT2 = (BS_DEVICE_SECUREIO1 << 8) | BS_PORT_INPUT2,
        SECUREIO1_INPUT3 = (BS_DEVICE_SECUREIO1 << 8) | BS_PORT_INPUT3,
        SECUREIO2_INPUT0 = (BS_DEVICE_SECUREIO2 << 8) | BS_PORT_INPUT0,
        SECUREIO2_INPUT1 = (BS_DEVICE_SECUREIO2 << 8) | BS_PORT_INPUT1,
        SECUREIO2_INPUT2 = (BS_DEVICE_SECUREIO2 << 8) | BS_PORT_INPUT2,
        SECUREIO2_INPUT3 = (BS_DEVICE_SECUREIO2 << 8) | BS_PORT_INPUT3,
        SECUREIO3_INPUT0 = (BS_DEVICE_SECUREIO3 << 8) | BS_PORT_INPUT0,
        SECUREIO3_INPUT1 = (BS_DEVICE_SECUREIO3 << 8) | BS_PORT_INPUT1,
        SECUREIO3_INPUT2 = (BS_DEVICE_SECUREIO3 << 8) | BS_PORT_INPUT2,
        SECUREIO3_INPUT3 = (BS_DEVICE_SECUREIO3 << 8) | BS_PORT_INPUT3,

		// Open Event
		ALL_EVENT		= 0x00,
		AUTH_ONLY		= 0x01,
		TNA_ONLY		= 0x02,
		AUTH_N_TNA		= 0x03,
		NONE                  = 0x04,

		// Door/switch type
		NORMALLY_OPEN	= 0x00,
		NORMALLY_CLOSED	= 0x01,

		// Reader
		NO_READER 			= 0x00,
		HOST_READER 		= 0x01,
		SLAVE_READER 		= 0x02,
	};

	int relay;
	int useRTE;
	int useDoorSensor;
	int openEvent; // only for BST
	int openTime;
	int heldOpenTime;
	int forcedOpenSchedule;
	int forcedCloseSchedule;
	int RTEType;
	int sensorType;
	short reader[2];
    unsigned char useRTEEx;
    unsigned char useSoundForcedOpen;
    unsigned char useSoundHeldOpen;
	unsigned char openOnce;
    int RTE;
    unsigned char useDoorSensorEx;
    unsigned char alarmStatus;
    unsigned char reserved2[2];
    int doorSensor;
    int relayDeviceId;
};


struct BSDoorConfig {
	enum {
		MAX_DOOR = 2,
			
		// Door mode
		NO_DOOR		= 0,
		ONE_DOOR	= 1,
		TWO_DOOR	= 2,
	};
	
	BSDoor door[MAX_DOOR];
	int apbType;
	int apbResetTime;
	int doorMode;
};

struct BSInputFunction {
	enum {
		// function
		DISABLED 		= 0x00,
		GENERIC_INPUT 	= 0x01,
		EMERGENCY_OPEN	= 0x02,
		ALL_ALARM_OFF	= 0x03,
		RESET_READER	= 0x04,
		LOCK_READER		= 0x05,

		//zone function type
		ALARM_ZONE_INPUT = 0x06,
		FIRE_ALARM_ZONE_INPUT = 0x07,
		ALARM_ZONE_SENSOR_STATUS_INPUT = 0x08,
		ALARM_ZONE_ARM_DISARM_INPUT = 0x09,
		INTERLOCK_ZONE_INPUT = 0x0A //Interlock Zone에서 Door Sensor와 같은 의미로 동작하는 Input
	};
	
	int functionType;	
	short minimumDuration;
	short switchType;
	int timeSchedule;
	unsigned deviceID;
	int reserved[4];
};


typedef struct {
	enum {
		// 16 bit event ID
		AUTH_SUCCESS 		= 0x01,
        AUTH_FAIL			= 0x02,
        AUTH_DURESS			= 0x03,
        ANTI_PASSBACK_FAIL	= 0x04,
        ACCESS_NOT_GRANTED	= 0x05,
        ENTRANCE_LIMITATION	= 0x06,
        ADMIN_AUTH_SUCCESS	= 0x07,
        LEFT_AUTH_SUCCESS   = 0x08,
        RIGHT_AUTH_SUCCESS  = 0x09,
		
        TAMPER_ON				= 0x30,
        DOOR_OPEN				= 0x31,
        DOOR_CLOSED				= 0x32,
        DOOR_FORCED_OPEN		= 0x33,
        DOOR_HELD_OPEN_WARNING 	= 0x34,
		
        INPUT0_ON			= 0x60,
        INPUT1_ON			= 0x61,
        INPUT2_ON			= 0x62,
        INPUT3_ON			= 0x63,
		
        ALARM_ZONE_EVENT    = 0x70,
        ALARM_ZONE_ARM_EVENT = 0x71,
        ALARM_ZONE_DISARM_EVENT = 0x72,
        FIRE_ALARM_ZONE_EVENT = 0x80,
		
        APB_ZONE_EVENT      = 0x90,
        ENTLIMIT_ZONE_EVENT = 0xA0,
		
        DOOR_HELD_OPEN_EVENT = 0xB0,
        DOOR_FORCED_OPEN_EVENT = 0xC0,
		
        OUTPUT_TYPE_RELAY = 0x00,
        OUTPUT_TYPE_NONRELAY = 0x01,
	};
	
	unsigned event; // (8 bit input device ID << 16) | 16 bit event ID 
	unsigned char outputDeviceID;
	unsigned char outputRelayID;
	unsigned char relayOn;
	unsigned char reserved1;
	unsigned short delay;
	unsigned short high;
	unsigned short low;
	unsigned short count;
	int priority; // 1(highest) ~ 99(lowest)
	unsigned deviceID;
	int outputType;
	int reserved2[1];
} BSOutputEvent;

typedef struct {
	unsigned short inputType;
	unsigned short outputRelayID;
	unsigned short inputDuration;
	unsigned short high;
	unsigned short low;
	unsigned short count;
	int reserved3[5];
} BSEMOutputEvent;


typedef struct {
	enum {
		NUM_OF_HOST_INPUT = 2,

		NUM_OF_SECURE_IO = 4,
		NUM_OF_SECURE_INPUT = 4,

		NUM_OF_SLAVE_INPUT = 2,
	};

	// host inputs
	BSInputFunction hostTamper;
	BSInputFunction hostInput[NUM_OF_HOST_INPUT];

	// secure I/O
	BSInputFunction secureIO[NUM_OF_SECURE_IO][NUM_OF_SECURE_INPUT];

	// slave
	BSInputFunction slaveTamper;
	BSInputFunction slaveInput[NUM_OF_SLAVE_INPUT];

	int reserved[32];
} BSInputConfig;


typedef struct {
	enum 
	{
		NUM_OF_INTERNAL_INPUT = 4,
		NUM_OF_SECURE_IO = 4,
		NUM_OF_SECURE_INPUT = 4,
	};

	// host inputs
	BSInputFunction internalTamper;
	BSInputFunction internalInput[NUM_OF_INTERNAL_INPUT];

	// secure I/O
	BSInputFunction secureIO[NUM_OF_SECURE_IO][NUM_OF_SECURE_INPUT];

	int reserved[48];

} DSInputConfig, XSInputConfig, BS2InputConfig, FSInputConfig;


typedef struct {
	enum {
		MAX_OUTPUT = 200 - 16,
	};

	int numOfEvent;
	BSOutputEvent outputEvent[MAX_OUTPUT];
	BSEMOutputEvent emergencyEvent[BSInputConfig::NUM_OF_SECURE_IO][BSInputConfig::NUM_OF_SECURE_INPUT];

	int reserved[31];
} BSOutputConfig;

typedef struct {
	enum {
		MAX_READER = 9,

		TEMPORARY_OPEN = 0,
		TOGGLED = 1,

		OPENED = 0,
		CLOSED = 1,
	};

	int numOfCardReader;
	unsigned readerID[MAX_READER];
	BSDoor door[MAX_READER];
	int apbType;
	int apbResetTime;
} BSCardReaderDoorConfig;

typedef struct {
	enum {
		MAX_READER = 9,
	};

	int numOfCardReader;
    unsigned readerID[MAX_READER];
	BSInputConfig input[MAX_READER];
} BSCardReaderInputConfig;

typedef struct {
	enum {
		MAX_READER = 9,
	};

	int numOfCardReader;
    unsigned readerID[MAX_READER];
	BSOutputConfig output[MAX_READER];
}  BSCardReaderOutputConfig;

typedef struct {
    BSCardReaderInputConfig inputConfig;
    BSCardReaderOutputConfig outputConfig;
    BSCardReaderDoorConfig doorConfig;
} BSCardReaderConfigData;


#endif