#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *math_test1();
unsigned char *math_test2();

struct _test TESTS[] = {
    {.testId = 1, .test_function = math_test1, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "abs word memory 1", .verbose=0},
    {.testId = 2, .test_function = math_test2, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "abs word memory -1", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"math.test")
