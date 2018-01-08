 	BITS 64
	
global strlen:function
extern _GLOBAL_OFFSET_TABLE_

strlen:
	push RBP		
	mov RBP, RSP

	call .get_GOT

.get_GOT:
	pop     rbx
	add     rbx,_GLOBAL_OFFSET_TABLE_+$$-.get_GOT wrt ..gotpc
	
prep:	
	XOR RAX, RAX

loop:	
	cmp byte [RDI+RAX], 0h
	jz return
	inc RAX
	jmp loop

return:
	LEAVE
	ret
