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
unsigned char *vectorssimpleops_test25();
unsigned char *vectorssimpleops_test26();
unsigned char *vectorssimpleops_test27();
unsigned char *vectorssimpleops_test28();
unsigned char *vectorssimpleops_test29();
unsigned char *vectorssimpleops_test30();
unsigned char *vectorssimpleops_test31();
unsigned char *vectorssimpleops_test32();
unsigned char *vectorssimpleops_test33();
unsigned char *vectorssimpleops_test34();
unsigned char *vectorssimpleops_test35();
unsigned char *vectorssimpleops_test36();
unsigned char *vectorssimpleops_test37();
unsigned char *vectorssimpleops_test38();
unsigned char *vectorssimpleops_test39();
unsigned char *vectorssimpleops_test40();
unsigned char *vectorssimpleops_test41();
unsigned char *vectorssimpleops_test42();
unsigned char *vectorssimpleops_test43();
unsigned char *vectorssimpleops_test44();
unsigned char *vectorssimpleops_test45();
unsigned char *vectorssimpleops_test46();
unsigned char *vectorssimpleops_test47();
unsigned char *vectorssimpleops_test48();
unsigned char *vectorssimpleops_test49();
unsigned char *vectorssimpleops_test50();
unsigned char *vectorssimpleops_test51();
unsigned char *vectorssimpleops_test52();
unsigned char *vectorssimpleops_test53();
unsigned char *vectorssimpleops_test54();

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
    {.testId = 25, .test_function = vectorssimpleops_test25, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "limit 2d vector 100,100 to 10", .verbose=0},
    {.testId = 26, .test_function = vectorssimpleops_test26, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "limit 2d vector 100,-100 10 10", .verbose=0},
    {.testId = 27, .test_function = vectorssimpleops_test27, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "limit 2d vector 10,20 to 2", .verbose=0},
    {.testId = 28, .test_function = vectorssimpleops_test28, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "limit 2d vector 10,20 to 25", .verbose=0},
    {.testId = 29, .test_function = vectorssimpleops_test29, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "static div v1(99,4) with v2(3,2)", .verbose=0},
    {.testId = 30, .test_function = vectorssimpleops_test30, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "div v1(99,4) with v2(3,2)", .verbose=0},
    {.testId = 31, .test_function = vectorssimpleops_test31, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "static div v1(0,8) with v2(2,2)", .verbose=0},
    {.testId = 32, .test_function = vectorssimpleops_test32, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "div v1(0,8) with v2(2,2)", .verbose=0},
    {.testId = 33, .test_function = vectorssimpleops_test33, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "create vector from angle 0", .verbose=0},
    {.testId = 34, .test_function = vectorssimpleops_test34, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "create vector from angle 90", .verbose=0},
    {.testId = 35, .test_function = vectorssimpleops_test35, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "mul v1(3) with v2(5,7)", .verbose=0},
    {.testId = 36, .test_function = vectorssimpleops_test36, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "get magnitude of 2dvector 3,0 q10.6 in table", .verbose=0},
    {.testId = 37, .test_function = vectorssimpleops_test37, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "get magnitude of 2dvector -5,-6 q10.6 in table", .verbose=0},
    {.testId = 38, .test_function = vectorssimpleops_test38, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "get magnitude of 2dvector 30,9 q10.6 in table", .verbose=0},
    {.testId = 39, .test_function = vectorssimpleops_test39, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "set magnitude of 2dvector -1.5,0 q10.6 fmt to 0.015625", .verbose=0},
    {.testId = 40, .test_function = vectorssimpleops_test40, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "set magnitude of 2dvector -1.5,1.5 q10.6 fmt to 0.5", .verbose=0},
    {.testId = 41, .test_function = vectorssimpleops_test41, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "set magnitude of 2dvector 3.33,-2.5 q10.6 fmt to 1.89", .verbose=0},
    {.testId = 42, .test_function = vectorssimpleops_test42, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "set magnitude of 2dvector  0.5625,-0.828125 q10.6 fmt to 0.015625", .verbose=0},
    {.testId = 43, .test_function = vectorssimpleops_test43, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "set magnitude of 2dvector  0.5625,-0.828125 q4.12 fmt to 0.015625", .verbose=0},
    {.testId = 44, .test_function = vectorssimpleops_test44, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "mul v1(3) with v2(15,21)", .verbose=0},
    {.testId = 45, .test_function = vectorssimpleops_test45, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "mul v1(0.5) with v2(3,3)", .verbose=0},
    {.testId = 46, .test_function = vectorssimpleops_test46, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "mul v1(-0.5) with v2(3,3)", .verbose=0},
    {.testId = 47, .test_function = vectorssimpleops_test47, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "limit v1(1,1) to 0.5 in q 4 12 fmt", .verbose=0},
    {.testId = 48, .test_function = vectorssimpleops_test48, .nbitplanes=1, .nrows=2, .nbyterow=2,.title = "limit v1(3,0) to 1.5 in q 4 12 fmt", .verbose=0},
    {.testId = 49, .test_function = vectorssimpleops_test49, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "dot product of v1(1,2) and v2(3,4) in q 6 10 fmt", .verbose=0},
    {.testId = 50, .test_function = vectorssimpleops_test50, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "dot product of v1(1,-2) and v2(3,4) in q 6 10 fmt", .verbose=0},
    {.testId = 51, .test_function = vectorssimpleops_test51, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "dot product of v1(-0.5,-1) and v2(-0.25,-2) in q 6 10 fmt", .verbose=0},
    {.testId = 52, .test_function = vectorssimpleops_test52, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "angle between v1(1,2) and v2(3,4) in q 6 10 fmt", .verbose=0},
    {.testId = 53, .test_function = vectorssimpleops_test53, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "dot product of v1(10,20) and v2(30,1) in q 6 10 fmt", .verbose=0},
    {.testId = 54, .test_function = vectorssimpleops_test54, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "angle between v1(10,20) and v2(-30,1) in q 6 10 fmt", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"vectorsimpleops.test")
