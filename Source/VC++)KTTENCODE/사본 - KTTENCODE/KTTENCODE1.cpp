// KTTENCODE1.cpp : Defines the initialization routines for the DLL.
//

#include "stdafx.h"
#include "KTTENCODE1.h"
#include <stdlib.h>
#include <malloc.h>
#include <stdio.h>



#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

//
//	Note!
//
//		If this DLL is dynamically linked against the MFC
//		DLLs, any functions exported from this DLL which
//		call into MFC must have the AFX_MANAGE_STATE macro
//		added at the very beginning of the function.
//
//		For example:
//
//		extern "C" BOOL PASCAL EXPORT ExportedFunction()
//		{
//			AFX_MANAGE_STATE(AfxGetStaticModuleState());
//			// normal function body here
//		}
//
//		It is very important that this macro appear in each
//		function, prior to any calls into MFC.  This means that
//		it must appear as the first statement within the 
//		function, even before any object variable declarations
//		as their constructors may generate calls into the MFC
//		DLL.
//
//		Please see MFC Technical Notes 33 and 58 for additional
//		details.
//

/////////////////////////////////////////////////////////////////////////////
// CKTTENCODE1App

BEGIN_MESSAGE_MAP(CKTTENCODE1App, CWinApp)
	//{{AFX_MSG_MAP(CKTTENCODE1App)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CKTTENCODE1App construction

CKTTENCODE1App::CKTTENCODE1App()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CKTTENCODE1App object

CKTTENCODE1App theApp;




unsigned int *get_cipher_key(int which, int index)
{
	index &= 0xff;
	if (which == KTIP_TOS_KNTP)
		return (unsigned int *)ktt801n_key_table[index];

	else if (which == KTIP_TOS_SDNP)
		return (unsigned int *)ddns_key_table[index];

	else
		return (unsigned int *)ktt801n_key_table[index];
}	

static
int __feistel_encode(uint32_t *result, uint32_t *source, uint32_t *key)
{
	uint32_t y = source[0];
   	uint32_t z = source[1];
	uint32_t limit,sum=0;

	union {	uint32_t i32;	char ch[4];	} u1;
	union {	uint32_t i32;	char ch[4];	} u2;

	u1.i32 = y;
	u2.ch[0] = u1.ch[3];
	u2.ch[1] = u1.ch[2];
	u2.ch[2] = u1.ch[1];
	u2.ch[3] = u1.ch[0];
	y = u2.i32;

	u1.i32 = z;
	u2.ch[0] = u1.ch[3];
	u2.ch[1] = u1.ch[2];
	u2.ch[2] = u1.ch[1];
	u2.ch[3] = u1.ch[0];
	z = u2.i32;



 	limit = DELTA * ROUNDS;
	while (sum!=limit) 
	{
		y+=((z<<4)^(z>>5)) + (z^sum) + key[sum&3];
		sum+=DELTA;
		z+=((y<<4)^(y>>5)) + (y^sum) + key[(sum>>11)&3];
	}

	u1.i32 = y;
	u2.ch[0] = u1.ch[3];
	u2.ch[1] = u1.ch[2];
	u2.ch[2] = u1.ch[1];
	u2.ch[3] = u1.ch[0];
	y = u2.i32;
	result[0] = y;

	u1.i32 = z;
	u2.ch[0] = u1.ch[3];
	u2.ch[1] = u1.ch[2];
	u2.ch[2] = u1.ch[1];
	u2.ch[3] = u1.ch[0];
	z = u2.i32;
	result[1] = z;

	return 8;
}

static
int __feistel_decode(uint32_t *result, uint32_t *source, uint32_t *key)
{
	uint32_t y = source[0];
   	uint32_t z = source[1];
	uint32_t sum = 0;

	union {	uint32_t i32;	char ch[4];	} u1;
	union {	uint32_t i32;	char ch[4];	} u2;

	u1.i32 = y;
	u2.ch[0] = u1.ch[3];
	u2.ch[1] = u1.ch[2];
	u2.ch[2] = u1.ch[1];
	u2.ch[3] = u1.ch[0];
	y = u2.i32;

	u1.i32 = z;
	u2.ch[0] = u1.ch[3];
	u2.ch[1] = u1.ch[2];
	u2.ch[2] = u1.ch[1];
	u2.ch[3] = u1.ch[0];
	z = u2.i32;

    sum = DELTA*ROUNDS;
    while (sum)
	{
		z-=((y<<4)^(y>>5)) + (y^sum) + key[(sum>>11)&3];
		sum-=DELTA;
		y-=((z<<4)^(z>>5)) + (z^sum) + key[sum&3];
	}
	u1.i32 = y;
	u2.ch[0] = u1.ch[3];
	u2.ch[1] = u1.ch[2];
	u2.ch[2] = u1.ch[1];
	u2.ch[3] = u1.ch[0];
	y = u2.i32;
	result[0] = y;

	u1.i32 = z;
	u2.ch[0] = u1.ch[3];
	u2.ch[1] = u1.ch[2];
	u2.ch[2] = u1.ch[1];
	u2.ch[3] = u1.ch[0];
	z = u2.i32;
	result[1] = z;

	return 8;
}

