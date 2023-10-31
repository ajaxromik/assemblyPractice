
.text
main:
	la $a0, str1
	la $a1, str2
	jal strcmp
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	la $a0, newline
	li $v0, 4
	syscall
	
	la $a0, str1
	la $a1, str3
	jal strcmp
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	
strcmp:
	
loop:	lb $t0, 0($a0)		# get the values at that spot
	lb $t1, 0($a1)		
	beqz $t0, end_loop	# if either are 0, end the loop
	beqz $t1, end_loop	# if one string ends before the other but are the same until that point
				# then this would be a logic error, but i'm following what i believe
				# the code would do
	
	bne $t0, $t1, if
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	j loop
	
if:	li $v0, -1
	jr $ra
	
end_loop:
	li $v0, 0
	jr $ra

.data
str1: 	.asciiz "A string for testing."
str2: 	.asciiz "A string for testing."
str3: 	.asciiz "Another string for testing."
newline: .asciiz "\n"