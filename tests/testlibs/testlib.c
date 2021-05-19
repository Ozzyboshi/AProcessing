#include "testlib.h"
#include <stdio.h>

int launch_test(struct _test test)
{
    unsigned int i;
    unsigned int row;
    unsigned char *bitplanedata;
    unsigned int bitplane;
    FILE *fd;
    unsigned int error = 0;
    unsigned char buf;
    static unsigned int testcounter = 0;
    const int verbose = 1;

    if (verbose) printf("running %s...\n",test.title);

    unsigned char *(*test_function)(void) = test.test_function;
    char file[400];
    snprintf(file, sizeof(file), "expected/filline.test%d", test.testId);

    if (verbose) printf("Start of test %d..\n", ++testcounter);

    bitplanedata = test_function();
    fflush(stdout);
    fd = fopen(file, "rb");
    if (!fd)
    {
        printf("Expected file '%s' not found or not readable\n",file);
        error = 1;
        return 1;
    }
    if (verbose)
        printf("File %s open\n", file);

    for (bitplane = 0; error == 0 && bitplane < test.nbitplanes; bitplane++)
    {
        if (verbose)
            printf("Processing bitplane %d\n", bitplane);
        for (row = 0; error == 0 && row < test.nrows; row++)
        {
            if (verbose)
                printf("Row %03d : ", row);
            for (i = 0; error == 0 && i < test.nbyterow; i++)
            {
                if (fread(&buf, 1, 1, fd) != 1)
                {
                    printf("Test failed, error reading byte: bitplane:%d of %d - row:%d - byte %d \n", bitplane,test.nbitplanes, row, i);
                    error = 1;
                }
                else
                {
                    if (verbose)
                        printf("%02x/%02x ", *bitplanedata, buf);
                    if (buf != *bitplanedata)
                    {

                        printf("Test failed, data mismatch : bitplane:%d - row:%d - byte %d \n", bitplane, row, i);
                        printf("Byte found :%02x but expected in the file: %02x \n", *bitplanedata, buf);

                        error = 1;
                    }
                    bitplanedata++;
                }
            }
            if (verbose)
                printf("\n");
            fflush(stdout);
        }
    }

    fclose(fd);
    return error;
}



int make_test4(struct _test test, const char *file)
{
    unsigned int i;
    unsigned int row;
    unsigned char *bitplanedata;
    unsigned int bitplane;
    FILE *fd;
    unsigned int error = 0;
    unsigned char buf;
    //static unsigned int testcounter = 0;
    unsigned int verbose = test.verbose;


    //printf("Start of test %d..\n", ++testcounter);

    bitplanedata = test.test_function();
    fflush(stdout);

        fflush(stdout);

    if (verbose) printf("Number of bitplanes %d\n",test.nbitplanes);
    fflush(stdout);
    fd = fopen(file, "rb");
    if (!fd)
    {
        printf("Expected file not found or not readable\n");
        return 1;
    }
    if (verbose)
        printf("File %s open\n", file);

    for (bitplane = 0; error == 0 && bitplane < test.nbitplanes; bitplane++)
    {
        if (verbose)
            printf("Processing bitplane %d\n", bitplane);
        for (row = 0; error == 0 && row < 256; row++)
        {
            if (verbose)
                printf("Row %03d : ", row);
            for (i = 0; error == 0 && i < test.nbyterow; i++)
            {
                if (fread(&buf, 1, 1, fd) != 1)
                {
                    perror("Error reading file\n");
                    error = 1;
                }
                else
                {
                    if (verbose)
                        printf("%02x/%02x ", *bitplanedata, buf);
                    if (buf != *bitplanedata)
                    {

                        printf("Test failed, data mismatch : bitplane:%d - row:%d - byte %d \n", bitplane, row, i);
                        printf("Byte found :%02x but expected in the file: %02x \n", *bitplanedata, buf);

                        error = 1;
                    }
                    bitplanedata++;
                }
            }
            if (verbose)
                printf("\n");
            fflush(stdout);
        }
    }

    fclose(fd);
    return error;
}