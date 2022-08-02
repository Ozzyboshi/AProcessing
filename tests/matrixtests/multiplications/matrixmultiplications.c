// Test with
// https://www.exploringbinary.com/binary-converter/
// https://www.rapidtables.com/convert/number/binary-to-hex.html

#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *matrix_multest1();
unsigned char *matrix_multest2();
unsigned char *matrix_multest3();
unsigned char *matrix_multest4();
unsigned char *matrix_multest5();
unsigned char *matrix_multest6();
unsigned char *matrix_multest7();
unsigned char *matrix_multest8();
unsigned char *matrix_multest9();
unsigned char *matrix_multest10();
unsigned char *matrix_multest11();
unsigned char *matrix_multest12();
unsigned char *matrix_multest13();
unsigned char *matrix_multest14();
unsigned char *matrix_multest15();
unsigned char *matrix_multest16();
unsigned char *matrix_multest17();
unsigned char *matrix_multest18();
unsigned char *matrix_multest19();
unsigned char *matrix_multest20();
unsigned char *matrix_multest21();
unsigned char *matrix_multest22();
unsigned char *matrix_multest23();
unsigned char *matrix_multest24();
unsigned char *matrix_multest25();
unsigned char *matrix_multest26();

struct _test TESTS[] = {
    {.testId = 1, .test_function = matrix_multest1, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "default tr matrix vs all ones", .verbose=0},
    {.testId = 2, .test_function = matrix_multest2, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "all positive ractional numbers", .verbose=0},
    {.testId = 3, .test_function = matrix_multest3, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "as above but with -1 on first row matrix", .verbose=0},
    {.testId = 4, .test_function = matrix_multest4, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "as above but with -1 1X3 mult", .verbose=0},
    {.testId = 5, .test_function = matrix_multest5, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "as above but with negatives 1X3 mult", .verbose=0},
    {.testId = 6, .test_function = matrix_multest6, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Translate to center screen", .verbose=0},
    {.testId = 7, .test_function = matrix_multest7, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "Translate to center screen 2 passes", .verbose=0},
    {.testId = 8, .test_function = matrix_multest8, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "3X3 mult with 11 decimals", .verbose=0},
    {.testId = 9, .test_function = matrix_multest9, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "45 deg rotation matrix", .verbose=0},
    {.testId = 10, .test_function = matrix_multest10, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point 10,0 rotated 90 deg and translated to center", .verbose=0},
    {.testId = 11, .test_function = matrix_multest11, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point 10,0 scaled by 0,5 on x and y", .verbose=0},
    {.testId = 12, .test_function = matrix_multest12, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point 10,5 scaled by  2x and 3y", .verbose=0},
    {.testId = 13, .test_function = matrix_multest13, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point 10,5 sheared by 3x and 4y", .verbose=0},
    {.testId = 14, .test_function = matrix_multest14, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point -5,-5 rotated by 45", .verbose=0},
    {.testId = 15, .test_function = matrix_multest15, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point 5,-5 rotated by 45", .verbose=0},
    {.testId = 16, .test_function = matrix_multest16, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point 5,-5 rotated by 45", .verbose=0},
    {.testId = 17, .test_function = matrix_multest17, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point 10,0 rotated 90 deg and translated to center", .verbose=0},
    {.testId = 18, .test_function = matrix_multest18, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "default tr matrix vs all ones with register as args", .verbose=0},
    {.testId = 19, .test_function = matrix_multest19, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "all positive ractional numbers reg", .verbose=0},
    {.testId = 20, .test_function = matrix_multest20, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "as above but with -1 on first row matrix reg", .verbose=0},
    {.testId = 21, .test_function = matrix_multest21, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "as above but with -1 on first row matrix reg with op2 load", .verbose=0},
    {.testId = 22, .test_function = matrix_multest22, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point 10,5 sheared by 3x and 4y with reg", .verbose=0},
    {.testId = 23, .test_function = matrix_multest23, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point 5,-5 rotated by 45 reg", .verbose=0},
    {.testId = 24, .test_function = matrix_multest24, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point 10,0 rotated 90 deg and translated to center reg", .verbose=0},
    {.testId = 25, .test_function = matrix_multest25, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point 10,0 scaled by 0,5 on x and y reg", .verbose=0},
    {.testId = 26, .test_function = matrix_multest26, .nbitplanes=1, .nrows=3, .nbyterow=8,.title = "point 10,5 scaled by  2x and 3y reg", .verbose=0},


    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"filline.test")
