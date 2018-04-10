/**
 *  Log management
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

#ifndef __BS_LOG_H__
#define __BS_LOG_H__

#include <time.h>

#define BS_LOG_CACHE_SIZE 128	//64

//
// Events same as BioEntry
//
#define	BE_EVENT_SCAN_SUCCESS 	0x58

#define BE_EVENT_ENROLL_BAD_FINGER 0x16
#define	BE_EVENT_ENROLL_SUCCESS 0x17
#define	BE_EVENT_ENROLL_FAIL 0x18
#define BE_EVENT_ENROLL_CANCELED 0x19
#define BE_EVENT_ENROLL_BAD_FACE 0x23

#define	BE_EVENT_VERIFY_BAD_FACE 0x24
#define BE_EVENT_VERIFY_NO_FACE 0x25
#define	BE_EVENT_VERIFY_BAD_FINGER 0x26
#define	BE_EVENT_VERIFY_SUCCESS 0x27
#define	BE_EVENT_VERIFY_FAIL 0x28
#define BE_EVENT_VERIFY_CANCELED 0x29
#define BE_EVENT_VERIFY_NO_FINGER 0x2a

#define BS_EVENT_VERIFY_CARD_FINGER 0x2d
#define BS_EVENT_VERIFY_CARD_PIN 0x2e
#define BS_EVENT_VERIFY_CARD_FINGER_PIN 0x30

#define	BE_EVENT_IDENTIFY_BAD_FINGER 0x36
#define	BE_EVENT_IDENTIFY_SUCCESS 0x37
#define	BE_EVENT_IDENTIFY_FAIL 0x38
#define BE_EVENT_IDENTIFY_CANCELED 0x39
#define BE_EVENT_IDENTIFY_FINGER 0x3a
#define BE_EVENT_IDENTIFY_FINGER_PIN 0x3b
#define	BE_EVENT_IDENTIFY_BAD_FACE 0x3c
#define	BE_EVENT_IDENTIFY_FACE 0x3d
#define	BE_EVENT_IDENTIFY_FACE_PIN 0x3e
#define BE_EVENT_IDENTIFY_FACE_TIMEOUT 0x3f

#define	BE_EVENT_DELETE_BAD_FACE 0x45
#define	BE_EVENT_DELETE_BAD_FINGER 0x46
#define	BE_EVENT_DELETE_SUCCESS 0x47
#define	BE_EVENT_DELETE_FAIL 0x48
#define BE_EVENT_DELETE_ALL_SUCCESS 0x49

#define	BE_EVENT_VERIFY_DURESS 0x62
#define	BE_EVENT_IDENTIFY_DURESS 0x63

#define	BE_EVENT_TAMPER_SWITCH_ON 0x64
#define	BE_EVENT_TAMPER_SWITCH_OFF 0x65

#define	BE_EVENT_SYS_STARTED 0x6a
#define	BE_EVENT_IDENTIFY_NOT_GRANTED 0x6d
#define	BE_EVENT_VERIFY_NOT_GRANTED 0x6e

#define BE_EVENT_IDENTIFY_LIMIT_COUNT 0x6f
#define BE_EVENT_IDENTIFY_LIMIT_TIME 0x70

#define BE_EVENT_IDENTIFY_DISABLED 0x71
#define BE_EVENT_IDENTIFY_EXPIRED 0x72

#define BE_EVENT_APB_FAIL 				0x73
#define BE_EVENT_COUNT_LIMIT 			0x74
#define BE_EVENT_TIME_INTERVAL_LIMIT 	0x75
#define BE_EVENT_INVALID_AUTH_MODE		0x76
#define BE_EVENT_EXPIRED_USER			0x77
#define BE_EVENT_NOT_GRANTED			0x78

#define BE_EVENT_DETECT_INPUT0	0x54
#define BE_EVENT_DETECT_INPUT1 0x55

#define BE_EVENT_TIMEOUT 0x90

// BIOSTATION specific events
#define BS_EVENT_RELAY_ON	0x80
#define BS_EVENT_RELAY_OFF	0x81

// Door event
#define BE_EVENT_DOOR0_OPEN 	0x82
#define BE_EVENT_DOOR1_OPEN		0x83
#define BE_EVENT_DOOR0_CLOSED 	0x84
#define BE_EVENT_DOOR1_CLOSED	0x85

#define BE_EVENT_DOOR0_FORCED_OPEN	0x86
#define BE_EVENT_DOOR1_FORCED_OPEN	0x87

#define BE_EVENT_DOOR0_HELD_OPEN	0x88
#define BE_EVENT_DOOR1_HELD_OPEN	0x89

#define BE_EVENT_DOOR0_RELAY_ON		0x8A
#define BE_EVENT_DOOR1_RELAY_ON		0x8B

#define BE_EVENT_TIMEOUT 0x90

//template card event
#define BE_EVENT_CARD_ENROLL_SUCCESS 0x20
#define BE_EVENT_CARD_ENROLL_FAIL 0x21

#define	BE_EVENT_CARD_VERIFY_DURESS 0x95

#define	BE_EVENT_CARD_VERIFY_SUCCESS 0x97
#define	BE_EVENT_CARD_VERIFY_FAIL 0x98

#define BE_EVENT_CARD_APB_FAIL 				0x99
#define BE_EVENT_CARD_COUNT_LIMIT 			0x9a
#define BE_EVENT_CARD_TIME_INTERVAL_LIMIT 	0x9b
#define BE_EVENT_CARD_INVALID_AUTH_MODE		0x9c
#define BE_EVENT_CARD_EXPIRED_USER			0x9d
#define BE_EVENT_CARD_NOT_GRANTED			0x9e


// IO event
#define BE_EVENT_INTERNAL_INPUT0	0xA0
#define BE_EVENT_INTERNAL_INPUT1	0xA1
#define DS_EVENT_INTERNAL_INPUT2	0xA2
#define DS_EVENT_INTERNAL_INPUT3	0xA3

#define BE_EVENT_SIO0_INPUT0		0xB0
#define BE_EVENT_SIO0_INPUT1		0xB1
#define BE_EVENT_SIO0_INPUT2		0xB2
#define BE_EVENT_SIO0_INPUT3		0xB3

#define BE_EVENT_SIO1_INPUT0		0xB4
#define BE_EVENT_SIO1_INPUT1		0xB5
#define BE_EVENT_SIO1_INPUT2		0xB6
#define BE_EVENT_SIO1_INPUT3		0xB7

#define BE_EVENT_SIO2_INPUT0		0xB8
#define BE_EVENT_SIO2_INPUT1		0xB9
#define BE_EVENT_SIO2_INPUT2		0xBA
#define BE_EVENT_SIO2_INPUT3		0xBB

#define BE_EVENT_SIO3_INPUT0		0xBC
#define BE_EVENT_SIO3_INPUT1		0xBD
#define BE_EVENT_SIO3_INPUT2		0xBE
#define BE_EVENT_SIO3_INPUT3		0xBF

#define BE_EVENT_LOCKED				0xC0
#define BE_EVENT_UNLOCKED			0xC1
#define BE_EVENT_BLACKLISTED		0xC2

#define BE_EVENT_ARMED              0xC3
#define BE_EVENT_DISARMED           0xC4

#define BE_EVENT_ALARM_ZONE_INPUT   0xC5
#define BE_EVENT_FIRE_ALARM_ZONE_INPUT   0xC6

#define BE_EVENT_ALARM_ZONE_INPUT_CLEAR 0xC7
#define BE_EVENT_FIRE_ALARM_ZONE_INPUT_CLEAR    0xC8

#define BE_EVENT_APB_ZONE_ALARM     0xC9
#define BE_EVENT_ENTLIMIT_ZONE_ALARM    0xCA

#define BE_EVENT_APB_ZONE_ALARM_CLEAR   0xCB
#define BE_EVENT_ENTLIMIT_ZONE_ALARM_CLEAR  0xCC

#define BE_EVENT_DOOR_HELD_OPEN_ALARM   0xE0
#define BE_EVENT_DOOR_FORCED_OPEN_ALARM 0xE1

#define BE_EVENT_DOOR_HELD_OPEN_ALARM_CLEAR 0xE2
#define BE_EVENT_DOOR_FORCED_OPEN_ALARM_CLEAR 0xE3

#define BE_EVENT_TIME_SET			0xD2
#define BE_EVENT_SOCK_CONN      0xD3
#define BE_EVENT_SOCK_DISCONN   0xD4
#define BE_EVENT_SERVER_SOCK_CONN      0xD5
#define BE_EVENT_SERVER_SOCK_DISCONN   0xD6
#define BE_EVENT_LINK_CONN      0xD7
#define BE_EVENT_LINK_DISCONN   0xD8
#define BE_EVENT_INIT_IP        0xD9
#define BE_EVENT_INIT_DHCP      0xDA
#define BE_EVENT_DHCP_SUCCESS   0xDB

#define BE_EVENT_NOT_CONNECT_FAIL 		0xDC


/*
#define BE_EVENT_APP_DISCONNECTED   0xE0
#define BE_EVENT_LINK_DISCONNECTED  0xE1
#define BE_EVENT_APP_CONNECTED   0xE2
#define BE_EVENT_LINK_CONNECTED  0xE3
*/

