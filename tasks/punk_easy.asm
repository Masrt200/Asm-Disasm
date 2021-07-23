     1                                  ;; password lock checkers
     2                                  ;; what 4 digit code passed as parameters will unlock the code
     3                                  extern print_str
     4                                  
     5                                  section .data
     6                                  NULL equ 0
     7                                  SYS_exit equ 60
     8                                  EXIT_success equ 0
     9                                  LF equ 10
    10                                  
    11 00000000 0A00                    newline db LF,NULL
    12 00000002 486572652773203520-     victory db "Here's 5 diamonds!",LF,NULL
    12 0000000B 6469616D6F6E647321-
    12 00000014 0A00               
    13                                  
    14                                  section .bss
    15 00000000 <res 00000004>          PIN resb 4
    16                                  
    17                                  section .text
    18                                      global reader
    19                                      reader:
    20 00000000 BA01000000                      mov rdx,1
    21                                  
    22                                          args:
    23 00000005 4839FA                              cmp rdx,rdi
    24 00000008 7D17                                jge end
    25 0000000A B800000000                          mov rax,0
    26 0000000F 4C8B14D6                            mov r10, qword [rsi+8*rdx]
    27 00000013 418A02                              mov al, byte [r10]
    28 00000016 2C30                                sub al,48
    29 00000018 884411FF                            mov byte [rcx+rdx-1],al
    30 0000001C 48FFC2                              inc rdx
    31 0000001F EBE4                                jmp args 
    32                                          end:
    33                                          
    34 00000021 C3                              ret
    35                                      global lsb
    36                                      lsb:
    37 00000022 4883E601                        and rsi,1
    38 00000026 4883FE01                        cmp rsi,1
    39 0000002A 7504                            jne fin
    40 0000002C 4883C708                        add rdi,0x8
    41                                      
    42                                      fin:
    43 00000030 4889F8                      mov rax,rdi
    44 00000033 C3                          ret
    45                                  
    46                                      global main
    47                                      main:
    48 00000034 48B9-                           mov rcx, PIN
    48 00000036 [0000000000000000] 
    49 0000003E E8BDFFFFFF                      call reader
    50                                          
    51 00000043 B800000000                      mov rax,0
    52 00000048 020425[00000000]                add al,byte [PIN]
    53 0000004F 3C00                            cmp al,0
    54 00000051 0F8480000000                    je last
    55                                  
    56 00000057 C1E002                          shl eax,2
    57 0000005A 83E01F                          and eax,0x1f
    58 0000005D 83F800                          cmp eax,0
    59 00000060 7575                            jne last
    60                                  
    61 00000062 020425[03000000]                add al, byte [PIN+0x3]
    62 00000069 020425[00000000]                add al, byte [PIN]
    63                                          
    64 00000070 4889C6                          mov rsi,rax
    65 00000073 D0C8                            ror al,1
    66 00000075 247F                            and al,0x7f
    67                                          
    68 00000077 4889C7                          mov rdi,rax
    69 0000007A E8A3FFFFFF                      call lsb
    70                                  
    71                                  
    72 0000007F 020425[02000000]                add al,byte [PIN+0x2]
    73 00000086 83F814                          cmp eax,0x14
    74 00000089 754C                            jne last
    75                                  
    76 0000008B B800000000                      mov rax,0
    77 00000090 BA00000000                      mov rdx,0
    78 00000095 BB00000000                      mov rbx,0
    79                                  
    80 0000009A 8A0425[01000000]                mov al, byte [PIN+0x1]
    81 000000A1 8A1C25[03000000]                mov bl, byte [PIN+0x3]
    82                                          
    83 000000A8 66F7E3                          mul bx
    84 000000AB 66BA0000                        mov dx,0
    85 000000AF 8A1C25[02000000]                mov bl, byte [PIN+0x2]
    86 000000B6 66F7F3                          div bx
    87                                  
    88 000000B9 8A1C25[00000000]                mov bl, byte [PIN]
    89 000000C0 66D1EB                          shr bx,1
    90 000000C3 6639D3                          cmp bx,dx
    91 000000C6 750F                            jne last
    92                                  
    93 000000C8 48BE-                           mov rsi,victory
    93 000000CA [0200000000000000] 
    94 000000D2 E8(00000000)                    call print_str
    95                                          
    96                                      last:
    97 000000D7 B83C000000                      mov rax,SYS_exit
    98 000000DC BF00000000                      mov rdi,EXIT_success
    99 000000E1 0F05                            syscall
   100                                  
