#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *angleops_test1();
unsigned char *angleops_test2();
unsigned char *angleops_test3();
unsigned char *angleops_test4();
unsigned char *angleops_test5();
unsigned char *angleops_test6();
unsigned char *angleops_test7();
unsigned char *angleops_test8();
unsigned char *angleops_test9();

struct _test TESTS[] = {
    {.testId = 1, .test_function = angleops_test1, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "angle of vector v(1,1) in q10,6 format", .verbose=0},
    {.testId = 2, .test_function = angleops_test2, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "angle of vector v(10,20) in q10,6 format", .verbose=0},
    {.testId = 3, .test_function = angleops_test3, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "angle of vector v(25,8) in q10,6 format", .verbose=0},
    {.testId = 4, .test_function = angleops_test4, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "angle of vector v(-25,8) in q10,6 format", .verbose=0},
    {.testId = 5, .test_function = angleops_test5, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "angle of vector v(25,-8) in q10,6 format", .verbose=0},
    {.testId = 6, .test_function = angleops_test6, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "angle of vector v(-25,-8) in q10,6 format", .verbose=0},
    {.testId = 7, .test_function = angleops_test7, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "angle of vector v(64,64) in q10,6 format", .verbose=0},
    {.testId = 8, .test_function = angleops_test8, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "angle of vector v(200,100)", .verbose=3},
    {.testId = 9, .test_function = angleops_test9, .nbitplanes=1, .nrows=64, .nbyterow=64,.title = "angle of vector v(63,28)", .verbose=3},


    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"angleops.test")
