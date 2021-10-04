primez: primez.o
	ld -o primez primez.o

primez.o: primez.asm
	nasm -f elf64 -o primez.o primez.asm

clean:
	rm -f primez.o primez

.PHONY: clean
