
.text
.globl main
main:
	li $a0, 10 # n
	li $a1, 5 # r
	jal combination # nCr
	
	move $a0, $v0
	li $v0, 1
	syscall
	
exit: 	li $v0, 10  # syscall 10 is exit
	syscall
	
combination:
	li $t0, 1		# this is c
	addi $t1, $a1, 1 	# i
	li $t2, 1		# second loop's i
	sub $t3, $a0, $a1	# n-k for second loop
	
mulloop:
	bgt $t1, $a0, divloop
	mul $t0, $t0, $t1
	addi $t1, $t1, 1	# i++
	j mulloop

divloop:
	bgt $t2, $t3, endfunc
	div $t0, $t0, $t2
	addi $t2, $t2, 1
	j divloop
	
endfunc:	
	move $v0, $t0
	jr $ra