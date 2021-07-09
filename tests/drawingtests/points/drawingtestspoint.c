// Test with
// https://www.exploringbinary.com/binary-converter/
// https://www.rapidtables.com/convert/number/binary-to-hex.html

#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *drawing_test1();


struct _test TESTS[] = {
    {.testId = 1, .test_function = drawing_test1, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "square rotated vertices", .verbose=0},
  

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"drawline.test")
