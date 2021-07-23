section .text
    global _start
_start:
    mov rax, year
    mov rbx,400
    div rbx
    cmp rdx,0   
    je leap_year
    cmp rdx,0
    jne coutt


coutt:
    mov rax, year
    mov rbx,100
    div rbx
    cmp rdx,0
    je not_leap_year
    cmp rdx,0
    jne couttt
couttt:
    mov rax, year
    mov rbx,4
    div rbx
    cmp rdx,0
    je leap_year
    cmp rdx,0
    jne not_leap_year
        
leap_year:
    mov rdx, len
    mov rcx, msg
    mov rbx, 1 ; file descriptor for stdout
    mov rax, 4 ; sys_write call number (for 32-bit)
    syscall
    mov rbx,0   ;process' exit code
    mov rax,1   ;system call number (sys_exit)
    syscall   ;call kernel - this interrupt won't return

not_leap_year:
    mov rdx, lenn
    mov rcx, msgg
    mov rbx, 1 ; file descriptor for stdout
    mov rax, 4 ; sys_write call number (for 32-bit)
    syscall
    mov rbx,0   ;process' exit code
    mov rax,1   ;system call number (sys_exit)
    syscall    ;call kernel - this interrupt won't return

 section .data 
    year dw 4000
    msg dd "Year is a leap year",0xa
    len equ $ - msg
    msgg dd "Not a leap year",0xa
    lenn equ $ - msgg