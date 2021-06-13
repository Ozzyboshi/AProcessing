all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 ./drawingtestsfilledpolygon.s  -o ./drawingtestsfilledpolygon.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DVAMPIRE ./drawingtestsfilledpolygon.s  -o ./drawingtestsfilledpolygonvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  drawingtestsfilledpolygon.c -o drawingtestsfilledpolygon drawingtestsfilledpolygon.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  drawingtestsfilledpolygon.c -o drawingtestsfilledpolygonvampire drawingtestsfilledpolygonvampire.o ../../testlibs/testlib.o 

test: drawingtestsfilledpolygon
	vamos ./drawingtestsfilledpolygon

copy: drawingtestsfilledpolygon
	scp -r ../drawingtestsfilledpolygon pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./drawingtestsfilledpolygon