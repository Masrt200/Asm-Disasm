; learning data types correctly
; Mohit Agarwal
; 17-05-2021
section .data
;define constants
EXIT_SUCCESS equ 0 ;successful operation
SYS_EXIT equ 60    ;sysexit syscall

;define variables
bvar1 db 8
bvar2 db 16
bres  db 0

section .text
global _start
_start:
;byte addition
loop:
    mov al, byte [bvar1]
    add al, byte [bvar2]
    mov byte [bres], al

;end program
last:
mov rax, SYS_EXIT
mov rdi, EXIT_SUCCESS
syscall


