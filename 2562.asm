extern scanf
extern printf

segment .data
	input: db " %d", 0
	output: db "%d", 10, "%d", 0
	n: dd 0

segment .bss
	i: resd 1
	mx: resd 1
	mxi: resd 1

segment .text
	global main

main:
	push rbp

	mov dword[mx], 0
	mov dword[i], 1
loop:
	mov eax, dword[i]
	cmp eax, 9
	jg loop_end

	mov rdi, input
	lea rsi, [n]
	mov rax, 0
	call scanf

	mov eax, dword[n]
	cmp eax, [mx]
	jle pass

	mov eax, dword[n]
	mov [mx], eax
	mov eax, dword[i]
	mov [mxi], eax

pass:
	inc dword[i]
	jmp loop

loop_end:
	mov rdi, output
	mov rsi, [mx]
	mov rdx, [mxi]
	mov rax, 2
	call printf

	pop rbp
	mov rax, 0
	ret
