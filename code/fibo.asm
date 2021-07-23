; Fibonacci Calculation Iteratively
; f[n]=f[n-1]+f[n-2]
; Mohit Agarwal
; 18-05-21

SECTION .data
SYS_EXIT equ 60 ; sysexit syscall
EXIT_SUCCESS equ 0 

N  db 15 ; Fibonacci Index to Calculate
f0 db 0 ; f[0]=0
f1 db 1 ; f[1]=1
fn dw 0 ; f[n]=?

SECTION .text
    global _start

    _start:

        cmp byte [N],2  ; 
        jge iter 
        mov al, byte [N]
        mov byte [fn],al
        jmp last
        
        iter:
            mov cl,byte [N] ; initialised program counter with value of N
            sub cl,2

            mov bl, byte [f0]
            mov dl, byte [f1]

            greek:
                mov word [fn],bx
                add word [fn],dx  ;byte[fn] contains fibo

                mov bx,dx
                mov dx,word [fn]

                dec cl
                cmp cl,0
                jne greek
        
        last:
            mov rax,SYS_EXIT
            mov rdi, EXIT_SUCCESS
            syscall