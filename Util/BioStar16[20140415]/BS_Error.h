/**
 *  Error/flag code 
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
 
#ifndef __BS_ERROR_H__
#define __BS_ERROR_H__


typedef enum {
	BS_SUCCESS			= 0,

	// communication channel error
	BS_ERR_NO_AVAILABLE_CHANNEL		= -100,
	BS_ERR_INVALID_COMM_HANDLE		= -101,
	BS_ERR_CANNOT_WRITE_CHANNEL		= -102,
	BS_ERR_WRITE_CHANNEL_TIMEOUT	= -103,
	BS_ERR_CANNOT_READ_CHANNEL		= -104,
	BS_ERR_READ_CHANNEL_TIMEOUT		= -105,
	BS_ERR_CHANNEL_OVERFLOW			= -106,
	BS_ERR_CHANNEL_CLOSED			= -107,

	// socket error
	BS_ERR_CANNOT_INIT_SOCKET		= -200,
	BS_ERR_CANNOT_OPEN_SOCKET		= -201,
	BS_ERR_CANNOT_CONNECT_SOCKET	= -202,
	BS_ERR_SOCKET_CLOSED			= -203,

	// serial error
	BS_ERR_CANNOT_OPEN_SERIAL		= -220,

	// USB error
	BS_ERR_CANNOT_OPEN_USB			= -240,

	// USB memory error
	BS_ERR_INVALID_USB_MEMORY		= -260,
	BS_ERR_NO_MORE_USB_MEMORY		= -261,
	BS_ERR_CANNOT_FIND_USB_MEMORY	= -262,
	BS_ERR_VT_EXIST_IN_MEMORY		= -263,
	BS_ERR_USB_MEMORY_FULL			= -264,
	BS_ERR_NO_MORE_VT				= -265,

	// generic command error code
	BS_ERR_BUSY						= -300,
	BS_ERR_INVALID_PACKET			= -301,
	BS_ERR_CHECKSUM					= -302,
	BS_ERR_UNSUPPORTED				= -303,
	BS_ERR_FILE_IO					= -304,
	BS_ERR_DISK_FULL				= -305,
	BS_ERR_NOT_FOUND				= -306,
	BS_ERR_INVALID_PARAM			= -307,
	BS_ERR_RTC						= -308,
	BS_ERR_MEM_FULL					= -309,
	BS_ERR_DB_FULL					= -310,
	BS_ERR_INVALID_ID				= -311,
	BS_ERR_USB_DISABLED				= -312,
	BS_ERR_COM_DISABLED				= -313,
	BS_ERR_WRONG_PASSWORD			= -314,
	BS_ERR_TRY_AGAIN				= -315,
	BS_ERR_EXIST_FINGER				= -316,
	// user related error
	BS_ERR_NO_USER					= -320,
	BS_ERR_CANNOT_CHANGE_IMG_VIEW = -321,

	// server error
	BS_ERR_NO_MORE_TERMINAL			= -400,
	BS_ERR_TERMINAL_NOT_FOUND		= -401,
	BS_ERR_TERMINAL_COMM_ERROR		= -402,
	BS_ERR_TERMINAL_NOT_AUTHORIZED	= -403,
	BS_ERR_TERMINAL_BUSY			= -404,

	// server db error
	BS_ERR_DB_NOT_EXIST				= -500,
	BS_ERR_CANNOT_CONNECT_TO_DB		= -501,
	BS_ERR_DB_INTERNAL_ERROR		= -502,

	// SSL error
	BS_ERR_CANNOT_INIT_SSL			= -601,
	BS_ERR_SSL_INVALID_CTX			= -602,
	BS_ERR_SSL_INVALID_CERTFILE		= -603,
	BS_ERR_SSL_INVALID_KEYFILE		= -604,
	BS_ERR_SSL_INVALID_CAFILE		= -605,
	BS_ERR_SSL_INVALID_PATH			= -606,
	BS_ERR_SSL_CANNOT_CONNECT		= -607,

	BS_ERR_INVALID_DATA				= -608,

	BS_ERR_UNKNOWN		= -9999,
 } BS_RET_CODE;




#endif

