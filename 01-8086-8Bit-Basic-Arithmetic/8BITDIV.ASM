
;Program for dividing a 16-bit number by an 8-bit number
;No dedicated instruction available in 8086
;to perform 8 bit / 8 bit

assume cs:code,ds:data
data segment 
	opr1 db 11h
        opr2 db 99h
        quotient db 00H
	reminder db 00H      
data ends
code segment
        org 0100h
start:  mov ax,data
        mov ds,ax
        mov bl,opr1
        mov al,opr2
        mov ah,00h
	div bl
here:	mov reminder,ah  	
	mov quotient,al
        mov ah,4ch
        int 21h
	code ends
end start
