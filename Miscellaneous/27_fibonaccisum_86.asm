;fibonacci Sum

assume cs:code, ds:data

data segment
    fibo dw 0000h
    org 0010h
    count dw 0005h
data ends

code segment

    	org 0100h

start:  MOV AX, data
        MOV DS, AX
	mov cx, count


	mov ax, 0000h
	mov fibo, ax
	cmp cx,0001h
	jz last

	mov bx, 0001h
	mov fibo,bx
	cmp cx,0002h
	jz last

	sub cx,0002h

L1:	add ax,bx
	add fibo, ax

	mov dx, ax	
	mov ax, bx
	mov bx, dx

	loop L1

last:	MOV AH, 4ch
        INT 21h

code ends
end start