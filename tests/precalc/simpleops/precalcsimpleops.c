#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *precalcsimpleops_test1();
unsigned char *precalcsimpleops_test2();
unsigned char *precalcsimpleops_test3();
unsigned char *precalcsimpleops_test4();
unsigned char *precalcsimpleops_test5();
unsigned char *precalcsimpleops_test6();
unsigned char *precalcsimpleops_test7();
unsigned char *precalcsimpleops_test8();
unsigned char *precalcsimpleops_test9();
unsigned char *precalcsimpleops_test10();
unsigned char *precalcsimpleops_test11();

struct _test TESTS[] = {
    {.testId = 1, .test_function = precalcsimpleops_test1, .nbitplanes=1, .nrows=361, .nbyterow=8,.title = "default table", .verbose=0},
    {.testId = 2, .test_function = precalcsimpleops_test2, .nbitplanes=1, .nrows=361, .nbyterow=8,.title = "default table", .verbose=0},
    {.testId = 3, .test_function = precalcsimpleops_test3, .nbitplanes=1, .nrows=16, .nbyterow=2,.title = "Color table from 000 to fff in 16 steps", .verbose=0},
    {.testId = 4, .test_function = precalcsimpleops_test4, .nbitplanes=1, .nrows=16, .nbyterow=2,.title = "Color table from fff to 000 in 16 steps", .verbose=0},
    {.testId = 5, .test_function = precalcsimpleops_test5, .nbitplanes=1, .nrows=16, .nbyterow=2,.title = "Color table from de8 to 315 in 16 steps", .verbose=0},
    {.testId = 6, .test_function = precalcsimpleops_test6, .nbitplanes=1, .nrows=32, .nbyterow=2,.title = "Color table from de8 to 315 in 32 steps", .verbose=0},
    {.testId = 7, .test_function = precalcsimpleops_test7, .nbitplanes=1, .nrows=64, .nbyterow=2,.title = "Color table from de8 to 315 in 64 steps", .verbose=0},
    {.testId = 8, .test_function = precalcsimpleops_test8, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "Duplicate binary 00001110", .verbose=0},
    {.testId = 9, .test_function = precalcsimpleops_test9, .nbitplanes=1, .nrows=128, .nbyterow=2,.title = "Blue to purple then black", .verbose=0},
    {.testId = 10, .test_function = precalcsimpleops_test10, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "Map 127 - 0,254  500,5500", .verbose=0},
    {.testId = 11, .test_function = precalcsimpleops_test11, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "Map 700 - 500,5500  254,0", .verbose=0},


    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"precalcsimpleops.test")
