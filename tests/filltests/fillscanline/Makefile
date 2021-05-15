all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 ./fillscanline.s  -o ./fillscanline.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DVAMPIRE ./fillscanline.s  -o ./fillscanlinevampire.o
	m68k-amigaos-gcc fillscanline.c -o fillscanline fillscanline.o
	m68k-amigaos-gcc fillscanline.c -o fillscanlinevampire fillscanlinevampire.o

test: fillscanline
	vamos -C 00 ./fillscanline

copy: fillscanline
	scp -r ../fillscanline pi@10.0.0.4:/media/MAXTOR/upload/Vampire/