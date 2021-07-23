#include <stdio.h>

int main(){

    int num=586;
    int cn=0;
    while (1){
        if(num&1) num=3*num+1;
        else num=num/2;
        if(num==1) break;
        cn++;
    }
    printf("%d",cn);
    return 0;
}