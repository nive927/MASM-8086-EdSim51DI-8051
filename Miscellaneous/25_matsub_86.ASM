;Program to subtract two matrices with 8-bit valued elements

assume cs:code, ds:data
data segment
	mat1 dw 000Bh,000Bh,000Bh,000Bh
	mat2 dw 0001h,0001h,0001h,0001h
	
	nr1 dw 0002h
	nc1 dw 0002h
	
 	nr2 dw 0002h
	nc2 dw 0002h
	
	result dw 0000h,0000h,0000h,0000h
data ends
code segment
	org 0100h
start:
	mov ax,data
	mov ds,ax

	;checking if the number of rows is the same
	mov ax,nr1
	mov bx,nr2
	cmp ax,bx
	jnz last

	;checking if the number of columns is the same
	mov ax,nc1
	mov bx,nc2
	cmp ax,bx
	jnz last

	;clearing ax, bx and dx
	mov ax,0000h
    	mov bx,0000h
    	mov dx,0000h

	;count the number of elements for looping
	mov ax,nr1
	mov bx,nc1
	mul bx
	mov cx,ax

	;loading the addresses into the pointers
	lea si,mat1
	lea di,mat2
	lea bx,result
    
here: 
	mov ax,[si]
	mov dx,[di]
	sub ax,dx
	mov [bx],ax
	inc si
	inc si
	inc di
	inc di
	inc bx
	inc bx
	loopne here
last: 
	mov ah,4ch
	int 21h
code ends
end start