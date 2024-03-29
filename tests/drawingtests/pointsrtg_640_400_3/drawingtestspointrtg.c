#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *drawing_test1();
unsigned char *drawing_test2();
unsigned char *drawing_test3();

struct _test TESTS[] = {
    {.testId = 1, .test_function = drawing_test1, .nbitplanes=1, .nrows=400, .nbyterow=640*3,.title = "point 0,0 1,0 and 1,1", .verbose=0},
    {.testId = 2, .test_function = drawing_test2, .nbitplanes=1, .nrows=400, .nbyterow=640*3,.title = "square rotated vertices color FFFFFF", .verbose=0},
    {.testId = 3, .test_function = drawing_test3, .nbitplanes=1, .nrows=400, .nbyterow=640*3,.title = "square rotated vertices color ABCDEF", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"drawrtgpoint.test")
