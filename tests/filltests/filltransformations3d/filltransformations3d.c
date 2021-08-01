/*******************************************************************************************/
/*** Test fill polygon  				                                             ***/
/*** These tests checks if bitplanes are correctly filled                                ***/
/*******************************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *filltransformations3d_test1();
unsigned char *filltransformations3d_test2();
unsigned char *filltransformations3d_test3();
unsigned char *filltransformations3d_test4();
unsigned char *filltransformations3d_test5();
unsigned char *filltransformations3d_test6();


struct _test TESTS[] = {
    {.testId = 1, .test_function = filltransformations3d_test1, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "Point 3d projected", .verbose=0},
    {.testId = 2, .test_function = filltransformations3d_test2, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "Point 3d projected", .verbose=0},
    {.testId = 3, .test_function = filltransformations3d_test3, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "Point 3d projected", .verbose=0},
    {.testId = 4, .test_function = filltransformations3d_test4, .nbitplanes=1, .nrows=2, .nbyterow=4,.title = "Two Points 3d projected", .verbose=0},
    {.testId = 5, .test_function = filltransformations3d_test5, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "3d Triangle in a fill table", .verbose=0},
    {.testId = 6, .test_function = filltransformations3d_test6, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "3d Triangle with one vertex near to the viewer", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"filltransformations3d.test")
