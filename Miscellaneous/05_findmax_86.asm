; Program to find the max in a list

assume cs:code, ds:data
data segment
	arr db 0CCh, 02h, 03h, 0FFh, 05h, 0FCh
	count dw 0006h
	max db 00h
	pos db 00h
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
	
	mov pos, 01
	mov bl, 02h
		
	L1:
		cmp al, [si]
		jnc skip
		mov al, [si]
		mov pos, bl
	skip:	inc si
		inc bl
		loop L1
	
here:
	mov max, al
	mov ah, 4ch
	int 21h
code ends
end start