#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *precalcsimpleops_test1();
unsigned char *precalcsimpleops_test2();


struct _test TESTS[] = {
    {.testId = 1, .test_function = precalcsimpleops_test1, .nbitplanes=1, .nrows=361, .nbyterow=8,.title = "default table", .verbose=0},
    {.testId = 2, .test_function = precalcsimpleops_test2, .nbitplanes=1, .nrows=361, .nbyterow=8,.title = "default table", .verbose=0},



    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"precalcsimpleops.test")
