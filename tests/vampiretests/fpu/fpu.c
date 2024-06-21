#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *vampire_fpu_test1();
unsigned char *vampire_fpu_test2();
unsigned char *vampire_fpu_test3();
unsigned char *vampire_fpu_test4();
unsigned char *vampire_fpu_test5();

struct _test TESTS[] = {
    {.testId = 1, .test_function = vampire_fpu_test1, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "Get color distance", .verbose=0},
    {.testId = 2, .test_function = vampire_fpu_test2, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "Copfade one color 975,EEC  25/50", .verbose=0},
    {.testId = 3, .test_function = vampire_fpu_test3, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "Copfade one color EEC,975  25/50", .verbose=0},
    {.testId = 4, .test_function = vampire_fpu_test4, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "Copfade one color 000,FFF  1/16", .verbose=0},
    {.testId = 5, .test_function = vampire_fpu_test5, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "Copfade one color FFF,000  1/16", .verbose=0},

         
    {.testId = 0, .test_function = NULL}
};

TEST_FUNC_IMPLEMENTATION(TESTS,"fpuvampire.test")
