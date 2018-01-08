	BITS 64

	global memcpy:function
	extern _GLOBAL_OFFSET_TABLE_
	
memcpy:
	push RBP
	mov RBP, RSP
	push RBX
	call .get_GOT

.get_GOT:
	pop     rbx
        add     rbx,_GLOBAL_OFFSET_TABLE_+$$-.get_GOT wrt ..gotpc
func:	
	XOR RAX, RAX
	mov RBX, RSI
	mov RCX, 0

loop:
	cmp RCX, RDX
	je stop
	mov r8b, byte[RSI + RCX]
	cmp r8b, 0
	je lv
	mov byte[RDI + RCX], r8b
	inc RCX
	jmp loop
lv:
	mov byte[RDI + RCX], 0
	mov RAX, RDI
	leave
	ret

stop:	
	mov RAX, RDI
	leave
	ret
	
