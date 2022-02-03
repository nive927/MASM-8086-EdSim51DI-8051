
;Program for dividing a 32-bit number by an 16-bit number
;No dedicated instruction available in 8086
;to perform 16 bit / 16 bit

assume cs:code,ds:data
data segment 
	opr1 dw 1111h
        opr2 dw 9999h
        quotient dw 0000H
	reminder dw 0000H      
data ends
code segment
        org 0100h
start:  mov ax,data
        mov ds,ax
        mov bx,opr1
        mov ax,opr2
        mov dx, 0000h
	div bx
here:	mov reminder,dx  	
	mov quotient,ax
        mov ah,4ch
        int 21h
	code ends
end start
