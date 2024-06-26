ASM = vasmm68k_mot
CC = m68k-amigaos-gcc
ASMFLAGS = -devpac -Fhunk -quiet -esc -m68040 -m68882
ASMFLAGSVAMPIRE = -devpac -Fhunk -quiet -esc -m68080 -m68882 -DVAMPIRE 
CFLAGS = -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer
CFLAGSVAMPIRE = -ffast-math -m68080 -mhard-float -noixemul -fomit-frame-pointer
LIBS = ../../testlibs/testlib.o
SRC = fpu.s
CSRC = $(SRC:.s=.c)
OBJ = $(SRC:.s=.o)
EXEC = $(SRC:.s=)
EXECVAMPIRE = $(SRC:.s=vampire)
OBJVAMPIRE = $(SRC:.s=vampire.o)


all: 
	$(ASM) $(ASMFLAGS) $(SRC) -o $(OBJ)
	$(CC) $(CFLAGS) $(CSRC) -o $(EXEC) $(OBJ) $(LIBS)
	$(ASM) $(ASMFLAGSVAMPIRE) $(SRC) -o $(OBJVAMPIRE)
	$(CC) $(CFLAGSVAMPIRE) $(CSRC) -o $(EXECVAMPIRE) $(OBJVAMPIRE) $(LIBS)

copy:
	scp  ./$(EXECVAMPIRE) pi@10.0.0.4:/media/MAXTOR/upload/Vampire/
	scp  ./$(EXEC) pi@10.0.0.4:/media/MAXTOR/upload/Vampire/
	scp  -r ./expected pi@10.0.0.4:/media/MAXTOR/upload/Vampire/
clean:
	rm -f *.o
	rm -f ./$(EXECVAMPIRE)