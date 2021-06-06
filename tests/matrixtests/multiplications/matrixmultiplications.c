// Test with
// https://www.exploringbinary.com/binary-converter/
// https://www.rapidtables.com/convert/number/binary-to-hex.html

#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *matrix_multest1();
unsigned char *matrix_multest2();
unsigned char *matrix_multest3();
unsigned char *matrix_multest4();
unsigned char *matrix_multest5();

struct _test TESTS[] = {
    {.testId = 1, .test_function = matrix_multest1, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "default tr matrix vs all ones", .verbose=0},
    {.testId = 2, .test_function = matrix_multest2, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "all positive ractional numbers", .verbose=0},
    {.testId = 3, .test_function = matrix_multest3, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "as above but with -1 on first row matrix", .verbose=0},
    {.testId = 4, .test_function = matrix_multest4, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "as above but with -1 1X3 mult", .verbose=0},
    {.testId = 5, .test_function = matrix_multest5, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "as above but with negatives 1X3 mult", .verbose=0},
    {.testId = 0, .test_function = NULL}

};
int main(int argc, char **argv)
{
    unsigned int error;
    unsigned int totalerrors = 0;
    unsigned int testcounter = 0;

    while (TESTS[testcounter].testId)
    {
        printf("Running test %d - %s...", TESTS[testcounter].testId,TESTS[testcounter].title);
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
