        BITS 64

	global strstr:function
	extern _GLOBAL_OFFSET_TABLE_
	SECTION .text

strstr:
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
	XOR R10, R10
	XOR R11, R11
	cmp byte [RSI+R8], 0
	je second_null
	cmp byte [RDI+RCX], 0
	je notfound
	

size:
	cmp byte [RSI+R10], 0
	je bigloop
	inc R10
	jmp size
	
bigloop:
	mov R9B, [RSI+R8]
	cmp byte [RDI+R11], R9B
	jne reloop
	inc R8
	cmp byte [RSI+R8], 0
	je end
	inc R11
	jmp bigloop

reloop:
	XOR R8, R8
	inc RCX
	mov R11, RCX
	cmp byte [RDI+RCX], 0
	je notfound
	jmp bigloop

notfound:
	MOV RAX, 0
	LEAVE
	ret
	
second_null:
	MOV RAX, RDI
	LEAVE
	ret
	
end:
	MOV RAX, RDI
	ADD RAX, R11
	SUB RAX, R10
	ADD RAX, 1
	LEAVE
	ret
