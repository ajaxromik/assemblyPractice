
	.text #not sure why .text
	.globl main
main: 
	li $a0, 5 # factorial of the second argument
	jal factorial
	
	move $a0, $v0
	li $v0, 1 # code for printing $a0
	syscall

exit: 	li $v0, 10
	syscall

factorial: 
	li $t0, 1 # addi $t0, $zero, 1 ;;; int f = 1
	li $t1, 1 # init i = 0
forloop:bgt $t1, $a0, finish # exit loop if condition wrong
	mul $t0, $t0, $t1 # factorial math
	addi $t1, $t1, 1 # i++
	j forloop 
finish: move $v0, $t0
	jr $ra
