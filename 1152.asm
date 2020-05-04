extern scanf
extern printf

segment .data
	input: db "%*s", 0
	output: db "%d", 10, 0

segment .bss
	cnt: resd 1
	
segment .text
	global main

main:
	push rbp

	mov dword[cnt], 0

loop:
	mov rdi, input
	mov rax, 0
	call scanf

	cmp eax, -1
	je loop_end

	inc dword[cnt]
	jmp loop

loop_end:
	mov rdi, output
	mov rsi, [cnt]
	mov rax, 1
	call printf

	pop rbp
	mov rax, 0
	ret
