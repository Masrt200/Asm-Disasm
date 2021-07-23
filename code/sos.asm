;sum of squares
;calculatesL 1^2+2^2+3^2...10^2
;Mohit Agarwal
;17-5-21 -- after hours of brainfuck

SECTION .data
    SYS_EXIT equ 60
    EXIT_SUCCESS equ 0

    CN  db 10
    SUM dw 0

SECTION .text
    global _start

    _start:
        mov cl, byte [CN]  ; cl=10
        mov bl,1           ; bl=1
    sum_loop:
        mov al,bl          ;al=2
        mul al             ;al=2*2 ; al=4
        add word [SUM],ax  ;SUM=SUM+4
        inc bl             ;bl=2
        dec cl             ;cl=9 
        cmp cl,0           ; greater 
        jg sum_loop         
    last:
        mov rax,SYS_EXIT
        mov rdi,EXIT_SUCCESS
        syscall
