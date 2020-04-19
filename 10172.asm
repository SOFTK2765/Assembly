segment .data
	output: db 124, "\_/", 124, 10, 124, "q p", 124, "   /}", 10, "( 0 )", 34, 34, 34, "\", 10, 124, 34, "^", 34, 96, "    ", 124, 10, 124, 124, "_/=\\__", 124, 0

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
