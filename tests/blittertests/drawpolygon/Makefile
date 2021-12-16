all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DUSE_VIDEOCHIP -DUSE_CLIPPING ./drawpolygon.s  -o ./drawpolygon.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DUSE_VIDEOCHIP -DVAMPIRE -DUSE_CLIPPING ./drawpolygon.s  -o ./drawpolygonvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  drawpolygon.c -o drawpolygon drawpolygon.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  drawpolygon.c -o drawpolygonvampire drawpolygonvampire.o ../../testlibs/testlib.o 
	chmod 777 drawpolygon
	chmod 777 drawpolygonvampire

test: drawpolygon
	vamos -v ./drawpolygon 2>>/tmp/vamosinfo

copy: drawpolygon
	scp -r ../drawpolygon pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./drawpolygon
	rm -f ./drawpolygonvampire