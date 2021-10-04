cb: cb.o
	ld cb.o -o cb

cb.o: cb.asm
	nasm -f elf64 cb.asm -o cb.o

clean:
	rm -f cb.o cb

.PHONY: clean
