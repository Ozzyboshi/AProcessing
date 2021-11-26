all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DUSE_VIDEOCHIP -DUSE_CLIPPING ./blitfilllines.s  -o ./blitfilllines.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DUSE_VIDEOCHIP -DVAMPIRE -DUSE_CLIPPING ./blitfilllines.s  -o ./blitfilllinesvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  blitfilllines.c -o blitfilllines blitfilllines.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  blitfilllines.c -o blitfilllinesvampire blitfilllinesvampire.o ../../testlibs/testlib.o 
	chmod 777 blitfilllines
	chmod 777 blitfilllinesvampire

test: blitfilllines
	vamos -v ./blitfilllines 2>>/tmp/vamosinfo

copy: blitfilllines
	scp -r ../blitfilllines pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./blitfilllines
	rm -f ./blitfilllinesvampire