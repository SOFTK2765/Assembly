extern scanf
extern printf

segment .data
	input: db " %d %d", 0
	output: db "%d", 10, 0
	a: dd 0
	b: dd 0

segment .text
	global main

main:
	push rbp

loop:
	mov rdi, input
	lea rsi, [a]
	lea rdx, [b]
	mov rax, 0
	call scanf

	cmp eax, -1
	je loop_end

	mov eax, [a]
	add eax, [b]

	mov rdi, output
	mov esi, eax
	mov rax, 1
	call printf

	jmp loop

loop_end:
	pop rbp
	mov rax, 0
	ret
