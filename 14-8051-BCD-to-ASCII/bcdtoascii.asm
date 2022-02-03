MOV R0, #23H
MOV A, R0
ANL A, #0F0H	; AND for upper
SWAP A			; swap lowr & higr
				; in accumulator
MOV R1, A		; highr

MOV A, R0		; original
ANL A, #0FH	; lowr
ADD A,#30H		; add 30H to lowr
MOV R2, A
MOV A, R1
ADD A,#30H		; add 30H to highr
MOV R1, A

HERE: SJMP HERE
