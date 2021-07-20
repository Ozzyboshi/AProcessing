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
unsigned char *filline_test16();
unsigned char *filline_test17();
unsigned char *filline_test18();
unsigned char *filline_test19();
unsigned char *filline_test20();
unsigned char *filline_test21();
unsigned char *filline_test22();
unsigned char *filline_test23();
unsigned char *filline_test24();
unsigned char *filline_test25();
unsigned char *filline_test26();
unsigned char *filline_test27();
unsigned char *filline_test28();
unsigned char *filline_test29();
unsigned char *filline_test30();
unsigned char *filline_test31();
unsigned char *filline_test32();
unsigned char *filline_test33();
unsigned char *filline_test34();
unsigned char *filline_test35();
unsigned char *filline_test36();
unsigned char *filline_test37();
unsigned char *filline_test38();
unsigned char *filline_test39();
unsigned char *filline_test40();
unsigned char *filline_test41();
unsigned char *filline_test42();
unsigned char *filline_test43();
unsigned char *filline_test44();

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

    // Clipping
    {.testId = 16, .test_function = filline_test16, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Triangle left line 0 -5 , -5 5", .verbose=0}, 
    {.testId = 17, .test_function = filline_test17, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Triangle base line -5 5 , 5 5", .verbose=0}, 
    {.testId = 18, .test_function = filline_test18, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Triangle base line 0 -5 , 5 5", .verbose=0}, 
    {.testId = 19, .test_function = filline_test19, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Triangle base line 0 -5 , 5 5 , -5 5", .verbose=0}, 
    {.testId = 20, .test_function = filline_test20, .nbitplanes=1,.nrows=256,.nbyterow=4,.title = "Big horizontal line -100,0 600,0", .verbose=0}, 
    {.testId = 21, .test_function = filline_test21, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "8,10 - 350,2 Xb clipping", .verbose=0},
    {.testId = 22, .test_function = filline_test22, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "350,2 - 320,8 Xb clipping", .verbose=0},
    {.testId = 23, .test_function = filline_test23, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "321,2 - 350,8 Xb clipping", .verbose=0},
    {.testId = 24, .test_function = filline_test24, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "319,2 - 320,2 Xb clipping", .verbose=0},
    {.testId = 25, .test_function = filline_test25, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "-1,2 - -10,20 Xa clipping", .verbose=0},
    {.testId = 26, .test_function = filline_test26, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "10,20 - -1,2 Xa clipping", .verbose=0},
    {.testId = 27, .test_function = filline_test27, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "-100,128 - 400,128 Xa and Xb clipping", .verbose=0},
    {.testId = 28, .test_function = filline_test28, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "400,128 - -100,128 Xa and Xb clipping", .verbose=0},
    {.testId = 29, .test_function = filline_test29, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "-10,-1 - 399,265 Xa and Xb clipping", .verbose=0},
    {.testId = 30, .test_function = filline_test30, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "110,-20 - 100,300 Xa and Xb clipping", .verbose=0},
    {.testId = 31, .test_function = filline_test31, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "-10,-20 - 100,300 Xa and Xb clipping", .verbose=0},
    {.testId = 32, .test_function = filline_test32, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "-1,-1 - 1,1 Xa clipping", .verbose=0},
    {.testId = 33, .test_function = filline_test33, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "100,254 - 101,256 Yb clipping", .verbose=0},
    {.testId = 34, .test_function = filline_test34, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "101,256 - 100,254 Yb clipping", .verbose=0},
    {.testId = 35, .test_function = filline_test35, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "100,-100 - 100,1000 Ya Yb clipping", .verbose=0},
    {.testId = 36, .test_function = filline_test36, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "200,260 - 400,220 Ya Xb clipping", .verbose=0},
    {.testId = 37, .test_function = filline_test37, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "-1,-1 - 256,256 Xa Xb clipping", .verbose=0},
    {.testId = 38, .test_function = filline_test38, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "-1500,-1500 - 2000,1000 diagonal OOB", .verbose=0},
    {.testId = 39, .test_function = filline_test39, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "-1500,-1500 - 555,700 Xa and Ya clipping", .verbose=0},
    {.testId = 40, .test_function = filline_test40, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "300,500 - 320,-10 Xb and Yb clipping", .verbose=0},
    {.testId = 41, .test_function = filline_test41, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "0,-5 - -5,5 Xa clipping OOB", .verbose=0},
    {.testId = 42, .test_function = filline_test42, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "#319,#255-5,#319-5,#255+5", .verbose=0},
    {.testId = 43, .test_function = filline_test43, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "#319,#255-5,#319+5,#255+5", .verbose=0},
    {.testId = 44, .test_function = filline_test44, .nbitplanes=1, .nrows=256, .nbyterow=4,.title = "the 2 above combined", .verbose=0},

    {.testId = 0, .test_function = NULL}

};

TEST_FUNC_IMPLEMENTATION(TESTS,"filline.test");
