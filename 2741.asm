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

	mov dword[tmp], 1

loop:
	mov rdi, output
	mov rsi, [tmp]
	mov rax, 0
	call printf

	mov eax, dword[tmp]
	cmp eax, dword[n]
	je loop_end

	inc dword[tmp]
	jmp loop

loop_end:
	pop rbp
	mov rax, 0
	ret
