;; find the sqrt of a number
;; masrt
;; 23-5-21

section .data
    SYS_EXIT equ 60
    EXIT_SUCCESS equ 0
    NUM dd 1546213
    SQRT dd 0

section .text
    global _start
    _start:

        mov ecx, 50
        mov ebx, dword [NUM]
        mov dword [SQRT],ebx

        iter:
            mov eax, dword [NUM]
            mov edx,0
            div ebx                 ; eax=eax/ebx , edx=eax%ebx (not important)
            add ebx,eax             ; ebx=ebx+eax/ebx

            mov eax,ebx
            mov edx,0
            mov ebx,2
            div ebx                   ; ebx=ebx/2
            mov ebx,eax

            dec ecx
            cmp ecx,0
            jne iter
            mov dword [SQRT], ebx
    
    last:
        mov rax, SYS_EXIT
        mov rdi, EXIT_SUCCESS
        syscall


