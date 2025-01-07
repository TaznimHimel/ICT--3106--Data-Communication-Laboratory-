#include <stdio.h>
#include <string.h>

// Function for bit stuffing
void bitStuffing(int N, int arr[])
{
    int count = 0;
    for (int i = 0; i < N; i++)
    {
        if (arr[i] == 1)
        {
            count++;
        }
        else
        {
            count = 0;
        }
        if (count == 5)
        {
            for (int j = N; j > i; j--)
            {
                arr[j] = arr[j - 1];
            }
            arr[i + 1] = 0;
            N++;
        }
    }
    printf("After Bit Stuffing: ");
    for (int i = 0; i < N; i++)
    {
        printf("%d", arr[i]);
    }
}

int main()
{
    int N;
    printf("Enter the number of bits: ");
    scanf("%d", &N);
    int arr[N];
    printf("Enter the bits: ");
    for (int i = 0; i < N; i++)
    {
        scanf("%d", &arr[i]);
    }
    bitStuffing(N, arr);
    return 0;
}
// Output:
// Enter the number of bits: 10
// Enter the bits: 1 1 1 1 1 0 1 1 1 1
// After Bit Stuffing: 1 1 1 1 1 0 0 1 1 1 1
// Explanation:
// In this program, we are implementing bit stuffing. Bit stuffing is a process of adding extra bits to the data to prevent it from being confused with the control characters. In this program, we take the number of bits as input and an array of bits. We then iterate through the array and check if there are 5 consecutive 1s. If we find 5 consecutive 1s, we insert an extra 0 bit after the 5th 1. Finally, we print the array after bit stuffing.
