j main

main:
   li $a0, 4        		# test werte übergeben
   jal fib
   move $a0, $v0 		# ergebnis von fib in eigabe für print
   li $v0, 1           		# set print mode to integer
   syscall             		# output Read in Run I / O
   # end execution
   li $v0, 10
   syscall

fib:
    addi $sp, $sp, -4		# make room on stack
    sw $ra, 0($sp)		# save return address
    li $t0, 2			# $t0 = 2
    li $t1, 0			# f0 = 0
    li $t2, 1			# f1 = 1
    beq $a0, 0, is0		# if (n == 0) return f0;
    beq $a0, 1, is1		# if (n == 1) return f1;
    bgt $a0, 1, isg2   		# if (n >= 2) loop
is0:
    move $v0, $t1		# store f0 in $v0
    j ret			# jump back to caller of fib	
is1:
    move $v0, $t2		# store f1 in $v0
    j ret			# jump back to caller of fib
isg2:
    jal fib_iter		# jump and link to fib_iter
    j ret
ret:
    lw $ra, 0($sp)		# retrieve return address
    addi $sp, $sp, 4		# pop it off the stack
    jr $ra			# jump back to caller of fib   
   
fib_iter:
    bgt $t0, $a0, end		# if t0 > $a0 break loop
    addi $t0, $t0, 1		# t0 ++
    add $v0, $t1, $t2		# f = f0 + f1 
    move $t1, $t2		# f0 = f1
    move $t2, $v0     		# f1 = f
    j fib_iter			# next loop
end:
   jr $ra
   
   
