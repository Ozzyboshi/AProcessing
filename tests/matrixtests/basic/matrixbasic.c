
#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *matrix_test1();
unsigned char *matrix_test2();
unsigned char *matrix_test3();
unsigned char *matrix_test4();

struct _test TESTS[] = {
    {.testId = 1, .test_function = matrix_test1, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Default transformation matrix read on op1", .verbose=0},
    {.testId = 2, .test_function = matrix_test2, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Default transformation matrix read on op2", .verbose=0},
    {.testId = 3, .test_function = matrix_test3, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Update current transformation matrix", .verbose=0},
    {.testId = 4, .test_function = matrix_test4, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Matrix Push Pop test", .verbose=0},
    {.testId = 0, .test_function = NULL}

};
TEST_FUNC_IMPLEMENTATION(TESTS,"filline.test")
