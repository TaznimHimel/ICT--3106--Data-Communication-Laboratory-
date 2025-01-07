#include <stdio.h>
#include <string.h>

int main()
{
    // Stuffing is the process of adding extra characters to the data to prevent it from being confused with the control characters. The stuffing process is performed by the sender.
    int i = 0, j = 0;
    char d[100], l[] = "DLEETX", sd[100], ds[100];
    printf("Enter data in UpperCase: ");
    scanf("%s", d);
    sd[0] = 'D', sd[1] = 'L', sd[2] = 'E', sd[3] = 'E', sd[4] = 'T', sd[5] = 'X';
    j = 6;
    while (d[i] != '\0')
    {
        if (d[i] == 'D' && d[i + 1] == 'L' && d[i + 2] == 'E')
        {
            sd[j] = 'D', sd[j + 1] = 'L', sd[j + 2] = 'E', sd[j + 3] = 'E', sd[j + 4] = 'T', sd[j + 5] = 'X';
            j += 6;
            i += 3;
        }
        else
        {
            sd[j] = d[i];
            j++;
            i++;
        }
    }

    // De-stuffing is the process of removing the extra characters added during the stuffing process. The de-stuffing process is the reverse of the stuffing process. The de-stuffing process is performed by the receiver
    sd[j] = '\0';
    strcpy(ds, sd);
    strcat(sd, l);
    printf("After stuffing:\n");
    printf("Stuffed Data: %s\n", sd);
    i = 0;
    j = 6;
    while (ds[j] != '\0')
    {
        if (ds[j] == 'D' && ds[j + 1] == 'L' && ds[j + 2] == 'E' && ds[j + 3] == 'D' && ds[j + 4] == 'L' && ds[j + 5] == 'E')
        {
            d[i] = 'D', d[i + 1] = 'L', d[i + 2] = 'E';
            i += 3;
            j += 6;
        }
        else
        {
            d[i] = ds[j];
            i++;
            j++;
        }
    }
    d[i] = '\0';
    printf("After destuffing:\n");
    printf("Destuffed Data: %s\n", d);
    return 0;
}