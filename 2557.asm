segment .data
	output: db "Hello World", 33, 0

segment .text
	global main
	extern printf

main:
	push rbp
	mov rdi, output
	mov rax, 0
	call printf

	pop rbp
	mov rax, 0
	ret
