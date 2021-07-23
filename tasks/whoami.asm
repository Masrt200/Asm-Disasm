
;;      Find the output when
;;   i)  ds:0x402000 = 0x157b0
;;  ii)  ds:0x402000 = 0x51445
;; iii)  ds:0x402000 = 0x10001

;; file format elf64-x86-64
;; Disassembly of section .text:

0000000000401000 <_start>:
  401000:	bb 00 00 00 00       	mov    ebx,0x0

0000000000401005 <func1>:
  401005:	/-> 48 ff c3             	inc    rbx
  401008:	|   48 3b 1c 25 00 20 40 	cmp    rbx,QWORD PTR ds:0x402000
  40100f:	00 
  401010:	|   7f 4f                	jg     401061 <last>
  401012:	|   ba 00 00 00 00       	mov    edx,0x0
  401017:	|   48 8b 04 25 00 20 40 	mov    rax,QWORD PTR ds:0x402000
  40101e:	00 
  40101f:	|   48 f7 f3             	div    rbx
  401022:	|   48 83 fa 00          	cmp    rdx,0x0
  401026:	\-- 75 dd                	jne    401005 <func1>
  401028:	    49 89 d8             	mov    r8,rbx
  40102b:	    bb 00 00 00 00       	mov    ebx,0x0
  401030:	    b9 00 00 00 00       	mov    ecx,0x0

0000000000401035 <func2>:
  401035:	/-> 48 ff c3             	inc    rbx
  401038:	|   4c 89 c0             	mov    rax,r8
  40103b:	|   ba 00 00 00 00       	mov    edx,0x0
  401040:	|   48 f7 f3             	div    rbx
  401043:	|   48 83 fa 00          	cmp    rdx,0x0
  401047:	+-- 75 ec                	jne    401035 <func2>
  401049:	|   48 ff c1             	inc    rcx
  40104c:	|   4c 39 c3             	cmp    rbx,r8
  40104f:	\-- 7c e4                	jl     401035 <func2>
  401051:	    48 83 f9 02          	cmp    rcx,0x2
  401055:	    75 ae                	jne    401005 <func1>
  401057:	    48 89 1c 25 08 20 40 	mov    QWORD PTR ds:0x402008,rbx
  40105e:	00 
  40105f:	    eb a4                	jmp    401005 <func1>

0000000000401061 <last>:
  401061:	b8 3c 00 00 00       	mov    eax,0x3c
  401066:	bf 00 00 00 00       	mov    edi,0x0
  40106b:	0f 05                	syscall 
