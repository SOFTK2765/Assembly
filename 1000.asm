section .data
	input: db "%d %d",0
	output: db "%d",10,0
	
	a: times 4 db 0
	b: times 4 db 0

section .text
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

	pop rbp
	mov rax,0
	ret
