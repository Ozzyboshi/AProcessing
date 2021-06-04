
#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *matrix_multest1();

struct _test TESTS[] = {
    {.testId = 1, .test_function = matrix_multest1, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "3X3 matrix multiplication", .verbose=1},
    
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
