extern      printf
extern      exit

SEGMENT      .data
      fmt1  db "Getting started ...",0
      fmt2  db "%s",13,10,0
      fmt5  db "%f %f",13,10,0
      align 16
      val1 dq 1.1, 2.2
      align 16
      val2 dq 2.2, 3.3

SEGMENT      .text
global      main
   main:
      mov   rdi, fmt2
      mov   rsi, fmt1
      mov   rax, 0
      call   printf
      
      movapd   xmm0, [val1]
      movapd   xmm1, [val2]
      addpd   xmm0, xmm1  ;xmm0 contains 3.3 and 5.5

	  movapd xmm1,xmm0  ;copy
      psrldq xmm1,8  ;shift right by 8 bytes
      mov rdi,fmt5
      mov rax,2
      call printf

;      mov   rdi, fmt5
;      mov   rax, 1
;      call   printf  ;printf prints 3.3 and 2.2
      
   
      mov   rdi, 0
      call    exit
