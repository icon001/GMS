typedef struct 
{
   char checksum[4];		//체크썸
   char length[4];			//데이터길이
   char EncodeData[1024];   //암호화 데이터
}EncodeRes;
