section .data
	SYS_WRITE equ 1
	STDOUT equ 1
	NL db 0xa

section .text
	global _start
_start:
	pop r15     ;arg counter
	xor r14, r14;max
	add rsp, 8
	dec r15
	cmp r15, 0
	je error
  loopx:
	pop r11
	dec r15
	call atoi
	cmp r14, rax
	jg skip
	mov r14, rax
    skip:
	cmp r15, 0
	jne loopx
	mov rdi, rax

	mov rax, r14
	mov rbx, 10
	xor rcx, rcx
	push bx
	add rcx, 2
  itoa:
	xor rdx, rdx
	div rbx
	add dl, 0x30
	push dx
	add rcx, 2
	cmp rax, 0
	jne itoa
    putchar:
	mov rax, 1
	mov rdi, 1
	mov rsi, rsp
	mov rdx, rcx
	syscall

	jmp exit

atoi: ; ptr to null terminated string in r11
	; return result in rax
	xor rax, rax
	xor rcx, rcx
	xor rbx, rbx
	mov r10, 10
  loop_chars:;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov bl, [r11+rcx]
	inc rcx
	cmp bl, 0
	je atoi_ret

	cmp bl, 0x30;<is 0-9>
	jl error
	cmp bl, 0x39
	jg error    ;</is 0-9>

	sub bl, 0x30
	mul r10
	add rax, rbx
	jmp loop_chars;;;;;;;;;;;;;;;;;
  atoi_ret:
	ret

exit:
	mov rax, 60
	mov rdi, 0
	syscall
error:
	mov rax, 60
	mov rdi, 1
	syscall
