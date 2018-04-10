/**
 *  	Access Control
 *
 *  	@author sjlee@suprema.co.kr
 *  	@see    
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


#ifndef __BS_ACCESSCONTROL_H__
#define __BS_ACCESSCONTROL_H__



#define BS_TIMECODE_PER_DAY 	5
#define BS_SCHEDULE_PER_GROUP	16
#define BS_GROUP_PER_USER		4
#define BS_MAX_HOLIDAY			16
#define BS_MAX_SCHEDULE			64
#define BS_MAX_ACCESS_GROUP		64
#define BS_AC_NOT_USED			-1

#define BS_MAX_ACCESS_NAME_LEN	32

#define BS_ALL_TABLE	0xffff

typedef struct {
	unsigned short startTime;
	unsigned short endTime;
} BSTimeCodeElem;

typedef struct {
	BSTimeCodeElem codeElement[BS_TIMECODE_PER_DAY];
} BSTimeCode;

typedef struct {
	int scheduleID; // -1 if not used
	BSTimeCode timeCode[7]; // 0 - Sunday, 1 - Monday, ...
	int holidayID;
	char name[BS_MAX_ACCESS_NAME_LEN];
} BSTimeSchedule;

typedef struct {
	int holidayID; // -1 if not used
	int numOfHoliday;
	unsigned short holiday[32]; // (month << 8) | day
	BSTimeCode timeCode;
	char name[BS_MAX_ACCESS_NAME_LEN];	
} BSHoliday;

typedef struct {
	int groupID; // -1 if not used
	int numOfSchedule;
	int scheduleID[BS_SCHEDULE_PER_GROUP];
	char name[BS_MAX_ACCESS_NAME_LEN];
} BSAccessGroup;


#endif