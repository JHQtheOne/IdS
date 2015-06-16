#include<stdio.h>

int main(void) {
	int a, b, c, d;
	printf("please enter a:");
	scanf("%d", &a);
	printf("please enter b:");
	scanf("%d", &b);
	printf("please enter c:");
	scanf("%d", &c);
	printf("please enter d:");
	scanf("%d", &d);
	printf("minOfMax(%d, %d, %d, %d) returned %d", a, b, c, d, minOfMax(a, b, c, d));
    return 0;
}

int max ( int a , int b ) {
	if ( a > b )
		return a;
	else
		return b;
}

int min ( int a , int b ) {
	if ( a < b )
		return a;
	else
		return b;
}

int minOfMax ( int a , int b , int c , int d ) {
 int tmp1 = max ( a , b );
 int tmp2 = max ( c , d );
 int tmp3 = min ( tmp1 , tmp2 );
 return tmp3;
 }