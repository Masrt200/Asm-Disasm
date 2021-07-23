#include <stdio.h>
#include <math.h>
#include <string.h>

int len(int num){
    int cn=0;
    while(1){
        num=num/10;
        cn++;
        
        if(num==0) break;
    }
    return cn;
}


int main(){
    char input[19];
    char enc[]="Co9%;75`;0^M`;-TW`$";
    char output[20];

    printf("First Time? ");
    scanf("%s",input);

    for(int i=0;i<19;i++){
        int x=(int)input[i];
        int y=0;
        int cn=len(x)-1;
        while(cn>=0){
            y+=(int)pow(10.0,cn)*(x%10);
            x=x/10;
            cn--;
        }
        output[i]=(char)y;
    }
    
    int res=strncmp(enc,output,19);
    if(res==0) printf("%s\n","Amazing Hell");
    else printf("%s\n","Winter Fell");
    
    return 0;
}