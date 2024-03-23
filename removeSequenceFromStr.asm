	.data
prompt1:	.asciz "Enter a string:\n"
prompt2:	.asciz "Enter indexes:\n"
buf:	.space 100

	.text
	.globl main

main:
	li a7, 4
	la a0, prompt1
	ecall
	
	li a7, 8
	la a0, buf
	li a1, 100
	ecall
	
	li a7, 4
	la a0, prompt2
	ecall
	
	li a7, 5
	ecall
	
	mv t0, a0 #index1
	
	li a7, 5
	ecall
	
	mv t1, a0 #index2
	li s0, 0 #length 
	la t2, buf
	add t0, t0, t2
	add t1, t1, t2
	mv s0, t2
length:
	lb t3, (t2)
	beqz t3, checking
	addi t2, t2, 1
	addi s0, s0, 1
	j length

checking:
	bgt t0, t1, swapIndexes
	addi t1, t1, 1 
	bgt t0, s0, end
	bgt t1, s0, end

loop:
	lb t4, (t1)
	beqz t4, end
	sb t4, (t0)
	addi t1, t1, 1
	addi t0, t0, 1
	j loop

swapIndexes:
	mv t4, t0
	mv t0, t1
	mv t1, t4
	li t4, 0
	
end:
	li t6, 0
	sb t6, (t0)
	
	li a7, 4
	la a0, buf
	ecall
	li a7, 10
	ecall