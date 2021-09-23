/*******************************************************************************************/
/*** Test fill line checks  				                                             ***/
/*** These tests checks if bitplanes are correctly filled                                ***/
/*** according to the FILL_TABLE 				                                         ***/
/*** Each row in the fill table is 32 bits:                                              ***/
/*** - first word : xleft                                                                ***/
/*** - second word : xright                                                              ***/
/*** each row is repeated 256 times, row 0 corresponds to bitplane first row and so on...***/
/*******************************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

//int make_test_patched(struct _test , const char *,int);


unsigned char *filline_test1();
unsigned char *filline_test2();
unsigned char *filline_test3();
unsigned char *filline_test4();
unsigned char *filline_test5();
unsigned char *filline_test6();
unsigned char *filline_test7();
unsigned char *filline_test8();
unsigned char *filline_test9();
unsigned char *filline_test10();
unsigned char *filline_test11();
unsigned char *filline_test12();
unsigned char *filline_test13();
unsigned char *filline_test14();
unsigned char *filline_test15();

struct _test TESTS[] = {
    {.testId = 1, .test_function = filline_test1, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "1,1 8,5 -> 10,1 18,5 0<m<1", .verbose=0},
    {.testId = 2, .test_function = filline_test2, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "8,5 1,1 -> 18,5 10,1 0<m<1", .verbose=0},
    {.testId = 3, .test_function = filline_test3, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "10,1 18,5 -> 1,1 8,5 0<m<1", .verbose=0},
    {.testId = 4, .test_function = filline_test4, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "1,1 8,5 -> 10,1 18,5 0<m<1", .verbose=0},
    {.testId = 5, .test_function = filline_test5, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "8,5 1,1 -> 10,1 18,5 0<m<1", .verbose=0},
    {.testId = 6, .test_function = filline_test6, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "1,1 3,2 155,5", .verbose=0}, 

    // Start of vertical
    {.testId = 7, .test_function = filline_test7, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "1,1 1,2", .verbose=0}, 
    {.testId = 8, .test_function = filline_test8, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "0,0 1,7", .verbose=0},
    {.testId = 9, .test_function = filline_test9, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "0,0 8,18", .verbose=0}, 
    {.testId = 10, .test_function = filline_test10, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "0,0 0,1 -> 319,0,319,1", .verbose=0}, 
    
    // Shapes
    {.testId = 11, .test_function = filline_test11, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Square from 10,10 to 20,20", .verbose=0}, 
    {.testId = 12, .test_function = filline_test12, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Line 16,2 8,26", .verbose=0},
    {.testId = 13, .test_function = filline_test13, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Triangle 16,2 8,26 - 8,16 28,16 - 16,2 28,26", .verbose=0}, 

    // Horizontal line
    {.testId = 14, .test_function = filline_test14, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Horizontal line going to top right 16,2 8,10", .verbose=0}, 

    // Circle
    {.testId = 15, .test_function = filline_test15, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Circle", .verbose=0}, 

    
    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"filline.test");
