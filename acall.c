#include <stdio.h>
#include <stdlib.h>
//@ as -o my.o acall.S
//@ gcc -o my my.o acall.c
int main(){
	printf("%d\n",asmmul(100,3));
	return 0;
}