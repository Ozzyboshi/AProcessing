/*******************************************************************************************/
/*** Test fill line checks  				                                             ***/
/*** These tests checks if bitplanes are correctly filled                                ***/
/*** according to the FILL_TABLE 				                                         ***/
/*** Each row in the fill table is 32 bits:                                              ***/
/*** - first word : xleft                                                                ***/
/*** - second word : xright                                                              ***/
/*** each row is repeated 256 times, row 0 corresponds to bitplane first row and so on...***/
/*******************************************************************************************/
#include "../../testlibs/testlib.h"
#include <stdio.h>
#include <stdlib.h>



/*struct _test
{
    unsigned int testId;
    unsigned char *(*test_function)(void);
    char title[100];
};
*/
int make_test();


unsigned char *fillscanline_test1();
unsigned char *fillscanline_test2();
unsigned char *fillscanline_test3();
unsigned char *fillscanline_test4();
unsigned char *fillscanline_test5();
unsigned char *fillscanline_test6();
unsigned char *fillscanline_test7();
unsigned char *fillscanline_test8();
unsigned char *fillscanline_test9();
unsigned char *fillscanline_test10();
unsigned char *fillscanline_test11();

struct _test TESTS[] = {
    {.testId = 1, .test_function = fillscanline_test1, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "From px 15 to 102 first row", .verbose=0 }, // Pixel 15 up to 102 first line (line number 0)
    {.testId = 2, .test_function = fillscanline_test2, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = " Pixel 1 up to 2 first line", .verbose=0}, // Pixel 1 up to 2 first line (line number 0)
    {.testId = 3, .test_function = fillscanline_test3, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = " Pixel 1 up to 2 second line", .verbose=0}, // Pixel 1 up to 2 second line (line number 1)
    {.testId = 4, .test_function = fillscanline_test4, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "Whole first line", .verbose=0}, // Whole first line
    {.testId = 5, .test_function = fillscanline_test5, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "First 2 rows", .verbose=0}, // Whole first 2 rows
    {.testId = 6, .test_function = fillscanline_test6, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "First bit of first row", .verbose=0},
    {.testId = 7, .test_function = fillscanline_test7, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = " Pixel 1 up to 2 first line both bitplanes", .verbose=0},
    {.testId = 8, .test_function = fillscanline_test8, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = " Pixel 4 up to 8 first line both bitplanes", .verbose=0},
    {.testId = 9, .test_function = fillscanline_test9, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "Whole first line both bitplanes", .verbose=0}, // Whole first line
    {.testId = 10, .test_function = fillscanline_test10, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "Row 2 and 3 from px 8 to 16 both bitplanes", .verbose=0}, // Whole first line
    {.testId = 11, .test_function = fillscanline_test11,  .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "Row 0 from px 8 to 31 first and second bitplane " , .verbose=0}, // Whole first line

    {.testId = 0, .test_function = NULL}

};

int main(int argc, char **argv)
{
    unsigned int error;
    unsigned int totalerrors = 0;
    unsigned int testcounter = 0;

    
    while (TESTS[testcounter].testId)
    {
        printf("Running test %s...",TESTS[testcounter].title);
        fflush(stdout);
        char filename[100];
        snprintf(filename, sizeof(filename), "expected/filline.test%d", TESTS[testcounter].testId);
        error = make_test4(TESTS[testcounter],filename);
        //error = launch_test(TESTS[testcounter]);
        if (!error)
            printf("Test succeeded\n");
        else
            printf("Test KO\n");
        totalerrors += error;

        testcounter++;
    }
    printf("Total errors: %d\n", totalerrors);
    exit(totalerrors);

    
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
    //static unsigned int testcounter = 0;
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

    for (bitplane = 0; error == 0 && bitplane < 2; bitplane++)
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


int make_test3(struct _test test, const char *file)
{
    unsigned int i;
    unsigned int row;
    unsigned char *bitplanedata;
    unsigned int bitplane;
    FILE *fd;
    unsigned int error = 0;
    unsigned char buf;
    //static unsigned int testcounter = 0;
    const int verbose = 0;

    //printf("Start of test %d..\n", ++testcounter);

    bitplanedata = test.test_function();
    fflush(stdout);
    fd = fopen(file, "rb");
    if (!fd)
    {
        printf("Expected file not found or not readable\n");
        return 1;
    }
    if (verbose)
        printf("File %s open\n", file);

    for (bitplane = 0; error == 0 && bitplane < 2; bitplane++)
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