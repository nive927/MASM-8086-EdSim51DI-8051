;16 bit subtraction
;num1 -> r7(msb) r6(lsb)
;num2 -> r5(msb) r4(lsb)
;result: r0(carry) r1(msb) r2(lsb)

clr c
mov a, r6
subb a, r4
mov r2, a

mov a, r7
subb a, r5
mov r1, a
mov r0, #00h
jnc here
clr c
inc r0
mov a, r1
cpl a
mov r1, a
mov a, r2
cpl a
mov r2, a
mov a, r2
clr c
add a, #01h
mov r2, a
jnc here
mov a, r1
add a, #01h
mov r1, a
here: sjmp here