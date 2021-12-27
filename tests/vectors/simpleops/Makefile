all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DUSE_VIDEOCHIP -DUSE_CLIPPING ./vectorssimpleops.s  -o ./vectorssimpleops.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DUSE_VIDEOCHIP -DVAMPIRE -DUSE_CLIPPING ./vectorssimpleops.s  -o ./vectorssimpleopsvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  vectorssimpleops.c -o vectorssimpleops vectorssimpleops.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  vectorssimpleops.c -o vectorssimpleopsvampire vectorssimpleopsvampire.o ../../testlibs/testlib.o 
	chmod 777 vectorssimpleops
	chmod 777 vectorssimpleopsvampire

test: vectorssimpleops
	vamos -v ./vectorssimpleops 2>>/tmp/vamosinfo

copy: vectorssimpleops
	scp -r ../vectorssimpleops pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./vectorssimpleops