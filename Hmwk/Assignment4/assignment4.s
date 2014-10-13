	.data
	
	/* User Defined Input */
	.balign 4
	input1:
	.asciz "Please enter numerator"
	
	.balign 4
	input2:
	.asciz "Please enter a denominator"
	
	/* output */
	.balign 4
	read1:
	.asciz "Your devider is %d\n"
	
	.balign 4
	read2:
	.asciz "Your remander is %d\n"
	
	.balign 4
	scan:
	.asciz "%d"
	
	/* where numbers are stored */
	.balign 4
	msg1: .word 0
	
	.balign 4
	msg2: .word 0
	
	.balign 4
	return: .word 0
	
	.balign 4
	returntwo: .word 0

.text

/* Divide */
divide:
	ldr r1, address_return_2
	str lr, [r1]
	ldr r2, addr_a
	ldr r2, [r2]
	ldr r3, addr_b
	ldr r3, [r3]
	mov r4, #1
	mov r5, r3
	mov r0, #0
	mov r1, r2
	cmp r1, r3

bge scale_left
	blt end
	
	scale_left:
	mov r4, r4, LSL #1
	mov r5, r5, LSL #1
	cmp r1, r5
	bgt scale_left
	ble scale
	
scale:
	mov r4, r4, LSR #1
	mov r5, r5, LSR #1
	b addSub
	
scaleRight:
	mov r4, r4, LSR #1
	mov r5, r5, LSR #1
	cmp r1, r5
	blt scaleRight
	bge compare
	
addSub:
	add r0, r0, r4
	sub r1, r1, r5
	b scaleRight
	
compare:
	cmp r4, #1
	bge addSub
	blt end
	end:
	ldr lr, address_return_2
	ldr lr, [lr]
	bx lr
	
.global main

main:
	ldr r1, address_return
	str lr, [r1]

	/* intput */
	ldr r0, addr_intro
	bl printf
	ldr r0, address_input1
	bl printf
	ldr r0, address_scan
	ldr r1, addr_a
	bl scanf
	ldr r0, address_input2
	bl printf
	ldr r0, address_scan
	ldr r1, addr_b
	bl scanf

	ldr r0, addr_a
	ldr r0, [r0]
	ldr r1, addr_b
	ldr r1, [r1]
	bl divide

	
	mov r5, r1
	mov r3, r0
	ldr r0, address_read1
	ldr r1, addr_a
	ldr r1, [r1]
	ldr r2, addr_b
	ldr r2, [r2]
	bl printf
	mov r3, r5
	ldr r0, address_read2
	ldr r1, addr_a
	ldr r1, [r1]
	ldr r2, addr_b
	ldr r2, [r2]
	bl printf
	
	/* exit stage right */
	ldr lr, address_return
	ldr lr, [lr]
	bx lr
	
address_msg1: .word msg1
address_msg2: .word msg2
address_scan: .word scan
address_input1: .word input1
address_input2: .word input2
address_read1: .word read1
address_read2: .word read2
address_return: .word return
address_return_2: .word returntwo
.global printf
.global scanf
