;pattern made ny me :)

;looks like I am forgetting this
;so its a revision

section .data
SYS_exit equ 60
EXIT_SUCCESS equ 0
STDIN equ 0 ; standard input
STDOUT equ 1 ; standard output
STDERR equ 2 ; standard error
SYS_read equ 0 ; read
SYS_write equ 1 ; write
LF equ 10 ; line feed
NULL equ 0 ; end of string

SYM db "*" ;character to print
SPC db " " ;space in between 
NL db LF   ;\n 
N db 20
colours db "1","2","3","4","5","6","7","8","9"
NEED db 27,"[3","0","m"
clear_screen db 27, "[2J"

section .text
    global cprint
    cprint:
        push rcx
        push rdx
        push rax

        mov rdx,1
        mov rax,SYS_write
        mov rdi,STDOUT
        syscall

        pop rax
        pop rdx
        pop rcx
        ret

    global looper
    looper:
        push rcx
        begin:
            cmp bl,cl
            je end
            call cprint
            inc bl
            jmp begin
        end:
            pop rcx
            ret

    global _start
    _start:
        
        
        mov r10,1
        rock:
            rdtsc
            mov rdx,0
            mov rbx,9
            div rbx
            mov bl,byte[colours+rdx]
            mov byte[NEED+3],bl

            mov rsi,NEED
            mov rdx,5
            mov rax,SYS_write
            mov rdi,STDOUT
            syscall

            mov rsi,clear_screen
            mov rdx,4
            mov rax,SYS_write
            mov rdi,STDOUT
            ;syscall

            mov al, byte [N]
            mov cl,1
            ;;start of main loop
            mloop:
                mov bl,1
                mov rsi,SPC
                call looper

                mov rsi,SYM
                mov bl,0
                call looper
                
                mov dl,cl
                neg cl
                add cl,al
                shl cl,2
                mov bl,0
                mov rsi,SPC
                call looper

                mov cl,dl
                    
                mov bl,0
                mov rsi,SYM
                call looper 

                mov rsi,NL
                call cprint
                    
                inc cl
                cmp cl,al
                jle mloop
            inc r10
            cmp r10,100
            jne rock
        
    
    _last:
        mov rax,SYS_exit
        mov rdi,EXIT_SUCCESS
        syscall
