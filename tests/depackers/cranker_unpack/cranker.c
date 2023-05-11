#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *cranker_test1();
unsigned char *cranker_test2();
unsigned char *cranker_test3();
unsigned char *cranker_test4();
unsigned char *cranker_test5();
unsigned char *cranker_test6();
unsigned char *cranker_test7();
unsigned char *cranker_test8();

struct _test TESTS[] = {
    {.testId = 1, .test_function = cranker_test1, .nbitplanes=1, .nrows=1, .nbyterow=54,.title = "small file", .verbose=0},
    {.testId = 2, .test_function = cranker_test2, .nbitplanes=1, .nrows=1, .nbyterow=51264,.title = "medium file 1", .verbose=0},
    {.testId = 3, .test_function = cranker_test3, .nbitplanes=1, .nrows=1, .nbyterow=51264,.title = "medium file 2", .verbose=0},
    {.testId = 4, .test_function = cranker_test4, .nbitplanes=1, .nrows=1, .nbyterow=51264,.title = "medium file 3", .verbose=0},
    {.testId = 5, .test_function = cranker_test5, .nbitplanes=1, .nrows=1, .nbyterow=51264,.title = "medium file 4", .verbose=0},
    {.testId = 6, .test_function = cranker_test6, .nbitplanes=1, .nrows=1, .nbyterow=51264,.title = "medium file 5", .verbose=0},
    {.testId = 7, .test_function = cranker_test7, .nbitplanes=1, .nrows=1, .nbyterow=124912,.title = "big file 1", .verbose=0},
    {.testId = 8, .test_function = cranker_test8, .nbitplanes=1, .nrows=1, .nbyterow=124912,.title = "big file 2", .verbose=0},
    
    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"cranker.test")
