
#include <stdio.h>
#include <string.h>

typedef unsigned char u8;
typedef signed   char s8;

int main(int argc, char* argv[]) {
    
    if(argc != 2) {
        printf("usage: extract-titlekey [tik file]\n");
        goto EXIT;
    }
    
    FILE* in = fopen(argv[1], "rb");
    
    if(in == NULL) {
        printf("cannot open file: %s\n exiting...\n", argv[1]);
        goto EXIT;
    }
    
    fseek(in, 0, SEEK_END);
    unsigned in_size = ftell(in);
    fseek(in, 0, SEEK_SET);
    
    if(in_size < 0x180 + 0x10) {
        printf("tik file is too small\n exiting...\n");
        goto EXIT_CLOSE_FILE;
    }
    
    u8 key[0x10] = { 0 };
    
    fseek(in, 0x180, SEEK_SET);
    
    fread(key, 1, 0x10, in);
    
    for(u8 i = 0; i < 0x10; i++) {
        printf("%02x", key[i]);
    }
    printf("\n");
    
EXIT_CLOSE_FILE:
    fclose(in);
EXIT:
    return 0;
}
