
.text
main:
	li $a0, 255
	jal countBits	# counts the amount of bits that are equal to 1
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	
countBits:
	li $t0, 0 	# count
	li $t1, 0 	# i
	
for:	and $t2, $a0, 1
	bne $t2, 0, countplus
after:	srl $a0, $a0, 1
	addi $t1, $t1, 1	# i++
	ble $t1, 32, for
	move $v0, $t0		# put return value into the right spot and leave
	jr $ra
	
countplus:
	addi $t0, $t0, 1
	j after