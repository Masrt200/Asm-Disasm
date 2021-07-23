; Masrt 
; 25-05-21

;; calling read and write functions from the linked source file
extern print_str
extern reading

section .data

LF equ 10
NULL equ 0
STRLEN equ 50
;; variable to keep count
SHIFT dw 0
prmpt db "Message? ",NULL
prmpt2 db "Shift: ",  NULL
prmpt3 db "Secret!!! ",NULL
newline db LF,NULL


section .bss
STRING resb STRLEN+2
SSS resb 5

section .text
    global _start

    ;; string to int of the value SHIFT
    global sti 
    sti:
        push rbp
        mov rbp,rsp 
        push rbx

        mov r12,0
        pushloop:
            cmp byte [rdi+r12],NULL
            je mid
            mov dl, byte [rdi+r12]
            sub dl,48
            push rdx
            inc r12
            jmp pushloop
        
        mid:
        mov rax,1
        mov rdx,0
        mov rbx,0
        mov r8,1
        mov r9,10
        poploop:
            cmp r12,0
            je theend
            pop r8
            imul r8,rax
            add rbx,r8
            mul r9
            dec r12
            jmp poploop
        
        theend:
        mov word [SHIFT],bx

        
        pop rbx
        pop rbp
        ret

    ;;cipher time
    global julius
    julius:
        mov r12,0
        mov r10,26
        looping:
            cmp byte [rdi+r12],NULL
            je done
            mov al, byte [rdi+r12]
            cmp al,97
            jl upper
            cmp al,122
            jg else
            sub al,97
            add al, byte[rsi]
            mov ah,0
            div r10b
            mov al,ah
            add al,97
            jmp else

            upper:
            cmp  al,65
            jl else
            cmp al,90
            jg else
            sub al,65
            add al,byte[rsi]
            mov ah,0
            div r10b
            mov al,ah
            add al,65

            else:
                mov byte [rdi+r12],al
                inc r12
                jmp looping

        done:
        ret



    _start:
        mov rsi,prmpt
        call print_str

        mov r10,STRING
        call reading

        mov rsi,prmpt2
        call print_str

        mov r10,SSS
        call reading

        mov rdi,SSS
        call sti

        mov rdi,STRING
        mov rsi,SHIFT
        call julius

        mov rsi,prmpt3
        call print_str

        mov rsi,STRING
        call print_str

        mov rsi,newline
        call print_str

    last:
        mov rax,60
        mov rdi,0
        syscall
