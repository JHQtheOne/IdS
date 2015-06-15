j main

main:
   li $a0, 7        		# test werte übergeben
   li $a1, -5
   li $a2, 6
   li $a3, 2
   jal minOfMax
   move $a0, $v0 		# ergebnis von fib in eigabe für print
   li $v0, 1           		# set print mode to integer
   syscall             		# output Read in Run I / O
   # end execution
   li $v0, 10
   syscall

max:
  bgt $a1, $a0, retA1
  j retA0   
         
min:
  bgt $a0, $a1, retA1 # if a0 <= a1 return a0 else jump to return a1
retA0:
  move $v0, $a0
  jr $ra # return a0
retA1:
  move $v0, $a1
  jr $ra # return a1  
  
minOfMax:
  addi $sp, $sp, -4		# make room on stack
  sw $ra, 0($sp)		# save return address
  jal max 			# v0 = max(a0,a1)	
  move $t0, $v0 		# t0 = v0
  move $a0, $a2			# a0 = a2 (set input for max)
  move $a1, $a3			# a1 = a3 (set input for max)
  jal max			# v0 = max(a0, a1)
  move $t1, $v0			# t1 = v0
  move $a0, $t0			# a0 = t0 (set input for min)
  move $a1, $t1			# a1 = t1 (set input for min)
  jal min 			# v0 = min(a0,a1)
  lw $ra, 0($sp)		# retrieve return address
  addi $sp, $sp, 4		# pop it off the stack
  jr $ra			# jump back to caller of minOfMax  			