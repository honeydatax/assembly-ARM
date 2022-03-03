.text
.global _start
@ as -o my.o strcpy.S
@ ld -o my my.o
@ ./my
_start:
	ldr r0,_adds
	ldr r1,_adds2
	ldr r3,_strcpy
	blx r3
	ldr r0,_adds2
	ldr r3,_puts
	blx r3
_exit:
	mov r7, #1              
	swi #0                  
_lens:
	@ r1=string
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
_putss:
	@ r0=string
	push {fp,lr}
	add fp,sp,#4
	sub sp,sp,#16
	mov r7,r0
	mov r1,r0	
	ldr r3,_len
	blx r3
	mov r2,r0
	mov r0, #1            
	mov r1,r7
	mov r7, #4              
	swi #0                  
	sub sp,fp,#4
	pop {fp,pc}
_strcpys:
	@ r0=string
	@ r1=string2
	push {fp,lr}
	add fp,sp,#4
	sub sp,sp,#16
	mov r3,r0
	mov r2,r1
	_strcpyss:
		ldrb r1,[r3]
		strb r1,[r2]
		cmp r1,#0
		beq _strcpysss
		add r3,r3,#1
		add r2,r2,#1
		b _strcpyss
	_strcpysss:
	sub sp,fp,#4
	pop {fp,pc}

_strcpy:
.word _strcpys
_puts:
.word _putss 
_len:
.word _lens 
_adds:
.word _string
_adds2:
.word _string2
.data
_string:
.asciz "\033[47;30m\nHello world,hi\n\0"         
_string2:
.asciz "0123456789001234567890012345678900123456789001234567890\0"
