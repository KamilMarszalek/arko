	.data
prompt:	.asciz "Enter string:\n"
buf: 	.space 100

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
	li t4, 0 #within a number
	li t5, 0 #counter
loop:
	blt t3, t0, changeStatus
	bgt t3, t1, changeStatus
	addi t4, t4, 1
next:
	addi t2, t2, 1
	lb t3, (t2)
	beqz t3, end
	j loop
changeStatus:
	beqz t4, next
	addi t5, t5, 1
	add t4, zero, zero
	j next
end:
	li a7, 1
	mv a0, t5
	ecall
	
	li a7, 10
	ecall