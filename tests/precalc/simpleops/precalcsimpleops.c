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
unsigned char *precalcsimpleops_test12();
unsigned char *precalcsimpleops_test13();
unsigned char *precalcsimpleops_test14();
unsigned char *precalcsimpleops_test15();
unsigned char *precalcsimpleops_test16();
unsigned char *precalcsimpleops_test17();
unsigned char *precalcsimpleops_test18();
unsigned char *precalcsimpleops_test19();
unsigned char *precalcsimpleops_test20();

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
    {.testId = 12, .test_function = precalcsimpleops_test12, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "Map 10 - -10,10  -160,160", .verbose=0},
    {.testId = 13, .test_function = precalcsimpleops_test13, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "Map 10 - -160,160 -10,10 ", .verbose=0},
    {.testId = 14, .test_function = precalcsimpleops_test14, .nbitplanes=1, .nrows=1, .nbyterow=6,.title = "Convert dec 1234 to ascii", .verbose=0},
    {.testId = 15, .test_function = precalcsimpleops_test15, .nbitplanes=1, .nrows=1, .nbyterow=6,.title = "Convert dec 1234 to ascii with upper part trashed", .verbose=0},
    {.testId = 16, .test_function = precalcsimpleops_test16, .nbitplanes=1, .nrows=1, .nbyterow=1,.title = "Half binary 0000111000001110", .verbose=0},
    {.testId = 17, .test_function = precalcsimpleops_test17, .nbitplanes=1, .nrows=1, .nbyterow=1,.title = "Half binary 1101001000101110", .verbose=0},
    {.testId = 18, .test_function = precalcsimpleops_test18, .nbitplanes=1, .nrows=3, .nbyterow=4,.title = "Bubble sort ordering of 3 records", .verbose=0},
    {.testId = 19, .test_function = precalcsimpleops_test19, .nbitplanes=1, .nrows=10, .nbyterow=4,.title = "Bubble sort ordering of 10 records", .verbose=0},
    {.testId = 20, .test_function = precalcsimpleops_test20, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "Mirror sequence 1101001000101110", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"precalcsimpleops.test")
