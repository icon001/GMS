#ifndef _BS_SERVER_APP_
#define _BS_SERVER_APP_

enum{
	//Function Type
	BS_SERVER_CB_CONN				= 0,
	BS_SERVER_CB_DISCONN			,
	BS_SERVER_CB_REQUEST_STARTED	,
	BS_SERVER_CB_RECV_LOG			,
	BS_SERVER_CB_RECV_LOGEX			,
	BS_SERVER_CB_RECV_IMAGE_LOG		,
	BS_SERVER_CB_REQUEST_USER_INFO	,
    BS_SERVER_CB_REQUEST_MATCHING   ,

	//Connection Type
	NORMAL_CONN = 0,
	SSL_CONN = 1,

	KEEP_ALIVE_INTERVAL			= 100,
    MAX_FUNCTION_DATA_SIZE      = 65536,	//4096,
    IP_ADDR_SIZE                = 32,

    REQUEST_IDENTIFY = 0x01,
    REQUEST_VERIFY = 0x02,
        
    ID_USER = 0x01,
    ID_CARD = 0x02,

    NORMAL_FINGER = 0x01,
    DURESS_FINGER = 0x02,
};

typedef BS_RET_CODE (__stdcall *BS_ConnectionProc)( int handle, unsigned deviceID, int deviceType, int connectionType, 
                                                                                                   int functionType, char* ipAddress );

typedef BS_RET_CODE (__stdcall *BS_LogProc)( int handle, unsigned deviceID, int deviceType, int connectionType, void* data );

typedef BS_RET_CODE (__stdcall *BS_ImageLogProc)( int handle, unsigned deviceID, int deviceType, int connectionType, void* data, int nSize );

typedef BS_RET_CODE (__stdcall *BS_RequestMatchingProc)( int handle, unsigned deviceID, int deviceType, int connectionType, 
                                                         int matchingType, unsigned ID, unsigned char* templateData, void* userHdr, int* isDuress );

typedef BS_RET_CODE (__stdcall *BS_RequestUserInfoProc)( int handle, unsigned deviceID, int deviceType, int connectionType, 
                                                                     int idType, unsigned ID, unsigned customID, void* userHdr );

#endif