#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *math_test1();
unsigned char *math_test2();
unsigned char *math_test3();
unsigned char *math_test4();
unsigned char *math_test5();
unsigned char *math_test6();
unsigned char *math_test7();
unsigned char *math_test8();
unsigned char *math_test9();
unsigned char *math_test10();
unsigned char *math_test11();
unsigned char *math_test12();
unsigned char *math_test13();
unsigned char *math_test14();
unsigned char *math_test15();
unsigned char *math_test16();
unsigned char *math_test17();
unsigned char *math_test18();
unsigned char *math_test19();
unsigned char *math_test20();
unsigned char *math_test21();
unsigned char *math_test22();
unsigned char *math_test23();
unsigned char *math_test24();
unsigned char *math_test25();
unsigned char *math_test26();
unsigned char *math_test27();
unsigned char *math_test28();
unsigned char *math_test29();
unsigned char *math_test30();
unsigned char *math_test31();
unsigned char *math_test32();
unsigned char *math_test33();
unsigned char *math_test34();
unsigned char *math_test35();
unsigned char *math_test36();
unsigned char *math_test37();
unsigned char *math_test38();
unsigned char *math_test39();

struct _test TESTS[] = {
    {.testId = 1, .test_function = math_test1, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "abs word memory 1", .verbose=0},
    {.testId = 2, .test_function = math_test2, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "abs word memory -1", .verbose=0},
    {.testId = 3, .test_function = math_test3, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 10", .verbose=0},
    {.testId = 4, .test_function = math_test4, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 40000", .verbose=0},
    {.testId = 5, .test_function = math_test5, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 160000", .verbose=0},
    {.testId = 6, .test_function = math_test6, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 123455", .verbose=0},
    {.testId = 7, .test_function = math_test7, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "sqrt 123455", .verbose=0},
    {.testId = 8, .test_function = math_test8, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if 14 between 15 and 345", .verbose=0},
    {.testId = 9, .test_function = math_test9, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if 15 between 15 and 345", .verbose=0},
    {.testId = 10, .test_function = math_test10, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if 345 between 15 and 345", .verbose=0},
    {.testId = 11, .test_function = math_test11, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if 346 between 15 and 345", .verbose=0},
    {.testId = 12, .test_function = math_test12, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if unsigned word 65535>346 test 1", .verbose=0},
    {.testId = 13, .test_function = math_test13, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if unsigned word 350>350 test 2", .verbose=0},
    {.testId = 14, .test_function = math_test14, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if unsigned word 10>350 test 3", .verbose=0},
    {.testId = 15, .test_function = math_test15, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 65535>346 test 1", .verbose=0},
    {.testId = 16, .test_function = math_test16, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 350>350 test 2", .verbose=0},
    {.testId = 17, .test_function = math_test17, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 1000>350 test 3", .verbose=0},
    {.testId = 18, .test_function = math_test18, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if unsigned word 65535>=346 test 1", .verbose=0},
    {.testId = 19, .test_function = math_test19, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if unsigned word 350>=350 test 2", .verbose=0},
    {.testId = 20, .test_function = math_test20, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if unsigned word 10>=350 test 3", .verbose=0},
    {.testId = 21, .test_function = math_test21, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 65535>=346 test 1", .verbose=0},
    {.testId = 22, .test_function = math_test22, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 350>=350 test 2", .verbose=0},
    {.testId = 23, .test_function = math_test23, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 10>=350 test 3", .verbose=0},
    {.testId = 24, .test_function = math_test24, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 65535<1 test 3", .verbose=0},
    {.testId = 25, .test_function = math_test25, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 350<350 test 1", .verbose=0},
    {.testId = 26, .test_function = math_test26, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 350<65535 test 2", .verbose=0},
    {.testId = 27, .test_function = math_test27, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 10<350 test 3", .verbose=0},
    {.testId = 28, .test_function = math_test28, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 65535<=1 test 3", .verbose=0},
    {.testId = 29, .test_function = math_test29, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 350<=350 test 1", .verbose=0},
    {.testId = 30, .test_function = math_test30, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 350<=65535 test 2", .verbose=0},
    {.testId = 31, .test_function = math_test31, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 10=<350 test 3", .verbose=0},
    {.testId = 32, .test_function = math_test32, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 65535<1 test 3", .verbose=0},
    {.testId = 33, .test_function = math_test33, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 350<350 test 1", .verbose=0},
    {.testId = 34, .test_function = math_test34, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 350<65535 test 2", .verbose=0},
    {.testId = 35, .test_function = math_test35, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 10<350 test 3", .verbose=0},
    {.testId = 36, .test_function = math_test36, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 65535<=1 test 3", .verbose=0},
    {.testId = 37, .test_function = math_test37, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 350<=350 test 1", .verbose=0},
    {.testId = 38, .test_function = math_test38, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 350<=65535 test 2", .verbose=0},
    {.testId = 39, .test_function = math_test39, .nbitplanes=1, .nrows=1, .nbyterow=2,.title = "check if signed word 10<=350 test 3", .verbose=0},
    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"math.test")
