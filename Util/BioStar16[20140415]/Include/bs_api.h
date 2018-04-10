/**
 *  BioStation SDK Main API
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

#ifndef __BS_API_H__
#define __BS_API_H__

#include <time.h>
#include <tchar.h>

#include "BS_Error.h"
#include "BS_Log.h"
#include "BS_Display.h"
#include "BS_User.h"
#include "BS_Config.h"
#include "BS_AccessControl.h"
#include "BS_AccessControlEx.h"
#include "BS_Wiegand.h"
#include "BS_Terminal.h"
#include "BS_Mifare.h"
#include "BS_BEPlus.h"
#include "BS_Zone.h"
#include "BS_SecureIO.h"
#include "BS_ServerApp.h"

#ifdef __cplusplus
extern "C" 
{
#endif

//
// Initialize SDK
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_InitSDK();

//
// Initialize socket
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_OpenSocket( const char* biostationAddr, int port, int* handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_OpenSocketEx( const char* deviceipAddr, int port, const char* hostipAddr, int* handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_CloseSocket( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_OpenSocketUDP( const char* biostationAddr, int port, int* handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_CloseSocketUDP( int handle );

//
// Initialize Serial
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_OpenSerial( const char* port, int baudrate, int* handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_CloseSerial( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_OpenSerial485( const char* port, int baudrate, int* handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_CloseSerial485( int handle );

//
// Initialize USB
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_OpenUSB( int* handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_OpenUSBEx( int* handle, int type );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_CloseUSB( int handle );

//
// USB Memory stick
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_OpenUSBMemory( const char* driveLetter, int* handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_CloseUSBMemory( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteVirtualTerminal( int handle, unsigned terminalID );

//
// Basic packet interface
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SendSinglePacket( int handle, unsigned short command, unsigned short flag, unsigned param1, unsigned param2, int timeout );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SendBroadcastSinglePacket( int handle, unsigned short command, unsigned short flag, unsigned param1, unsigned param2, int timeout );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReceiveSinglePacket( int handle, int timeout, unsigned short command, unsigned short* returnCode, unsigned* param1, unsigned* param2 );

// maximum payload size is 512KB
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SendPacket( int handle, unsigned short command, unsigned short flag, unsigned param1, unsigned param2, unsigned char* payload, int payloadSize );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReceivePacket( int handle, int timeout, unsigned char* payload, unsigned* payloadSize, unsigned short* returnCode, unsigned* param1, unsigned* param2 );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReceivePacketEx( int handle, int timeout, unsigned short command, unsigned char* payload, unsigned* payloadSize, unsigned short* returnCode, unsigned* param1, unsigned* param2 );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_FlushRecvPackets( int handle );
//
// Terminal information
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetBiostationID( int handle, unsigned* biostationID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SearchBiostation( int handle, unsigned* IDs, int* numOfBiostation );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetClientIPAddress( int handle, char* ipAddr, unsigned* id, int* port, int timeout );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetBiostationID( int handle, unsigned id );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetTime( int handle, time_t* timeVal );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetTime( int handle, time_t timeVal );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_CheckSystemStatus( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_Reset( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_UpgradeEx( int handle, const char* upgradeFile );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_Disable( int handle, int timeout ); // max timeout = 60 sec
__declspec( dllexport ) BS_RET_CODE __stdcall BS_Enable( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DisableCommunication( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnableCommunication( int handle, const char* masterPassword );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_ChangePasswordBEPlus( int handle, const char* oldPassword, const char* newPassword );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetDeviceID( int handle, unsigned* deviceID, int* deviceType );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SearchDevice( int handle, unsigned* deviceIDs, int* deviceTypes, int* numOfReader );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_Search485Slaves( int handle, BS485SlaveInfo* slaveList, int* numOfSlaves );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetDeviceID( int handle, unsigned deviceID, int deviceType );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_FactoryDefault( int handle, unsigned mask );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetChallengeCode( int handle, char* filePath );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetChallengeCode( int handle, char* filePath );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_ResetLAN( int handle );


//
// Log management
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ClearLogCache( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ClearLogCacheEx( int handle);
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadLogCache( int handle, int* numOfLog, BSLogRecord* logRecord );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadLogCacheEx( int handle, int* numOfLog, BSLogRecordEx * logRecord );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadLog( int handle, time_t startTime, time_t endTime, int* numOfLog, BSLogRecord* logRecord ); // maximum numOfLog = 32768(BST), 8192(BE+) 
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadLogEx( int handle, time_t startTime, time_t endTime, int* numOfLog, BSLogRecordEx * logRecord );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadNextLog( int handle, time_t startTime, time_t endTime, int* numOfLog, BSLogRecord* logRecord ); // maximum numOfLog = 32768(BST), 8192(BE+) 
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadNextLogEx( int handle, time_t startTime, time_t endTime, int* numOfLog, BSLogRecordEx * logRecord );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteLog( int handle, int numOfLog, int* numOfDeletedLog );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteAllLog( int handle, int numOfLog, int* numOfDeletedLog );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetLogCount( int handle, int* numOfLog );


//
// Image Log management
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadImageLog( int handle, time_t startTime, time_t endTime, int* numOfLog, UCHAR* imageLogData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetImageLogCount( int handle, int* numOfLog );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteImageLog( int handle, int numOfLog, int* numOfDeletedLog  );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteAllImageLog( int handle, int numOfLog, int* numOfDeletedLog );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadSpecificImageLog( int handle, time_t logtime, int event, int* size, UCHAR* imageLogData );


//
// Display Setup
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SendNotice( int handle, const char* msg ); // max message len is 1024 bytes
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SendNoticeEx( int handle, const char* msg , bool bUTF16);
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetBackground( int handle, int bgIndex, const char* fileName );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetSlideShow( int handle, int numOfPicture, int imageIndex, const char* pngFile ); // Maximum Slide Show = 32
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteSlideShow( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetSound( int handle, int soundIndex, const char* wavFile );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteSound( int handle, int soundIndex );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetLanguageFile( int handle, int languageIndex, const char* languageFile );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SendNoticeUTF8( int handle, const char* msg ); // max message len is 1024 bytes
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SendNoticeUTF16( int handle, const char* msg, int dataLen ); // max message len is 1024 bytes
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SendAgreementArticle( int handle, const char* filePath );

//Interactive
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DisplayCustomInfo( int handle, int displayTime, const char* text, const char* imageFile );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_CancelDisplayCustomInfo( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_PlayCustomSound( int handle, const char* waveFile );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_PlaySound( int handle, int soundID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WaitCustomKeyInput( int handle, int waitTime, const char* title, 
                                                                     const char* imageFile, char* keyOutput, int* numOfKey );


//
// User management
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserDBInfo( int handle, int* numOfUser, int* numOfTemplate );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollUser( int handle, BSUserHdr* hdr, unsigned char* templateData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteUser( int handle, unsigned userID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteAllUser( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteMultipleUsers( int handle, int number, unsigned* user );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUser( int handle, unsigned userID, BSUserHdr* hdr, unsigned char* templateData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserInfo( int handle, unsigned userID, BSUserHdr* hdr );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllUserInfo( int handle, BSUserHdr* hdr, int *numOfUser );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ScanTemplate( int handle, unsigned char* templateData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ScanTemplateEx( int handle, int sensorID, unsigned char* templateData );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadImage( int handle, int imageType, unsigned char* bitmapImage, int* imageLen );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadImageEx( int handle, int imageType, int index, unsigned char* bitmapData, int* imageLen );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollUserEx( int handle, BSUserHdrEx* hdr, unsigned char* templateData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollMultipleUserEx( int handle, int numOfUser, BSUserHdrEx* hdr, unsigned char* templateData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserEx( int handle, unsigned userID, BSUserHdrEx* hdr, unsigned char* templateData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserInfoEx( int handle, unsigned userID, BSUserHdrEx* hdr );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllUserInfoEx( int handle, BSUserHdrEx* hdr, int *numOfUser );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadCardID( int handle, unsigned int* cardID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadCardIDEx( int handle, unsigned int* cardID, int* customID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadRFCardIDEx( int handle, unsigned readerID, unsigned int* cardID, int* customID );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollUserBEPlus( int handle, BEUserHdr* hdr, unsigned char* templateData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollMultipleUserBEPlus( int handle, int numOfUser, BEUserHdr* hdr, unsigned char* templateData ); // max 64 user
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserBEPlus( int handle, unsigned userID, BEUserHdr* hdr, unsigned char* templateData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserInfoBEPlus( int handle, unsigned userID, BEUserHdr* hdr );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllUserInfoBEPlus( int handle, BEUserHdr* hdr, int *numOfUser );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetPrivateInfo(int handle, int type, const BSPrivateInfo* privateInfo, const char* imagePath );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetPrivateInfo( int handle, unsigned userID, BSPrivateInfo* privateinfo );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllPrivateInfo( int handle, BSPrivateInfo* privateinfo, int *numOfUser );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserImage( int handle, int nUserID, int* imageLen, unsigned char* imageData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetUserImage( int handle, int nUserID, int imageLen, unsigned char* imageData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserFaceInfo( int handle, int* numOfUser, int* numOfFaceTemplate );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollFace( int handle, unsigned userID, int numOfTemplate, unsigned char* faceTemplate );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollUserDStation( int handle, DSUserHdr* userHdr, unsigned char* fingerTemplate,  unsigned char* faceTemplate );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollMultipleUserDStation( int handle, int numOfUser, DSUserHdr* hdr, unsigned char* fingerTemplate,  unsigned char* faceTemplate );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllUserInfoDStation( int handle, DSUserHdr* userHdr, int* numOfUser );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserInfoDStation( int handle, unsigned userID, DSUserHdr* userHdr );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserDStation( int handle, unsigned userID, DSUserHdr* userHdr, unsigned char* fingerTemplate, unsigned char* faceTemplate );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFaceData( int handle, int *imageLen, unsigned char* imageData, unsigned char* faceTemplate );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollUserXStation( int handle, XSUserHdr* userHdr );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollMultipleUserXStation( int handle, int numOfUser, XSUserHdr* hdr );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllUserInfoXStation( int handle, XSUserHdr* userHdr, int* numOfUser );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserInfoXStation( int handle, unsigned userID, XSUserHdr* userHdr );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserXStation( int handle, unsigned userID, XSUserHdr* userHdr );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollUserBioStation2( int handle, BS2UserHdr* userHdr, unsigned char* fingerTemplate);
__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollMultipleUserBioStation2( int handle, int numOfUser, BS2UserHdr* userHdr, unsigned char* fingerTemplate);
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllUserInfoBioStation2( int handle, BS2UserHdr* userHdr, int* numOfUser );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserInfoBioStation2( int handle, unsigned userID, BS2UserHdr* userHdr );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserBioStation2( int handle, unsigned userID, BS2UserHdr* userHdr, unsigned char* fingerTemplate);

__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollUserFStation( int handle, FSUserHdr* userHdr, unsigned char* faceTemplate);
__declspec( dllexport ) BS_RET_CODE __stdcall BS_EnrollMultipleUserFStation( int handle, int numOfUser, FSUserHdr* userHdr, unsigned char* faceTemplate);
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllUserInfoFStation( int handle, FSUserHdr* userHdr, int* numOfUser );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserInfoFStation( int handle, unsigned userID, FSUserHdr* userHdr );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetUserFStation( int handle, unsigned userID, FSUserHdr* userHdr, unsigned char* faceTemplate);
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ScanFaceTemplate( int handle, FSUserTemplateHdr* userTemplateHdr, unsigned char* imageData, unsigned char* faceTemplate );

//
// Configuration
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDisplayConfig( int handle, BSDisplayConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDisplayConfig( int handle, BSDisplayConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteOPModeConfig( int handle, BSOPModeConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadOPModeConfig( int handle, BSOPModeConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteTnaEventConfig( int handle, BSTnaEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadTnaEventConfig( int handle, BSTnaEventConfig* config );


__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteIPConfig( int handle, BSIPConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadIPConfig( int handle, BSIPConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteWLANConfig( int handle, BSWLANConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadWLANConfig( int handle, BSWLANConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFingerprintConfig( int handle, BSFingerprintConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFingerprintConfig( int handle, BSFingerprintConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteIOConfig( int handle, BSIOConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadIOConfig( int handle, BSIOConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteRelayConfig( int handle, BSRelayConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadRelayConfig( int handle, BSRelayConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteSerialConfig( int handle, BSSerialConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadSerialConfig( int handle, BSSerialConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteUSBConfig( int handle, BSUSBConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadUSBConfig( int handle, BSUSBConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteEncryptionConfig( int handle, BSEncryptionConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadEncryptionConfig( int handle, BSEncryptionConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteWiegandConfig( int handle, BSWiegandConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadWiegandConfig( int handle, BSWiegandConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAvailableSpace( int handle, int* availableSpace, int* totalSpace );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadSysInfoConfig( int handle, BSSysInfoConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteTnaEventExConfig( int handle, BSTnaEventExConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadTnaEventExConfig( int handle, BSTnaEventExConfig* config );


__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteEntranceLimitConfig( int handle, BSEntranceLimit* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadEntranceLimitConfig( int handle, BSEntranceLimit* config );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteConfig( int handle, int configType, int size, void* data );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadConfig( int handle, int configType, int* size, void* data );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetProtection( int handle, bool use, char* encKey );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetProtectionInfo( int handle, bool* use );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetDSProtection( int handle, bool use, char* encKey );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteZoneConfig( int handle, BSZoneConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadZoneConfig( int handle, BSZoneConfig* config );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteZoneConfigEx( int handle, BSZoneConfigEx* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadZoneConfigEx( int handle, BSZoneConfigEx* config );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDoorConfig( int handle, BSDoorConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDoorConfig( int handle, BSDoorConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteInputConfig( int handle, BSInputConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadInputConfig( int handle, BSInputConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteOutputConfig( int handle, BSOutputConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadOutputConfig( int handle, BSOutputConfig* config );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_Write485NetworkConfig( int handle, BS485NetworkConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_Read485NetworkConfig( int handle, BS485NetworkConfig* config );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteSSLConfig( int handle, BSSSLConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadSSLConfig( int handle, BSSSLConfig* config );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteCardReaderConfig( int handle, BSCardReaderConfigData* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadCardReaderConfig( int handle, BSCardReaderConfigData* config );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteCardReaderZoneConfig( int handle, BSCardReaderZoneConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadCardReaderZoneConfig( int handle, BSCardReaderZoneConfig* config );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDSTnaEventConfig( int handle, DSTnaEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDSTnaEventConfig( int handle, DSTnaEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDSTnaEventExConfig( int handle, DSTnaEventExConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDSTnaEventExConfig( int handle, DSTnaEventExConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDSSaveImageEventConfig( int handle, DSSaveImageEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDSSaveImageEventConfig( int handle, DSSaveImageEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFaceConfig( int handle, DSFaceConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFaceConfig( int handle, DSFaceConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDSInputConfig( int handle, DSInputConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDSInputConfig( int handle, DSInputConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDSWiegandConfig( int handle, DSWiegandConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDSWiegandConfig( int handle, DSWiegandConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDS485NetworkConfig( int handle, DS485NetworkConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDS485NetworkConfig( int handle, DS485NetworkConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDSSerialConfig( int handle, DSSerialConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDSSerialConfig( int handle, DSSerialConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDSOPModeConfig( int handle, DSOPModeConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDSOPModeConfig( int handle, DSOPModeConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDSDisplayConfig( int handle, DSDisplayConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDSDisplayConfig( int handle, DSDisplayConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDSFingerprintConfig( int handle, DSFingerprintConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDSFingerprintConfig( int handle, DSFingerprintConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteDSWLANConfig( int handle, DSWLANConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadDSWLANConfig( int handle, DSWLANConfig* config );


__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteXSTnaEventConfig( int handle, XSTnaEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadXSTnaEventConfig( int handle, XSTnaEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteXSTnaEventExConfig( int handle, XSTnaEventExConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadXSTnaEventExConfig( int handle, XSTnaEventExConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteXSSaveImageEventConfig( int handle, XSSaveImageEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadXSSaveImageEventConfig( int handle, XSSaveImageEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteXSInputConfig( int handle, XSInputConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadXSInputConfig( int handle, XSInputConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteXSWiegandConfig( int handle, XSWiegandConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadXSWiegandConfig( int handle, XSWiegandConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteXS485NetworkConfig( int handle, XS485NetworkConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadXS485NetworkConfig( int handle, XS485NetworkConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteXSSerialConfig( int handle, XSSerialConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadXSSerialConfig( int handle, XSSerialConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteXSOPModeConfig( int handle, XSOPModeConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadXSOPModeConfig( int handle, XSOPModeConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteXSDisplayConfig( int handle, XSDisplayConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadXSDisplayConfig( int handle, XSDisplayConfig* config );


__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2TnaEventConfig( int handle, BS2TnaEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2TnaEventConfig( int handle, BS2TnaEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2TnaEventExConfig( int handle, BS2TnaEventExConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2TnaEventExConfig( int handle, BS2TnaEventExConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2SaveImageEventConfig( int handle, BS2SaveImageEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2SaveImageEventConfig( int handle, BS2SaveImageEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2InputConfig( int handle, BS2InputConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2InputConfig( int handle, BS2InputConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2WiegandConfig( int handle, BS2WiegandConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2WiegandConfig( int handle, BS2WiegandConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2485NetworkConfig( int handle, BS2485NetworkConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2485NetworkConfig( int handle, BS2485NetworkConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2SerialConfig( int handle, BS2SerialConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2SerialConfig( int handle, BS2SerialConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2OPModeConfig( int handle, BS2OPModeConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2OPModeConfig( int handle, BS2OPModeConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2DisplayConfig( int handle, BS2DisplayConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2DisplayConfig( int handle, BS2DisplayConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2FingerprintConfig( int handle, BS2FingerprintConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2FingerprintConfig( int handle, BS2FingerprintConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2WLANConfig( int handle, BS2WLANConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2WLANConfig( int handle, BS2WLANConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2InterphoneConfig( int handle, BS2InterphoneConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2InterphoneConfig( int handle, BS2InterphoneConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBS2USBConfig( int handle, BS2USBConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBS2USBConfig( int handle, BS2USBConfig* config );


__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFSTnaEventConfig( int handle, FSTnaEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFSTnaEventConfig( int handle, FSTnaEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFSTnaEventExConfig( int handle, FSTnaEventExConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFSTnaEventExConfig( int handle, FSTnaEventExConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFSSaveImageEventConfig( int handle, FSSaveImageEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFSSaveImageEventConfig( int handle, FSSaveImageEventConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFSInputConfig( int handle, FSInputConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFSInputConfig( int handle, FSInputConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFSWiegandConfig( int handle, FSWiegandConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFSWiegandConfig( int handle, FSWiegandConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFS485NetworkConfig( int handle, FS485NetworkConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFS485NetworkConfig( int handle, FS485NetworkConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFSSerialConfig( int handle, FSSerialConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFSSerialConfig( int handle, FSSerialConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFSOPModeConfig( int handle, FSOPModeConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFSOPModeConfig( int handle, FSOPModeConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFSDisplayConfig( int handle, FSDisplayConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFSDisplayConfig( int handle, FSDisplayConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFSFaceConfig( int handle, FSFaceConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFSFaceConfig( int handle, FSFaceConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFSWLANConfig( int handle, FSWLANConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFSWLANConfig( int handle, FSWLANConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFSInterphoneConfig( int handle, FSInterphoneConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFSInterphoneConfig( int handle, FSInterphoneConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteFSUSBConfig( int handle, FSUSBConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadFSUSBConfig( int handle, FSUSBConfig* config );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteBSVideophoneConfig( int handle, BSVideophoneConfig* config );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBSVideophoneConfig( int handle, BSVideophoneConfig* config );


//
// Access Control
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_AddTimeSchedule( int handle, BSTimeSchedule* schedule );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteTimeSchedule( int handle, int scheduleID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteAllTimeSchedule( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllTimeSchedule( int handle, int* numOfSchedule, BSTimeSchedule* schedule );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_AddHoliday( int handle, BSHoliday* holiday );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteHoliday( int handle, int holidayID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteAllHoliday( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllHoliday( int handle, int* numOfHoliday, BSHoliday* holiday );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_AddAccessGroup( int handle, BSAccessGroup* group );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteAccessGroup( int handle, int groupID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteAllAccessGroup( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllAccessGroup( int handle, int* numOfGroup, BSAccessGroup* group );

//
// Access Control Ex
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_AddTimeScheduleEx( int handle, BSTimeScheduleEx* schedule );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteTimeScheduleEx( int handle, int scheduleID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteAllTimeScheduleEx( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllTimeScheduleEx( int handle, int* numOfSchedule, BSTimeScheduleEx* schedule );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetAllTimeScheduleEx( int handle, int numOfSchedule, BSTimeScheduleEx* schedule );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_AddHolidayEx( int handle, BSHolidayEx* holiday );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteHolidayEx( int handle, int holidayID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteAllHolidayEx( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllHolidayEx( int handle, int* numOfHoliday, BSHolidayEx* holiday );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetAllHolidayEx( int handle, int numOfHoliday, BSHolidayEx* holiday );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_AddAccessGroupEx( int handle, BSAccessGroupEx* group );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteAccessGroupEx( int handle, int groupID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteAllAccessGroupEx( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetAllAccessGroupEx( int handle, int* numOfGroup, BSAccessGroupEx* group );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetAllAccessGroupEx( int handle, int numOfGroup, BSAccessGroupEx* group );


__declspec( dllexport ) BS_RET_CODE __stdcall BS_RelayControl( int handle, bool onoff );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_RelayControlEx( int handle, int deviceIndex, int relayIndex, bool onoff );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DoorControl( int handle, int doorIndex/* 0 - Door 0, 1 - Door 1, 2 - Both */, bool onoff );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_CardReaderDoorControl( int handle, unsigned readerID, bool onoff );

