segment .data
	input: db "%d %d", 0
	output: db "%d", 0
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
	mul rbx
	
	mov rdi, output
	mov rsi, rax
	mov rax, 0
	call printf

	pop rbp
	mov rax, 0
	ret
