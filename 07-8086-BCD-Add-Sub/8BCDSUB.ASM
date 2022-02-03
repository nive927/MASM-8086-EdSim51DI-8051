
;Program for subtracting two 8-bit BCD numbers

assume cs:code,ds:data
data segment 
	opr1 db 51h
        opr2 db 21h
        diff db 00H
	sign db 00H      
data ends
code segment
        org 0100h
start:
	mov ax,data
        mov ds,ax
        
        mov al,opr1
        mov bl,opr2
	mov ch,00h
	
	sub al,bl
	DAS
	jnc here
	mov bl, al
	mov al, 99H
	sub al, bl
	DAS
	mov bl, 01H
	add al, bl
	DAA
	inc ch
here:
	mov diff,al
	mov sign,ch
        mov ah,4ch
        int 21h
	code ends
end start
