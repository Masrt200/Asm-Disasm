; -----

section .data
; Define standard constants.
LF equ 10 ; line feed
NULL equ 0 ; end of string
TRUE equ 1
FALSE equ 0
EXIT_SUCCESS equ 0 ; success code
STDIN equ 0 ; standard input
STDOUT equ 1 ; standard output
STDERR equ 2 ; standard error
SYS_read equ 0 ; read
SYS_write equ 1 ; write
SYS_open equ 2 ; file open
SYS_close equ 3 ; file close
SYS_fork equ 57 ; fork
SYS_exit equ 60 ; terminate
SYS_creat equ 85 ; file open/create
SYS_time equ 201 ; get time

STRLEN equ 50

msg db "Hi! Assembly is Amazing", LF, NULL
prmpt db "Your Name? ", NULL
newline db LF,NULL

section .bss
char resb 1
newStr resb STRLEN+2

section .text
    global _start
    global print_str
    print_str:
        push rbx
        
        mov rdx,0
        readloop:
            cmp byte [rsi+rdx],NULL
            je printing
            inc rdx
            jmp readloop

        ;; output to screen
        printing:
        mov rax,SYS_write
        mov rdi, STDOUT
        syscall
        
        pop rbx ; epilogue
        ret

    global reading
    reading:
        push rbx ; prologue
        mov rbx,newStr
        mov r12,0
        read_char:
            mov rax, SYS_read
            mov rdi, STDIN
            mov rsi, char
            mov rdx,1
            syscall

            mov al, byte [char]
            cmp al,LF
            je read_done

            inc r12
            cmp r12,STRLEN
            je read_done

            
            mov byte [rbx+r12-1],al
            
            jmp read_char

        read_done:
        mov byte [rbx+r12],10
        mov byte [rbx+r12+1], NULL
        pop rbx
        ret

    _start:
        mov rsi, msg
        call print_str

        mov rsi, prmpt
        call print_str

        call reading

        mov rsi, newStr
        call print_str    
    last:
        mov rax, SYS_exit
        mov rdi, EXIT_SUCCESS
        syscall