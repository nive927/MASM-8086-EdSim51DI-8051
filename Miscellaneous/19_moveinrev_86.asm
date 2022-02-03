; mov in reverse order
assume cs:code,ds:data

data segment
    arr db 0aah,0bbh,0cch,0ddh,0eeh,0ffh,11h,33h,44h,55h
    count dw 0010h
    org 0019h
    str2 db 0ffh ; to see the start addr
data ends

code segment
    org 0100h

start:
    mov ax,data
    mov ds,ax

    mov cx,count

    mov si,offset arr
    mov di, offset str2

here: mov bl,[si]
         mov [di],bl
         inc si
         dec di
         loop here

 mov ah,4ch
    int 21h
code ends

end start