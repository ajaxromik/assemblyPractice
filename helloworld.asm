# Actual start of the main program to print "Hello World"
	.text
	.globl main 						# 'globl' main directive
main: 										# global label main
	addu $s7, $0, $ra 				# save the return address in ra
# Output the string "Hello World" on separate line
	.data 								# 'data' directive
	.globl hello
hello: .asciiz "\nHello World! This is William Carr\n" 		# string to print
	.text 								# 'text' directive
	li $v0, 4 							# print_str (system call 4)
	la $a0, hello 					# takes string address as argument
	syscall
# clean up at the end of the main
#	addu $ra, $0, $s7 				# restore the return address IF CALLED AS SUBROUTINE
#	jr $ra 							# return to the main program
	li $v0, 10
	syscall	
