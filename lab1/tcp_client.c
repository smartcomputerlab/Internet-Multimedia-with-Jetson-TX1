// tcp_client.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <unistd.h>

#define SERVER_PORT 8080
#define SERVER_IP "127.0.0.1"
#define BUFFER_SIZE 1024

int main() {
    int sock = 0;
    struct sockaddr_in server_addr;
    char buffer[BUFFER_SIZE];
    ssize_t valread;
    // Create socket
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        perror("Socket creation error");
        exit(EXIT_FAILURE);
    }
    // Define server address
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(SERVER_PORT);
    // Convert IPv4 and IPv6 addresses from text to binary form
    if (inet_pton(AF_INET, SERVER_IP, &server_addr.sin_addr) <= 0) {
        perror("Invalid address/ Address not supported");
        exit(EXIT_FAILURE);
    }
    // Connect to the server
    if (connect(sock, (struct sockaddr *) &server_addr, sizeof(server_addr)) < 0) {
        perror("Connection failed");
        close(sock);
        exit(EXIT_FAILURE);
    }
    // Input message to send
    printf("Enter message to send: ");
    fgets(buffer, BUFFER_SIZE, stdin);
    // Send message to server
    send(sock, buffer, strlen(buffer), 0);
    printf("Message sent to server.\n");
    // Read response from the server (optional)
    valread = read(sock, buffer, BUFFER_SIZE);
    buffer[valread] = '\0';  // Null-terminate the received string
    printf("Server's response: %s\n", buffer);
    // Close the socket
    close(sock);
    return 0;
}

