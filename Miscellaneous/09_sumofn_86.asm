; Program to find the sum of n numbers

assume cs:code, ds:data
data segment
	array db 01h,03h,05h,07h
	org 0010h
	len dw 0004h
	org 0020h
	sum dw 0000h
data ends
code segment
	assume cs: code, ds: data
	org 0100h
start:
	mov ax, data
	mov ds, ax

	lea si, array
	mov cx, len
	mov bx, 00h
L1:
	mov ah, 00h
	mov al, [si]
	adc bx, ax
	mov sum, bx
	inc si
	loop L1

	mov ah, 4ch
	int 21h
code ends
end start
	