; Program to display the system date

assume cs:code,ds:data
data segment
	; reserving n consecutive bytes (memory locations) in the memory
	; and assigning a NULL value (?) to all of them.
	day db 01 dup(?)
	month db 01 dup(?)
	year db 02 dup(?)
data ends
code segment
	org 0100h
start:
	mov ax,data
	mov ds,ax
	
	;system date
	;INT 21h /AH=2Ah - get system date;
	
	mov ah,2ah
	int 21h
	
	;Result of the interrupt is stored in the following way:
	; CX = year (1980-2099)
	; DH = month
	; DL = day
	; AL = day of week (00h=Sunday)
	
	mov si,offset day ;optionally use lea instruction instead of offset
	mov [si],dl
	mov si,offset month
	mov [si],dh
	mov si,offset year
	mov [si],cx
	
	; can use mov inst directly, SIMPLIFIED
	; mov day,dl
	; mov month,dh
	; this will cause error, need to use si
	; mov year,cx
	
	mov ah,4ch
	int 21h
	code ends
end start