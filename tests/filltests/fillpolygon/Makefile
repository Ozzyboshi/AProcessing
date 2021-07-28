all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DUSE_CLIPPING ./fillpolygon.s  -o ./fillpolygon.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DUSE_CLIPPING -DVAMPIRE ./fillpolygon.s  -o ./fillpolygonvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  fillpolygon.c -o fillpolygon fillpolygon.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  fillpolygon.c -o fillpolygonvampire fillpolygonvampire.o ../../testlibs/testlib.o 

test: fillpolygon
	vamos -v ./fillpolygon 2>>/tmp/vamosinfo

copy: fillpolygon
	scp -r ../fillpolygon pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./fillscanline