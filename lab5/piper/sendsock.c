#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#define BUFLEN 512      // Max length of buffer
#define PORT 8889       // The port on which to send or listen for data
#define REMOTE_ADDR  "192.168.1.34"

void die(char *s)      // exit with message
{
  perror(s);
}

int main() {
  int c, i=0;
  char buff[512], car=0;

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

  while(buff[0]!='*')
     {
     memset(buff,0x00,512);i=0;
     printf("Write new message (ends with [.,?,!]: ");
     do {
       car=getchar(); buff[i++]=car;
       }
     while(car!='.' && car!='?' && car!='!');
     printf("%s\n",buff);
     sendto(s,buff+1,strlen(buff)-1,0,(struct sockaddr *)&si_other,slen);
     printf("message sent to: %s\n", REMOTE_ADDR);
     }
    return 0;
}

