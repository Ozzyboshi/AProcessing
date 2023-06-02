#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *angleops_test1();
unsigned char *angleops_test2();
unsigned char *angleops_test3();


struct _test TESTS[] = {
    {.testId = 1, .test_function = angleops_test1, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "angle of vector v(1,1) in q10,6 format", .verbose=0},
    {.testId = 2, .test_function = angleops_test2, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "angle of vector v(100,200) in q10,6 format", .verbose=0},
    {.testId = 3, .test_function = angleops_test3, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "angle of vector v(50,70) in q10,6 format", .verbose=0},
   
    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"angleops.test")
