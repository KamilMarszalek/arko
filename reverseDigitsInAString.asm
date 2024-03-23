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
	
	li t0, '0'
	li t1, '9'
	la t2, buf
	lb t3, (t2)
	beqz t3, end
	mv t4, t2

findLast:
	lb t5, (t4)
	beqz t5, findLastExit
	addi t4, t4, 1
	j findLast

findLastExit:
	addi t4, t4, -1 #set pointer to last char of string
	lb t5, (t4)
	
loop:
	beqz t3, end
	blt t3, t0, next
	bgt t3, t1, next
	
innerLoop:
	blt t5, t0, previous
	bgt t5, t1, previous
	sb t5, (t2)
	sb t3, (t4)
	addi t4, t4, -1 
	lb t5, (t4) 
	ble t4, t2, end
	j next

previous:
	addi t4, t4, -1
	ble t4, t2, end
	lb t5, (t4)
	j innerLoop
	
next:
	addi t2, t2, 1
	lb t3, (t2)
	j loop

end:
	li a7, 4
	la a0, buf
	ecall
	
	li a7, 10
	ecall 