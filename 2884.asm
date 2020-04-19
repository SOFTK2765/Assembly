extern scanf
extern printf

segment .data
	input: db "%d %d", 0
	output: db "%d %d", 0

segment .bss
	h: resd 1
	m: resd 1
	tmp: resd 1

segment .text
	global main

main:
	push rbp

	mov rdi, input
	lea rsi, [h]
	lea rdx, [m]
	mov rax, 0
	call scanf
	
	mov eax, dword[h]
	mov edx, 60
	mul edx
	add eax, dword[m]
	add eax, 1440
	mov edx, 45
	sub eax, edx
	mov ecx, 1440
	div ecx
	mov eax, edx
	mov ecx, 60
	mov edx, 0
	div ecx

	mov rdi, output
	mov rsi, rax
	mov rax, 0
	call printf	

	pop rbp
	mov rax, 0
	ret
