/**
 *  BioStation information
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

#ifndef __BS_TERMINAL_H__
#define __BS_TERMINAL_H__

// device type
#define BS_DEVICE_BIOSTATION		0x00
#define BS_DEVICE_BIOSTATION_ENC	0x01
#define BS_DEVICE_BIOENTRY_PLUS		0x01
#define BS_DEVICE_BIOLITE			0x02
#define BS_DEVICE_XPASS             0x03
#define BS_DEVICE_DSTATION			0x04
#define BS_DEVICE_XSTATION			0x05
#define BS_DEVICE_BIOSTATION2		0x06
#define BS_DEVICE_XPASS_SLIM		0x07
#define BS_DEVICE_SECUREIO		    0x08
#define BS_DEVICE_LIFTIO    		0x09
#define BS_DEVICE_FSTATION  		0x0A

// factory default mask
#define BS_FACTORY_DEFAULT_CONFIG	0x01
#define BS_FACTORY_DEFAULT_USER		0x02
#define BS_FACTORY_DEFAULT_LOG		0x04
#define BS_FACTORY_DEFAULT_LED		0x08 // BEPlus only

#define BS_MAX_485_DEVICE           8
#endif