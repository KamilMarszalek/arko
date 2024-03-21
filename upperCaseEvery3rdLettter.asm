	.data
prompt: .asciz "Enter a string:\n"
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
	
	li s0, 'a'
	li s1, 'z'
	li s2, 3
	li t0, 0 #counter
	la t1, buf
	lb t2, (t1)
	beqz t2, end
loop:
	blt t2, s0, next
	bgt t2, s1, next
	addi t0, t0, 1
	beq t0, s2, changeLetter
next:
	addi t1, t1, 1
	lb t2, (t1)
	beqz t2, end
	j loop
changeLetter:
	addi t2, t2, -32
	sb t2, (t1)
	add t0, zero, zero
	j next
end:
	li a7, 4
	la a0, buf
	ecall
	
	li a7, 10
	ecall
