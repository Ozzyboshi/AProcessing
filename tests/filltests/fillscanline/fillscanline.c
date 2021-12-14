/*******************************************************************************************/
/*** Test fill line checks  				                                             ***/
/*** These tests checks if bitplanes are correctly filled                                ***/
/*** according to the FILL_TABLE 				                                         ***/
/*** Each row in the fill table is 32 bits:                                              ***/
/*** - first word : xleft                                                                ***/
/*** - second word : xright                                                              ***/
/*** each row is repeated 256 times, row 0 corresponds to bitplane first row and so on...***/
/*******************************************************************************************/
#include "../../testlibs/testlib.h"
#include <stdio.h>
#include <stdlib.h>

int make_test();


unsigned char *fillscanline_test1();
unsigned char *fillscanline_test2();
unsigned char *fillscanline_test3();
unsigned char *fillscanline_test4();
unsigned char *fillscanline_test5();
unsigned char *fillscanline_test6();
unsigned char *fillscanline_test7();
unsigned char *fillscanline_test8();
unsigned char *fillscanline_test9();
unsigned char *fillscanline_test10();
unsigned char *fillscanline_test11();
unsigned char *fillscanline_test12();
unsigned char *fillscanline_test13();
unsigned char *fillscanline_test14();
unsigned char *fillscanline_test15();
unsigned char *fillscanline_test16();

struct _test TESTS[] = {
    {.testId = 1, .test_function = fillscanline_test1, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "From px 15 to 102 first row", .verbose=0 }, // Pixel 15 up to 102 first line (line number 0)
    {.testId = 2, .test_function = fillscanline_test2, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = " Pixel 1 up to 2 first line", .verbose=0}, // Pixel 1 up to 2 first line (line number 0)
    {.testId = 3, .test_function = fillscanline_test3, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = " Pixel 1 up to 2 second line", .verbose=0}, // Pixel 1 up to 2 second line (line number 1)
    {.testId = 4, .test_function = fillscanline_test4, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "Whole first line", .verbose=0}, // Whole first line
    {.testId = 5, .test_function = fillscanline_test5, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "First 2 rows", .verbose=0}, // Whole first 2 rows
    {.testId = 6, .test_function = fillscanline_test6, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "First bit of first row", .verbose=0},
    {.testId = 7, .test_function = fillscanline_test7, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = " Pixel 1 up to 2 first line both bitplanes", .verbose=0},
    {.testId = 8, .test_function = fillscanline_test8, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = " Pixel 4 up to 8 first line both bitplanes", .verbose=0},
    {.testId = 9, .test_function = fillscanline_test9, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "Whole first line both bitplanes", .verbose=0}, // Whole first line
    {.testId = 10, .test_function = fillscanline_test10, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "Row 2 and 3 from px 8 to 16 both bitplanes", .verbose=0}, // Whole first line
    {.testId = 11, .test_function = fillscanline_test11,  .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "Row 0 from px 8 to 31 first and second bitplane " , .verbose=0}, // Whole first line
    {.testId = 12, .test_function = fillscanline_test12,  .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "Row 2-3 from px 8 to 31 second bitplane " , .verbose=0}, // Whole first line
    {.testId = 13, .test_function = fillscanline_test13,  .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "Row 0 from px 0 to 6 second bitplane " , .verbose=0}, // Whole first line
    {.testId = 14, .test_function = fillscanline_test14,  .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "Row 0 from px 0 to <0  first bitplane " , .verbose=0}, // Whole first line
    {.testId = 15, .test_function = fillscanline_test15,  .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "From px 15 to 102 first row with noreset" , .verbose=0}, // Whole first line
    {.testId = 16, .test_function = fillscanline_test16, .nbitplanes=2,.nrows=256,.nbyterow=40, .title = "From px 15 to 102 first row color 2", .verbose=0 }, // Pixel 15 up to 102 first line (line number 0)

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"filline.test")
