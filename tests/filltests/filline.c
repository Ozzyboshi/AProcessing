/*******************************************************************************************/
/*** Test fill line checks  				                                             ***/
/*** These tests checks if bitplanes are correctly filled                                ***/
/*** according to the FILL_TABLE 				                                         ***/
/*** Each row in the fill table is 32 bits:                                              ***/
/*** - first word : xleft                                                                ***/
/*** - second word : xright                                                              ***/
/*** each row is repeated 256 times, row 0 corresponds to bitplane first row and so on...***/
/*******************************************************************************************/

#include <stdio.h>
#include <stdlib.h>

struct _test
{
    unsigned int testId;
    unsigned char *(*test_function)(void);
    char title[100];
};

int make_test();

unsigned char *filline_test1();
unsigned char *filline_test2();
unsigned char *filline_test3();
unsigned char *filline_test4();
unsigned char *filline_test5();
unsigned char *filline_test6();

struct _test TESTS[] = {
    {.testId = 1, .test_function = filline_test1, .title = "From px 15 to 102 first row"}, // Pixel 15 up to 102 first line (line number 0)
    {.testId = 2, .test_function = filline_test2, .title = ""}, // Pixel 1 up to 2 first line (line number 0)
    {.testId = 3, .test_function = filline_test3, .title = ""}, // Pixel 1 up to 2 second line (line number 1)
    {.testId = 4, .test_function = filline_test4,  .title = ""}, // Whole first line
    {.testId = 5, .test_function = filline_test5, .title = "First 2 rows"}, // Whole first line
    {.testId = 6, .test_function = filline_test6, .title = "First bit of first row"},

    {.testId = 0, .test_function = NULL}

};

int main(int argc, char **argv)
{
    unsigned int error;
    unsigned int totalerrors = 0;
    unsigned int testcounter = 0;

    if (argv[1] && atoi(argv[1]) > 0)
    {
        char filename[100];
        snprintf(filename, sizeof(filename), "expected/filline.test%d", TESTS[atoi(argv[1])].testId);
        error = make_test(TESTS[atoi(argv[1])].test_function, filename);
        if (!error)
            printf("Test succeeded\n");
        else
            printf("Test KO\n");

        exit(error);
    }

    while (TESTS[testcounter].testId)
    {
        printf("Running test %s...",TESTS[testcounter].title);
        char filename[100];
        snprintf(filename, sizeof(filename), "expected/filline.test%d", TESTS[testcounter].testId);
        error = make_test(TESTS[testcounter].test_function, filename);
        if (!error)
            printf("Test succeeded\n");
        else
            printf("Test KO\n");
        totalerrors += error;

        testcounter++;
    }
    printf("Total errors: %d\n", totalerrors);
    exit(totalerrors);

    /*error = make_test(filline_test1, "expected/filline.test1");
    if (!error)
        printf("Test 1 succeeded\n");
    else
        printf("Test1 KO\n");
    totalerrors += error;

    error = make_test(filline_test2, "expected/filline.test1");
    if (!error)
        printf("Test 2 succeeded\n");
    else
        printf("Test2 KO\n");
    totalerrors += error;

    printf("Total errors: %d\n", totalerrors);
    exit(totalerrors);*/
}

int make_test(unsigned char *(*test_function)(void), const char *file)
{
    unsigned int i;
    unsigned int row;
    unsigned char *bitplanedata;
    unsigned int bitplane;
    FILE *fd;
    unsigned int error = 0;
    unsigned char buf;
    static unsigned int testcounter = 0;
    const int verbose = 0;

    //printf("Start of test %d..\n", ++testcounter);

    bitplanedata = test_function();
    fflush(stdout);
    fd = fopen(file, "rb");
    if (!fd)
    {
        printf("Expected file not found or not readable\n");
        return 1;
    }
    if (verbose)
        printf("File %s open\n", file);

    for (bitplane = 0; error == 0 && bitplane < 1; bitplane++)
    {
        if (verbose)
            printf("Processing bitplane %d\n", bitplane);
        for (row = 0; error == 0 && row < 256; row++)
        {
            if (verbose)
                printf("Row %03d : ", row);
            for (i = 0; error == 0 && i < 40; i++)
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
