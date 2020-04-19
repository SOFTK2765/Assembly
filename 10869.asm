segment .data
	input: db "%d %d", 0
	output: db "%d", 10, 0
	a: dd 0
	b: dd 0

segment .text
	global main
	extern scanf
	extern printf

main:
	push rbp

	mov rdi, input
	lea rsi, [a]
	lea rdx, [b]
	mov rax, 0
	call scanf

	mov rax, [a]
	mov rbx, [b]
	add rax, rbx

	mov rdi, output
	mov rsi, rax
	mov rax, 0
	call printf

	mov rax, [a]
	mov rbx, [b]
	sub rax, rbx
	
	mov rdi, output
	mov rsi, rax
	mov rax, 0
	call printf

	mov rax, [a]
	mov rbx, [b]
	mul rbx

	mov rdi, output
	mov rsi, rax
	mov rax, 0
	call printf

	mov rax, [a]
	mov rdx, [b]
	mov rcx, rdx
	mov rdx, 0
	div rcx

	mov rdi, output
	mov rsi, rax
	mov rax, 0
	call printf

	mov rax, [a]
	mov rdx, [b]
	mov rcx, rdx
	mov rdx, 0
	div rcx

	mov rdi, output
	mov rsi, rdx
	mov rax, 0
	call printf

	pop rbp
	mov rax, 0
	ret
