//   udp_server.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <unistd.h>
#define SERVER_PORT 8080
#define BUFFER_SIZE 1024
int main() {
    int sockfd;
    struct sockaddr_in server_addr, client_addr;
    char buffer[BUFFER_SIZE];
    socklen_t addr_len = sizeof(client_addr);
    ssize_t message_len;
    // Create socket
    if ((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
        perror("Socket creation failed"); exit(EXIT_FAILURE);}
    // Set up server address
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(SERVER_PORT);
    server_addr.sin_addr.s_addr = INADDR_ANY;
    // Bind the socket to the server address
    if (bind(sockfd, (const struct sockaddr *) &server_addr, sizeof(server_addr)) < 0) {
        perror("Bind failed"); exit(EXIT_FAILURE);
    }
    printf("Server is waiting for messages...\n");
    // Receive message from client
    while (1) {
        message_len=recvfrom(sockfd,buffer,BUFFER_SIZE,0,(struct sockaddr*)&client_addr,&addr_len);
        if (message_len < 0) {  perror("Failed to receive message");  exit(EXIT_FAILURE); }
        buffer[message_len] = '\0';  // Null-terminate the received message
        printf("Received message: %s\n", buffer);
    }
    close(sockfd);
    return 0;
}

