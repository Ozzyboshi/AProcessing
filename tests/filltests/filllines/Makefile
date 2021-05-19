all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 ./filllines.s  -o ./filllines.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DVAMPIRE ./filllines.s  -o ./filllinesvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  filllines.c -o filllines filllines.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  filllines.c -o filllinesvampire filllinesvampire.o ../../testlibs/testlib.o 
	#m68k-amigaos-gcc -Wall -O1 -noixemul filllines.c -o filllines filllines.o
	#m68k-amigaos-gcc -Wall -O1 -noixemul filllines.c -o filllinesvampire filllinesvampire.o

test: filllines
	vamos -C 00 ./filllines

copy: filllines
	scp -r ../filllines pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./fillscanline