    	.data
prompt1: .asciz "Enter string:\n"
prompt2: .asciz "Enter length of the string:\n"
buf:    .space 100
length:	.space 8

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
    	la t0, buf

    	li a7, 5
    	ecall
    	mv t1, a0
outerLoop:
	addi t1, t1, -1
	blez t1, end
	la t2, buf
	lb t3, (t2)
	addi t2, t2, 1
innerLoop:
	lb t4, (t2)
	blt t4, t3, swap
	mv t3, t4
	j continue
swap:
	sb t3, (t2)
	sb t4, -1(t2)
continue:
	addi t2, t2, 1
	la t0, buf
	add t0, t0, t1
	blt t2, t0, innerLoop
	j outerLoop
end:
	li a7, 4
	la a0, buf
	ecall
	
	li a7, 10
	ecall
	

