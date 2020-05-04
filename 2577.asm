extern scanf
extern printf

segment .data
	input: db "%d %d %d", 0
	output: db "%d", 10, 0
	a: dd 0
	b: dd 0
	c: dd 0

segment .bss
	cnt: resd 10
	tmp: resd 1
	i: resd 1

segment .text
	global main

main:
	push rbp

	mov rdi, input
	lea rsi, [a]
	lea rdx, [b]
	lea rcx, [c]
	mov rax, 0
	call scanf

	mov rax, [a]
	mov rdx, [b]
	mul rdx
	mov rdx, [c]
	mul rdx
	mov dword[tmp], eax

	mov dword[i], 0

init_loop:
	mov eax, dword[i]
	cmp eax, 10
	je init_loop_end

	mov eax, dword[i]
	mov dword[cnt+eax], 0	

	inc dword[i]
	jmp init_loop

init_loop_end:

loop:
	mov eax, dword[tmp]
	cmp eax, 0
	je loop_end

	mov ecx, 10
	div ecx

	mov dword[tmp], eax
	mov eax, 0x4
	mul edx

	inc dword[cnt+eax]

	jmp loop

loop_end:
	mov dword[i], 0

print_loop:
	mov eax, dword[i]
	cmp eax, 10
	je print_loop_end

	mov rdi, output
	mov rdx, 0x4
	mul rdx
	mov esi, dword[cnt+eax]
	mov rax, 1
	call printf

	inc dword[i]
	jmp print_loop

print_loop_end:
	pop rbp
	mov rax, 0
	ret
