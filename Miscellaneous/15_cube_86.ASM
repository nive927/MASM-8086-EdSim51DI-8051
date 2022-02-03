;Cube of a number

assume cs: code, ds: data

data segment
	result dw 0000h
	org 0010h
	num db 9h
data ends

code segment
	org 0100h
start: 

	mov ax, data
	mov ds, ax

	mov al, num
	mov bl, num

	mul bl

	mul bl 

	mov result, ax

	mov ah, 4ch
	int 21h

	code ends

end start
