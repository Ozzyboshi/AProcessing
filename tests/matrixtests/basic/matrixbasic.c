
#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *matrix_test1();
unsigned char *matrix_test2();
unsigned char *matrix_test3();
unsigned char *matrix_test4();
unsigned char *matrix_test5();
unsigned char *matrix_test6();
unsigned char *matrix_test7();
unsigned char *matrix_test8();
unsigned char *matrix_test9();
unsigned char *matrix_test10();

struct _test TESTS[] = {
    {.testId = 1, .test_function = matrix_test1, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Default transformation matrix read on op1", .verbose=0},
    {.testId = 2, .test_function = matrix_test2, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Default transformation matrix read on op2", .verbose=0},
    {.testId = 3, .test_function = matrix_test3, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Update current transformation matrix", .verbose=0},
    {.testId = 4, .test_function = matrix_test4, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Matrix Push Pop test", .verbose=0},
    {.testId = 5, .test_function = matrix_test5, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Matrix load identity with rotatex embedded 10", .verbose=0},
    {.testId = 6, .test_function = matrix_test6, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Matrix load identity with rotatex oldstyle 10", .verbose=0},
    {.testId = 7, .test_function = matrix_test7, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Matrix load identity with rotatex embedded 100", .verbose=0},
    {.testId = 8, .test_function = matrix_test8, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Matrix load identity with rotatex oldstyle 100", .verbose=0},
    {.testId = 9, .test_function = matrix_test9, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Matrix load identity with rotatey embedded 10", .verbose=0},
    {.testId = 10, .test_function = matrix_test10, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Matrix load identity with rotatey oldstyle 10", .verbose=0},

    {.testId = 0, .test_function = NULL}

};
TEST_FUNC_IMPLEMENTATION(TESTS,"filline.test")
