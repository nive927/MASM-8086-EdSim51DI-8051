;Program for moving a string without using string instructions

assume cs:code,ds:data
data segment
	str1 db "Nive"
	str2 db "Dest"
	count dw 0004h
data ends
code segment
	org 0100h
start:
	mov ax,data
	mov ds,ax
	mov cx,count
	mov si,offset str1
	mov di,offset str2
here:
	mov bl,[si]
	mov [di],bl
	inc si
	inc di
	loop here
	mov ah,4ch
	int 21h
code ends
end start
