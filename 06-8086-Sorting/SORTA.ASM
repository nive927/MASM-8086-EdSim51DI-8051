;Program for sorting in ascending order using Bubble sort

assume cs:code,ds:data
data segment	
	count db 06h
	arr db 01h,0FFh,0A2h,027h,011h,0C5h
data ends
code segment
	org 0100h
start:
	mov ax,data
	mov ds,ax
	
	mov ch,count
        dec ch;bubble sort
	
loop1:
	mov cl,ch
	lea si,arr
	
	loop2:
		mov al,[si]
		mov ah,[si+1]
		cmp al,ah
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
		
last:	
	mov ah,4ch
	int 21h
code ends
end start
