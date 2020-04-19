extern scanf
extern printf

segment .data
	input: db "%d", 0
	output: db "%d", 10, 0
	n: dd 0

segment .bss
	tmp: resd 1

segment .text
	global main

main:
	push rbp

	mov rdi, input
	lea rsi, [n]
	mov rax, 0
	call scanf

	mov eax, dword[n]
	mov dword[tmp], eax

loop:
	mov rdi, output
	mov rsi, [tmp]
	mov rax, 0
	call printf

	cmp dword[tmp], 1
	je loop_end

	dec dword[tmp]
	jmp loop

loop_end:
	pop rbp
	mov rax, 0
	ret
