; Program to perform floating point subtraction
; Result will be in IEEE 754 format in hex

ASSUME CS:CODESEG, DS:DATASEG
DATASEG SEGMENT
	ORG 00H		; directive to assign an offset address for a variable
	X DD 20.4375	; 0x41a38000 - 01000001101000111000000000000000
	ORG 10H
	Y DD 0.125	; 0x3e000000 - 00111110000000000000000000000000
	ORG 20H
	DIFF DD ?	; 0x41a28000 - 010000011010001010000000
DATASEG ENDS
CODESEG SEGMENT
start:
	MOV AX,DATASEG
	MOV DS,AX
	
	FINIT			; initialize 8087 stack
	FLD Y			; load Y into ST(0)
	FLD X			; load X into ST(0)
	FSUB ST(0),ST(1)	; ST(0) = X - Y
	FST DIFF		; store ST(0) in diff
	
	MOV AH,4CH
	INT 21H
	CODESEG ENDS
END START