#include <stdio.h>
#include <stdlib.h>
//@ as -o my.o ccall.S
//@ gcc -o my my.o divid.c
int divid(int a1,int a2){
	return a1/a2;
}
