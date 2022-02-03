;Program to convert a BCD number into an Hexadecimal number

assume cs:code,ds:data
data segment
    bcd db 12h
    res db 00h
data ends
code segment
    org 0100h
start:
    mov ax, data
    mov ds, ax
    mov bl, bcd
    and bl, 0fh
    mov al, bcd
    and al, 0f0h	;prefix with 0, otherwise error
    mov cl, 04h
    ror al, cl		;to move the masked result into lsb
    mov dl, 0ah
    mul dl
    add al, bl
    mov res, al
    mov ah, 4ch
    int 21h
code ends
end start