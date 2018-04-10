// KTTENCODE.cpp : Defines the entry point for the DLL application.
//

#include <stdio.h>
#include <stdlib.h>

#include "stdafx.h"
#include "KTTENCODE.h"

#define ROUNDS		32
#define DELTA		0x9E3779B9	/* sqr(5)-1 * 2^31 */


BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
    return TRUE;
}

int __stdcall KTTEncode(EncodeRes *pEncodeRes,char* Source,int nLen)
{
char buffer[20];

_itoa( 10, buffer, 10 );
	memset(pEncodeRes->checksum,0x00,sizeof(pEncodeRes->checksum));
	memset(pEncodeRes->length,0x00,sizeof(pEncodeRes->length));
	memset(pEncodeRes->EncodeData,0x00,sizeof(pEncodeRes->EncodeData));

	strncpy(pEncodeRes->EncodeData,Source,nLen);
	
	//_itoa( nLen, pEncodeRes->length, 10 );
	//strcpy(pEncodeRes->length,itoa(nLen));
	
	return 1;
}

int __stdcall KTTDecode(EncodeRes *pEncodeRes,char* Source,int nLen)
{
	return 1;
}
