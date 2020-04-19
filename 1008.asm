extern scanf
extern printf

segment .data
	input: db "%lf", 0
	output: db "%.9lf", 0
	a: dq 0
	b: dq 0
	res: dq 0

segment .text
	global main
	
main:
	push rbp

	mov rdi, input
	lea rsi, [a]
	mov rax, 0
	call scanf

	mov rdi, input
	lea rsi, [b]
	mov rax, 0
	call scanf

	finit
	fld qword[a]
	fld qword[b]
	fdiv
	fstp qword[res]

	movq xmm0, [res]

	mov rdi, output
	mov rax, 1
	call printf
	
	pop rbp
	mov rax, 0
	ret
