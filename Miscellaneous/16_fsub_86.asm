;Subtract 2 floating point numbers

assume cs:code, ds:data

data segment

	org 00h
	x dd 10.1111
	org 10h
	y dd 10.1234
	org 20h
	diff dd ?
	org 30h

data ends

code segment

	org 0100h

start:	


        mov ax, data
	mov ds, ax	

	finit

	fld x

	fld y
	
	fsub st(0), st(1)

	fst diff
	
	mov ah, 4ch
	int 21h

code ends

end start
