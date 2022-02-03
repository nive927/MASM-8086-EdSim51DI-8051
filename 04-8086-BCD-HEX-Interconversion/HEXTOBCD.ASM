;Program for converting Hexadecimal to BCD

assume cs:code,ds:data
data segment
	hex db 0FFh
        bcd1 db 00H
        bcd2 db 00H
data ends
code segment
        org 0100h
start:  
	mov ax,data
        mov ds,ax
        mov ah,00h
        mov al,hex
        mov bl,64h	;div by 100 to separate quotient and reminder
        div bl
        mov bcd1,al
        mov al,ah
        mov ah,00h
        mov bl,0Ah	;div by 10 to separate quotient and reminder
        div bl
        mov cl,04h
        rol al,cl	;move to msb
        mov dl,ah
        or dl,al	;packing into one nibble
        mov bcd2,dl
        mov ah,4ch
        int 21h
	code ends
end start