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
unsigned char *math_test8();
unsigned char *math_test9();
unsigned char *math_test10();
unsigned char *math_test11();

struct _test TESTS[] = {
    {.testId = 1, .test_function = math_test1, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "abs word memory 1", .verbose=0},
    {.testId = 2, .test_function = math_test2, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "abs word memory -1", .verbose=0},
    {.testId = 3, .test_function = math_test3, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 10", .verbose=0},
    {.testId = 4, .test_function = math_test4, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 40000", .verbose=0},
    {.testId = 5, .test_function = math_test5, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 160000", .verbose=0},
    {.testId = 6, .test_function = math_test6, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 123455", .verbose=0},
    {.testId = 7, .test_function = math_test7, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 123455", .verbose=0},
    {.testId = 8, .test_function = math_test8, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if 14 between 15 and 345", .verbose=0},
    {.testId = 9, .test_function = math_test9, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if 15 between 15 and 345", .verbose=0},
    {.testId = 10, .test_function = math_test10, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if 345 between 15 and 345", .verbose=0},
    {.testId = 11, .test_function = math_test11, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if 346 between 15 and 345", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"math.test")
