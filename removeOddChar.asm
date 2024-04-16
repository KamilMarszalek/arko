	.data
prompt:	.asciz "Enter a string:\n"
prompt2:	.asciz "String after deletion odd chars char:\n"
buf:	.space 100
buf2:	.space 100

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
	la a4, buf2
	mv t2, t0

	li t4, 'A'
	li t5, 'a'
	li a2, 'Z'
	li a3, 'z'
loop:

	lb t1, (t0)
	beqz t1, end
	bge t1, t5, greater_than_a
	bge t1, t4, greater_than_A
	j save_letter

greater_than_a:

  	mv t6, t1
  	bgt t6, a3, save_letter
	j calculate
	
greater_than_A:

	mv t6, t1
	bgt t6, a2, save_letter

calculate:
	andi t6, t6, 1
	addi t0, t0, 1
	bnez t6, loop

save_letter:
	sb t1, (a4)
	addi t0, t0, 1
	addi a4, a4, 1 
	j loop

end:
	
	li a7, 4
	la a0, prompt2
	ecall
	
	li a7, 4
	la a0, buf2
	ecall
	
	li a7, 10
	ecall
	
	
