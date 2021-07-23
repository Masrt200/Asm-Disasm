; reverse a list of elements
; push them to the stack and then pop them back off to the memory

SECTION .data
SYS_EXIT equ 60
EXIT_SUCCESS equ 0

numbers dq 65521,57005,12,51984,4458
len dq 5

SECTION .text
    global _start

    _start:
        mov rcx, qword [len]    ; counter for comparing
        mov rbx, numbers        ; address of list numbers
        mov rax,0               ; used for pop, popped value is stored here
        mov r8,0                ; element counter from 0 to len

        push_loop:
            push qword [rbx+8*r8] ; push element at [rbx+8*r8] on the stack, that means, [rbx+0],[rbx+8],[rbx+16] etc
            inc r8                ; incrementing r8
            dec rcx                 ; generic loop condition 
            cmp rcx,0               ; generic loop condition
            jne push_loop           ; generic loop condition

        mov rcx, qword [len]
        mov rbx, numbers
        mov r8, 0
        pop_loop:
            pop rax                 ;pops the value on the top of the stack into rax
            mov qword [rbx+8*r8], qword rax   ; stores rax in the memory specified by [rbx+8*r8]
            inc r8                  ; increments r8   
            dec rcx                 ; generic loop condition
            cmp rcx,0               ; generic loop condition
            jne pop_loop            ; generic loop condition

    last:
        mov rax, SYS_EXIT
        mov rdi, EXIT_SUCCESS
        syscall

