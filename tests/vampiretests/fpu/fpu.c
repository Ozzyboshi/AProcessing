#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *vampire_fpu_test1();

struct _test TESTS[] = {
    {.testId = 1, .test_function = vampire_fpu_test1, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "Distance", .verbose=0},
         
         
    {.testId = 0, .test_function = NULL}
};

TEST_FUNC_IMPLEMENTATION(TESTS,"fpuvampire.test")
