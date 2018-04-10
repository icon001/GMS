// BioStar16DLL.cpp: implementation of the CBioStar16DLL class.
//
//////////////////////////////////////////////////////////////////////
#define _CRT_SECURE_NO_WARNINGS

#include <stdlib.h>
#include <stdio.h>
#include <AFX.h>
#include "BioStar16DLL.h"

#include "BS_API.h"
#include "Common.h"

//#pragma comment(lib,"BS_SDK.lib")

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CBioStar16DLL::CBioStar16DLL()
{
//	BS_InitSDK();
}

CBioStar16DLL::~CBioStar16DLL()
{

}

extern "C" 
{
	__declspec( dllexport ) BS_RET_CODE __stdcall F_BS_InitSDK()
	{
		return BS_InitSDK();
	}

	__declspec( dllexport ) BS_RET_CODE __stdcall F_BS_OpenSocket(char* ipAdress,int Port,int* handle)
	{
		unsigned deviceID;
		int deviceType;

		BS_RET_CODE result = BS_OpenSocket( ipAdress, Port, handle );
		if( result != BS_SUCCESS )
		{
			return result;
		}

		result = BS_GetDeviceID(*handle,&deviceID,&deviceType);
		if( result != BS_SUCCESS )
		{
			return result;
		}

		result = BS_SetDeviceID( *handle, deviceID, deviceType );
		if( result != BS_SUCCESS )
		{
			return result;
		}
		return result;
	}

	__declspec( dllexport ) BS_RET_CODE __stdcall F_BS_CloseSocket(int handle)
	{
		BS_RET_CODE result = BS_CloseSocket( handle );
		return result;
	}

	__declspec( dllexport ) BS_RET_CODE __stdcall F_BS_ReadCardNo(int handle,unsigned* acardID,int* acustomID)
	{
		unsigned cardID;
		int customID;
		cardID = 0;
		BS_RET_CODE result = BS_ReadCardIDEx( handle, &cardID, &customID );

		if( result == BS_SUCCESS )
		{
			//memcpy(acardID, cardID,sizeof(cardID) );
			*acardID = cardID;
			*acustomID = customID;
		}
		return result;
	}

	__declspec( dllexport ) BS_RET_CODE __stdcall F_BS_ScanTemplate(int handle,int index,fnTemplate *Template)
	{
		//BS_RET_CODE result = BS_ScanTemplate( handle, m_TemplateData );
		BS_RET_CODE result;
		if (index == 1)
		{
			result = BS_ScanTemplate( handle, (unsigned char*)(&(Template->Template1)) );
		} else if (index == 2)
		{
			result = BS_ScanTemplate( handle, (unsigned char*)(&(Template->Template2)) );
		} else if (index == 3)
		{
			result = BS_ScanTemplate( handle, (unsigned char*)(&(Template->Template3)) );
		} else if (index == 4)
		{
			result = BS_ScanTemplate( handle, (unsigned char*)(&(Template->Template4)) );
		}
		/*
		if( result != BS_SUCCESS )
		{
			return result;
		}
		//result = BS_ScanTemplate( handle, m_TemplateData + 384 );
		result = BS_ScanTemplate( handle, (unsigned char*)(&(Template->Template2)) );
		if( result != BS_SUCCESS )
		{
			return result;
		} */
		return result;
	}

	__declspec( dllexport ) BS_RET_CODE __stdcall F_BS_GetUserBEPlus(int handle,int userID,fnTemplate *Template)
	{
		BS_RET_CODE result;
		unsigned char* m_TemplateData;
		m_TemplateData = (unsigned char*)malloc( TEMPLATE_SIZE * 2 * 10 ); 
		memset(m_TemplateData, 0x00, TEMPLATE_SIZE * 2 * BS_MAX_TEMPLATE_PER_USER);
		BEUserHdr userHdr;
		memset( &userHdr, 0, sizeof( BEUserHdr ) );
		result = BS_GetUserBEPlus( handle, userID, &userHdr, m_TemplateData );
		if( result == BS_SUCCESS )
		{
			if (userHdr.numOfFinger >= 1) 
			{
				//Template->Template1 = (unsigned *)m_TemplateData[0];
				//memcpy(Template->Template1, (unsigned *)m_TemplateData ,sizeof(Template.Template1) );  
				//memcpy(Template.Template2, (unsigned char*)m_TemplateData + TEMPLATE_SIZE,sizeof(Template.Template2) );
			}
			if (userHdr.numOfFinger >= 2) 
			{
				//memcpy(Template.Template3, (unsigned char*)m_TemplateData + (TEMPLATE_SIZE * 2),sizeof(Template.Template3) );  
				//memcpy(Template.Template4, (unsigned char*)m_TemplateData + (TEMPLATE_SIZE * 3),sizeof(Template.Template4) );
			}

		}
		return result;
	}

	__declspec( dllexport ) BS_RET_CODE __stdcall F_BS_ScanTemplateADD(int handle,int FingerCount,int userID,int customCardID,fnTemplate Template,unsigned CardNo,time_t expiryTime)
	{
		BS_RET_CODE result;
		unsigned char* m_TemplateData;
		m_TemplateData = (unsigned char*)malloc( TEMPLATE_SIZE * 2 * 10 ); 
		memset(m_TemplateData, 0x00, TEMPLATE_SIZE * 2 * 10);
		BEUserHdr userHdr;
		int i;

		memset( &userHdr, 0, sizeof( BEUserHdr ) );
		userHdr.numOfFinger = FingerCount;
		if (FingerCount >= 1)
		{
			userHdr.isDuress[0] = 0;
			userHdr.fingerChecksum[0] = 0;
			for( i = 0; i < TEMPLATE_SIZE; i++ )
			{
				userHdr.fingerChecksum[0] += Template.Template1[i];
			}
			for( i = 0; i < TEMPLATE_SIZE; i++ )
			{
				userHdr.fingerChecksum[0] += Template.Template2[i];
			}
			memcpy(m_TemplateData, (unsigned char *)Template.Template1,sizeof(Template.Template1) );  
			memcpy(m_TemplateData + TEMPLATE_SIZE, (unsigned char *)Template.Template2,sizeof(Template.Template2) );
			if (FingerCount == 2) 
			{
				userHdr.isDuress[1] = 0;
				userHdr.fingerChecksum[1] = 0;
				for( i = 0; i < TEMPLATE_SIZE; i++ )
				{
					userHdr.fingerChecksum[1] += Template.Template3[i];
				}
				for( i = 0; i < TEMPLATE_SIZE; i++ )
				{
					userHdr.fingerChecksum[1] += Template.Template4[i];
				}
				memcpy(m_TemplateData + (TEMPLATE_SIZE * 2), (unsigned char *)Template.Template3,sizeof(Template.Template3) );  
				memcpy(m_TemplateData + (TEMPLATE_SIZE * 3), (unsigned char *)Template.Template4,sizeof(Template.Template4) );
			}
		}

		userHdr.userID = userID;
		userHdr.cardID = CardNo;
		userHdr.cardCustomID = 0;
		userHdr.cardVersion = BEUserHdr::CARD_VERSION_1;

		userHdr.startTime = 1;
		if (expiryTime < 0) expiryTime = 2145830400;
		userHdr.expiryTime = expiryTime;//1830330000;

		userHdr.adminLevel = 0;
		userHdr.securityLevel = 0;
		userHdr.cardFlag = 1;
		
		userHdr.opMode = 0; //BS_AUTH_MODE_DISABLED//(5 == BS_AUTH_MODE_DISABLED)? BS_AUTH_MODE_DISABLED : 5 + BS_AUTH_FINGER_ONLY - 1;

//		sscanf( m_AccessGroup, "&%x", &userHdr.accessGroupMask );

		sscanf( "fffffffe", "%x", &userHdr.accessGroupMask );
		result = BS_DeleteUser( handle, userID );
		
		result = BS_EnrollUserBEPlus( handle, &userHdr, m_TemplateData );

		if( result != BS_SUCCESS )
		{
			return result;
		}
		return result;
	}

	__declspec( dllexport )  BS_RET_CODE __stdcall F_BS_ReadImage(int handle,int imageType,unsigned char* bitmapImage,int* imageLen)
	{
		BS_RET_CODE result = BS_ReadImage( handle, imageType, bitmapImage,imageLen );
		if (result == BS_SUCCESS) 
		{
/*			unsigned char* ImageData;
			int Len;
			Len = sizeof(unsigned char*);
			Len = *imageLen; 
			ImageData = (unsigned char*)malloc( sizeof(unsigned char*) * Len ); 
			memcpy(ImageData, (unsigned char*)bitmapImage,sizeof(unsigned char*) * Len );  
			FILE *file;
			file = fopen("c:\\bitmap.bmp", "w+");
			for(int i = 0; i < Len; i++)
			{
				fputc(ImageData[i], file);

			}
			//fwrite( ImageData, 1, Len , file);
			fclose(file);
*/
		}

		return result;
	}

	__declspec( dllexport ) BS_RET_CODE __stdcall F_BS_DeleteUser( int handle, unsigned userID )
	{
		BS_RET_CODE result = BS_DeleteUser( handle, userID );
		return result;
	}

	__declspec( dllexport ) BS_RET_CODE __stdcall F_BS_SetTime( int handle )
	{
		CTime	m_Time;
		CTime	m_Date;
		BS_RET_CODE result;
		m_Date = CTime::GetCurrentTime();
		m_Time = CTime::GetCurrentTime();
		CTime utcTime( m_Date.GetYear(), m_Date.GetMonth(), m_Date.GetDay(), m_Time.GetHour(), m_Time.GetMinute(), m_Time.GetSecond() );

		//time_t localTime = BS_ConvertToLocalTime( utcTime.GetTime() );
		//result = BS_SetTime( handle, localTime );
		return result;
	}

	__declspec( dllexport ) BS_RET_CODE __stdcall F_BS_DeleteAllUser( int handle )
	{
		BS_RET_CODE result = BS_DeleteAllUser( handle );
		return result;
	}
}