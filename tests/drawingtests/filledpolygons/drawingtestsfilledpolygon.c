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
unsigned char *drawing_test10();
unsigned char *drawing_test11();
unsigned char *drawing_test12();
unsigned char *drawing_test13();
unsigned char *drawing_test14();
unsigned char *drawing_test15();
unsigned char *drawing_test16();
unsigned char *drawing_test17();
unsigned char *drawing_test18();
unsigned char *drawing_test19();
unsigned char *drawing_test20();
unsigned char *drawing_test21();
unsigned char *drawing_test22();
unsigned char *drawing_test23();
unsigned char *drawing_test24();

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
    {.testId = 10, .test_function = drawing_test10, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Square centered on 0,255 and rotated", .verbose=0},
    {.testId = 11, .test_function = drawing_test11, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Square centered on 319,0 and rotated", .verbose=0},
    {.testId = 12, .test_function = drawing_test12, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Square centered on 319,255 and rotated", .verbose=0},
    {.testId = 13, .test_function = drawing_test13, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered on origin and rotated", .verbose=0},
    {.testId = 14, .test_function = drawing_test14, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered on 0,255", .verbose=0},
    {.testId = 15, .test_function = drawing_test15, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered on 319,0", .verbose=0},
    {.testId = 16, .test_function = drawing_test16, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered on 319,255", .verbose=0},
    {.testId = 17, .test_function = drawing_test17, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Rotated on the origin by 90 deg", .verbose=0},
    {.testId = 18, .test_function = drawing_test18, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Rotated on the origin by 38 deg", .verbose=0},
    {.testId = 19, .test_function = drawing_test19, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Square Rotated on the origin by 220 deg", .verbose=0},
    {.testId = 20, .test_function = drawing_test20, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle filled with blitter", .verbose=0},
    {.testId = 21, .test_function = drawing_test21, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "Triangle filled with blitter test min/max Y", .verbose=0},
    // Start flipping
    {.testId = 22, .test_function = drawing_test22, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle flipped horizontally", .verbose=0},
    {.testId = 23, .test_function = drawing_test23, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle flipped vertically", .verbose=0},
    {.testId = 24, .test_function = drawing_test24, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle flipped horizontally and vertically", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"drawline.test")
