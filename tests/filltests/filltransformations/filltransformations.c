/*******************************************************************************************/
/*** Test fill polygon  				                                             ***/
/*** These tests checks if bitplanes are correctly filled                                ***/
/*******************************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *filltransformations_test1();
unsigned char *filltransformations_test2();
unsigned char *filltransformations_test3();
unsigned char *filltransformations_test4();



struct _test TESTS[] = {
    {.testId = 1, .test_function = filltransformations_test1, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "Square rotated top left", .verbose=0},
    {.testId = 2, .test_function = filltransformations_test2, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "Square rotated top right", .verbose=0},
    {.testId = 3, .test_function = filltransformations_test3, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "Square rotated 292 relative to origin", .verbose=0},
    {.testId = 4, .test_function = filltransformations_test4, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "Square rotated 292 relative to origin", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"filltransformations.test")
