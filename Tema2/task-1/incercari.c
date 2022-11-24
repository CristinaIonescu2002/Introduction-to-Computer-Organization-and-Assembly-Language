#include <stdio.h>
#include <stdlib.h>
#include <string.h>


void square(int n, char *plain, char* enc_string, int step) {
    char vec[27]="ABCDEFGHIJKLMNOPQRSTUVWXYZ\0";
    enc_string=malloc(n*sizeof(char));
    strcpy(enc_string,plain);
    for(int i=0; i<n; i++){
        int nr=((int)plain[i] + step-65)%26 +65 ;
        char car=(char)nr;
        enc_string[i]=car;
    }
    printf("%s\n", enc_string);
    free(enc_string);
}
int main(){
    int n=25;
    int step=15;
    char *plain="THYROPARATHYROIDECTOMIZED";
    char *enc_string;
    square(n,plain,enc_string,step);
}