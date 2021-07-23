; Masrt
; 22-05-21
; finding lasrgest prime factor of a given number

SECTION .data
    SYS_EXIT equ 60
    EXIT_SUCCESS equ 0
    NUM dq 87984
    greatest dq 0

SECTION .text
    global _start
    _start:
        mov rbx,0      ;counter for factors
        func1:
            inc rbx
            cmp rbx,qword [NUM]     ; till how much?
            jg last                 
            mov rdx,0               ;
            mov rax,qword [NUM]     ; check for     
            div rbx                 ; a factor
            cmp rdx,0               ;
            jne func1              
            mov r8,rbx              ; store current factor in r8

        ; check r8 for prime
        mov rbx,0
        mov rcx,0
        func2:
            inc rbx
            mov rax, r8
            mov rdx,0
            
            div rbx
            cmp rdx,0
            jne func2
            inc rcx
            cmp rbx,r8
            jl func2
            cmp rcx,2
            jne func1
            mov qword [greatest],rbx  ; if prime then store that in greatest
            jmp func1
        
        ; exit peacefully
        last:
            mov rax,SYS_EXIT
            mov rdi,EXIT_SUCCESS
            syscall
