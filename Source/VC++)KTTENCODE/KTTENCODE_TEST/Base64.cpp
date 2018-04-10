#include "stdafx.h"
#include <malloc.h>
#include "Base64.h"



/////////////////////////////////////////////////////////////
// base64 인코딩/디코딩 및 제거
// base64.cpp
static char base64_table[] =
{ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
 '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/', '\0'
};
static char base64_pad = '=';

unsigned char *base64_encode(const unsigned char *string, int length, int *ret_length) 
{
    const unsigned char *current = string;
    int i    = 0;
    int    wi    =    0;
    int        nAllocSize    =    ((length + 3 - length 
  % 3) * 4 / 3 + 1) * sizeof(char);
    nAllocSize    +=    (nAllocSize/80+1)*2;
    unsigned char *result = new unsigned char[nAllocSize];
 
    while (length > 2) 
    { /* keep going until we have less than 24 bits */
        result[i++] = base64_table[current[0] >> 2];
        result[i++] = base64_table[((current[0] & 0x03) <<  4) 
   + (current[1] >> 4)];
        result[i++] = base64_table[((current[1] & 0x0f) <<  2) 
   + (current[2] >> 6)];
        result[i++] = base64_table[current[2] & 0x3f];
  
        current += 3;
        length -= 3; /* we just handle 3 octets of data */
        wi+=4;
  
/*        if(wi%80 == 0)
        {
            result[i++] = '\r';
            result[i++] = '\n';
        }
*/    }
 
    /* now deal with the tail end of things */
    if (length != 0) 
    {
        result[i++] = base64_table[current[0] >> 2];
        if (length > 1) 
        {
            result[i++] = base64_table[((current[0] & 
    0x03) <<  4) + (current[1] >> 4)];
            result[i++] = base64_table[(current[1] & 
    0x0f) <<  2];
            result[i++] = base64_pad;
        }else 
        {
            result[i++] = base64_table[(current[0] & 
    0x03) <<  4];
            result[i++] = base64_pad;
            result[i++] = base64_pad;
        }
    }
    if(ret_length) 
    {
        *ret_length = i;
    }
    result[i] = '\0';
    return result;
}

/* as above, but backwards. :) */
unsigned char *base64_decode(const unsigned char *string, int length, int *ret_length) 
{
    const unsigned char *current = string;
    int ch, i = 0, j = 0, k;
    char *chp;
 
    unsigned char *result = new unsigned char[(length / 4 *3 + 1) * sizeof(char)];
    if (result == NULL) {
        return NULL;
    }
 
    /* run through the whole string, converting as we go */
    while ((ch = *current++) != '\0') {
        if (ch == base64_pad) break;
        chp = strchr(base64_table, ch);
        if (chp == NULL) continue;
        ch = chp - base64_table;
  
        switch(i % 4) {
        case 0:
            result[j] = (unsigned char)(ch <<  2);
            break;
        case 1:
            result[j++] |= ch >> 4;
            result[j] = (unsigned char)((ch & 0x0f) <<  4);
            break;
        case 2:
            result[j++] |= ch >>2;
            result[j] = (unsigned char)((ch & 0x03) <<  6);
            break;
        case 3:
            result[j++] |= ch;
            break;
        }
        i++; 
    }
 
    k = j;
    /* mop things up if we ended on a boundary */
    if (ch == base64_pad) {
        switch(i % 4) {
        case 0:
        case 1:
            delete [] result;
            return NULL;
        case 2:
            k++;
        case 3:
            result[k++] = 0;
        }
    }
    if(ret_length) {
        *ret_length = j;
    }
    result[k] = '\0';
    return result;
}

void base64_free(unsigned char* data)
{
 delete[] data;
}
