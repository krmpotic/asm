section .data
	SYS_WRITE equ 1
	STDOUT equ 1
	NL db 0xa

section .text
	global _start
_start:
	mov r12, 2
  b:
	cmp r12, 100
	je exit

	mov rcx, 2
  c:
	cmp rcx, r12
	jnl prime
	mov rax, r12
	xor rdx, rdx
	div rcx
	cmp rdx, 0
	je back
	inc rcx
	jmp c
	
  back:
	inc r12
	jmp b

prime:
	mov rax, r12
	jmp print_rax

;	jmp print_rax
;  back:

print_rax:
	mov rbx, 10
	xor rcx, rcx
	push bx
	add rcx, 2
  _pr_0:
	xor rdx, rdx
	div rbx
	add dl, 0x30
	push dx
	add rcx, 2
	cmp rax, 0
	jne _pr_0
	mov rax, 1
	mov rdi, 1
	mov rsi, rsp
	mov rdx, rcx
	syscall
	jmp back

exit:
	mov rax, 60
	mov rdi, 0
	syscall
error:
	mov rax, 60
	mov rdi, 1
	syscall
