all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 ./matrixmultiplications.s  -o ./matrixmultiplications.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DVAMPIRE ./matrixmultiplications.s  -o ./matrixmultiplicationsvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  matrixmultiplications.c -o matrixmultiplications matrixmultiplications.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  matrixmultiplications.c -o matrixmultiplicationsvampire matrixmultiplicationsvampire.o ../../testlibs/testlib.o 

test: matrixmultiplications
	vamos ./matrixmultiplications

copy: matrixmultiplications
	scp -r ../matrixmultiplications pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./fillscanline