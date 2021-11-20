// Test with
// https://www.exploringbinary.com/binary-converter/
// https://www.rapidtables.com/convert/number/binary-to-hex.html

#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *blitline_test1();
unsigned char *blitline_test2();
unsigned char *blitline_test3();
unsigned char *blitline_test4();
unsigned char *blitline_test5();

struct _test TESTS[] = {
    {.testId = 1, .test_function = blitline_test1, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a line 0,0-10,0 by RamJam", .verbose=0},
    {.testId = 2, .test_function = blitline_test2, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a line 0,0-10,0 by TIP/SPREADPOINT", .verbose=0},
    {.testId = 3, .test_function = blitline_test3, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a line 0,0-0,10 by RamJam", .verbose=0},
    {.testId = 4, .test_function = blitline_test4, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a line 0,0-0,10 by TIP/SPREADPOINT", .verbose=0},
    {.testId = 5, .test_function = blitline_test5, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "a line 0,0-10,0 by Oosterkamp", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"blitline.test")
