extern scanf
extern printf

segment .data
	input: db "%d", 0
	output: db "%d", 0
	a: dd 0

segment .text
	global main

main:
	push rbp

	mov rdi, input
	lea rsi, [a]
	mov rax, 0
	call scanf

	mov rax, [a]
	mov rdx, 0x0000000000000004
	mov rcx, rdx
	mov rdx, 0
	div rcx
	cmp rdx, 0
	jne not
	
	mov rax, [a]
	mov rdx, 0x0000000000000064
	mov rcx, rdx
	mov rdx, 0
	div rcx
	cmp rdx, 0
	je not
	jmp p1

not:
	mov rax, [a]
	mov rdx, 0x0000000000000190
	mov rcx, rdx
	mov rdx, 0
	div rcx
	cmp rdx, 0
	je p1

p0:
	mov rdi, output
	mov rsi, 0
	mov rax, 0
	call printf
	jmp end

p1:
	mov rdi, output
	mov rsi, 1
	mov rax, 0
	call printf

end:
	pop rbp
	mov rax, 0
	ret
