; trying out macros for fun

%define mulby8(x) shl x,3

%macro abs 1
    cmp %1,0
    jge %%end
    neg %1
    %%end:
%endmacro

section .text
    global _start:
    _start:
        mov rax,55
        mulby8 (rax)
        mov bx,-55
        abs bx
    
    mov rax,60
    mov rdi,0
    syscall