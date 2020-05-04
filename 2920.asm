extern scanf
extern printf

segment .data
	input: db " %d", 0
	output: db "%s", 0
	asc: db "ascending", 0
	desc: db "descending", 0
	mix: db "mixed", 0

segment .bss
	tmp: resd 1
	pre: resd 1
	sig: resd 1
	i: resd 1

segment .text
	global main

main:
	push rbp

	mov rdi, input
	lea rsi, [pre]
	mov rax, 0
	call scanf

	mov rdi, input
	lea rsi, [tmp]
	mov rax, 0
	call scanf

	mov eax, dword[tmp]
	cmp eax, dword[pre]
	jl less

	mov dword[sig], 1
	jmp cmp_end

less:
	mov dword[sig], -1	

cmp_end:
	mov dword[i], 2

loop:
	mov eax, dword[i]
	cmp eax, 8
	je loop_end

	mov eax, dword[tmp]
	mov dword[pre], eax

	mov rdi, input
	lea rsi, [tmp]
	mov rax, 0
	call scanf

	mov eax, dword[tmp]
	cmp eax, dword[pre]
	jl loop_less

	mov eax, dword[sig]
	cmp eax, 1
	jne mixed_end
	jmp loop_cmp_end

loop_less:
	mov eax, dword[sig]
	cmp eax, -1
	jne mixed_end

loop_cmp_end:
	inc dword[i]
	jmp loop

loop_end:
	mov eax, dword[sig]
	cmp eax, 1
	jne desc_end

	mov rdi, output
	mov rsi, asc
	mov rax, 1
	call printf

	jmp end

desc_end:
	mov rdi, output
	mov rsi, desc
	mov rax, 1
	call printf

	jmp end

mixed_end:
	mov rdi, output
	mov rsi, mix
	mov rax, 1
	call printf

end:
	pop rbp
	mov rax, 0
	ret