int feistel_encode(unsigned char *out,unsigned char *in, int size,int nKeyIndex)
{
	int ndx = 0;
	unsigned int *key;

	key = get_cipher_key(KTIP_TOS_SDNP,nKeyIndex); 

	if (!in || size <= 0) 
		return -1;
	
	while (ndx < size)
	{
		ndx += __feistel_encode(
				(uint32_t *)(out + ndx), 
				(uint32_t *)(in + ndx),
				(uint32_t *)key);
	}
	

	return 1;
}

int feistel_decode(unsigned char *out,unsigned char *in, int size,int nKeyIndex)
{
	int ndx = 0;
	unsigned int *key;

	key = get_cipher_key(KTIP_TOS_SDNP,nKeyIndex); 

	if (!in || size <= 0) 
		return -1;
	
	while (ndx < size)
	{
		ndx += __feistel_decode(
				(uint32_t *)(out + ndx), 
				(uint32_t *)(in + ndx),
				(uint32_t *)key);
	}
	

	return 1;
}

uint16_t crc16sum(const uint8_t *buffer, int len, uint16_t crc)
{
	while (len-- > 0)
		crc = CRC16(crc, *buffer++);

	return crc;
}


extern "C" 
{
	__declspec(dllexport) int __stdcall KTTEncode(EncodeRes *pEncodeRes,char* Source,int nLen,int nKeyIndex)
	{
		int i ;
		unsigned char *EncodeData;
		unsigned char *out;
		int osz;
		int nResult;
		char checksum;

		memset(pEncodeRes->checksum,0x00,sizeof(pEncodeRes->checksum));
		memset(pEncodeRes->length,0x00,sizeof(pEncodeRes->length));
		memset(pEncodeRes->EncodeData,0x00,sizeof(pEncodeRes->EncodeData));


		osz = nLen % 8;
		osz = 8 - osz;
		osz = nLen + osz;

		out = (unsigned char *)malloc(osz);

		nResult = feistel_encode(out,(unsigned char *)Source,nLen,nKeyIndex);

		for( i = 0; i< osz; i++)
		{
			pEncodeRes->EncodeData[i] = out[i] ;
			//strncpy(pEncodeRes->EncodeData,Source,nLen);
		}
		_itoa( osz, pEncodeRes->length, 10 );

		checksum = crc16sum(out,osz,0x00);
		pEncodeRes->checksum[0] = checksum;
		//pEncodeRes->checksum[0] = 0x18;

		free(out);

		
		return nResult;
	}

	__declspec(dllexport) int __stdcall KTTDecode(EncodeRes *pEncodeRes,char* Source,int nLen,int nKeyIndex)
	{
		int i ;
		unsigned char *DecodeData;
		int osz;
		unsigned char *out;
		int nResult;
		
		memset(pEncodeRes->checksum,0x00,sizeof(pEncodeRes->checksum));
		memset(pEncodeRes->length,0x00,sizeof(pEncodeRes->length));
		memset(pEncodeRes->EncodeData,0x00,sizeof(pEncodeRes->EncodeData));
		
		_itoa( nLen, pEncodeRes->length, 10 );
		
		osz = nLen % 8;
		osz = 8 - osz;
		osz = nLen + osz;

		out = (unsigned char *)malloc(osz);
//		out = (unsigned char *)malloc(nLen);

		nResult = feistel_decode(out,(unsigned char *)Source,nLen,nKeyIndex);

		for( i = 0; i< osz; i++)
		{
			pEncodeRes->EncodeData[i] = out[i] ;
			//strncpy(pEncodeRes->EncodeData,Source,nLen);
		}

		free(out);
		
		return nResult;
	}

}