	.data
message1: .asciz "Type a number: "
format: .asciz "%d"
message2: .asciz "The factorial of %d is %d\n"

	.text
	
factorial:
	str lr, [sp,#-4]! 
	str R0, [sp,#-4]! 
	cmp R0, #0 @compare R0 and 0
	BNE is_nonzero @if R0 != 0 then branch
	mov R0, #1 @R0 ? 1. This is the return
	b end
	
is_nonzero:
	sub R0, R0, #1 
	bl factorial
	ldr R1, [sp] 
	mul R0, R1, R0
	
end:
	add sp, sp, #+4 
	ldr lr, [sp], #+4 
	bx lr
	
	.globl main
main:
	str lr, [sp, #-4]! 
	sub sp, sp, #4 
	ldr R0, address_of_message1 
	bl printf @Call printf
	ldr R0, address_of_format
	mov R1, sp 
	bl scanf
	ldr R0, [sp] 
	bl factorial
	mov R2, R0
	ldr R1, [sp]
	ldr R0, address_of_message2
	bl printf 
	add sp, sp, #+4 
	ldr lr, [sp], #+4
	bx lr
	
address_of_message1: .word message1
address_of_message2: .word message2
address_of_format: .word format
