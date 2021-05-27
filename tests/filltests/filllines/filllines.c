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
#include "../../testlibs/testlib.h"

unsigned char *filline_test1();
unsigned char *filline_test2();
unsigned char *filline_test3();
unsigned char *filline_test4();
unsigned char *filline_test5();
unsigned char *filline_test6();
unsigned char *filline_test7();
unsigned char *filline_test8();
unsigned char *filline_test9();
unsigned char *filline_test10();
unsigned char *filline_test11();
unsigned char *filline_test12();
unsigned char *filline_test13();

/*struct _test TESTS[] = {
  
     {.testId = 10, .test_function = filline_test10, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = " 0,0 0,1 -> 319,0,319,1", .verbose=1}, 

  
    {.testId = 0, .test_function = NULL}

};*/

struct _test TESTS[] = {
    {.testId = 1, .test_function = filline_test1, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "1,1 8,5 -> 10,1 18.5 0<m<1", .verbose=0},
    {.testId = 2, .test_function = filline_test2, .title = "8,5 1,1 -> 18.5 10,1 0<m<1", .verbose=0},
    {.testId = 3, .test_function = filline_test3, .title = "10,1 18,5 -> 1,1 8,5 0<m<1", .verbose=0},
    {.testId = 4, .test_function = filline_test4, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "1,1 8,5 -> 10,1 18,5 0<m<1", .verbose=0},
    {.testId = 5, .test_function = filline_test5, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "8,5 1,1 -> 10,1 18,5 0<m<1", .verbose=0},
    {.testId = 6, .test_function = filline_test6, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "1,1 3,2 155,5", .verbose=0}, 

    // Start of vertical
    {.testId = 7, .test_function = filline_test7, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "1,1 1,2", .verbose=0}, 
    {.testId = 8, .test_function = filline_test8, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "0,0 1,7", .verbose=0},
    {.testId = 9, .test_function = filline_test9, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "0,0 8,18", .verbose=0}, 
    {.testId = 10, .test_function = filline_test10, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "0,0 0,1 -> 319,0,319,1", .verbose=0}, 
    
    // Shapes
    {.testId = 11, .test_function = filline_test11, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Square from 10,10 to 20,20", .verbose=0}, 
    {.testId = 12, .test_function = filline_test12, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Line 16,2 8,26", .verbose=0},
    {.testId = 13, .test_function = filline_test13, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Triangle 16,2 8,26 - 8,16 28,16 - 16,2 28,26", .verbose=0}, 


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
        char filename[100];
        snprintf(filename, sizeof(filename), "expected/filline.test%d", TESTS[testcounter].testId);
        error = make_test4( TESTS[testcounter],filename);
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
/*
int launch_test(struct _test test)
//unsigned char *(*test_function)(void), const char *file)
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

    unsigned char *(*test_function)(void) = test.test_function;
    char file[100];
    snprintf(file, sizeof(file), "expected/filline.test%d", test.testId);

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
                    printf("Test failed, error reading byte: bitplane:%d - row:%d - byte %d \n", bitplane, row, i);
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
*/