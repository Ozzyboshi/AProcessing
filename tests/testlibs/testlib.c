//#define DUMP_ON_VERBOSE_2

#include "testlib.h"
#include <stdio.h>
#include <errno.h>

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
    char file[200];
    snprintf(file, sizeof(file), "expected/filline.test%d", test.testId);

    if (verbose) printf("Start of test %d..\n", ++testcounter);
    if (verbose) printf("Expected file %s\n",file);

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
#ifdef DUMP_ON_VERBOSE_2
    unsigned char *bitplanedatastart;
#endif
    unsigned int bitplane;
    FILE *fd;
    unsigned int error = 0;
    unsigned char buf;
    unsigned int verbose = test.verbose;


    //printf("Start of test %d..\n", ++testcounter);

    bitplanedata = test.test_function();
#ifdef DUMP_ON_VERBOSE_2
    bitplanedatastart = bitplanedata;
#endif
    fflush(stdout);

        fflush(stdout);

    if (verbose) printf("Number of bitplanes %d\n",test.nbitplanes);
    fflush(stdout);
    fd = fopen(file, "rb");
    if (!fd)
    {
        printf("Expected file '%s' not found or not readable : %d -> %s\n",file,errno,strerror(errno));
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

                        printf("Following bytes in memory : %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",*(bitplanedata+1),*(bitplanedata+2),*(bitplanedata+3),*(bitplanedata+4),*(bitplanedata+5),*(bitplanedata+6),*(bitplanedata+7),*(bitplanedata+8),*(bitplanedata+9),*(bitplanedata+10));
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


   
    
#ifdef DUMP_ON_VERBOSE_2
    if ( error && verbose == 2)
    {
        bitplanedata = bitplanedatastart;
        for (bitplane = 0;  bitplane < test.nbitplanes; bitplane++)
        {
            printf("Processing bitplane %d\n", bitplane);
            for (row = 0;  row < test.nrows; row++)
            {
                printf("Row %03d : ", row);
                for (i = 0;  i < test.nbyterow; i++)
                {
                    printf("%02x ", *bitplanedata);
                    bitplanedata++;
                }
                printf("\n");
            }
        }
    }
#endif
    return error;
}



int make_test_patched(struct _test test, const char *file,struct _test test2)
{
    unsigned int i;
    unsigned int row;
    unsigned char *bitplanedata;
    unsigned char *bitplanedatastart;
    unsigned int bitplane;
    FILE *fd;
    unsigned int error = 0;
    unsigned char buf;
    unsigned int verbose = test.verbose;

    //printf("Start of test %d..\n", ++testcounter);
    Disable();
    bitplanedata = test.test_function();
    Enable();
    test = test2;

    bitplanedatastart = bitplanedata;
    fflush(stdout);

        fflush(stdout);

    if (verbose) printf("Number of bitplanes %d\n",test.nbitplanes);
    fflush(stdout);
    fd = fopen(file, "rb");
    if (!fd)
    {
        printf("Expected file '%s' not found or not readable : %d -> %s\n",file,errno,strerror(errno));
        if (verbose<3) return 1;
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

                        printf("Following bytes in memory : %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",*(bitplanedata+1),*(bitplanedata+2),*(bitplanedata+3),*(bitplanedata+4),*(bitplanedata+5),*(bitplanedata+6),*(bitplanedata+7),*(bitplanedata+8),*(bitplanedata+9),*(bitplanedata+10));
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


   
    
    if ( error && verbose == 2)
    {
        bitplanedata = bitplanedatastart;
        for (bitplane = 0;  bitplane < test.nbitplanes; bitplane++)
        {
            printf("Processing bitplane %d\n", bitplane);
            for (row = 0;  row < test.nrows; row++)
            {
                printf("Row %03d : ", row);
                for (i = 0;  i < test.nbyterow; i++)
                {
                    printf("%02x ", *bitplanedata);
                    bitplanedata++;
                }
                printf("\n");
            }
        }
    }

    if (error && verbose == 3 )
    {

        FILE* fdwrite ;
        char filename[100];
        sprintf(filename,"output%d.bin",test.testId);
        printf("Trying to produce %s helper file\n",filename);
        fdwrite = fopen(filename,"w");
        if (fdwrite==NULL)
        {
            printf("Cannot create helper file");
            return 1;
        }
        bitplanedata = bitplanedatastart;
        bitplanedata = bitplanedatastart;
        for (bitplane = 0;  bitplane < test.nbitplanes; bitplane++)
        {
            printf("Processing bitplane %d\n", bitplane);
            for (row = 0;  row < test.nrows; row++)
            {
                printf("Row %03d : ", row);
                for (i = 0;  i < test.nbyterow; i++)
                {
                    printf("%02x ", *bitplanedata);
                    fwrite(bitplanedata,1,1,fdwrite);
                    bitplanedata++;
                }
                printf("\n");
            }
        }
        fclose(fdwrite);
    }
    return error;
}
