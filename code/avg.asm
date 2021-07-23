; Masrt 
; averaging

%macro avg 3
    lea rbx, [%1]
    mov cx, word [%2]
    mov ax,0
    mov r8,0
    %%sum:
        add ax, word [rbx+2*r8]
        inc r8
        loop %%sum
    cwd
    idiv word [%2]
    mov word [%3],ax
%endmacro

section .data
    SYS_EXIT equ 60 
    EXIT_SUCCESS equ 0

    data1 dw 55,62,44,55,69,78,41,23,58
    len1 dw 9

    data2 dw 44,-5,68,12,448,63,20,555,-9
    len2 dw 9

    avg1 dw 0
    avg2 dw 0

section .text
global _start
    _start:
    avg data1,len1,avg1
    avg data2,len2,avg2

    last:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
