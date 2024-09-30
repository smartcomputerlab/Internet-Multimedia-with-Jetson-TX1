// udpsend.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <unistd.h>

#define SERVER_PORT 8080
#define SERVER_IP "127.0.0.1"
#define BUFFER_SIZE 1024

int main() {
    int sockfd;
    struct sockaddr_in server_addr;
    char buffer[BUFFER_SIZE];
    socklen_t addr_len = sizeof(server_addr);
    // Create socket
    if ((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
        perror("Socket creation failed");
        exit(EXIT_FAILURE);
    }
    // Set up server address
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(SERVER_PORT);
    server_addr.sin_addr.s_addr = inet_addr(SERVER_IP);
    // Input message to send
    printf("Enter message to send: ");
    fgets(buffer, BUFFER_SIZE, stdin);
    // Send message to server
    if (sendto(sockfd,buffer,strlen(buffer),0,(const struct sockaddr *)&server_addr,addr_len)< 0) 
    {
        perror("Failed to send message");
        exit(EXIT_FAILURE);
    }
    printf("Message sent.\n");
    close(sockfd);
    return 0;
}

