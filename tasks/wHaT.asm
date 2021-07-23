
section .data
LF equ 10 ; line feed
NULL equ 0 ; end of string
STDOUT equ 1 ; standard output
SYS_write equ 1 ; Syscall write
EXIT_SUCCESS equ 0 ;peacefully exit
SYS_exit equ 60 ; terminate

CHAR db "#"
NEWLINE db LF

section .text
    global print
    print:
        mov rdx,1
        mov rax,SYS_write
        mov rdi,STDOUT
        syscall
        ret

    global _start
    _start:
        mov r10,0
        l1:
            mov rsi,NEWLINE
            call print
            inc r10
            cmp r10,10
            je last
            mov rbx,0
        l2:
            cmp rbx,r10
            je l1
            mov rsi,CHAR
            call print
            inc rbx
            jmp l2


    last:
        mov rax,SYS_exit
        mov rdi,EXIT_SUCCESS
        syscall