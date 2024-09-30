// tcp_server.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <unistd.h>

#define SERVER_PORT 8080
#define BUFFER_SIZE 1024

int main() {
    int server_fd, new_socket;
    struct sockaddr_in address;
    char buffer[BUFFER_SIZE];
    int addrlen = sizeof(address);
    ssize_t valread;
    // Create socket file descriptor
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
        perror("Socket failed");
        exit(EXIT_FAILURE);
    }
    // Define the server address
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(SERVER_PORT);
    // Bind the socket to the specified port
    if (bind(server_fd, (struct sockaddr *) &address, sizeof(address)) < 0) {
        perror("Bind failed");
        close(server_fd);
        exit(EXIT_FAILURE);
    }
    // Listen for incoming connections (up to 3 connections can wait)
    if (listen(server_fd, 3) < 0) {
        perror("Listen failed");
        close(server_fd);
        exit(EXIT_FAILURE);
    }
    printf("Server is listening on port %d...\n", SERVER_PORT);
    // Accept a connection from a client
    if ((new_socket =accept(server_fd,(struct sockaddr *) &address, (socklen_t *) &addrlen)) < 0) {
        perror("Accept failed");
        close(server_fd);
        exit(EXIT_FAILURE);
    }
    // Read the message from the client
    valread = read(new_socket, buffer, BUFFER_SIZE);
    buffer[valread] = '\0';  // Null-terminate the received string
    printf("Received message: %s\n", buffer);
    // Respond to the client (optional)
    char *response = "Message received by server";
    send(new_socket, response, strlen(response), 0);
    printf("Response sent to client.\n");
    // Close the socket
    close(new_socket);
    close(server_fd);
    return 0;
}

