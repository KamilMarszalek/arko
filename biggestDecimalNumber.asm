	.data
prompt:	.asciz "Enter string:\n"
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
	li t4, 0 #greatest number
	li t5, 0 #temporary number
	li t6, 10 #system base
	beqz t3, end
loop:
	blt t3, t0, reset
	bgt t3, t1, reset
	mul t5, t5, t6
	add t5, t5, t3
	addi t5, t5, -48
next:
	addi t2, t2, 1
	lb t3, (t2)
	beqz t3, end
	j loop
reset:
	bgt t5, t4, swap
	add t5, zero, zero
	j next
swap:
	mv t4, t5
	add t5, zero, zero
	j next
end:
	li a7, 1
	mv a0, t4
	ecall
	
	li a7, 10
	ecall