// Test with
// https://www.exploringbinary.com/binary-converter/
// https://www.rapidtables.com/convert/number/binary-to-hex.html

#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *drawing_test3d1();
unsigned char *drawing_test3d2();
unsigned char *drawing_test3d3();
unsigned char *drawing_test3d4();
unsigned char *drawing_test3d5();

struct _test TESTS[] = {
    {.testId = 1, .test_function = drawing_test3d1, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "triangle rotated filled", .verbose=0},
    {.testId = 2, .test_function = drawing_test3d2, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "2 triangle rotated overlapped (one upside down)", .verbose=0},
    {.testId = 3, .test_function = drawing_test3d3, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "square not rotated filled", .verbose=0},
    {.testId = 4, .test_function = drawing_test3d4, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "square rotatedx rotated filled", .verbose=0},
    {.testId = 5, .test_function = drawing_test3d5, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "square rotatedy rotated filled", .verbose=0},
  
    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"drawline.test")
