;Program for sub 2, 32 bit numbers

assume cs:code,ds:data
data segment 
	opr1h dw 1234h
        opr1l dw 5678h
	opr2h dw 1111h
	opr2l dw 1111h
        carry db 00h
	resulth dw 0000h
	resultl dw 0000h     
data ends
code segment
        org 0100h
start:  
	mov ax,data
        mov ds,ax

	; loading the operands in the appropriate registers
        mov ax,opr1h
        mov bx,opr1l
	mov cx,opr2h
	mov dx,opr2l
	
	sub bx,dx	; subtract the lower 8 bits
	sbb ax,cx	; subtract the higher 8 bits with borrow
	
	mov cl,00h
	jnc here	; jump if difference is positive
	
	inc cl		; otherwise, show negative sign
	
	neg ax		; finding 1's complement from 2's complement for upper and lower bits separately
	sub ax,0001h
	neg bx
	sub bx,00001h	; now the entire result is in 1's complement
	
	add bx,0001h	; adding one to find 2's complement 
	adc ax,0000h	; adding with carry
here:	
	mov resulth,ax
	mov resultl,bx
	mov carry,cl
        mov ah,4ch
        
        int 21h
	code ends
end start