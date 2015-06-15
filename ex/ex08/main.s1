	.file	"main.c"
	.globl	_lower
	.section .rdata,"dr"
	.align 4
_lower:
	.long	12
	.globl	_sum
	.bss
	.align 4
_sum:
	.space 4
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	_lower, %eax
	movl	%eax, 12(%esp)
	jmp	L2
L3:
	movl	_sum, %edx
	movl	12(%esp), %eax
	addl	%edx, %eax
	movl	%eax, _sum
	incl	12(%esp)
L2:
	cmpl	$14, 12(%esp)
	jle	L3
	movl	_sum, %eax
	leave
	ret
