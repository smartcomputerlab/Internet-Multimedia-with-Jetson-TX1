#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stddef.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/wait.h>
#include <arpa/inet.h> // inet_addr()
#include <netdb.h>
#include <sys/socket.h>
#include <unistd.h> // read(), write(), close()
#define MAX 256
#define PORT 8080
#define SA struct sockaddr

int main(int c, char **a)
{
char line[512];
char prompt[256];
char car;
char *command= "./main";
int pid=0,i=0;
unsigned int count=0;
int sockfd, connfd, len;
struct sockaddr_in servaddr, cli;
    // socket create and verification
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd == -1) { printf("socket creation failed...\n"); exit(0); }
    else
        printf("Socket successfully created..\n");
    bzero(&servaddr, sizeof(servaddr));
    // assign IP, PORT
    servaddr.sin_family = AF_INET;
    //servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servaddr.sin_port = htons(PORT);
    // Binding newly created socket to given IP and verification
    if ((bind(sockfd, (SA*)&servaddr, sizeof(servaddr))) != 0) {
        printf("socket bind failed...\n");
        exit(0);
    }
    else
        printf("Socket successfully binded..\n");
    // Now server is ready to listen and verification
    if ((listen(sockfd, 5)) != 0) {
        printf("Listen failed...\n");
        exit(0);
    }
    else
        printf("Server listening..\n");
    len = sizeof(cli);
while(1)
    {
    count++; i=0;
    while(1)            // principal service loop
      {
      connfd = accept(sockfd, (SA*)&cli, &len); // waiting for connection
      if (connfd < 0)
        {
        printf("server accept failed...\n");
        sleep(5);
        }
      else break;
      }
    printf("server accept the client...\n");
    memset(prompt,0x00,256);
    char *command= "./main";
    read(connfd,prompt,256);
    strcat(prompt," Please give me a short answer, in less than 200 words if possible.\n");
    printf("%s",prompt);
    //strcpy(prompt,"How big is the city of Tokyo ? Give me a short answer.\n");
    char *arg_list[] = {"./main", "-m" , "models/llama-2-7b-chat.Q2_K.gguf", "-n", "512","-p", prompt, NULL};
    pid=fork();
    if(pid==0)
      {
      close(1);close(connfd);
      if(count%2) creat("/tmp/answer1.txt",0777);
      else creat("/tmp/answer2.txt",0777);
      execvp(command,arg_list);
      }
    else
      {
      if(pid>0) wait(0);                // parent process
        {
        int fd,nb=0; char buffer[1024];char mbuff[512];int mnb;
        if(count%2)
          {
          fd=open("/tmp/answer1.txt",0); nb=read(fd,buffer,1024);
          write(1,buffer,nb); write(connfd,buffer,nb);close(fd);close(connfd);
          }
        else
          {
          fd=open("/tmp/answer2.txt",0); nb=read(fd,buffer,1024);
          write(1,buffer,nb); write(connfd,buffer,nb);close(fd);close(connfd);
          }
        }
      }
    sleep(4);
   }
}


