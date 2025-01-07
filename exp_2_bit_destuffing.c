#include <stdio.h>
#include <string.h>

// Function for bit destuffing
void bitDestuffing(int N, int arr[])
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
        if (count == 5 && arr[i + 1] == 0)
        {
            for (int j = i + 1; j < N; j++)
            {
                arr[j] = arr[j + 1];
            }
            N--;
        }
    }
    printf("After Bit Destuffing: ");
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
    bitDestuffing(N, arr);
    return 0;
}
// Output:
// Enter the number of bits: 11
// Enter the bits: 1 1 1 1 1 0 0 1 1 1 1
