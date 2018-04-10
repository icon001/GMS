/**
 *  	New Access Control Tables
 *
 *  	@author sjlee@suprema.co.kr
 *  	@see    
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

#ifndef __BS_ACCESS_CONTROL_H__
#define __BS_ACCESS_CONTROL_H__

#define BS_TIMECODE_PER_DAY_EX	5
#define BS_MAX_HOLIDAY_EX		32
#define BS_MAX_SCHEDULE_EX		128 // 64
#define BS_MAX_ACCESS_GROUP_EX	128 // 64

#define BS_AC_SCHEDULE		0x01
#define BS_AC_HOLIDAY		0x02
#define BS_AC_ACCESS_GROUP	0x03

#define BS_MAX_ACCESS_NAME_LEN	32

struct BSTimeCodeElemEx {
	unsigned short startTime;
	unsigned short endTime;
};


struct BSTimeCodeEx {
	BSTimeCodeElemEx codeElement[BS_TIMECODE_PER_DAY_EX];
};


struct BSTimeScheduleEx {
	enum {
		// pre-defined schedule
		NO_TIME_SCHEDULE	= 0xFD,
		ALL_TIME_SCHEDULE 	= 0xFE,

		NUM_OF_DAY		= 9,
		NUM_OF_HOLIDAY	= 2,

		SUNDAY 		= 0,
		MONDAY		= 1,
		TUESDAY		= 2,
		WEDNESDAY	= 3,
		THURSDAY	= 4,
		FRIDAY		= 5,
		SATURDAY	= 6,
		HOLIDAY1	= 7,
		HOLIDAY2	= 8,
	};

	int scheduleID; // 1 ~ 128
	char name[BS_MAX_ACCESS_NAME_LEN];
	int holiday[2]; // 0 for unused
	BSTimeCodeEx timeCode[NUM_OF_DAY]; // 0 - Sunday, 1 - Monday, ...
	int reserved[2];
};


struct BSHolidayElemEx {
	enum {
		// flag
		ONCE = 0x01,
	};

	unsigned char flag;	
	unsigned char year; // since 2000
	unsigned char month; // 1 ~ 12
	unsigned char startDay; // 1 ~ 31
	unsigned char duration; // 1 ~ 100
	unsigned char reserved[3];
};


struct BSHolidayEx {
	enum {
		MAX_HOLIDAY = 32,
	};

	int holidayID; // 1 ~ 32
	char name[BS_MAX_ACCESS_NAME_LEN];
	int numOfHoliday;
	BSHolidayElemEx holiday[MAX_HOLIDAY];
	int reserved[2];
};


struct BSAccessGroupEx {
	enum {
        // AC group type
        NORMAL = 0x00,
        CUSTOM = 0x01,

        // pre-defined group
		NO_ACCESS_GROUP		= 0xFD,
		FULL_ACCESS_GROUP	= 0xFE,

		// pre-defined door
		ALL_DOOR		= 0x00,

		MAX_READER = 32,
	};

	int groupID; // 1 ~ 128
	char name[BS_MAX_ACCESS_NAME_LEN];
	int numOfReader;
	unsigned readerID[MAX_READER];
	int scheduleID[MAX_READER];
    int type;
    unsigned userID;
	int reserved[2];
};


struct BSAccessControlConfigEx {
	int numOfTimeSchedule;
	BSTimeScheduleEx schedule[BS_MAX_SCHEDULE_EX];
	int numOfHoliday;
	BSHolidayEx holiday[BS_MAX_HOLIDAY_EX];
	int numOfAccessGroup;
	BSAccessGroupEx accessGroup[BS_MAX_ACCESS_GROUP_EX];
	int reserved[256]; 
};


#endif

