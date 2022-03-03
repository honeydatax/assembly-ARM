.text
.global _start

_start:
    mov r0, #1            
    ldr r1,_adds
    mov r2, #20
    mov r7, #4              
    swi #0                  

_exit:
    mov r7, #1              
    swi #0                  

_adds:
.word _string
_string:
.asciz "\033[47;30m\nHello world\n"         
