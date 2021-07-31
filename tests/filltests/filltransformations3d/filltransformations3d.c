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


struct _test TESTS[] = {
    {.testId = 1, .test_function = filltransformations3d_test1, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "Point 3d projected", .verbose=2},
    {.testId = 2, .test_function = filltransformations3d_test2, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "Point 3d projected", .verbose=2},
    {.testId = 3, .test_function = filltransformations3d_test3, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "Point 3d projected", .verbose=2},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"filltransformations3d.test")
