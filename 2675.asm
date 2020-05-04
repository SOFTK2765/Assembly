extern scanf
extern printf

segment .data
	input_n: db "%d", 0
	input_rs: db " %d %s", 0
	printc: db "%c", 0
	printnl: db 10, 0
	n: dd 0

segment .bss
	i: resd 1
	j: resd 1
	k: resd 1
	r: resd 1
	s: resb 21

segment .text
	global main

main:
	push rbp

	mov rdi, input_n
	lea rsi, [n]
	mov rax, 0
	call scanf

	mov dword[i], 0

loop_n:
	mov eax, dword[i]
	cmp eax, dword[n]
	jge loop_n_end

	mov rdi, input_rs
	lea rsi, [r]
	mov rdx, s
	mov rax, 0
	call scanf

	mov rcx, s

	mov dword[j], 0

loop_s:
	mov eax, dword[j]
	mov al, byte[s+eax]
	cmp rax, 0
	je loop_s_end

	mov dword[k], 0
		
loop_r:
	mov eax, dword[k]
	cmp eax, dword[r]
	jge loop_r_end

	mov eax, dword[j]
	mov rdi, printc
	mov sil, byte[s+eax]
	mov rax, 1
	call printf

	inc dword[k]
	jmp loop_r

loop_r_end:
	inc dword[j]
	jmp loop_s

	loop_s_end:
	mov rdi, printnl
	mov rax, 0
	call printf

	inc dword[i]
	jmp loop_n

loop_n_end:
	pop rbp
	mov rax, 0
	ret
