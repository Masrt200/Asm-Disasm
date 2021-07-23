; Selection sort in Assembly
; Mohit Agarwal
; 25-05-21
; OP program success

SECTION .data

SYS_EXIT equ 60
EXIT_SUCCESS equ 0

;list1 dw 55,11,20,36,84,7,40
;len1 dw 7
list2 dw 26, 23, 50, 85, 45, 90, 65, 18, 87, 92, 34, 97, 65, 91, 33,2
len2 dw 16
avg dw 0
min dw 0
max dw 0
med dw 0
sum dw 0
;list3 dw 15, 80, 72, 52, 49, 15, 29, 7, 72
;len3 dw 9

SECTION .text
    global _start

    global sort
    sort:
        push rbp            ; pushing rbp to stack
        mov rbp,rsp         ; using rbp as a reference
        sub rsp,4           ; make space for local variables
        push r12            ; prologue

        ; we can start accessing value from rbp+16 if they are on the stack
        ;and rdp minus how much we sub rsp if we made space for local variables

        mov byte [rbp-0x4],0 ; count i ;; byte takes on address size
        mov byte [rbp-0x3],0 ; count j 

        mov r12,0   ; i for looping
        loop1:
            mov r10w ,word [rdi+2*r12] ; small
            mov byte [rbp-0x4],r12b ; r11=index
            mov r9,r12  ; r9=j

            loop2:
                cmp word [rdi+2*r9],r10w
                jge else
                mov r10w, word [rdi+2*r9]
                mov byte [rbp-0x4],r9b
                else:
                    inc r9
                    cmp r9,rsi
                    jl loop2
            
            mov r8w, word [rdi+2*r12]
            mov r11b, byte [rbp-0x4] 
            mov word [rdi+2*r11], r8w
            mov word [rdi+2*r12], r10w
            inc r12
            cmp r12,rsi
            jl loop1

        
        pop r12
        mov rsp,rbp         ; clear locals
        pop rbp
        ret

    global stat
    stat:  ; (list,len,min,max,sum,avg,median)

        push rbp
        mov rbp,rsp
        push r12

        ;median is at rbp+16

        ;minimum
        mov r12w, word [rdi]
        mov word [rdx], r12w
        ;maximum
        dec rsi
        mov r12w, word [rdi+2*rsi]
        mov word [rcx],r12w
        inc rsi

        ;; SUM
        mov eax,0
        mov r12,0
        sum_loo:
            add ax,word [rdi+2*r12]
            inc r12
            cmp r12,rsi
            jl sum_loo

        mov word [r8],ax
        cwd
        ;; average
        idiv si
        mov word [r9],ax

        ;;median
        mov rdx,0
        mov rax,rsi
        mov r12,2
        div r12
        cmp rdx,0
        jne odd
        mov r12w, word [rdi+2*rax]
        dec rax
        add r12w, word [rdi+2*rax]
        mov rdx,0
        mov rax,r12
        mov r12,2
        div r12
        mov r11, qword [rbp+16]
        mov word [r11],ax

        jmp done
        odd:
            mov r12w, word [rdi+2*rax]
            mov r11, qword [rbp+16] 
            mov word [r11], r12w   

        done:

        pop r12
        pop rbp
        ret
    _start:

    mov rdi,list2
    mov si, word[len2]
    call sort

    mov rdx,min
    mov rcx,max
    mov r8,sum
    mov r9,avg
    push med
    call stat

    last:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall