.text
.global _start
@ as -o my.o len.S
@ ld -o my my.o
@ ./my
_start:
	ldr r1,_adds
	ldr r3,_len
	blx r3
	mov r2,r0
	mov r0, #1            
	ldr r1,_adds
	mov r7, #4              
	swi #0                  

_exit:
	mov r7, #1              
	swi #0                  
_lens:
	push {fp,lr}
	add fp,sp,#4
	sub sp,sp,#16
	mov r0,#0
	mov r3,r1
	lenss:
		ldrb r1,[r3]
		cmp r1,#0
		beq lensss
		add r3,r3,#1
		add r0,r0,#1
		b lenss 
	lensss:
	sub sp,fp,#4
	pop {fp,pc}
_len:
.word _lens 
_adds:
.word _string
_string:
.asciz "\033[47;30m\nHello world\n\0"         
