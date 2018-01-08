	BITS 64

	SECTION .text
	global strncmp:function

strncmp:
	push RBP
	mov RBP, RSP
	XOR RAX, RAX
	XOR RCX, RCX

loop:
	cmp RCX, RDX
	je ok
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
	
ok:
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
	mov r9b, byte[RDI + RCX]
	sub r9b, r8b
	mov al, r9b
	leave
	ret
	
moin:
	mov r9b, byte[RDI + RCX]
	sub r8b, r9b
	mov al, r8b
	neg RAX
	leave
	ret
