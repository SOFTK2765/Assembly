extern scanf
extern printf

segment .data
	input_n: db "%d", 0
	input_s: db " %s", 0
	output: db "%d", 10, 0
	n: dd 0

segment .bss
	s: resb 81
	i: resd 1
	j: resd 1
	cnt: resd 1
	sum: resd 1

segment .text
	global main

main:
	push rbp

	mov rdi, input_n
	lea rsi, [n]
	mov rax, 0
	call scanf

	mov dword[i], 0

loop:
	mov eax, dword[i]
	cmp eax, dword[n]
	je loop_end

	mov rdi, input_s
	mov rsi, s
	mov rax, 0
	call scanf

	mov dword[cnt], 0
	mov dword[sum], 0
	mov dword[j], 0
	
loop2:
	mov eax, dword[j]
	mov al, byte[s+eax]
	cmp eax, 0
	je loop2_end

	cmp eax, 0x4F
	jne cmp_x

	inc dword[cnt]
	mov eax, dword[sum]
	add eax, dword[cnt]
	mov dword[sum], eax

	jmp cmp_end

cmp_x:
	mov dword[cnt], 0

cmp_end:
	inc dword[j]
	jmp loop2

loop2_end:
	mov rdi, output
	mov rsi, [sum]
	mov rax, 1
	call printf

	inc dword[i]
	jmp loop

loop_end:
	pop rbp
	mov rax, 0
	ret
