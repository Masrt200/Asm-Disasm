;; password lock checkers
;; what 4 digit code passed as parameters will unlock the code
extern print_str

section .data
NULL equ 0
SYS_exit equ 60
EXIT_success equ 0
LF equ 10

newline db LF,NULL
victory db "Here's 5 diamonds!",LF,NULL

section .bss
PIN resb 4

section .text
    global reader
    reader:
        mov rdx,1

        args:
            cmp rdx,rdi
            jge end
            mov rax,0
            mov r10, qword [rsi+8*rdx]
            mov al, byte [r10]
            sub al,48
            mov byte [rcx+rdx-1],al
            inc rdx
            jmp args 
        end:
        
        ret
    global lsb
    lsb:
        and rsi,1
        cmp rsi,1
        jne fin
        add rdi,0x8
    
    fin:
    mov rax,rdi
    ret

    global main
    main:
        mov rcx, PIN
        call reader
        
        mov rax,0
        add al,byte [PIN]
        cmp al,0
        je last

        shl eax,2
        and eax,0x1f
        cmp eax,0
        jne last

        add al, byte [PIN+0x3]
        add al, byte [PIN]
        
        mov rsi,rax
        ror al,1
        and al,0x7f
        
        mov rdi,rax
        call lsb


        add al,byte [PIN+0x2]
        cmp eax,0x14
        jne last

        mov rax,0
        mov rdx,0
        mov rbx,0

        mov al, byte [PIN+0x1]
        mov bl, byte [PIN+0x3]
        
        mul bx
        mov dx,0
        mov bl, byte [PIN+0x2]
        div bx

        mov bl, byte [PIN]
        shr bx,1
        cmp bx,dx
        jne last

        mov rsi,victory
        call print_str
        
    last:
        mov rax,SYS_exit
        mov rdi,EXIT_success
        syscall

