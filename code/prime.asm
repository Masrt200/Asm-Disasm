; stores prime numbers till N
; Mohit Agarwal
; 18-05-21

SECTION .data
    SYS_EXIT equ 60
    EXIT_SUCCESS equ 0

    Num dw 100  ; first 50 primes
    PRIME dw 0 ; stores current number
    SUM dw 0   ; stores SUM of N primes

;SECTION .bss
    ;PRM resb 50 ; array of N prime elements

SECTION .text
global _start

_start:
    mov r8w, word [Num]  ;r8w=100
    begin:
        cmp r8w,0                    
        je last                         
        inc word [PRIME]  ; PRIME=2              
        check_prime:
            mov bx, 0     ;bx=0              
            mov cx, 0     ;cx=0              

            iter:
                inc bx    ;bx=2              
                mov dx,0  ;dx=0              
                mov ax, word [PRIME]  ;ax=2    
                div bx    ;ax=1  dx=0              
                cmp dx,0                
                jne iter                
                inc cx    ;cx=2              
                cmp bx, word [PRIME]    
                jl iter                 
            check:
                cmp cx,2                
                jne begin               
                add word [SUM],bx     SUM=0+2 
                dec r8w      ;r8w=99           
                jmp begin               
    last:
        mov rax,SYS_EXIT
        mov rdi,EXIT_SUCCESS
        syscall

    
    
