extern scanf
extern printf

segment .data
	input: db "%d", 0
	output: db "%d * %d = %d", 10, 0
	n: dd 0

segment .bss
	i: resd 1

segment .text
	global main

main:
	push rbp

	mov rdi, input
	lea rsi, [n]
	mov rax, 0
	call scanf

	mov dword[i], 1

loop:
	mov eax, [n]
	mul dword[i]
	mov ecx, eax

	mov rdi, output
	mov rsi, [n]
	mov rdx, [i]
	mov rax, 3
	call printf
	
	inc dword[i]
	mov eax, 9
	cmp eax, dword[i]
	jge loop

	pop rbp
	mov rax, 0
	ret	
	
