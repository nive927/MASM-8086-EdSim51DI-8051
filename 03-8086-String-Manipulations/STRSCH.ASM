;Program to search for a byte in a string

assume cs:code,es:extra,ds:data
data segment
	str1 db "i"
	status dw 0000h
data ends
extra segment
    	str db "Nive"
    	count dw 0004h	
extra ends
code segment
	org 0100h
start:
	mov ax, data
	mov ds, ax
	mov ax, extra
	mov es, ax
	mov cx, count
	mov al, str1
	mov di, offset str
	repne scasb
	je found
	jmp not_found
	
found:
	mov status, cx
	jmp exit
not_found:
	;Not necessary but is done
	;for better understanding of
	;how status is set
	mov status, 0000h
	jmp exit
exit:
	mov ah,4ch
	int 21h
	
code ends
end start