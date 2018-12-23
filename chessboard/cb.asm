section .data
	at_sign db 0x40
	space_sign db 0x20
	NL db 0x0a

section .text
global _start
_start:
	mov r8, 1; line counter
	xor r9, r9; column counter

  print_char:
	add r9, 1
	cmp r9, 9

	jl same_row

	mov rax, 1
	mov rdi, 1
	mov rsi, NL
	mov rdx, 1
	syscall

	mov r9, 1
	add r8, 1
	cmp r8, 8
	jg exit

    same_row:
	lea r10, [r8 + r9]
	and r10, 1
	mov rax, 1
	mov rdi, 1
	mov rdx, 1

	cmp r10, 1
	je print_space

	mov rsi, at_sign
	syscall
	jmp print_char
	
	print_space:
	mov rsi, space_sign
	syscall
	jmp print_char
	

exit:
	mov rax, 60
	mov rdi, 1
	syscall
