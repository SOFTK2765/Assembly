extern scanf
extern printf

segment .data
	input: db "%s %s", 0
	output: db "%s", 10, 0
	output_tmp: db "%c", 10, 0

segment .bss
	a: resb 4
	b: resb 4
	i: resd 1

segment .text
	global main

main:
	push rbp

	mov rdi, input
	mov rsi, a
	mov rdx, b
	mov rax, 0
	call scanf

	mov eax, 2
	mov dl, byte[a]
	mov cl, byte[a+eax]
	mov byte[a], cl
	mov byte[a+eax], dl

	mov eax, 2
	mov dl, byte[b]
	mov cl, byte[b+eax]
	mov byte[b], cl
	mov byte[b+eax], dl

	mov al, byte[a]
	cmp al, byte[b]
	jg print_a
	jl print_b

	mov edx, 1
	mov al, byte[a+edx]
	cmp al, byte[b+edx]
	jg print_a
	jl print_b

	mov edx, 2
	mov al, byte[a+edx]
	cmp al, byte[b+edx]
	jg print_a
	jl print_b

print_a:
	mov rdi, output
	mov rsi, a
	mov rax, 1
	call printf
	jmp end

print_b:
	mov rdi, output
	mov rsi, b
	mov rax, 1
	call printf

end:
	pop rbp
	mov rax, 0
	ret
