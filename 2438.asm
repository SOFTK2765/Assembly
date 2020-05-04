extern scanf
extern printf

segment .data
	input: db "%d", 0
	printstar: db "*", 0
	printnl : db 10, 0
	n: dd 0

segment .bss
	i: resd 1
	j: resd 1
	tmp: resd 1

segment .text
	global main

main:
	push rbp

	mov rdi, input
	lea rsi, [n]
	mov rax, 0
	call scanf

	mov dword[i], 1

loop1:
	mov dword[j], 0

loop2:
	mov eax, dword[j]
	cmp eax, dword[i]
	je loop2_end
	
	mov rdi, printstar
	mov rax, 0
	call printf

	inc dword[j]
	jmp loop2

loop2_end:
	mov rdi, printnl
	mov rax, 0
	call printf

	mov eax, dword[i]
	cmp eax, dword[n]
	je loop1_end

	inc dword[i]
	jmp loop1

loop1_end:

	pop rbp
	mov rax, 0
	ret
