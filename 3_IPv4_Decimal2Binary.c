#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to convert IPv4 address to binary
void IPv4ToBinary(char *ip)
{
    // array to store binary number
    int binaryNum[32];
    // counter for binary array
    int i = 0;
    // split the string into tokens
    char *token = strtok(ip, ".");
    while (token != NULL)
    {
        // convert token to integer
        int n = atoi(token);
        // convert decimal to binary
        while (n > 0)
        {
            // storing remainder in binary array
            binaryNum[i] = n % 2;
            n = n / 2;
            i++;
        }
        // add leading zeros
        while (i < 8)
        {
            binaryNum[i] = 0;
            i++;
        }
        // get next token
        token = strtok(NULL, ".");
    }
    // printing binary array in reverse order
    for (int j = i - 1; j >= 0; j--)
        printf("%d", binaryNum[j]);
}

int main()
{
    char ip[16];
    printf("Enter an IPv4 address: ");
    scanf("%s", ip);
    IPv4ToBinary(ip);
    return 0;
}