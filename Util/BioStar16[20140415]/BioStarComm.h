#ifndef _BIOSTAR16DLL_H_
#define _BIOSTAR16DLL_H_

#include <windows.h>
#include "UF_Error.h"
#include "Common.h"

#ifdef MAKE_DLL
   #define DllType __declspec(dllexport)
#else
   #define DllType __declspec(dllimport)
#endif 

extern "C" {
	DllType BS_RET_CODE __stdcall F_BS_InitSDK();
	DllType BS_RET_CODE __stdcall F_BS_OpenSocket(char* ipAdress,int Port,int* handle);
	DllType BS_RET_CODE __stdcall F_BS_CloseSocket(int handle);
	DllType BS_RET_CODE __stdcall F_BS_ReadCardNo(int handle,unsigned* acardID,int* acustomID);
	DllType BS_RET_CODE __stdcall F_BS_ScanTemplate(int handle,int index,fnTemplate *Template);
	DllType BS_RET_CODE __stdcall F_BS_ScanTemplateADD(int handle,int FingerCount,int userID,int customCardID,fnTemplate Template,unsigned CardNo,time_t expiryTime);
	DllType BS_RET_CODE __stdcall F_BS_ReadImage(int handle,int imageType,unsigned char* bitmapImage,int* imageLen);
	DllType BS_RET_CODE __stdcall F_BS_DeleteUser( int handle, unsigned userID );
	DllType BS_RET_CODE __stdcall F_BS_SetTime( int handle );
	DllType BS_RET_CODE __stdcall F_BS_DeleteAllUser( int handle );
}

#endif _SUPREMADLL_H_