.text
.global main
@ as -o my.o ccall.S
@ gcc -o my my.o divid.c
@ ./my
main:
	mov r0,#100
	mov r1,#5
	blx divid
	mov r1,r0
	ldr r0,=_string
	blx printf
_exit:
	mov r7, #1              
	swi #0                  
.data
_string:
.asciz "%d\n\0"         
_string2:
.asciz "\033[47;30m\n0123456789001234567890012345678900123456789001234567890\0"
