.text
.global main
@ as -o my.o printf.S
@ gcc -o my my.o
@ ./my
main:
	mov r0,#100
	mov r1,#5
	bl	__aeabi_idiv
	mov r1,r0
	ldr r0,=_string
	blx printf
_exit:
	mov r7, #1              
	swi #0                  
_adds:
.word _string
_adds2:
.word _string2
.data
_string:
.asciz "%d\n\0"         
_string2:
.asciz "\033[47;30m\n0123456789001234567890012345678900123456789001234567890\0"
