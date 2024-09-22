#include <arpa/inet.h> // inet_addr()
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h> // bzero()
#include <sys/socket.h>
#include <unistd.h> // read(), write(), close()
#define MAX 4096
#define PORT 8080
#define SA struct sockaddr

int main()­
{
        int sockfd, connfd;
        struct sockaddr_in servaddr, cli;
        int n;
        // socket create and verification
        sockfd = socket(AF_INET, SOCK_STREAM, 0);
        if (sockfd == -1) { printf("socket creation failed...\n"); exit(0); }
        else printf("Socket successfully created..\n");
        bzero(&servaddr, sizeof(servaddr));
        // assign IP, PORT
        servaddr.sin_family = AF_INET;
        //servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");
        servaddr.sin_addr.s_addr = inet_addr("192.168.1.23");
        servaddr.sin_port = htons(PORT);
        // connect the client socket to server socket
        while (connect(sockfd, (SA*)&servaddr, sizeof(servaddr)) != 0)
          {
          printf("connection with the server failed...waiting for 20s\n");
          sleep(20);
          printf("New connection try !, to stop type '.' .\n");
          if(getchar()=='.') exit(1);
          }
        printf("connected to the server..\n");
        char car,buff[MAX];
        bzero(buff, sizeof(buff));
        printf("Enter the prompt [ must end with: [.,?,!]: ");
        n=0;
        do
        {
                car=getchar();
                buff[n++] = car;
        }
        while(car!='.' && car!='?' && car!='!');
        write(sockfd, buff, sizeof(buff));
        bzero(buff, sizeof(buff));
        read(sockfd, buff, sizeof(buff));
        close(sockfd);
        printf("From llama server :\n %s\n", buff);
        return 0;
}

