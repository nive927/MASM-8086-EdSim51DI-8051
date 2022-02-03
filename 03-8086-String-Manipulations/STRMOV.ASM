;Program to move a string of bytes

assume cs:code,ds:data,es:extra
data segment
    str db "Nive"
    count dw 0004h
data ends
extra segment
    dest db "Dest"
extra ends
code segment
    org 0100h
start:
    mov ax, data
    mov ds, ax
    mov ax, extra
    mov es, ax
    mov cx, count
    mov si, offset str
    mov di, offset dest
    cld
    rep movsb
    mov ah,4ch
    int 21h
code ends
end start