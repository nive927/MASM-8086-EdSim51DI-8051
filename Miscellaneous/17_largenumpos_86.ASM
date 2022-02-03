; Program to find the max in a list

assume cs:code, ds:data
data segment
	arr db 11h, 22h, 44h, 33h, 88h
	count dw 0005h
	max db 00h
	pos db 01h
data ends
code segment
	org 0100h
start:
	mov ax, data
	mov ds, ax
	
	mov cx, count
	dec cx
	
	lea si, arr	
	mov al, [si]
	inc si
	mov bl,02h
	
	L1:
		cmp al, [si]
		jnc skip
		mov al, [si]
		mov pos,bl
	skip:	inc si
		inc bl
		loop L1
	
here:
	mov max, al
	mov ah, 4ch
	int 21h
code ends
end start