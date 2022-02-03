
;Program for adding two 8-bit BCD numbers

assume cs:code,ds:data
data segment 
	opr1 db 06h
        opr2 db 07h
        result db 00H
	carry db 00H      
data ends
code segment
        org 0100h
start:
	mov ax,data
        mov ds,ax
        
        mov al,opr1
        mov bl,opr2
	
	add al,bl
	DAA
	
	mov result,al
	
	mov al, 00h ;clear the contents of al
	ADC al, al ; AL + AL + CF to get the carry since, Al is now 00
	
	mov carry,al
        
        mov ah,4ch
        int 21h
	code ends
end start
