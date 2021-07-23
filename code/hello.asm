section .text
    GLOBAL _start ;must be declared for linker (ld command)

_start:
    mov rdx,len
    mov rsi,msg
    mov rdi,1
    mov rax,1   ;syswrite
    syscall    ;call kernel

    mov rax,60   ;sysexit
    mov rdi,0    ;success
    syscall    ;call kernel

section .data
msg db "This is beyond my comfort",0xa ;string to be printed
len equ $- msg ;length of the string