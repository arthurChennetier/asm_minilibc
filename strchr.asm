	BITS 64

global strchr:function
extern _GLOBAL_OFFSET_TABLE_

strchr:
	push RBP
	mov RBP, RSP
	call .get_GOT

.get_GOT:
	pop     rbx
	add     rbx,_GLOBAL_OFFSET_TABLE_+$$-.get_GOT wrt ..gotpc
	

prep:	
	XOR RCX, RCX
	
loop:
	cmp byte [RDI+RCX], sil
	jz return
	cmp byte [RDI+RCX], 0
	jz nofind
	inc RCX
	jmp loop

return:
	mov RAX, RDI
	ADD RAX, RCX
	LEAVE
	ret

nofind:
	mov RAX, 0
	LEAVE
	ret
