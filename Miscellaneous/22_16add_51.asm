;16 bit addition
;num1 -> r7(msb) r6(lsb)
;num2 -> r5(msb) r4(lsb)
;result: r0(carry) r1(msb) r2(lsb)

clr c
mov a, r6
add a, r4
mov r2, a

mov a, r7
addc a, r5
mov r1, a
mov r0, 00h
jnc here
inc r0
here: sjmp here