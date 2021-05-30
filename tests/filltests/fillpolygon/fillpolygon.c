/*******************************************************************************************/
/*** Test fill polygon  				                                             ***/
/*** These tests checks if bitplanes are correctly filled                                ***/
/*******************************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *fillpolygon_test1();
unsigned char *fillpolygon_test2();
unsigned char *fillpolygon_test3();
unsigned char *fillpolygon_test4();
unsigned char *fillpolygon_test5();

struct _test TESTS[] = {
    {.testId = 1, .test_function = fillpolygon_test1, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle", .verbose=0},
    {.testId = 2, .test_function = fillpolygon_test2, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Square", .verbose=0},
    {.testId = 3, .test_function = fillpolygon_test3, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle rectangle 20,20 20,40 57,40", .verbose=0},
    {.testId = 4, .test_function = fillpolygon_test4, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle rectangle 20,20 20,40 57,20", .verbose=0},
    {.testId = 5, .test_function = fillpolygon_test5, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Irregular crazy poligon", .verbose=0},

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
