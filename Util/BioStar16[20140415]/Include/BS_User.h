/**
 *  User management
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

#ifndef __BS_USER_H__
#define __BS_USER_H__

#define BS_MAX_NAME_LEN 32
#define BS_MAX_PASSWORD_LEN 16
#define BS_TEMPLATE_SIZE 384
#define BS_FACE_TEMPLATE_SIZE 2284			// D-Station Only, F-Station(2000)
#define BS_FACE_RAW_TEMPLATE_SIZE 37500		// 250*150 = 37500 Byte F-Station
#define BS_MAX_TEMPLATE_PER_USER 10
#define BS_MAX_FACE_PER_USER 5				// D-Station Only
#define BS_MAX_PRIVATE_MSG_LEN 64
#define BS_MAX_IMAGE_SIZE (100 * 1024)
#define BS_MAX_IRIMAGE_SIZE (640 * 480)		// 640 * 480 = 307200	
#define BS_MAX_NUM_LOG	128
#define BS_MAX_LOGBULK_SIZE	1000 * 1024
#define BS_MAX_FACE_TEMPLATE 25				// F-Station 
#define BS_MAX_FACE_RAW_TEMPLATE 20			// 20 F-Station
#define BS_MAX_FACE_UPDATED 5			    // 5 F-Station

#define BS_USER_HEADER_ONLY	0x01
#define BS_USER_HEADER_TEMPLATE 0x02
#define BS_USER_HEADER_PICTURE 0x03
#define BS_USER_HEADER_TEMPLATE_PICTURE 0x04

#define BS_USER_SECURITY_DEFAULT 260
#define BS_USER_SECURITY_LOWER 261
#define BS_USER_SECURITY_LOW 262
#define BS_USER_SECURITY_NORMAL 263
#define BS_USER_SECURITY_HIGH 264
#define BS_USER_SECURITY_HIGHER 265

#define BS_USER_ADMIN 240
#define BS_USER_NORMAL 241

#define BS_BINARY_IMAGE	0
#define BS_GRAY_IMAGE	1

#define CARD_INFO_VERSION 0x13
#define DEFAULT_CUSTOMID 0x01

#define BS_AUTH_MODE_DISABLED	 0x00

typedef struct{
	unsigned ID;

	unsigned short reserved1;
	unsigned short adminLevel;
	unsigned short securityLevel;
	unsigned short statusMask; 
	unsigned accessGroupMask;

	char name[BS_MAX_NAME_LEN + 1];
	char department[BS_MAX_NAME_LEN + 1];
	char password[BS_MAX_PASSWORD_LEN + 1];

	unsigned short numOfFinger;
	unsigned short duressMask;
	unsigned short checksum[5]; // index 0, 1
} BSUserHdr;


typedef struct{
	unsigned ID;

	unsigned short headerVersion;
	unsigned short adminLevel;
	unsigned short securityLevel;
	unsigned short statusMask; 
	unsigned accessGroupMask;

	char name[BS_MAX_NAME_LEN + 1];
	char department[BS_MAX_NAME_LEN + 1];
	char password[BS_MAX_PASSWORD_LEN + 1];

	unsigned short numOfFinger;
	unsigned short duressMask;
	unsigned short checksum[5]; // index 0, 1

	unsigned short authMode; //2
	unsigned short authLimitCount; // 0 for no limit //2
	unsigned short reserved; //2
	unsigned short timedAntiPassback; // in minutes. 0 for no limit //2
	unsigned cardID; // 0 for not used
	bool	bypassCard;
	bool	disabled;
	unsigned expireDateTime;
	unsigned customID; //card Custom ID
	int version; // card Info Version
    unsigned startDateTime; //4 36
} BSUserHdrEx;

#define PRIVATE_TYPE_USER 0
#define PRIVATE_TYPE_GROUP 1
typedef struct{
	unsigned ID;
	char department[BS_MAX_NAME_LEN + 1];
	char greetingMsg[BS_MAX_PRIVATE_MSG_LEN + 1];
	int useImage;
	unsigned duration;
	unsigned countPerDay;
	unsigned imageChecksum;  
	int reserved[4];
} BSPrivateInfo;

typedef struct{
	enum 
	{
		DS_MAX_NAME_LEN = 48,
		DS_MAX_PASSWORD_LEN = 16,
		DS_MIN_PASSWORD_LEN = 4,
		
		DS_TEMPLATE_SIZE = 384,
		DS_FACE_TEMPLATE_SIZE = 2284,

		MAX_FINGER = 10,
		MAX_FINGER_TEMPLATE = 20,
		MAX_FACE = 5,
       	MAX_FACE_TEPLATE = 5,
	};

	unsigned ID;
	unsigned short headerVersion;
	unsigned short adminLevel;
	unsigned short securityLevel;
	unsigned short statusMask;
	unsigned accessGroupMask;	

	unsigned short name[DS_MAX_NAME_LEN];
	unsigned short department[DS_MAX_NAME_LEN];
	unsigned short password[DS_MAX_PASSWORD_LEN];

	unsigned short numOfFinger;
	unsigned short numOfFace;
	unsigned char duress[MAX_FINGER];
	unsigned char reserved[2];
	unsigned char fingerType[MAX_FINGER];
	unsigned char reserved1[2];
	unsigned fingerChecksum[MAX_FINGER];
	unsigned faceChecksum[MAX_FACE_TEPLATE];
	
	unsigned short authMode;
	unsigned char bypassCard;
    unsigned char disabled;

	unsigned cardID;
    unsigned customID;
	
	unsigned startDateTime;
    unsigned expireDateTime;

	unsigned reserved2[10];

} DSUserHdr, XSUserHdr, BS2UserHdr;

typedef struct{
	enum{		
	MAX_NAME_LEN	= 48,	
	MAX_PASSWORD_LEN	= 16,	
	MIN_PASSWORD_LEN	= 4,	
			
	MAX_FACE	= 25,	
	FACE_TEMPLATE_SIZE	= 2000,	
	MAX_FACE_RAW	= 20,	
	FACE_RAW_TEMPLATE_SIZE	= 37500,	
	MAX_IMAGE_SIZE	= 8*1024,	
        			
	USER_NORMAL	= 0,	
	USER_ADMIN	= 1,	
			
	USER_SECURITY_DEFAULT	= 0,	
	USER_SECURITY_LOWER	= 1,	
	USER_SECURITY_LOW	= 2,	
	USER_SECURITY_NORMAL	= 3,	
	USER_SECURITY_HIGH	= 4,	
	USER_SECURITY_HIGHER	= 5,	
	};		
			
	unsigned ID;		
	unsigned short headerVersion;		
	unsigned short adminLevel;		
	unsigned short securityLevel;		
	unsigned short statusMask;		
	unsigned accessGroupMask;		
			
	unsigned short name[MAX_NAME_LEN];		
	unsigned short department[MAX_NAME_LEN];		
	unsigned short password[MAX_PASSWORD_LEN];		
			
	// ¾ó±¼ÅÛÇÃ¸´Á¤º¸		
	unsigned short numOfFace;		
	unsigned short numOfUpdatedFace;		
	unsigned short faceLen[MAX_FACE];		
	unsigned char faceTemp[256];		
	unsigned faceChecksum[MAX_FACE];		
			
	//		
	short authMode;		
	unsigned char bypassCard;		
	unsigned char disabled;		
			
	unsigned cardID;		
	unsigned customID;		
			
	unsigned startDateTime;		
	unsigned expireDateTime;		
			
	unsigned short faceUpdatedIndex;		
	unsigned short reserved[40];		
	
} FSUserHdr;

typedef struct{			
	enum{		
	MAX_FACE	= 25,	
	MAX_FACE_RAW	= 20,	
	};		
			
	unsigned short imageSize;		
			
	// ¾ó±¼ÅÛÇÃ¸´Á¤º¸		
	unsigned short numOfFace;		
	unsigned short numOfUpdatedFace;		
	unsigned short faceLen[MAX_FACE];		
	unsigned char faceTemp[256];	
	unsigned short numOfRawFace;		
	unsigned short rawfaceLen[MAX_FACE_RAW];		
} FSUserTemplateHdr;

typedef struct{
	unsigned userID;
	unsigned short numOfRawFace;
	unsigned short rawfaceLen[20];
} FSRawTemplateHdr;

#endif