;Program for sorting descending BSort

assume cs:code,ds:data
data segment
	org 0000h
	arr db 11h,22h,33h,44h,55h,66h,77h,88h,99h
	count db 09h
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	
	mov ch,count
        dec ch		
	
loop1:
	mov cl,ch	
	lea si,arr	
	
	loop2:
		mov al,[si]
		mov ah,[si+1]
		cmp ah,al
		jc here		
		jz here		
		xchg [si+1],al
		xchg [si],ah
		
		here:
			inc si
			dec cl
			jnz loop2
	dec ch
	jnz loop1
		
	mov ah,4ch
	int 21h
code ends
end start
