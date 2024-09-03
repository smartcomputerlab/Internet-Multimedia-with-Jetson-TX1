//  udprecv.c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>

#define PORT 8889       //The port on which to listen for incoming data

void die(char *s)
{
        perror(s);
}

int main(void)
{
  struct sockaddr_in si_me, si_other;
  int s, i, slen = sizeof(si_other),rlen; int fd;
  char buffer[1000];
  char message[512];
  int retcode=0;
  //create a UDP socket  
  if((s=socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP))==-1) {die("socket");}
  // zero out the structure
  memset((char *) &si_me, 0, sizeof(si_me));
  si_me.sin_family = AF_INET;
  si_me.sin_port = htons(PORT);
  si_me.sin_addr.s_addr = htonl(INADDR_ANY);
  //bind socket to port
  if(bind(s,(struct sockaddr*)&si_me,sizeof(si_me))==-1) {die("bind");}
  //keep listening for data
  while(1)
    {
    //printf("Waiting for data...");
    memset(message,0x00,512);
    if((rlen=recvfrom(s,message,512,0,(struct sockaddr *)&si_other,&slen))==-1)
      {die("recvfrom()"); }
    //printf("Received message: %s\n",message);

    memset(buffer,0x00,1000);
    strcpy(buffer,"echo ");
    strcat(buffer,message);
    //printf("New command line: %s\n",buffer);
    sleep(1);

    // generate echo command with message 
    retcode=system(buffer);
    //if (retcode == 0) { printf("executed OK\n"); }
    //else { printf("execution error\n"); }
    }
  close(s);
  return 0;
}

