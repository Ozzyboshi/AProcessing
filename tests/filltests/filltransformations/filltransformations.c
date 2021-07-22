/*******************************************************************************************/
/*** Test fill polygon  				                                             ***/
/*** These tests checks if bitplanes are correctly filled                                ***/
/*******************************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *filltransformations_test1();
unsigned char *filltransformations_test2();


struct _test TESTS[] = {
    {.testId = 1, .test_function = filltransformations_test1, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "Square rotated top left", .verbose=0},
    {.testId = 2, .test_function = filltransformations_test2, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "Square rotated top right", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"filltransformations.test")
