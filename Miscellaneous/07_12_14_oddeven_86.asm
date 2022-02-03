assume cs:code,ds:data
data segment
	arr db 0Fh, 0Ah, 02h, 0Fh, 01h, 03h
	count dw 0006h
	oddc db 00h
	evenc db 00h
data ends
code segment
	org 0100h
start:
	mov ax,data
	mov ds,ax

	mov cx,count
	lea si,arr

	mov dx,0000h
	mov ax,0000h

L1:
	mov al,[si]
	div 02
	cmp ah,00	;if remainder is 0 then, even
	jnz odd
	inc dh		; dh for even count
	jmp skip
odd : 
	inc dl;		; dl for odd count
skip :
	inc si
	loop L1
here:
	mov oddc,dl
	mov evenc,dh
	
	mov ah,4ch
	int 21h
code ends
end start