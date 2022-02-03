;Program for comparing two strings of bytes

assume cs:code,ds:data,es:extra
data segment
	str1 db "Nive"
	count dw 0004h
	status dw 0000h
data ends
extra segment
	str2 db "Neve"
extra ends
code segment
	org 0100h
start:
	mov ax, data
	mov ds, ax
	mov ax, extra
	mov es, ax
	
	;Two ways to accomplish the same thing
	mov si, offset str1
	lea di, str2
	mov cx, count
	repe cmpsb
	
	jne not_equal
	jmp equal
	
not_equal:
	mov status, cx
	jmp exit
equal:
	;This is not necessary
	;but makes it easy to understand
	;that 0 indicates equal status
	mov status, 0000h 
exit:
	mov ah,4ch
	int 21h
code ends
end start