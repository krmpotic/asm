findbig: findbig.o
	ld -o findbig findbig.o

findbig.o: findbig.asm
	nasm -f elf64 -o findbig.o findbig.asm

debug:
	gdb findbig -ex "b _start" -ex "layout asm" -ex "layout reg" -ex "run"

clean:
	rm -f findbig.o findbig

.PHONY: debug clean
