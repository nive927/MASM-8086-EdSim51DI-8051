; Program to convert the case of the letters on the fly
; Usage: Give the input in a single line continuously,
; enter is also recognised

ASSUME CS:CODE,DS:data
data SEGMENT
	COUNT equ 10h	; not a variable but a synonym for hex(10) which is dec(16)
			; doesn't occupy any memory space
			; When EQU referes to a constant value, it becomes a synonym for that value. This value can't be overwritten, even if you try it won't change
			; When EQU referes to another variable, it becomes a synonym for that variable, so everything that happens to the synonym will happen to the variable.
data ends
CODE SEGMENT
	org 0100h
START:
	MOV AX,data
	MOV DS,AX

	MOV CX,COUNT	; LOOP COUNTER
L1:
	MOV AH,1	; Read INPUT CHARACTER with echo,
	INT 21H		; AL = CHARACTER, ASCII(hex) :A-Z=41-5A, a-z=61-7A 
			; ASCII(dec) :A-Z=65-90, a-z=97-122
	CMP AL,60H	; (hex)60h is (dec)96
	JNC UPPER	; Jump when there is no carry - input was lower case
	ADD AL,20H	; (hex) 20 is (dec)32 : 97 - 65 = 32
			; convert to lower case if it is in upper case
	JMP SKIP
UPPER:
	SUB AL,20H	; CONVERT TO UPPER CASE
SKIP:
	MOV AH,2	; CHARACTER OUTPUT FUNCTION
	MOV DL,AL	; CHARACTER MUST BE IN DL
	INT 21H		; DISPLAY THE CHARACTER
	LOOP L1		; REPEAT LOOP
	
	MOV Ah,4CH
	INT 21H
	CODE ENDS
end start