# sys-exit
mov rax,60   ;sysexit
mov rdi,0    ;success
syscall      ;call kernel

# sys-write
before this we need store the variable we want to print in rsi
and its length in rdx

mov rax,1   ;syswrite
mov rdi,1   ;stdout
syscall     ;call kernel

for x86 arch, we use int 0x80 to call the kernel

.bss -> for variables to be used later
.data -> for constants

![]('images/x64 register.png')

8 general purpose registers:
EAX, EBX, ECX, EDX, EDI, ESI, EBP, and ESP

**ESI** => Source Index;        source in string/memory operations (basically string data in stored here)
**EDI** => Destination Index;   destination in string/memory operations

AX; accumualtor =>      primary accumulator
DX; data register=>     used with AX for large multiply and divide operations
CX; count register =>   used to store loop counts in iterative operations
BX; base register =>    address indexing

SP; Stack Pointer  =>   points to the current position of data within the program stack
BP; Base Pointer   =>   refers to the base of the stack

%rax	System call     %rdi	                %rsi	            %rdx
0	    sys_read	    unsigned int fd 	    char *buf	        size_t count			
1	    sys_write	    unsigned int fd	        const char *buf	    size_t count			
2	    sys_open	    const char *filename	int flags	        int mode			
3	    sys_close	    unsigned int fd	
60	    sys_exit	    int error_code

byte            byte         b
word            word         w
doubleword      dword        d
quadword        qword        q
doublequadword  dqword       dd

# GPRS
rax eax ax al
rbx ebx bx bl
r8  r8d r8w r8b
r9  r9d r9w r9b

# section .data  --> All initialized variables and constants are placed here.
consts declared using
<name> equ <value>
variables using
<name> <data_type> <value>
data_type --> db,dw,dd,dq,ddq,dt
               8,16,32,64,128,128

# section .bss --> All un-intialized variables are stored here
variables are defined as:
<name> <data-type> <count>  //count is the number of elements in that variable
                            // and they are not initialized to any value

data_type --> resb,resw,resd,resq,resdq
                8   16    32  64    128


compile using::  nasm -g -f elf64 file.asm -l file.lst
link using::     ld -g file.o -o file

# INSTRUCTIONS

## mov <dest> <src>  ; size of the destination operand must be same as the source operand 

!! both operands cannot be memory
!! destination operand cannot be an intermediate
!! to move from memory to memory, an intermediate operation is required

> for double-word destination and source operand, the upper-order portion of the quadword register is set to 0. 
//maybe important in the future

**mov eax, dword [myVariable]**
here: mov --> instruction
      eax --> register, destination
      dword --> how much data to move
      myVariable --> memory location of the variable
      [myVariable] --> value at that memory location, important for accessing values

## lea <reg64> <mem>
places address of memory into the register
lea rcx, byte [bvar]

# Conversions

## Narrowing Conversions
mov rax,500 ; 1f4
mov byte [bvar2], al; bvar2=f4;

## Widening Conversions
movzx <dest> <src>

`movzx will mov the value of the src to dest, and will set the upper bits of the dest to zero`
`movsx` --> same thing but for signed values

## ADD
add <dest>,<src>  --> both operands cannot be memory, and destination cannot be an intermediate

```
bNum1 db 42 
bNum2 db 73
bAns db  0
```

to perform the above we would do,
mov al, byte [bNum1]
add al, byte [bNum2]
mov byte [bAns], al

## INC
inc <operand>
will add one to its value

## adc
it is used to add the values in two operand and add their carry bit as well
adc <dest>, <src> # <dest>=<dest>+<src>+<carry>

example
```
dquad1 ddq 0x1A000000000000000
dquad2 ddq 0x2C000000000000000 
dqSum  ddq 0
```
since dquad1 is 128bits we can't store it in a 64 bit register in the machine
but we can use 2 64 bit registers to do this

mov rax, qword [dquad1]    ;; the first 64 bits are moved to the rdx register
mov rdx. qword [dquad1+8]  ;; this adds 8 bytes or 64 bits to the memory location and hence the last 64 bits are moved to the rdx register
;; remember little-endian format

add rax, qword [dquad2]
adc rdx, qword [dquad2+8]

mov qword [dqsum], rax
mov qword [dqsum+8],rdx

## SUB
sub dest, src ;; the destination operand cannot be an immediate.Both operands, cannot be memory

## DEC 
decrease value of operand by one
dec <operand>

## MUL and IMUL
basically use two operand mul and imul  ?? does two operand mul exists??

mul dword [val]

stores the value of eax*val i edx:eax, where edx contains the upper bits and eax the lower bits
same goes for others like
rdx:rax - qwords
dx:ax - words
ah:al - bytes

imul <dest> <src>
imul <dest> <src> <imm> ;; dest=src*imm

## DIV and IDIV

div word [val]

stores the value of ax/val in ax and the remainder in dx
same goes for
rax, rdx
ah,al
edx,eax

**Note to make initialize rdx=0, before dividing**

## LOGICAL INSTRUCTION
and <dest> <src>
or <dest> <src>
xor <dest> <src>
not <operand>  ;; basically one's complement

## SHIFTS

