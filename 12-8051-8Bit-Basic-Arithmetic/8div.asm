MOV R0, #0AH
MOV R1, #02H
MOV A, R0
MOV B, R1
DIV AB ;(A/B is A-Q, B-R)
MOV R2, A
MOV R3, B
HERE: SJMP HERE
