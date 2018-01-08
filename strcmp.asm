	BITS 64

	SECTION .text
	global strcmp:function

strcmp:
	push RBP
	mov RBP, RSP
	XOR RAX, RAX
	XOR RCX, RCX

loop:
	
	mov r8b, byte[RSI + RCX]
	cmp r8b, 0
	je return
	cmp byte[RDI + RCX], 0
	je return
	cmp byte[RDI + RCX], r8b
	jne return
	inc RCX
	jmp loop

return:
	cmp r8b, 0
	jne lol
	cmp byte[RDI + RCX], 0
	jne lol
	mov RAX, 0
	leave
	ret

lol:
	cmp r8b, 0
	je sup
	cmp byte[RDI + RCX], 0
	je moin
	cmp r8b, byte[RDI + RCX]
	ja moin
	jmp sup

sup:
	mov RAX, 1
	leave
	ret
	
moin:
	mov RAX, -1
	leave
	ret