shl --> shift left
shl <dest>, <imm>/c1  (value of imm or c1 must be between 1 and 64)
shr --> shift right
shr <dest>, <imm>/c1

```
arithmetic shifts: sal <dest> <imm>
                    sar <dest> <imm>
```

## ROTATE -- basically rotates around the bits in the number
rol <dest> <imm>/c1 ;; imm or c1 must be between (0,64)
ror <dest> <imm>/c1

# LABELS
A program label is the target, or a location to jump to, for control statements.

labels have format as follows, they are case sensitive and can be defined only once
abc:
hello:
last:

etc

# CONTROL INSTRUCTIONS

## jmp
jmp <label>
jmp flag ; jumps to label flag

# Conditional

## cmp

cmp <op1> <op2> 
Where <op1> and <op2> are not changed and must be of the same size
both cannot be memory locations
op2 can be an intermediate but op1 cannot be

cmp is usually followed by jump statements like
je jump equal
jne jump not equal
jg  jump greater than
jl  jump less than
jle jump less than equal to
jge jump greater than equal to

general syntax is 
je <label> ;; etc

```
try this:
if (x != 0) {
    ans = x / y;
    errFlg = FALSE;
    } 
else {
    ans = 0;
    errFlg = TRUE;
}

TRUE equ 1
FALSE equ 0
x dd 0
y dd 0
ans dd 0
errFLAG db FALSE


cmp dword [x],0
je equal
mov eax,dword [x]
idiv eax,dword[y]
mov dword [ans],eax
mov byte [errFLAG],FALSE
equal:
mov dword [ans],0
mov byte [errFLAG], TRUE
```


!! jmp can jump to anywhere in the program
others have a limit of 128 bytes from the conditional statement

## TEST
```
CMP subtracts the operands and sets the flags. Namely, it sets the zero flag if the difference is zero (operands are equal).

TEST sets the zero flag, ZF, when the result of the AND operation is zero. If two operands are equal, their bitwise AND is zero when both are zero. TEST also sets the sign flag, SF, when the most significant bit is set in the result, and the parity flag, PF, when the number of set bits is even.

JE [Jump if Equals] tests the zero flag and jumps if the flag is set. JE is an alias of JZ [Jump if Zero] so the disassembler cannot select one based on the opcode. JE is named such because the zero flag is set if the arguments to CMP are equal.

TEST eax, eax
je     0x117e <main+53>

jumps if the %eax is zero.
```


# loop

loop <label>

is equilvalent to

dev rcx
cmp rcx,0
jne <label>

but if we forget to set the value of rcx, it may result in looping an unknown amount of time

**RCX IS FOR LOOPING**
**RAX AND RDX FOR MULTIPLICATION AND DIVISION**


# gdb
use:
x/1c $variable name to check its value after any breakpoing

i r
to check the register info
disas _start

info functions


# basic programs
sum of squares
fibonacci series
sum of primes
pascal's triangle


# STACK: PUSH AND POP

!! **The stack is implemented in reverse in memory**

push <operand64>    -> since architecture is 64 we push and pop quadwords only
                       Push the 64-bit operand on the stack.
                       First, adjusts rsp accordingly (rsp-8) and then copy the operand to [rsp].
                       The operand may not be an immediate value(can be variables and registers). Operand is not changed.

pop <operand64>     Pop the 64-bit operand from the stack.
                    Adjusts rsp accordingly (rsp+8).
                    The operand may not be an immediate value.
                    Operand is overwritten.

*rsp points to the top of the stack*
In the genral memory layout, stack sits at the top (high memory ends)

stack grows downwards and heap grows upwards; if stack and heap meet program will crash as there is no memory

## PUSH
rsp is decreased by 8                                   # moves downwards in memory
value of the operand is copied to the stack at [rsp]    # value in pushed

## POP
current top of the stack at [rsp] is overwritten in the operand     #value is popped    
rsp is increased by 8                                               #moves upwards in memory

**Note: Values pushed still resided in memory and can be overwritten when pushed again**
**since it exists, it can be accessed again by the proper address. Though this is highly unrealiable**
**get why size of the architecture is pushed to the stack??**

Example:

mov rax, 6700 ; 6700 = 0x0000000000001A2C
push rax
mov rax, 31   ;   31 = 0x0000000000000001F
push rax

NOW after these stack will look like

at start rsp=rbp

00  <- rbp is here   let 0x3fffffffffffff
00
00
00
00
00
1A
2C                      0x3ffffffffffff7 <- rsp-8 occured here
00                       
00
00
00
00
00
00
1F  <- rsp is here       0x3fffffffffffef <- then another rsp-8

Like this it is at the top, but in reverse order in memory
see why little endian is used?

**ONLY THE STACK IS REVERSED**
> other things like memory and values go from lower memory to highed memory




## neg __> (instruction) used to negate a value


# MACRO

macros are like, define in c/cpp... used to replace repeated code

single line declared as 

*%define mulby4(x) shr x,4*

called by,

*mulby4 (eax)*

MULTILINE declared as,

%macro name 2
    mov eax, %1
    mov ebx,%2
    add eax,ebx
    %%end
%endmacro

# FUNCTIONS

declared as:
```
global <func_name>
func_name:
    //body

ret
```

**A function must be written before it can be used.**


r8,r9 registers address




