#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *blitfillline_test1();

struct _test TESTS[] = {
    {.testId = 1, .test_function = blitfillline_test1, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a line 0,0-10,0 by RamJam", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"blitfillline.test")
