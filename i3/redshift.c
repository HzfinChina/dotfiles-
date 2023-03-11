#include<stdio.h>
#include<string.h>
#include<stdlib.h>

void change_bright_temp(float *pbright, int *ptemp, char argv);
int main(int argc, char *argv[])
{
    char strbright[10], strtemp[10];
    float brightness = 1;
    int temperature = 6500;
    char command[50];
    FILE *fp;

    /* 如果刚开机,这个文件不存在的话那么直接到写文件 */
    if ((fp = fopen("/tmp/screentemplight.txt", "r")) != NULL){ 
    fscanf(fp,"%s", strbright);
    fscanf(fp,"%s", strtemp);
    sscanf(strbright, "%f", &brightness);
    sscanf(strtemp, "%d", &temperature);
    change_bright_temp(&brightness, &temperature, argv[1][0]);
    }

    fp = fopen("/tmp/screentemplight.txt","w");
    fprintf(fp, "%f", brightness);
    putc('\n', fp);
    fprintf(fp, "%d", temperature);
    fclose(fp);
    sprintf(command, "redshift -P -O %d -b %f", temperature, brightness);
    system(command);
}

void change_bright_temp(float *pbright, int *ptemp, char argv)
{
    switch (argv) {
        case 'w':
        case 'W':
            if (*ptemp < 10000)
                *ptemp += 100;
            break;
        case 'c':
        case 'C':
            if (*ptemp > 1500)
                *ptemp -= 100;
            break;
        case 'b':
        case 'B':
            if (*pbright < 1)
                *pbright += 0.01;
            break;
        case 'd':
        case 'D':
            if (*pbright > 0.2)
                *pbright -= 0.01;
            break;
        default: 
            exit(EXIT_FAILURE);
    }
}