//
// Mifare
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteMifareConfiguration( int handle, BSMifareConfig* configData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadMifareConfiguration( int handle, BSMifareConfig* configData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ChangeMifareKey( int handle, unsigned char* oldPrimaryKey, unsigned char* newPrimaryKey, unsigned char* newSecondaryKey );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteMifareCard( int handle, BSMifareCardHeader* header, unsigned char* templateData, int templateSize );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadMifareCard( int handle, BSMifareCardHeader* header, unsigned char* templateData, int* templateSize );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_FormatMifareCard( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_AddBlacklist( int handle, int numOfItem, BSBlacklistItem* item );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteBlacklist( int handle, int numOfItem, BSBlacklistItem* item );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteAllBlacklist( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBlacklist( int handle, int* numOfItem, BSBlacklistItem* item );

//
// iClass
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteiClassConfiguration( int handle, BSiClassConfig* configData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadiClassConfiguration( int handle, BSiClassConfig* configData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ChangeiClassKey( int handle, unsigned char* oldPrimaryKey, unsigned char* newPrimaryKey, unsigned char* newSecondaryKey );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteiClassCard( int handle, BSiClassCardHeader* header, unsigned char* templateData, int templateSize );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadiClassCard( int handle, BSiClassCardHeader* header, unsigned char* templateData, int* templateSize );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_FormatiClassCard( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_AddBlacklistEx( int handle, int numOfItem, BSBlacklistItemEx* item );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteBlacklistEx( int handle, int numOfItem, BSBlacklistItemEx* item );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadBlacklistEx( int handle, int* numOfItem, BSBlacklistItemEx* item );


//
// Encryption
//
__declspec( dllexport ) void __stdcall BS_SetKey( unsigned char *key );
__declspec( dllexport ) int __stdcall BS_EncryptTemplate( unsigned char *input, unsigned char *output, int length );
__declspec( dllexport ) void __stdcall BS_DecryptTemplate( unsigned char *input, unsigned char *output, int length );


//
// Misc
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetDefaultTimeout( int handle, int timeout );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetInputTimeout( int handle, int timeout );
__declspec( dllexport ) int __stdcall BS_ConvertToUTF8( const char* msg, char* utf8Msg, int limitLen );
__declspec( dllexport ) int __stdcall BS_ConvertToUTF16( const char* msg, char* utf16Msg, int limitLen );
__declspec( dllexport ) time_t __stdcall BS_ConvertToLocalTime( time_t utcTime );


//
//Server Application
__declspec( dllexport ) BS_RET_CODE __stdcall BS_StartServerApp( int port, int maxConnection, char* sslPath, char* sslPassword, int connCheckDuration = KEEP_ALIVE_INTERVAL );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_StopServerApp();

__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetConnectedCallback( BS_ConnectionProc proc, bool syncOp, bool autoResponse );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetDisconnectedCallback( BS_ConnectionProc proc, bool syncOp );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetRequestStartedCallback( BS_ConnectionProc proc, bool syncOp, bool autoResponse );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetLogCallback( BS_LogProc proc, bool syncOp, bool autoResponse );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetImageLogCallback( BS_ImageLogProc proc, bool syncOp, bool autoResponse );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetRequestUserInfoCallback( BS_RequestUserInfoProc proc, bool syncOp );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetRequestMatchingCallback( BS_RequestMatchingProc proc, bool syncOp );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetSynchronousOperation( bool syncOp );



__declspec( dllexport ) BS_RET_CODE __stdcall BS_IssueCertificate( int handle, unsigned deviceID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_DeleteCertificate( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_StartRequest( int handle, int deviceType, int port );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetConnectedList( unsigned* deviceList, int* count );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_CloseConnection( unsigned deviceID );
// Secure I/O
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetInputFunction( int handle, int deviceID, int portID, BSInputFunction function );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetInputFunction( int handle, int deviceID, int portID, BSInputFunction* function );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ClearInputFunction( int handle, int deviceID, int portID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ClearAllInputFunction( int handle, int deviceID );

__declspec( dllexport ) BS_RET_CODE __stdcall BS_SetOutputEvent( int handle, BSOutputEvent event );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_GetOutputEvent( int handle, int deviceID, int relayID, int* numOfEvent, BSOutputEvent* event );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ClearOutputEvent( int handle, int deviceID, int relayID );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ClearAllOutputEvent( int handle, int deviceID );


//
// Internal UDP communication
//
__declspec( dllexport ) BS_RET_CODE __stdcall BS_OpenInternalUDP( int* handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_CloseInternalUDP( int handle );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_SearchDeviceInLAN( int handle, int* numOfDevice, unsigned* deviceIDs, int* deviceTypes, unsigned* readerAddrs );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_WriteConfigUDP( int handle, unsigned targetAddr, unsigned targetID, int configType, int dataSize, unsigned char* configData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ReadConfigUDP( int handle, unsigned targetAddr, unsigned targetID, int configType, int* dataSize, unsigned char* configData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_UpgradeFirmwareUDP( int handle, unsigned targetAddr, unsigned targetID, int firmwareLen, unsigned char* firmwareData );
__declspec( dllexport ) BS_RET_CODE __stdcall BS_ResetUDP( int handle, unsigned targetAddr, unsigned targetID );


#ifdef __cplusplus
}
#endif

#endif

