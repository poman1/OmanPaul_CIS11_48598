	.global _start
_start:
	mov r2,#67 @ puts 67 in r3
	mov r3,#5  @puts 5 in r4
	mov r4,#0  @Counter
	mov r5,#3  @Flag
	cmp r2,r3
	blt move
	bge deduct
 
deduct:
	sub r2,r2,r3
	add r4,r4,#1
	cmp r2,r3
	blt move
	bge deduct
	beq equal
 
equal:
	sub r2,r2,r3
	add r4,r4,$1
	b final
 	
move:
	mov r0,r4
	mov r1,r2
	bne final
	bne move
	b exit
 
final:
	mov r0,r2
	mov r1,r4
	b exit
 
exit:
	mov r7, #1
swi 0