; Program to display the fibonacci series

assume cs:code, ds:data
data segment
	count db 01h
	res db 5 dup(0)	
data ends
code segment
	org 0100
start:
	mov ax, data
	mov ds, ax
	
	mov ch, 00h
	mov cl, count
	
	lea si, res	; storing the starting addr of res in si
	
	mov al, 00h	; 0 in al
	mov [si], al	; 0 is the first in the series
	cmp cx, 0001h
	jz last
	
	inc si		; move loc pointed by si
	mov [si], 01h	; store 1 there
	cmp cx, 0002h
	jz last
	
	mov al, 01h	; al now has 1
	
	sub cx, 02h	; 0, 1 are handled by the code
	
	fib:
		mov al, [si-1] ;(add i-i th num with si curr to find ith)
		add al, [si]
		inc si
		mov [si], al ; has the value for si(ith number)
	loop fib		
	
last:
	mov ah, 4ch
	int 21h
code ends
end start

