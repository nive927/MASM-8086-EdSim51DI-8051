;number of 1s and 0s in 16-bit number

assume cs:code, ds:data
data segment 
	num dw 00afh	
	count0 db 00h
	count1 db 00h
data ends
code segment
	org 0100h
start:
	mov ax, data
	mov ds, ax

	mov bl, 00h	; counter for 0s
	mov bh, 00h	; counter for 1s

	mov ax, num
	mov cx, 10h	; hex 10, dec 16

loop1:	
	rcr ax, 1
	jc here1 
	inc bl
	jmp here2
here1:	inc bh
here2:	loop loop1

	mov count0, bl
	mov count1, bh
	
	mov ah, 4ch
	int 21h 
code ends
end start