#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#define BUFLEN 512      // Max length of buffer
#define PORT 8888       // The port on which to send or listen for data
#define REMOTE_ADDR  "192.168.1.31"

void die(char *s)      // exit with message
{
  perror(s); 
}

int main() {
  int c;
  int txt=0,nl=0,sp=0,sb=0,nb=0,count=0;
  char buff[512];int i=0;

  struct sockaddr_in si_me, si_other;
  int s, slen = sizeof(si_other) , recv_len;
  // create a UDP socket
  if ((s=socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP))==-1){die("socket");}
  memset((char *) &si_other, 0, sizeof(si_other));
  si_other.sin_family = AF_INET;
  si_other.sin_port = htons(PORT);    // to work remotely
  si_other.sin_addr.s_addr = inet_addr(REMOTE_ADDR);   // to work remotely
						       //
  // Read characters from standard input until EOF
  memset(buff,0x00,512);
  while ((c = getchar()) != EOF) 
    {
        putchar(c);
//      printf("%2.2x",c);
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
        if(c=='.' || c=='?' || c=='!') 
	  { txt=0; printf("\n%s\n",buff);
            sendto(s,buff,strlen(buff)+1,0,(struct sockaddr *)&si_other,slen);
          } 
      }
    return 0;
}

