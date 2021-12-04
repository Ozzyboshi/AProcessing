#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *blitfillline_test1();
unsigned char *blitfillline_test2();
unsigned char *blitfillline_test3();
unsigned char *blitfillline_test4();
unsigned char *blitfillline_test5();
unsigned char *blitfillline_test6();
unsigned char *blitfillline_test7();
unsigned char *blitfillline_test8();
unsigned char *blitfillline_test9();
unsigned char *blitfillline_test10();
unsigned char *blitfillline_test11();
unsigned char *blitfillline_test12();
unsigned char *blitfillline_test13();
unsigned char *blitfillline_test14();
unsigned char *blitfillline_test15();

struct _test TESTS[] = {
    {.testId = 1, .test_function = blitfillline_test1, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a line 0,0-10,0 by RamJam", .verbose=0},
    {.testId = 2, .test_function = blitfillline_test2, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a line 0,50-00,5 by RamJam", .verbose=0},
    {.testId = 3, .test_function = blitfillline_test3, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a triangle 5,0-0,5-10,5 by RamJam", .verbose=0},
    {.testId = 4, .test_function = blitfillline_test4, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a triangle 15,0-0,5-30,5 by RamJam", .verbose=0},
    {.testId = 5, .test_function = blitfillline_test5, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a triangle 15,0-0,5-30,5 by RamJam", .verbose=0},
    {.testId = 6, .test_function = blitfillline_test6, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a filled triangle 15,0-0,15-30,15 by RamJam", .verbose=0},
    {.testId = 7, .test_function = blitfillline_test7, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a filled triangle 0,0-0,255-319,255 by RamJam", .verbose=0},
    {.testId = 8, .test_function = blitfillline_test8, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a filled triangle 8,1-16,1-8,255 by RamJam", .verbose=0},
    {.testId = 9, .test_function = blitfillline_test9, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a filled triangle 8,1-16,1-8,255 by RamJam", .verbose=0},
    {.testId = 10, .test_function = blitfillline_test10, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a filled triangle 8,1-16,1-8,255 by RamJam", .verbose=0},
    {.testId = 11, .test_function = blitfillline_test11, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a filled triangle 8,1-16,1-8,255 by RamJam", .verbose=0},
    {.testId = 12, .test_function = blitfillline_test12, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a filled triangle 0,0-160,255-319,0 by RamJam", .verbose=0},
    {.testId = 13, .test_function = blitfillline_test13, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a filled triangle vertical bpl2", .verbose=0},
    {.testId = 14, .test_function = blitfillline_test14, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a filled triangle vertical bpl1", .verbose=0},
    {.testId = 15, .test_function = blitfillline_test15, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a filled triangle vertical bpl1 and 2", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"blitfillline.test")
