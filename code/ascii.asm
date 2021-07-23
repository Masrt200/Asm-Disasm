; program to convert integer to an ascii string
; Mohit Agarwal
; 19-05-21

SECTION .data
    SYS_EXIT equ 60
    EXIT_SUCCESS equ 0

    NUM dw 2585

SECTION .bss
intnum resb 10

SECTION .text
    global _start

    _start:
        mov bx,word [NUM]
        mov r8w,10
        mov rcx,0
        divide:
            mov dx,0
            mov ax, bx
            div r8w
            push rdx
            mov bx,ax
            inc cx
            cmp bx,0
            jne divide
        
        mov r8,0
        mov rax,0
        mov rbx,intnum
        store:
            pop rax
            add ax,0x30
            mov byte [rbx+2*r8], al
            inc r8
            cmp r8w,cx
            jne store
    last:
        mov rax, SYS_EXIT
        mov rdi, EXIT_SUCCESS
        syscall
