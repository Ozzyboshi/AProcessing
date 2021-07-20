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
unsigned char *fillpolygon_test6();
unsigned char *fillpolygon_test7();
unsigned char *fillpolygon_test8();
unsigned char *fillpolygon_test9();
unsigned char *fillpolygon_test10();
unsigned char *fillpolygon_test11();

struct _test TESTS[] = {
    {.testId = 1, .test_function = fillpolygon_test1, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle", .verbose=0},
    {.testId = 2, .test_function = fillpolygon_test2, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Square", .verbose=0},
    {.testId = 3, .test_function = fillpolygon_test3, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle rectangle 20,20 20,40 57,40", .verbose=0},
    {.testId = 4, .test_function = fillpolygon_test4, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle rectangle 20,20 20,40 57,20", .verbose=0},
    {.testId = 5, .test_function = fillpolygon_test5, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Irregular crazy poligon", .verbose=0},
    {.testId = 6, .test_function = fillpolygon_test6, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "First row clipped", .verbose=0},
    {.testId = 7, .test_function = fillpolygon_test7, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered at 0,0", .verbose=0},
    {.testId = 8, .test_function = fillpolygon_test8, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered at -10,0", .verbose=0},
    {.testId = 9, .test_function = fillpolygon_test9, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered at 10,0", .verbose=0},
    {.testId = 10, .test_function = fillpolygon_test10, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered at 319,255", .verbose=0},
    {.testId = 11, .test_function = fillpolygon_test11, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Under the screen horizontal line", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"filline.test")
