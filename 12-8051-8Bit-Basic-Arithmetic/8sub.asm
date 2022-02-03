MOV R2, #00 ; H not needed for 00
MOV R0, #01H	; operand1
MOV R1, #0FFH	; operand2
CLR C			; clear carry flag
MOV A, R0
SUBB A, R1
JNC LABEL
INC R2
CPL A			; 1's complement
INC A			; add 1 for 2's complement
LABEL:
MOV R3, A
HERE: SJMP HERE
