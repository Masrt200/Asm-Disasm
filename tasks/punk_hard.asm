
punk77:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    rsp,0x8
  401008:	48 8b 05 e9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fe9]        # 403ff8 <__gmon_start__>
  40100f:	48 85 c0             	test   rax,rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	call   rax
  401016:	48 83 c4 08          	add    rsp,0x8
  40101a:	c3                   	ret    

Disassembly of section .text:

0000000000401020 <_start>:
  401020:	f3 0f 1e fa          	endbr64 
  401024:	31 ed                	xor    ebp,ebp
  401026:	49 89 d1             	mov    r9,rdx
  401029:	5e                   	pop    rsi
  40102a:	48 89 e2             	mov    rdx,rsp
  40102d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  401031:	50                   	push   rax
  401032:	54                   	push   rsp
  401033:	49 c7 c0 e0 12 40 00 	mov    r8,0x4012e0
  40103a:	48 c7 c1 70 12 40 00 	mov    rcx,0x401270
  401041:	48 c7 c7 44 11 40 00 	mov    rdi,0x401144
  401048:	ff 15 a2 2f 00 00    	call   QWORD PTR [rip+0x2fa2]        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  40104e:	f4                   	hlt    
  40104f:	90                   	nop

0000000000401050 <_dl_relocate_static_pie>:
  401050:	f3 0f 1e fa          	endbr64 
  401054:	c3                   	ret    
  401055:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40105c:	00 00 00 
  40105f:	90                   	nop

0000000000401060 <deregister_tm_clones>:
  401060:	b8 40 40 40 00       	mov    eax,0x404040
  401065:	48 3d 40 40 40 00    	cmp    rax,0x404040
  40106b:	74 13                	je     401080 <deregister_tm_clones+0x20>
  40106d:	b8 00 00 00 00       	mov    eax,0x0
  401072:	48 85 c0             	test   rax,rax
  401075:	74 09                	je     401080 <deregister_tm_clones+0x20>
  401077:	bf 40 40 40 00       	mov    edi,0x404040
  40107c:	ff e0                	jmp    rax
  40107e:	66 90                	xchg   ax,ax
  401080:	c3                   	ret    
  401081:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  401088:	00 00 00 00 
  40108c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401090 <register_tm_clones>:
  401090:	be 40 40 40 00       	mov    esi,0x404040
  401095:	48 81 ee 40 40 40 00 	sub    rsi,0x404040
  40109c:	48 89 f0             	mov    rax,rsi
  40109f:	48 c1 ee 3f          	shr    rsi,0x3f
  4010a3:	48 c1 f8 03          	sar    rax,0x3
  4010a7:	48 01 c6             	add    rsi,rax
  4010aa:	48 d1 fe             	sar    rsi,1
  4010ad:	74 11                	je     4010c0 <register_tm_clones+0x30>
  4010af:	b8 00 00 00 00       	mov    eax,0x0
  4010b4:	48 85 c0             	test   rax,rax
  4010b7:	74 07                	je     4010c0 <register_tm_clones+0x30>
  4010b9:	bf 40 40 40 00       	mov    edi,0x404040
  4010be:	ff e0                	jmp    rax
  4010c0:	c3                   	ret    
  4010c1:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  4010c8:	00 00 00 00 
  4010cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000004010d0 <__do_global_dtors_aux>:
  4010d0:	f3 0f 1e fa          	endbr64 
  4010d4:	80 3d 65 2f 00 00 00 	cmp    BYTE PTR [rip+0x2f65],0x0        # 404040 <__TMC_END__>
  4010db:	75 13                	jne    4010f0 <__do_global_dtors_aux+0x20>
  4010dd:	55                   	push   rbp
  4010de:	48 89 e5             	mov    rbp,rsp
  4010e1:	e8 7a ff ff ff       	call   401060 <deregister_tm_clones>
  4010e6:	c6 05 53 2f 00 00 01 	mov    BYTE PTR [rip+0x2f53],0x1        # 404040 <__TMC_END__>
  4010ed:	5d                   	pop    rbp
  4010ee:	c3                   	ret    
  4010ef:	90                   	nop
  4010f0:	c3                   	ret    
  4010f1:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  4010f8:	00 00 00 00 
  4010fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401100 <frame_dummy>:
  401100:	f3 0f 1e fa          	endbr64 
  401104:	eb 8a                	jmp    401090 <register_tm_clones>
  401106:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40110d:	00 00 00 

0000000000401110 <reader>:
  401110:	ba 01 00 00 00       	mov    edx,0x1

0000000000401115 <args>:
  401115:	48 39 fa             	cmp    rdx,rdi
  401118:	7d 17                	jge    401131 <end>
  40111a:	b8 00 00 00 00       	mov    eax,0x0
  40111f:	4c 8b 14 d6          	mov    r10,QWORD PTR [rsi+rdx*8]
  401123:	41 8a 02             	mov    al,BYTE PTR [r10]
  401126:	2c 30                	sub    al,0x30
  401128:	88 44 11 ff          	mov    BYTE PTR [rcx+rdx*1-0x1],al
  40112c:	48 ff c2             	inc    rdx
  40112f:	eb e4                	jmp    401115 <args>

0000000000401131 <end>:
  401131:	c3                   	ret    

0000000000401132 <lsb>:
  401132:	48 83 e6 01          	and    rsi,0x1
  401136:	48 83 fe 01          	cmp    rsi,0x1
  40113a:	75 04                	jne    401140 <fin>
  40113c:	48 83 c7 08          	add    rdi,0x8

0000000000401140 <fin>:
  401140:	48 89 f8             	mov    rax,rdi
  401143:	c3                   	ret    