#define BE_EVENT_ENTER_MENU		            0xF9

// VERIFY Success - Sub Event
#define BE_EVENT_VERIFY_FINGER              0x2b         
#define BE_EVENT_VERIFY_PIN                 0x2c         
#define BE_EVENT_VERIFY_CARD_FINGER         0x2d
#define BE_EVENT_VERIFY_CARD_PIN            0x2e
#define BE_EVENT_VERIFY_CARD                0x2f
#define BE_EVENT_VERIFY_CARD_FINGER_PIN     0x30
#define BE_EVENT_VERIFY_FINGER_PIN          0x31
#define BE_EVENT_VERIFY_FACE                0x32
#define BE_EVENT_VERIFY_CARD_FACE           0x33
#define BE_EVENT_VERIFY_CARD_FACE_PIN       0x34
#define BE_EVENT_VERIFY_FACE_PIN            0x35

typedef struct {
	unsigned char event;
	unsigned char subEvent;	// reserved1;
	unsigned short tnaEvent;
	time_t eventTime;
	unsigned userID;
	unsigned reserved2;
} BSLogRecord;

typedef	struct {
	enum {
		NO_IMAGE = -1,
		WRITE_ERROR = -2,
	};
	unsigned char event;
	unsigned char subEvent;
	unsigned short tnaKey; 
	time_t eventTime;
	unsigned userID;
	unsigned deviceID;
	short imageSlot; // NO_IMAGE for no image, WRITE_ERROR for error
	short reserved1;
	int reserved2;
} BSLogRecordEx;

typedef struct {
	unsigned char event;
	unsigned char subEvent;	// reserved1;
	unsigned short tnaEvent;
	time_t eventTime;
	unsigned userID;
	unsigned reserved2;
	unsigned source;
	unsigned terminalID;
} BSDBLogRecord;

typedef struct {
	unsigned char event;
	unsigned char subEvent;
	unsigned short reserved1; 
	time_t eventTime;
	unsigned userID;
	unsigned imageSize;
	unsigned deviceID;
	unsigned reserved2;
}  BSImageLogHdr ;

#endif