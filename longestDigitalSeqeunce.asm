#Write a program displaying the longest sequence of digits found in a string. 
        .data
prompt: .asciz "Enter string:\n"
buf:    .space 100

        .globl main
        .text
main:
        li a7, 4
        la a0, prompt
        ecall

        li a7, 8
        la a0, buf
        li a1, 100
        ecall

        la t0, buf
        lb t1, (t0)
        beqz t1, end
        li s0, 0 #counter
        li s1, 0 #the longest length
        mv s2, t0
        mv s3, t0
        li t2, '0'
        li t3, '9'

loop:
        beqz t1, checkEnd
        bgt t1, t3, resetCounter
        blt t1, t2, resetCounter
        addi s0, s0, 1
        bgt s0, s1, updateLength
next:
        addi t0, t0, 1
        lb t1, (t0)
        j loop
resetCounter:
        add s0, zero, zero
        mv s2, t0
        j next
updateLength:
        mv  s1, s0
        mv s3, s2
        j next
checkEnd:
        bgt s0, s1, updateLength
end: 
        add s2, s2, s1
        sb zero, (s2)
        li a7, 4
        mv a0, s3
        ecall
        
        li a7, 10
        ecall