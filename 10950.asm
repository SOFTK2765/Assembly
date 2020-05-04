extern scanf
extern printf

segment .data
	input_n: db "%d", 0
	input_ab: db " %d %d", 0
	output: db "%d", 10, 0
	n: dd 0
	a: dd 0
	b: dd 0

segment .bss
	i: resd 1

segment .text
	global main

main:
	push rbp

	mov rdi, input_n
	lea rsi, [n]
	mov rax, 0
	call scanf

	mov dword[i], 0

loop:
	mov eax, dword[i]
	cmp eax, dword[n]
	jge loop_end

	mov rdi, input_ab
	lea rsi, [a]
	lea rdx, [b]
	mov rax, 0
	call scanf

	mov eax, [a]
	add eax, [b]

	mov rdi, output
	mov esi, eax
	mov rax, 1
	call printf

	inc dword[i]
	jmp loop

loop_end:
	pop rbp
	mov rax, 0
	ret
