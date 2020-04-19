extern scanf
extern printf

segment .data
	input: db "%d", 0
	output1: db ">", 0
	output2: db "<", 0
	output3: db "==", 0
	a: dd 0
	b: dd 0

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

	mov eax, [a]
	mov ebx, [b]

	cmp eax, ebx
	jg left
	jl right

	mov rdi, output3
	mov rax, 0
	call printf
	jmp end

left:
	mov rdi, output1
	mov rax, 0
	call printf
	jmp end

right:
	mov rdi, output2
	mov rax, 0
	call printf

end:
	pop rbp
	mov rax, 0
	ret
