	.data
prompt:	.asciz "Enter a string:\n"
prompt2:	.asciz "String after deletion every other char:\n"
buf:	.space 100

	.text
	.globl main

main:

	li a7, 4
	la a0, prompt
	ecall
	
	li a7, 8
	la a0, buf
	li a1, 100
	ecall
	la t0, buf
	mv t2, t0

loop:

	lb t1, (t0)
	beqz t1, end

remove:

	addi t2, t2, 1
	lb t3, (t2)
	sb t3, (t0)
	addi t0, t0, 1
	addi t2, t2, 1
	j loop
	
end:
	
	li a7, 4
	la a0, prompt2
	ecall
	
	li a7, 4
	la a0, buf
	ecall
	
	li a7, 10
	ecall
	
	