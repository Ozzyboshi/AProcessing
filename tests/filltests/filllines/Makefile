all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DUSE_CLIPPING ./filllines.s  -o ./filllines.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DUSE_CLIPPING -DVAMPIRE ./filllines.s  -o ./filllinesvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  filllines.c -o filllines filllines.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  filllines.c -o filllinesvampire filllinesvampire.o ../../testlibs/testlib.o 
	chmod 777 filllines
	chmod 777 filllinesvampire

test: filllines
	vamos -v ./filllines 2>>/tmp/vamosinfo

copy: filllines
	scp -r ../filllines pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./fillscanline