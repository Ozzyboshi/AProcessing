#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *vampire_test1();
unsigned char *vampire_test2();
unsigned char *vampire_test3();
unsigned char *vampire_test4();
unsigned char *vampire_test5();
unsigned char *vampire_test6();
unsigned char *vampire_test7();
unsigned char *vampire_test8();
unsigned char *vampire_test9();
unsigned char *vampire_test10();
unsigned char *vampire_test11();
unsigned char *vampire_test12();
unsigned char *vampire_test13();
unsigned char *vampire_test14();
unsigned char *vampire_test15();
unsigned char *vampire_test16();
unsigned char *vampire_test17();
unsigned char *vampire_test18();
unsigned char *vampire_test19();
unsigned char *vampire_test20();
unsigned char *vampire_test21();
unsigned char *vampire_test22();
unsigned char *vampire_test23();
unsigned char *vampire_test24();

struct _test TESTS[] = {
    {.testId = 1, .test_function = vampire_test1, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "Load", .verbose=0},
    {.testId = 2, .test_function = vampire_test2, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "Load using extra regs", .verbose=0},
    {.testId = 3, .test_function = vampire_test3, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "Left shift 60", .verbose=0},
    {.testId = 4, .test_function = vampire_test4, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "Right shift 60", .verbose=0},
    {.testId = 5, .test_function = vampire_test5, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "LOADI", .verbose=0},
    {.testId = 6, .test_function = vampire_test6, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "LOADI", .verbose=0},
    {.testId = 7, .test_function = vampire_test7, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "STOREI", .verbose=0},
    {.testId = 8, .test_function = vampire_test8, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "STOREM", .verbose=0},
    {.testId = 9, .test_function = vampire_test9, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "STOREM", .verbose=0},
    {.testId = 10, .test_function = vampire_test10, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "STOREC", .verbose=0},
    {.testId = 11, .test_function = vampire_test11, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "STOREILM", .verbose=0},
    {.testId = 12, .test_function = vampire_test12, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "STOREM3", .verbose=0},
    {.testId = 13, .test_function = vampire_test13, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "ADDIW.L", .verbose=0},
    {.testId = 14, .test_function = vampire_test14, .nbitplanes=1, .nrows=1, .nbyterow=4,.title = "MOVEIW.L", .verbose=0},
    {.testId = 15, .test_function = vampire_test15, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "PADDB", .verbose=0},
    {.testId = 16, .test_function = vampire_test16, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "PADDUSB", .verbose=0},
    {.testId = 17, .test_function = vampire_test17, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "PADDW", .verbose=0},
    {.testId = 18, .test_function = vampire_test18, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "PADDUSW", .verbose=0},
    {.testId = 19, .test_function = vampire_test19, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "PMULL", .verbose=0},
    {.testId = 20, .test_function = vampire_test20, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "PMULH", .verbose=0},
    {.testId = 21, .test_function = vampire_test21, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "PMUL88", .verbose=0},            
    {.testId = 22, .test_function = vampire_test22, .nbitplanes=1, .nrows=1, .nbyterow=8,.title = "PMULA", .verbose=0},            
    {.testId = 23, .test_function = vampire_test23, .nbitplanes=5, .nrows=1, .nbyterow=8,.title = "c2p", .verbose=0},            
    {.testId = 24, .test_function = vampire_test24, .nbitplanes=1, .nrows=2, .nbyterow=16,.title = "MEMCPY16", .verbose=0},            
         
    {.testId = 0, .test_function = NULL}
};

TEST_FUNC_IMPLEMENTATION(TESTS,"simpleopsvampire.test")
