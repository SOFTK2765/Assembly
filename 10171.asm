segment .data
	output: db "\    /\", 10, " )  ( ')", 10, "(  /  )", 10, " \(__)", 124, 0

segment .text
	global main
	extern printf

main:
	push rbp

	mov rdi, output
	call printf

	pop rbp
	mov rax, 0
	ret
