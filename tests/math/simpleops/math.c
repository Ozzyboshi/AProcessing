#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *math_test1();
unsigned char *math_test2();
unsigned char *math_test3();
unsigned char *math_test4();
unsigned char *math_test5();
unsigned char *math_test6();
unsigned char *math_test7();

struct _test TESTS[] = {
    {.testId = 1, .test_function = math_test1, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "abs word memory 1", .verbose=0},
    {.testId = 2, .test_function = math_test2, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "abs word memory -1", .verbose=0},
    {.testId = 3, .test_function = math_test3, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 10", .verbose=0},
    {.testId = 4, .test_function = math_test4, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 40000", .verbose=0},
    {.testId = 5, .test_function = math_test5, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 160000", .verbose=0},
    {.testId = 6, .test_function = math_test6, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 123455", .verbose=0},
    {.testId = 7, .test_function = math_test7, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 123455", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"math.test")
