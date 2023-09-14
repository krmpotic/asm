factor: factor.o
	ld -o factor factor.o

factor.o: factor.asm
	nasm -f elf64 -o factor.o factor.asm

debug:
	gdb -ex "b _start" -ex "layout asm" -ex "layout reg" -ex "run" --args factor 48

clean:
	rm -f factor.o factor

.PHONY: debug clean
