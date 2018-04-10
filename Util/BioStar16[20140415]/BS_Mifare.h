/**
 *  API for Mifare Card
 *
 *  @author sjlee@suprema.co.kr
 *  @see    
 */

/*  
 *  Copyright (c) 2008 Suprema Co., Ltd. All Rights Reserved.
 * 
 *  This software is the confidential and proprietary information of 
 *  Suprema Co., Ltd. ("Confidential Information").  You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into
 *  with Suprema.
 */

#ifndef __BS_MIFARE_H__
#define __BS_MIFARE_H__

#include <time.h>

struct BSMifareConfig {
	enum {
		MIFARE_KEY_SIZE = 6,
		MIFARE_MAX_TEMPLATE = 4,
	};

	// Options
	int magicNo;
	int disabled;
	int	useCSNOnly; 		// default 0
	int bioentryCompatible; // default 0

	// Keys
	int	useSecondaryKey;
	int reserved1;
	unsigned char	reserved2[8];
	unsigned char	reserved3[8];
	
	// Layout
	int cisIndex;
	int numOfTemplate;
	int templateSize;
	int templateStartBlock[MIFARE_MAX_TEMPLATE];

	int reserve4[15];
};


struct BSMifareCardHeader {
	enum {
		MAX_TEMPLATE		= 4,
		MAX_ACCESS_GROUP	= 4,
		MAX_NAME_LEN		= 16,
		PASSWORD_LEN		= 8,

		MIFARE_VER_1_0		= 0x10,

		// security level
		USER_SECURITY_DEFAULT	= 0,
		USER_SECURITY_LOWER		= 1,
		USER_SECURITY_LOW		= 2, 
		USER_SECURITY_NORMAL	= 3,
		USER_SECURITY_HIGH		= 4,
		USER_SECURITY_HIGHER	= 5,

		// admin level
		USER_LEVEL_NORMAL	= 0,
		USER_LEVEL_ADMIN	= 1,
	};

	unsigned int	CSN;
	unsigned int	userID;
	unsigned int	customID;
	unsigned char	version;
	unsigned char	numOfTemplate;
	unsigned char	adminLevel;
	unsigned char	securityLevel;
	unsigned char	duress[MAX_TEMPLATE];
	unsigned char	isBypassCard;
	unsigned char	reserved2[3];
	unsigned char	accessGroup[MAX_ACCESS_GROUP];
	unsigned char	userName[MAX_NAME_LEN];
	unsigned char	password[PASSWORD_LEN];
	time_t			startTime;
	time_t			expiryTime;
	unsigned int	reserved3[8];
};


struct BSiClassConfig {
	enum {
		ICLASS_KEY_SIZE = 6,
		ICLASS_MAX_TEMPLATE = 4,
	};

	// Options
	int magicNo;
	int disabled;
	int	useCSNOnly; 		// default 0
	int bioentryCompatible; // default 0

	// Keys
	int	useSecondaryKey;
	int reserved1;
	unsigned char	reserved2[8];
	unsigned char	reserved3[8];
	
	// Layout
	int cisIndex;
	int numOfTemplate;
	int templateSize;
	int templateStartBlock[ICLASS_MAX_TEMPLATE];

	int reserve4[15];
};


struct BSiClassCardHeader {
	enum {
		MAX_TEMPLATE		= 4,
		MAX_ACCESS_GROUP	= 4,
		MAX_NAME_LEN		= 16,
		PASSWORD_LEN		= 8,

		ICLASS_VER_1_0		= 0x10,

		// security level
		USER_SECURITY_DEFAULT	= 0,
		USER_SECURITY_LOWER		= 1,
		USER_SECURITY_LOW		= 2, 
		USER_SECURITY_NORMAL	= 3,
		USER_SECURITY_HIGH		= 4,
		USER_SECURITY_HIGHER	= 5,

		// admin level
		USER_LEVEL_NORMAL	= 0,
		USER_LEVEL_ADMIN	= 1,
	};

	unsigned int	CSN;
	unsigned int	userID;
	unsigned int	reserved1;
	unsigned char	version;
	unsigned char	numOfTemplate;
	unsigned char	adminLevel;
	unsigned char	securityLevel;
	unsigned char	duress[MAX_TEMPLATE];
	unsigned char	isBypassCard;
	unsigned char	reserved2[3];
	unsigned char	accessGroup[MAX_ACCESS_GROUP];
	unsigned char	userName[MAX_NAME_LEN];
	unsigned char	password[PASSWORD_LEN];
	time_t			startTime;
	time_t			expiryTime;
	unsigned int	reserved3[8];
};


struct BSBlacklistItem {
	enum {
		// blacklist type
		BLACKLIST_USER_ID	= 0x01,
		BLACKLIST_CSN		= 0x02,

        MAX_BLACKLIST       = 1000,
	};

	unsigned char itemType;
	unsigned char reserved[3];
	unsigned itemData;
};

struct BSBlacklistItemEx {
	enum {
		// blacklist type
		BLACKLIST_USER_ID	= 0x01,
		BLACKLIST_CSN		= 0x02,

        MAX_BLACKLIST       = 1000,
	};

	unsigned char itemType;
	unsigned char reserved[3];
	unsigned itemData;
	unsigned customID;
};

#endif