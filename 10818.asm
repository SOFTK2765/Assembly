extern scanf
extern printf

segment .data
	input_n: db "%d", 0
	input_ai: db " %d", 0
	output: db "%d %d", 0
	n: dd 0

segment .bss
	a: resd 1000001
	i: resd 1
	mn: resd 1
	mx: resd 1

segment .text
	global main

main:
	push rbp

	mov rdi, input_n
	lea rsi, [n]
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
	mov dword[mn], 987654321
	mov dword[mx], -987654321
	mov dword[i], 0

loop:
	mov eax, dword[i]
	cmp eax, dword[n]
	jge loop_end

	mov eax, 0x20
	mov edx, dword[i]
	mul edx
	mov eax, [a+eax]

	cmp eax, dword[mn]
	jge mn_end

	mov dword[mn], eax

mn_end:
	cmp eax, dword[mx]
	jle mx_end

	mov dword[mx], eax

mx_end:
	inc dword[i]
	jmp loop

loop_end:
	mov rdi, output
	mov esi, dword[mn]
	mov edx, dword[mx]
	mov rax, 2
	call printf

	pop rbp
	mov rax, 0
	ret
