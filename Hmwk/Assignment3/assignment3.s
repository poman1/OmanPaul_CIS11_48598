	.global main
main:
	mov r2, #111
	mov r3, #5
	mov r4, #0
	mov r5, #0
	mov r6, #0
	mov r7, #0
	mov r8, #10
	mov r9, #0
	mov r0, #0
	mov r1, r2
	cmp r1, r3
	blt swap			
swap:
	mov r4, #0
	beq end;
	mov r5, r0
	mov r0, r1
	mov r1, r5		
	
shft_scale:
	mov r6, #1
	mul r7, r3, r6
	mul r9, r7, r8
	cmp r1, r9
	mul r6, r8, r8
	mul r7, r3, r6
	mul r9, r7, r8
subtract:
	beq shft_scale
	add r0, r0, r6
	sub r1, r1, r7
	cmp r1, r7
	bge subtract
	cmp r6, #1
end:
	bx lr
