extern scanf
extern printf

segment .data
	input: db " %d", 0
	output: db "%d", 10, 0

segment .bss
	cnt: resd 43
	i: resd 1
	tmp: resd 1
	res: resd 1

segment .text
	global main

main:
	push rbp

	mov dword[i], 0

loop:
	mov eax, dword[i]
	cmp eax, 10
	jge loop_end

	mov rdi, input
	lea rsi, [tmp]
	mov rax, 0
	call scanf

	mov eax, dword[tmp]
	mov edx, 42
	mov ecx, edx
	mov edx, 0
	div ecx

	mov eax, edx
	mov ebx, 4
	mul ebx

	inc dword[cnt+rax]
	inc dword[i]
	jmp loop

loop_end:
	mov dword[res], 0
	mov dword[i], 0

cnt_loop:
	mov eax, dword[i]
	cmp eax, 42
	jge cnt_loop_end

	mov eax, dword[i]
	mov ebx, 4
	mul ebx
	mov eax, dword[cnt+eax]
	cmp eax, 0
	je no_cnt

	inc dword[res]

no_cnt:
	inc dword[i]
	jmp cnt_loop

cnt_loop_end:
	mov rdi, output
	mov esi, dword[res]
	mov rax, 0
	call printf

	pop rbp
	mov rax, 0
	ret
