all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DUSE_CLIPPING ./filltransformations.s  -o ./filltransformations.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DUSE_CLIPPING -DVAMPIRE ./filltransformations.s  -o ./filltransformationsvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  filltransformations.c -o filltransformations filltransformations.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  filltransformations.c -o filltransformationsvampire filltransformationsvampire.o ../../testlibs/testlib.o 

test: filltransformations
	vamos -v ./filltransformations 2>>/tmp/vamosinfo

copy: filltransformations
	scp -r ../filltransformations pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./filltransformations