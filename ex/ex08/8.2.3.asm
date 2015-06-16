j main

main:
   li $a0, 7        		# test werte übergeben
   li $a1, -5
   li $a2, 6
   li $a3, 8
   jal minOfMax
   move $a0, $v0 		# ergebnis von fib in eigabe für print
   li $v0, 1           		# set print mode to integer
   syscall             		# output Read in Run I / O
   # end execution
   li $v0, 10
   syscall
 
   
#int minOfMax ( int a , int b , int c , int d ) {
# int tmp1 = a > b ? a : b;
# int tmp2 = c > d ? c : d;
# int tmp3 = tmp1 < tmp2 ? tmp1 : tmp2;
# return tmp3;
# }  

minOfMax:
  bgt $a0, $a1, retA0
  move $t1, $a1
  j max2
retA0:
  move $t1, $a0
max2:    
  bgt $a2, $a3, retA2
  move $t2, $a3
  j min
retA2:
  move $t2, $a2
min:
  bgt $t1, $t2, retT2
  move $t3, $t1
  j end
retT2:
  move $t3, $t2
end:
  move $v0, $t3
  jr $ra	