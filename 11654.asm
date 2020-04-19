segment .data
	input: db "%c", 0
	output: db "%d", 0
	a: db 0

segment .text
	global main
	extern scanf
	extern printf

main:
	push rbp

	mov rdi, input
	lea rsi, [a]
	mov rax, 0
	call scanf

	mov rax, [a]

	mov rdi, output
	mov rsi, rax
	mov rax, 0
	call printf

	pop rbp
	mov rax, 0
	ret
