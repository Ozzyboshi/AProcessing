#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *drawpolygon_test1();
unsigned char *drawpolygon_test2();
unsigned char *drawpolygon_test3();
unsigned char *drawpolygon_test4();
unsigned char *drawpolygon_test5();
unsigned char *drawpolygon_test6();
unsigned char *drawpolygon_test7();
unsigned char *drawpolygon_test8();
unsigned char *drawpolygon_test9();

struct _test TESTS[] = {
    {.testId = 1, .test_function = drawpolygon_test1, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered", .verbose=0},
    {.testId = 2, .test_function = drawpolygon_test2, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered and rotated by 30", .verbose=0},
    {.testId = 3, .test_function = drawpolygon_test3, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle with negative values at center of the screen", .verbose=0},
    {.testId = 4, .test_function = drawpolygon_test4, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle rotated 359", .verbose=0},
    {.testId = 5, .test_function = drawpolygon_test5, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "thin triangle", .verbose=0},
    {.testId = 6, .test_function = drawpolygon_test6, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "thin triangle rotated", .verbose=0},
    {.testId = 7, .test_function = drawpolygon_test7, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "short triangle", .verbose=0},
    {.testId = 8, .test_function = drawpolygon_test8, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "short triangle rotated", .verbose=0},
    {.testId = 9, .test_function = drawpolygon_test9, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "Triangle centered one color", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"drawpolygon.test")
