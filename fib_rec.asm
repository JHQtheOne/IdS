j main

main:
   li $a0, 4        #test werte übergeben
   jal fib
   move $a0, $v0 		# ergebnis von fib in eigabe für print
   li $v0, 1           # set print mode to integer
   syscall             # output Read in Run I / O
   # end execution
   li $v0, 10
   syscall

fib:
bgt $a0 , 1 , recurse
move $v0 , $a0
jr $ra

recurse:
sub $sp , $sp , 12
sw $ra , 0( $sp )
sw $a0 , 4( $sp )
sub $a0 , $a0 , 1
jal fib
sw $v0 , 8( $sp )
lw $a0 , 4( $sp )
sub $a0 , $a0 , 2
jal fib
lw $t0 , 8( $sp )
add $v0 , $v0 , $t0
lw $ra , 0( $sp )
addi $sp , $sp , 12
jr $ra