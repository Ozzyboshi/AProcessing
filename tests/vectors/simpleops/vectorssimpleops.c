#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *vectorssimpleops_test1();
unsigned char *vectorssimpleops_test2();

struct _test TESTS[] = {
    {.testId = 1, .test_function = vectorssimpleops_test1, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "static add v1(3,4) with v2(5,6)", .verbose=0},
    {.testId = 2, .test_function = vectorssimpleops_test2, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "static sub v1(3,4) with v2(5,7)", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"vectorsimpleops.test")
