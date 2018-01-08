BITS 64

global strpbrk:function
extern _GLOBAL_OFFSET_TABLE_	
SECTION .text

strpbrk:
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
	cmp byte[RDI+RCX], 0
	je notfound

bigloop:
	mov R9B, [RSI+R8]
	cmp byte [RSI+R8], 0
	je reloop
	cmp byte [RDI+RCX], R9B
	je end
	inc R8
	jmp bigloop
	
reloop:
	XOR R8, R8
	inc RCX
	cmp byte[RDI+RCX], 0
	je notfound
	jmp bigloop

notfound:
	MOV RAX, 0
	LEAVE
	ret
	
end:
	mov RAX, RDI
	ADD RAX, RCX
	LEAVE
	ret
