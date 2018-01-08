	BITS 64
	
	SECTION .text
	global strcasecmp:function

strcasecmp:
	push RBP
	mov RBP, RSP
	XOR RAX, RAX
	XOR RCX, RCX

loop:
	xor r8b, r8b
	xor r9b, r9b
	mov r8b, byte[RSI + RCX]
	mov r9b, byte[RDI + RCX]
	cmp r8b, 0
	je return
	cmp r9b, 0
	je return
	cmp r8b, "Z"
	jbe hm
it:	
	cmp r9b, "Z"
	jbe nm
intero:	
	cmp r9b, r8b
	jne return
	inc RCX
	jmp loop

return:
	
	cmp r9b, 0
	jne lol
	cmp r8b, 0
	mov RAX, 42
	leave
	ret

lol:
	cmp r8b, 0
	je sup
	cmp r9b, 0
	je moin
	cmp r8b, r9b
	ja moin
	jmp sup

sup:
	sub r9b, r8b
	mov al, r9b
	leave
	ret
	
moin:
	sub r8b, r9b
	mov al, r8b
	neg RAX
	leave
	ret

hm:
	cmp r8b, "A"
	jb it
	add r8b, 32
	jmp it

nm:
	cmp r9b, "A"
	jb intero
	add r9b, 32
	jmp intero

