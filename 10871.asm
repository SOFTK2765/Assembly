extern scanf
extern printf

segment .data
	input_n_x: db "%d %d", 0
	input_ai: db "%d", 0
	output: db "%d ", 0

segment .bss
	n: resd 1
	x: resd 1
	a: resd 79851
	i: resd 1

segment .text
	global main

main:
	push rbp

	mov rdi, input_n_x
	lea rsi, [n]
	lea rdx, [x]
	mov rax, 0
	call scanf

	mov dword[i], 0

input_loop:
	mov eax, dword[i]
	cmp eax, dword[n]
	jge input_loop_end

	mov rdi, input_ai
	mov eax, 0x20
	mov edx, dword[i]
	mul edx
	lea rsi, [a+eax]
	mov rax, 0
	call scanf

	inc dword[i]
	jmp input_loop

input_loop_end:
	mov dword[i], 0

output_loop:
	mov eax, dword[i]
	cmp eax, dword[n]
	jge output_loop_end

	mov eax, 0x20
	mov edx, dword[i]
	mul edx
	mov eax, [a+eax]
	cmp eax, dword[x]
	jge ge

	mov rdi, output
	mov rsi, rax
	mov rax, 0
	call printf

ge:
	inc dword[i]
	jmp output_loop

output_loop_end:
	pop rbp
	mov rax, 0
	ret
