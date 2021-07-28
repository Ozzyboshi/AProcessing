all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DUSE_CLIPPING ./fillscanline.s  -o ./fillscanline.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DVAMPIRE -DUSE_CLIPPING ./fillscanline.s  -o ./fillscanlinevampire.o
	m68k-amigaos-gcc -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  fillscanline.c -o fillscanline fillscanline.o  ../../testlibs/testlib.o 
	m68k-amigaos-gcc -Wall -O1 -noixemul fillscanline.c -o fillscanlinevampire fillscanlinevampire.o    ../../testlibs/testlib.o 

test: fillscanline
	vamos -v ./fillscanline 2>>/tmp/vamosinfo

copy: fillscanline
	scp -r ../fillscanline pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./fillscanline