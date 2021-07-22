// Test with
// https://www.exploringbinary.com/binary-converter/
// https://www.rapidtables.com/convert/number/binary-to-hex.html

#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *drawing_test1();
unsigned char *drawing_test2();
unsigned char *drawing_test3();
unsigned char *drawing_test4();
unsigned char *drawing_test5();
unsigned char *drawing_test6();
unsigned char *drawing_test7();
unsigned char *drawing_test8();
unsigned char *drawing_test9();

struct _test TESTS[] = {
    {.testId = 1, .test_function = drawing_test1, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "square rotated filled", .verbose=0},
    {.testId = 2, .test_function = drawing_test2, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "triangle rotated 0deg filled", .verbose=0},
    {.testId = 3, .test_function = drawing_test3, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "triangle rotated 180deg filled", .verbose=0},
    {.testId = 4, .test_function = drawing_test4, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "rectangle rotated 0deg filled", .verbose=0},
    {.testId = 5, .test_function = drawing_test5, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "rectangle rotated 30deg filled", .verbose=0},
    {.testId = 6, .test_function = drawing_test6, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "rectangle scaled by 0.5 o n Y axis", .verbose=0},
    {.testId = 7, .test_function = drawing_test7, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Circle with r=10", .verbose=0},
    {.testId = 8, .test_function = drawing_test8, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Circle overlapped with square", .verbose=0},
    // Start clipping
    {.testId = 9, .test_function = drawing_test9, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Square centered on origin and rotated", .verbose=0},



    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"drawline.test")
