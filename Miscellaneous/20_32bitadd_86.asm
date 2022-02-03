;Program for adding 2, 32 bit numbers

assume cs:code,ds:data
data segment 
	opr11 dw 1234h
        opr12 dw 5678h
	opr21 dw 1111h
	opr22 dw 1111h
        carry db 00H
	result1 dw 0000H
	result2 dw 0000h     
data ends
code segment
        org 0100h
start:  mov ax,data
        mov ds,ax

        mov ax,opr11
        mov bx,opr12
	mov cx,opr21
	mov dx,opr22
	add bx,dx
	adc ax,cx
	mov cl,00h
	jnc here
	inc cl
here:  mov result1,ax
	mov result2,bx
	mov carry,cl
        mov ah,4ch
        int 21h
	code ends
end start