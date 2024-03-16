	.data
prompt:	.asciz "Enter string:\n"
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
	
	li t2, '0'
	li t3, '9'
	
	la t0, buf
	la t4, buf2
	lb t1, (t0)
loop:
	beqz t1, end
	bgt t1, t3, save
	blt t1, t2, save
	j complement
	
save:
	sb t1, (t4)
	addi t4, t4, 1
	addi t0, t0, 1
	lb t1, (t0)
	j loop
complement:
	li t5, '9'
	sub t1, t5, t1
	addi t1, t1, '0'
	j save
end:
	li a7, 4
	la a0, buf2
	ecall
	
	li a7, 10
	ecall
	
	