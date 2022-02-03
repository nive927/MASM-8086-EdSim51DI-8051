MOV R0,#0010h	;Addr of List
MOV R1,#05h	;Number of elements
MOV R2,#00h	
MOV R3,#00h
MOV R4,#00h	; Termination Indicator

loop:
	MOV A,@R0
	RRC A
	JNC even
	MOV A,R3
	ADD A,@R0
	MOV R3,A
	MOV A,R2
	ADDC A,#00h
	MOV R2,A
even:
	INC R0
	DJNZ R1,loop
MOV R4,#0FFh
HERE: SJMP HERE
