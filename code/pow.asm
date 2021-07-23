; computes the x to the power of y
; Masrt
; 23.05-21

SECTION .data
    SYS_EXIT equ 60
    EXIT_SUCCESS equ 0

    X dw 3
    Y dw 17
    Z dd 0

SECTION .text
    global _start

    _start:
        mov bx, 1
        mov r9w, word [X]
        mov ax, word [Y]
        mov r8, 1
        mov cx, 2


        iter:
            imul rbx,r9
            mov r9,rbx
            mov dx,0
            div cx
            
            cmp dx,1        ; checking if bit is 1
            jne iter
            imul r8,rbx
            
            cmp ax,0        ; checking if all bits are done
            je last
            jmp iter
    last:
        mov dword [Z],r8d
        mov rax,SYS_EXIT
        mov rdi, EXIT_SUCCESS
        syscall