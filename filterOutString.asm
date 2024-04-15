	.data
prompt1:	.asciz "Enter a string:\n"
prompt2:	.asciz "Enter another string:\n"
buf1:	.space 100
buf2:	.space 100

	.text
	.globl main

main:
	li a7, 4
	la a0, prompt1
	ecall
	
	li a7, 8
	la a0, buf1
	li a1, 100
	ecall
	
	li a7, 4
	la a0, prompt2
	ecall
	
	li a7, 8
	la a0, buf2
	li a1, 100
	ecall
	
	la t0, buf1
	mv t1, t0
	la t2, buf2

loop:
	lb t3, (t0)
	beqz t3, end

innerLoop:
	lb t4, (t2)
	beqz t4, saveChar
	beq t3, t4, skip
	addi t2, t2, 1
	j innerLoop

saveChar:
	sb t3, (t1)
	addi t1, t1, 1
	addi t0, t0, 1
	la t2, buf2
	j loop

skip:
	addi t0, t0, 1
	la t2, buf2
	j loop
	
end:
	li t6, 0
	sb t6, (t1)
	
	li a7, 4
	la a0, buf1
	ecall
	
	li a7, 10
	ecall