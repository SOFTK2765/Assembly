segment .data
	input: dd "%d", 0
	output: dd "%d", 10, 0
	a: dd 0

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
	mul rax
	mov rbx, rax

	mov rdi, input
	lea rsi, [a]
	mov rax, 0
	call scanf

	mov rax, [a]
	mul rax
	add rax, rbx
	mov rbx, rax

	mov rdi, input
	lea rsi, [a]
	mov rax, 0
	call scanf

	mov rax, [a]
	mul rax
	add rax, rbx
	mov rbx, rax

	mov rdi, input
	lea rsi, [a]
	mov rax, 0
	call scanf

	mov rax, [a]
	mul rax
	add rax, rbx
	mov rbx, rax

	mov rdi, input
	lea rsi, [a]
	mov rax, 0
	call scanf

	mov rax, [a]
	mul rax
	add rax, rbx
	mov rbx, rax

	mov dl, 10
	div dl
	and rax, 0xff00
	shr rax, 8

	mov rdi, output
	mov rsi, rax
	mov rax, 0
	call printf

	pop rbp
	mov rax, 0
	ret
