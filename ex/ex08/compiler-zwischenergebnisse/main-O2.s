	.file	"powerpc.c"
	.gnu_attribute 4, 1
	.gnu_attribute 8, 1
	.gnu_attribute 12, 2
	.section	".text"
	.align 2
	.globl main
	.type	main, @function
main:
	lis 9,sum@ha
	lwz 3,sum@l(9)
	addi 3,3,39
	stw 3,sum@l(9)
	blr
	.size	main, .-main
	.globl lower
	.globl sum
	.section	.sbss,"aw",@nobits
	.align 2
	.type	sum, @object
	.size	sum, 4
sum:
	.zero	4
	.section	.sdata,"aw",@progbits
	.align 2
	.type	lower, @object
	.size	lower, 4
lower:
	.long	12
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
