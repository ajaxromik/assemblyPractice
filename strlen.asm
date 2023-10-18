.text
main:	la $a0, str1
	jal strlen
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
strlen:	
	move $v0, $zero
	
loop:	lb $t1, 0($a0)
	beq $t1, $zero, end_while
	addi $v0, $v0, 1
	addi $a0, $a0, 1
	j loop
	
end_while:
	jr $ra
	
.data
str1:	.asciiz "William"