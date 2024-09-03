#include <stdio.h>
#include <string.h>


int main() {
    int c;
    int txt=0,nl=0,sp=0,sb=0,nb=0,count=0;
    char buff[512];int i=0;

    // Read characters from standard input until EOF
    while ((c = getchar()) != EOF) {
//	putchar(c);
//	printf("%2.2x",c);
	count++;
	if(c==0x0D) { count=0; }
	if(count==2) 
	{
	switch(c)
            {		
            case 0x20: txt=0;sp=1; break;
	    case 0x5B: txt=0;sb=1; break;
	    case 0x28: txt=0;nb=1; break;
	    default: txt=1;sp=0;sb=0;nb=0;i=0;memset(buff,0x00,512);break;
            }
	}
	if(txt) buff[i++]=c; 
	if(c=='.' || c=='?' || c=='!') { txt=0; printf("\n%s\n",buff);}
    }	
    return 0;
}

