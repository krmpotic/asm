findbig: findbig.o
	ld -o findbig findbig.o

findbig.o: findbig.asm
	nasm -f elf64 -o findbig.o findbig.asm
