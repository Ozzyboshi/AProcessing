// Test with
// https://www.exploringbinary.com/binary-converter/
// https://www.rapidtables.com/convert/number/binary-to-hex.html

#include <stdio.h>
#include <stdlib.h>
#include "../../testlibs/testlib.h"

unsigned char *drawing_test1();
unsigned char *drawing_test2();
unsigned char *drawing_test3();

struct _test TESTS[] = {
    {.testId = 1, .test_function = drawing_test1, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "square rotated filled", .verbose=0},
    
    /*
   let bitplane = [];


function setup() {
  for (let i = 0; i < 40*256; i += 1) bitplane[i]=0;
  createCanvas(320, 256);
  noLoop();
}

function draw() {
  loadPixels();
    angleMode(DEGREES); 
  background(0);
  translate(160,128);
  rotate(0);
  fill(255);
  triangle(0,-5,-5,5,5,5);
  for (let y = 0; y <  256; y++)
  {
    let finalbit = 0;
    for (let x = 0; x <  320; x++)
    {
    pixel = get(x,y);
    if (pixel[0])
    {
      let nrow = int((y-1)*40);
      let offset = int(nrow+(x/8));
      let  bit = (x-0)%8;
      switch (bit)
        {
          case 0: finalbit|=128; bitplane[offset]|=128; break;
          case 1: finalbit|=64; bitplane[offset]|=64; break;
          case 2: finalbit|=32; bitplane[offset]|=32; break;
          case 3: finalbit|=16; bitplane[offset]|=16; break;
          case 4: finalbit|=8; bitplane[offset]|=8; break;
          case 5: finalbit|=4; bitplane[offset]|=4; break;
          case 6: finalbit|=2; bitplane[offset]|=2; break;
          case 7: finalbit|=1; bitplane[offset]|=1; break;
          
        }
      //print("setting to 1 bit at offset "+offset+" bitplane value"+bitplane[offset]);
      //console.log("Pixel "+(y-1)+","+(int)((x-0)/8)+"("+(x-0)%8+"):"+"valore pixel:"+hex(finalbit));
    }
    }
    
  }
  
  for (let y = 123; y <  133; y++)
  {
    var pos = int(y*49+19);
    print("Row "+y); 
    print ("offset "+pos);
    
    let finalStr="";
    for (let x = 0; x <  40; x++)
    {
      let str = hex(bitplane[y*40+x]);
      let p = str[6]+str[7];
      finalStr+=p;
      finalStr+="/";
    }
    print(finalStr);
    //let str = hex(bitplane[y*40+19]);
    //let p19 = str[6]+str[7];
    //print(p19);
    //print(
    //  hex(bitplane[y*40+19])  +"/"+
    //  hex(bitplane[y*40+20]) +"/" +
    //  hex(bitplane[y*40+21]) +"/" 
    //);
    
  }
}*/
    {.testId = 2, .test_function = drawing_test2, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "triangle rotated 0deg filled", .verbose=0},
    {.testId = 3, .test_function = drawing_test3, .nbitplanes=2, .nrows=256, .nbyterow=40,.title = "triangle rotated 180deg filled", .verbose=0},
  

    {.testId = 0, .test_function = NULL}

};
int main(int argc, char **argv)
{
    unsigned int error;
    unsigned int totalerrors = 0;
    unsigned int testcounter = 0;

    while (TESTS[testcounter].testId)
    {
        printf("Running test %d - %s...", TESTS[testcounter].testId,TESTS[testcounter].title);
        char filename[100];
        snprintf(filename, sizeof(filename), "expected/drawline.test%d", TESTS[testcounter].testId);
        error = make_test4( TESTS[testcounter],filename);
        if (!error)
            printf("Test succeeded\n");
        else
            printf("Test KO\n");
        totalerrors += error;

        testcounter++;
    }
    printf("Total errors: %d\n", totalerrors);
    exit(totalerrors);    
}
