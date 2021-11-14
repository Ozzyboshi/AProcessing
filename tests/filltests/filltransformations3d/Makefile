all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DUSE_3D -DUSE_CLIPPING ./filltransformations3d.s  -o ./filltransformations3d.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DUSE_3D -DUSE_CLIPPING -DVAMPIRE ./filltransformations3d.s  -o ./filltransformations3dvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  filltransformations3d.c -o filltransformations3d filltransformations3d.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  filltransformations3d.c -o filltransformations3dvampire filltransformations3dvampire.o ../../testlibs/testlib.o 

	chmod 777 filltransformations3d
	chmod 777 filltransformations3dvampire

test: filltransformations3d
	vamos -v ./filltransformations3d 2>>/tmp/vamosinfo

copy: filltransformations3d
	scp -r ../filltransformations3d pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./filltransformations3d