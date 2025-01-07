#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to convert IPv4 address to binary
void IPv4ToBinary(char *ip)
{
    // array to store binary number
    int binaryNum[32] = {0};
    // counter for binary array
    int i = 0;
    // split the string into tokens
    char *token = strtok(ip, ".");
    while (token != NULL)
    {
        // convert token to integer
        int n = atoi(token);
        // convert decimal to binary
        for (int j = 7; j >= 0; j--)
        {
            binaryNum[i] = n >> j & 1;
            i++;
        }
        token = strtok(NULL, ".");
    }
    // print the binary number
    for (int j = 0; j < 32; j++)
    {
        printf("%d", binaryNum[j]);
        if ((j + 1) % 8 == 0)
            printf(" ");
    }
    printf("\n");
}

int main()
{
    char ip[16];
    printf("Enter an IPv4 address: ");
    scanf("%s", ip);
    IPv4ToBinary(ip);
    return 0;
}