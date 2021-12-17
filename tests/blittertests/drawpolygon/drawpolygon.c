#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *drawpolygon_test1();
unsigned char *drawpolygon_test2();
unsigned char *drawpolygon_test3();

struct _test TESTS[] = {
    {.testId = 1, .test_function = drawpolygon_test1, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered", .verbose=0},
    {.testId = 2, .test_function = drawpolygon_test2, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered and rotated by 30", .verbose=0},
    {.testId = 3, .test_function = drawpolygon_test2, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle with negative values at center of the screen", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"drawpolygon.test")
