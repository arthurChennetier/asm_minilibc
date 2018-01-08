	BITS 64

global rindex:function
extern _GLOBAL_OFFSET_TABLE_
SECTION .text
	
rindex:
	push RBP
	mov RBP, RSP
	call .get_GOT

.get_GOT:
	pop     rbx
	add     rbx,_GLOBAL_OFFSET_TABLE_+$$-.get_GOT wrt ..gotpc

prep:
	XOR RAX, RAX
	XOR RCX, RCX
	XOR R8, R8
	cmp sil, 0
	je last
	
loop:
	cmp byte [RDI+RCX], sil
	je save
	cmp byte [RDI+RCX], 0
	je return
	inc RCX
	jmp loop

save:
	mov R8, RCX
	inc RCX
	jmp loop

return:
	cmp byte[RDI+R8], sil
	jne not_found
	mov RAX, RDI
	ADD RAX, R8
	LEAVE
	ret

not_found:
	mov RAX, 0
	LEAVE
	ret
	

last:	
	cmp byte [RDI+RCX], 0
	je last_end
	inc RCX
	jmp last

	
last_end:	
	mov RAX, RDI
	ADD RAX, RCX
	LEAVE
	ret
