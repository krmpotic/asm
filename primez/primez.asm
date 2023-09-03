section .data
	LIMIT     equ 100
	STDOUT    equ 1
	SYS_WRITE equ 1
	SYS_EXIT  equ 60
	ASCII_ZERO  equ 0x30
	ASCII_SPACE  equ 0x20

section .text
	global _start
_start:
	mov r12, 2; r12 2..LIMIT
  b:
	cmp r12, LIMIT
	je exit

	mov rcx, 2
  c:
	cmp rcx, r12
	jnl prime ; tested all rcx 2..r12, r12 is prime!

	;; is r12 divisible by rcx?
	mov rax, r12
	xor rdx, rdx
	div rcx
	cmp rdx, 0
	je back ; it is, so r12 not prime!

	inc rcx
	jmp c

  back:
	inc r12
	jmp b

prime:
	mov rax, r12
	mov rbx, ASCII_SPACE
	jmp print_rax_bx

print_rax_bx: ; print int in rax, and character in bx
	push bx
	mov rbx, 10
	xor rcx, rcx
	add rcx, 2
  _pr_0:
	xor rdx, rdx
	div rbx
	add dl, ASCII_ZERO
	push dx
	add rcx, 2
	cmp rax, 0
	jne _pr_0
	mov rax, SYS_WRITE
	mov rdi, STDOUT
	mov rsi, rsp
	mov rdx, rcx
	syscall
	jmp back

exit:
	mov rax, SYS_EXIT
	mov rdi, 0
	syscall
error:
	mov rax, SYS_EXIT
	mov rdi, 1
	syscall
