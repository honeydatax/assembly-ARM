.text
.global asmmul
@ as -o my.o acall.S
@ gcc -o my my.o acall.c
@ ./my
asmmul:
	push {fp,lr}
	add fp,sp,#4
	sub sp,sp,#16
		mul r2,r0,r1
		mov r0,r2
	sub sp,fp,#4
	pop {fp,pc}

