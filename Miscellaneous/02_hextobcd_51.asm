MOV R0, #0FFH	
MOV R2, #00H	
MOV R1, #00H	
MOV A, R0

MOV B, #64H	
DIV AB
MOV R1, A	

MOV A, B	
MOV B, #0AH	
DIV AB
MOV R2, A	
SWAP A		
ADD A, B	
MOV R2, A	
HERE: SJMP HERE
