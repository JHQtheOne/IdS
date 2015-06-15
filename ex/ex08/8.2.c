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
