#include<stdio.h>

int main(int argc, char const *argv[]) {

	int t, c, k, w, i=0;
	char res[100];

	scanf( "%d", &t);
	//Check to see if tries are within the given range
	if( t > 100 ){
		return 0;
	}

	do {
		scanf("%d %d %d", &c, &k, &w);
		if ( ( c > 100 || c < 1) ||
			( k > 100 || k < 1) ||
			( w > 100 || w < 1)) {

				return 0 ;
			}

		if ( k >= ( c * w )){
			//printf( "Yes \n");
			res[i] = 'Y';
		} else{
			//printf( "No \n");
			res[i] = 'N';
		}
		i++;
	} while(i < t);

	printf("%s\n", res);

	return 0;
}
