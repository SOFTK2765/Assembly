extern scanf
extern printf

segment .data
	input: db "%d", 0
	output: db "%c", 10, 0
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
	cmp rax, 90
	jl gb
	
	mov rdi, output
	mov rsi, 0x0000000000000041
	mov rax, 0
	call printf
	jmp end

gb:
	mov rax, [a]
	cmp rax, 80
	jl gc

	mov rdi, output
	mov rsi, 0x0000000000000042
	mov rax, 0
	call printf
	jmp end

gc:
	mov rax, [a]
	cmp rax, 70
	jl gd

	mov rdi, output
	mov rsi, 0x0000000000000043
	mov rax, 0
	call printf
	jmp end

gd:
	mov rax, [a]
	cmp rax, 60
	jl gf

	mov rdi, output
	mov rsi, 0x0000000000000044
	mov rax, 0
	call printf
	jmp end

gf:
	mov rdi, output
	mov rsi, 0x0000000000000046
	mov rax, 0
	call printf

end:
	pop rbp
	mov rax, 0
	ret
