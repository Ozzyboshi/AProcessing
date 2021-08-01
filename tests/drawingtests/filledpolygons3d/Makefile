all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DUSE_3D -DUSE_CLIPPING ./drawingtestsfilledpolygon3d.s  -o ./drawingtestsfilledpolygon3d.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DUSE_3D  -DVAMPIRE -DUSE_CLIPPING ./drawingtestsfilledpolygon3d.s  -o ./drawingtestsfilledpolygon3dvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -DUSE_3D -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  drawingtestsfilledpolygon3d.c -o drawingtestsfilledpolygon3d drawingtestsfilledpolygon3d.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -DUSE_3D -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  drawingtestsfilledpolygon3d.c -o drawingtestsfilledpolygon3dvampire drawingtestsfilledpolygon3dvampire.o ../../testlibs/testlib.o 

test: drawingtestsfilledpolygon3d
	vamos -v ./drawingtestsfilledpolygon3d 2>>/tmp/vamosinfo

copy: drawingtestsfilledpolygon3d
	scp -r ../drawingtestsfilledpolygon3d pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./drawingtestsfilledpolygon3d