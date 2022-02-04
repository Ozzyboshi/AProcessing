all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 ./matrixbasic.s -DUSE_3D  -o ./matrixbasic.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DVAMPIRE -DUSE_3D ./matrixbasic.s  -o ./matrixbasicvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  matrixbasic.c -o matrixbasic matrixbasic.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  matrixbasic.c -o matrixbasicvampire matrixbasicvampire.o ../../testlibs/testlib.o 

	chmod 777 matrixbasic
	chmod 777 matrixbasicvampire

test: matrixbasic
	vamos -v ./matrixbasic 2>>/tmp/vamosinfo

copy: matrixbasic
	scp -r ../matrixbasic pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./fillscanline