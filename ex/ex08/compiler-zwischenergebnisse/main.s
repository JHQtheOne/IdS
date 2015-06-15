	.file	"powerpc.c"
	.gnu_attribute 4, 1
	.gnu_attribute 8, 1
	.gnu_attribute 12, 2
	.globl lower
	.section	.sdata,"aw",@progbits
	.align 2
	.type	lower, @object
	.size	lower, 4
lower:
	.long	12
	.globl sum
	.section	".sbss","aw",@nobits
	.align 2
sum:
	.zero	4
	.size	sum, 4
	.type	sum, @object
	.section	".text"
	.align 2
	.globl main
	.type	main, @function
main:
	stwu 1,-32(1)
	stw 31,28(1)
	mr 31,1
	lis 0,lower@ha
	mr 9,0
	lwz 0,lower@l(9)
	stw 0,8(31)
	b .L2
.L3:
	lis 0,sum@ha
	mr 11,0
	lwz 9,sum@l(11)
	lwz 0,8(31)
	add 9,9,0
	lis 0,sum@ha
	mr 11,0
	stw 9,sum@l(11)
	lwz 0,8(31)
	addic 0,0,1
	stw 0,8(31)
.L2:
	lwz 0,8(31)
	cmpwi 7,0,14
	ble 7,.L3
	lis 0,sum@ha
	mr 9,0
	lwz 0,sum@l(9)
	mr 3,0
	addi 11,31,32
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	main, .-main
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
