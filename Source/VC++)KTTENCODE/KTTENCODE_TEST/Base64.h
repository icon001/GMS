
// base64 인코딩/디코딩 및 제거
// base64.h

 unsigned char* base64_encode(const unsigned char *string, int length, int *ret_length);
 unsigned char* base64_decode(const unsigned char *string, int length, int *ret_length);
 void base64_free(unsigned char* data);

