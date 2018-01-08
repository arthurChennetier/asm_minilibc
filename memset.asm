        BITS 64

	global memset:function
	extern _GLOBAL_OFFSET_TABLE_

memset:
	push RBP
	mov RBP, RSP
	push RBX
	call .get_GOT
	
.get_GOT:
	pop     rbx
        add     rbx,_GLOBAL_OFFSET_TABLE_+$$-.get_GOT wrt ..gotpc 
	
func:	XOR RAX, RAX
	mov RBX, RSI
	mov RCX, 0
loop:
	cmp RCX, RDX
	je lv
	mov byte[RDI + RCX], bl
	inc RCX
	jmp loop
lv:
	mov RAX, RDI
	leave
	ret
