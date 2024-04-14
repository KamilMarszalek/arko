	.data
prompt:	.asciz "Enter a string:\n"
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
	
	li t0, 'A'
	li t1, 'Z'
	li t5, 10
	li t6, 0
	
	la t2, buf
	mv t3, t2

loop:
	lb t4, (t2)
	beqz t4, end
	beq t4, t5, storeZero
	bgt t4, t1, saveLetter
	blt t4, t0, saveLetter
	sb t4, (t3)
	j recognizeNumSeq

next:
	# addi t2, t2, 1
	addi t3, t3, 1
	j loop

recognizeNumSeq:
	addi t2, t2, 1
	lb t4, (t2)
	blt t4, t0, next
	bgt t4, t1, next
	j recognizeNumSeq

saveLetter:
	sb t4, (t3)
	addi t2, t2, 1
	addi t3, t3, 1
	j loop

storeZero:
	sb t6, (t3)

end:
	li a7, 4
	la a0, buf
	ecall
	
	li a7, 10
	ecall