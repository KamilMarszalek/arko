	.data
prompt:	.asciz "Enter string:\n"
buf: 	.space 100
newString:	.space 100

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
	lb t3,(t2)
	la t4, newString
	lb t5, (t4)
	beqz t3, end
loop:
	blt t3, t0, next
	bgt t3, t1, next
	sb t5, (t2)
	lb t5, (t4)
	addi t5, t5, 1
next:
	addi t2, t2, 1
	lb t3, (t2)
	lb t5, (t4)
	bnez t3, loop
end:
	li a7, 4
	la a0, newString
	ecall
	
	li a7, 10
	ecall
	