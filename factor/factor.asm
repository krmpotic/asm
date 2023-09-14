;section .data
;	SYS_WRITE equ 1
;	STDOUT equ 1
;	NL db 0xa
;
;section .text
;	global _start
;_start:
;	pop r15
;	xor r14, r14
;	add rsp, 8
;	dec r15
;	cmp r15, 1
;	jne error 
;
;;itoa: print the value in rbx to stdout
;itoa:
;	xor rdx, rdx
;	div rbx
;	add dl, '0'
;	push dx
;	add rcx, 2
;	cmp rax, 0
;
;; atoi: ptr to null terminated string in r11
;; return result in rax
;atoi:
;	xor rax, rax
;	xor rcx, rcx
;	xor rbx, rbx
;	mov r10, 10
;  loop_chars:
; 	mov bl, [r11+rcx]
;	inc rcx
;	cmp bl, 0 ; null terminator 
;	je atoi_ret
;
;	; check if argument is a positive number
;	cmp bl, '0'
;	jl error
;	cmp bl, '9'
;	jg error
;
;	sub bl, 0x30
;	mul r10 ; multiply rax by 10
;	add rax, rbx
;	jmp loop_chars
;atoi_ret:
;	ret
;
;;; exit(1)
;error:
;	mov rax, 60
;	mov rdi, 1
;	syscall
;
;;; exit(0)
;exit:
;	mov rax, 60
;	mov rdi, 0
;	syscall
