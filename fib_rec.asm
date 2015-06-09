j main

main:
   li $a0, 4        #test werte übergeben
   jal fib
   move $a0, $v0  		# ergebnis von fib in eigabe für print
   li $v0, 1           # set print mode to integer
   syscall             # output Read in Run I / O
   # end execution
   li $v0, 10
   syscall

fib:			# fib
bgt $a0 , 1 , recurse	# a0 >= 2
move $v0 , $a0		# v0 <- a0
jr $ra			# return_fib

recurse:		# recurse	
sub $sp , $sp , 12	# push
sw $ra , 0($sp)		# ra -> Sr
sw $a0 , 4($sp)		# a0 -> L
sub $a0 , $a0 , 1	# a0-1
jal fib			# fib n-1
sw $v0 , 8($sp)		# v0 -> R
lw $a0 , 4($sp)		# a0 <- L 
sub $a0 , $a0 , 2	# a0-2
jal fib			# fib n-2
lw $t0 , 8( $sp )	# t0 <- R
add $v0 , $v0 , $t0	# v0+t0
lw $ra , 0($sp)		# ra <- Sr
addi $sp , $sp , 12	# pop
jr $ra			# return_recurse