0000000000401144 <main>:
  401144:	48 b9 44 40 40 00 00 	movabs rcx,0x404044
  40114b:	00 00 00 
  40114e:	e8 bd ff ff ff       	call   401110 <reader>
  401153:	b8 00 00 00 00       	mov    eax,0x0
  401158:	02 04 25 44 40 40 00 	add    al,BYTE PTR ds:0x404044
  40115f:	3c 00                	cmp    al,0x0
  401161:	0f 84 80 00 00 00    	je     4011e7 <last>
  401167:	c1 e0 02             	shl    eax,0x2
  40116a:	83 e0 1f             	and    eax,0x1f
  40116d:	83 f8 00             	cmp    eax,0x0
  401170:	75 75                	jne    4011e7 <last>
  401172:	02 04 25 47 40 40 00 	add    al,BYTE PTR ds:0x404047
  401179:	02 04 25 44 40 40 00 	add    al,BYTE PTR ds:0x404044
  401180:	48 89 c6             	mov    rsi,rax
  401183:	d0 c8                	ror    al,1
  401185:	24 7f                	and    al,0x7f
  401187:	48 89 c7             	mov    rdi,rax
  40118a:	e8 a3 ff ff ff       	call   401132 <lsb>
  40118f:	02 04 25 46 40 40 00 	add    al,BYTE PTR ds:0x404046
  401196:	83 f8 14             	cmp    eax,0x14
  401199:	75 4c                	jne    4011e7 <last>
  40119b:	b8 00 00 00 00       	mov    eax,0x0
  4011a0:	ba 00 00 00 00       	mov    edx,0x0
  4011a5:	bb 00 00 00 00       	mov    ebx,0x0
  4011aa:	8a 04 25 45 40 40 00 	mov    al,BYTE PTR ds:0x404045
  4011b1:	8a 1c 25 47 40 40 00 	mov    bl,BYTE PTR ds:0x404047
  4011b8:	66 f7 e3             	mul    bx
  4011bb:	66 ba 00 00          	mov    dx,0x0
  4011bf:	8a 1c 25 46 40 40 00 	mov    bl,BYTE PTR ds:0x404046
  4011c6:	66 f7 f3             	div    bx
  4011c9:	8a 1c 25 44 40 40 00 	mov    bl,BYTE PTR ds:0x404044
  4011d0:	66 d1 eb             	shr    bx,1
  4011d3:	66 39 d3             	cmp    bx,dx
  4011d6:	75 0f                	jne    4011e7 <last>
  4011d8:	48 be 2a 40 40 00 00 	movabs rsi,0x40402a
  4011df:	00 00 00 
  4011e2:	e8 19 00 00 00       	call   401200 <print_str>

00000000004011e7 <last>:
  4011e7:	b8 3c 00 00 00       	mov    eax,0x3c
  4011ec:	bf 00 00 00 00       	mov    edi,0x0
  4011f1:	0f 05                	syscall 
  4011f3:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  4011fa:	00 00 00 
  4011fd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000401270 <__libc_csu_init>:
  401270:	f3 0f 1e fa          	endbr64 
  401274:	41 57                	push   r15
  401276:	4c 8d 3d d3 2b 00 00 	lea    r15,[rip+0x2bd3]        # 403e50 <__frame_dummy_init_array_entry>
  40127d:	41 56                	push   r14
  40127f:	49 89 d6             	mov    r14,rdx
  401282:	41 55                	push   r13
  401284:	49 89 f5             	mov    r13,rsi
  401287:	41 54                	push   r12
  401289:	41 89 fc             	mov    r12d,edi
  40128c:	55                   	push   rbp
  40128d:	48 8d 2d c4 2b 00 00 	lea    rbp,[rip+0x2bc4]        # 403e58 <__do_global_dtors_aux_fini_array_entry>
  401294:	53                   	push   rbx
  401295:	4c 29 fd             	sub    rbp,r15
  401298:	48 83 ec 08          	sub    rsp,0x8
  40129c:	e8 5f fd ff ff       	call   401000 <_init>
  4012a1:	48 c1 fd 03          	sar    rbp,0x3
  4012a5:	74 1f                	je     4012c6 <__libc_csu_init+0x56>
  4012a7:	31 db                	xor    ebx,ebx
  4012a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4012b0:	4c 89 f2             	mov    rdx,r14
  4012b3:	4c 89 ee             	mov    rsi,r13
  4012b6:	44 89 e7             	mov    edi,r12d
  4012b9:	41 ff 14 df          	call   QWORD PTR [r15+rbx*8]
  4012bd:	48 83 c3 01          	add    rbx,0x1
  4012c1:	48 39 dd             	cmp    rbp,rbx
  4012c4:	75 ea                	jne    4012b0 <__libc_csu_init+0x40>
  4012c6:	48 83 c4 08          	add    rsp,0x8
  4012ca:	5b                   	pop    rbx
  4012cb:	5d                   	pop    rbp
  4012cc:	41 5c                	pop    r12
  4012ce:	41 5d                	pop    r13
  4012d0:	41 5e                	pop    r14
  4012d2:	41 5f                	pop    r15
  4012d4:	c3                   	ret    
  4012d5:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  4012dc:	00 00 00 00 

00000000004012e0 <__libc_csu_fini>:
  4012e0:	f3 0f 1e fa          	endbr64 
  4012e4:	c3                   	ret    

Disassembly of section .fini:

00000000004012e8 <_fini>:
  4012e8:	f3 0f 1e fa          	endbr64 
  4012ec:	48 83 ec 08          	sub    rsp,0x8
  4012f0:	48 83 c4 08          	add    rsp,0x8
  4012f4:	c3                   	ret    
