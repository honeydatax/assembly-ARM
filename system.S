.text
.global main
@ as -o my.o system.S
@ gcc -o my my.o
@ ./my
main:
	ldr r0,=_string2
	blx printf
	ldr r0,=_string
	blx system
_exit:
	mov r7, #1              
	swi #0                  
_adds:
.word _string
_adds2:
.word _string2
.data
_string:
.asciz "ls -l"         
_string2:
.asciz "\033[47;30m\n                     \000"
