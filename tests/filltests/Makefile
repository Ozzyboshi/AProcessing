all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 ./filline.s  -o ./filline.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DVAMPIRE ./filline.s  -o ./fillinevampire.o
	m68k-amigaos-gcc filline.c -o filline filline.o
	m68k-amigaos-gcc filline.c -o fillinevampire fillinevampire.o