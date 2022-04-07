#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *vectorssimpleops_test1();
unsigned char *vectorssimpleops_test2();
unsigned char *vectorssimpleops_test3();
unsigned char *vectorssimpleops_test4();
unsigned char *vectorssimpleops_test5();
unsigned char *vectorssimpleops_test6();
unsigned char *vectorssimpleops_test7();
unsigned char *vectorssimpleops_test8();
unsigned char *vectorssimpleops_test9();
unsigned char *vectorssimpleops_test10();
unsigned char *vectorssimpleops_test11();
unsigned char *vectorssimpleops_test12();
unsigned char *vectorssimpleops_test13();
unsigned char *vectorssimpleops_test14();
unsigned char *vectorssimpleops_test15();
unsigned char *vectorssimpleops_test16();
unsigned char *vectorssimpleops_test17();
unsigned char *vectorssimpleops_test18();
unsigned char *vectorssimpleops_test19();
unsigned char *vectorssimpleops_test20();
unsigned char *vectorssimpleops_test21();
unsigned char *vectorssimpleops_test22();
unsigned char *vectorssimpleops_test23();
unsigned char *vectorssimpleops_test24();

struct _test TESTS[] = {
    {.testId = 1, .test_function = vectorssimpleops_test1, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "static add v1(3,4) with v2(5,6)", .verbose=0},
    {.testId = 2, .test_function = vectorssimpleops_test2, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "static sub v1(3,4) with v2(5,7)", .verbose=0},
    {.testId = 3, .test_function = vectorssimpleops_test3, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "static mul v1(3,4) with v2(5,7)", .verbose=0},
    {.testId = 4, .test_function = vectorssimpleops_test4, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "add v1(3,4) with v2(5,6)", .verbose=0},
    {.testId = 5, .test_function = vectorssimpleops_test5, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "sub v1(3,4) with v2(5,7)", .verbose=0},
    {.testId = 6, .test_function = vectorssimpleops_test6, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "mul v1(3,4) with v2(5,7)", .verbose=0},
    {.testId = 7, .test_function = vectorssimpleops_test7, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "2dvector 4,5", .verbose=0},
    {.testId = 8, .test_function = vectorssimpleops_test8, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "2dvector 5,6 with addr reg", .verbose=0},
    {.testId = 9, .test_function = vectorssimpleops_test9, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "2dvector 10,1 with addr reg", .verbose=0},
    {.testId = 10, .test_function = vectorssimpleops_test10, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "get magnitude of 2dvector 3,4", .verbose=0},
    {.testId = 11, .test_function = vectorssimpleops_test11, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "get magnitude of 2dvector -3,-4", .verbose=0},
    {.testId = 12, .test_function = vectorssimpleops_test12, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "get magnitude of 2dvector 3*64,4*64", .verbose=0},
    {.testId = 13, .test_function = vectorssimpleops_test13, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "set magnitude of 100 to 2dvector 3,4", .verbose=0},
    {.testId = 14, .test_function = vectorssimpleops_test14, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "set magnitude of 100 to 2dvector 3*64,4*64", .verbose=0},
    {.testId = 15, .test_function = vectorssimpleops_test15, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "set magnitude of 100 to 2dvector -3*64,4*64", .verbose=0},
    {.testId = 16, .test_function = vectorssimpleops_test16, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "mixed ops", .verbose=0},
    {.testId = 17, .test_function = vectorssimpleops_test17, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "south vector normalization", .verbose=0},
    {.testId = 18, .test_function = vectorssimpleops_test18, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "north vector normalization", .verbose=0},
    {.testId = 19, .test_function = vectorssimpleops_test19, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "west vector normalization", .verbose=0},
    {.testId = 20, .test_function = vectorssimpleops_test20, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "east vector normalization", .verbose=0},
    {.testId = 21, .test_function = vectorssimpleops_test21, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "zero vector normalization", .verbose=0},
    {.testId = 22, .test_function = vectorssimpleops_test22, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "decimal vector with sqrt fake", .verbose=0},
    {.testId = 23, .test_function = vectorssimpleops_test23, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "decimal vector with sqrt fake going left", .verbose=0},
    {.testId = 24, .test_function = vectorssimpleops_test24, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "setmag fake with negative x", .verbose=0},


    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"vectorsimpleops.test")
