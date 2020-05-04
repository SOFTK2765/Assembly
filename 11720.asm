extern scanf
extern printf

segment .data
	input_n: db "%d", 0
	input_1d: db "%1d", 0
	output: db "%d", 0
	n: dd 0
	sum: dd 0

segment .bss
	i: resd 1
	tmp: resd 1

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
	je loop_end

	mov rdi, input_1d
	lea rsi, [tmp]
	mov rax, 0
	call scanf

	mov eax, dword[sum]
	add eax, dword[tmp]
	mov dword[sum], eax

	inc dword[i]
	jmp loop

loop_end:
	mov rdi, output
	mov rsi, [sum]
	mov rax, 1
	call printf

	pop rbp
	mov rax, 0
	ret
