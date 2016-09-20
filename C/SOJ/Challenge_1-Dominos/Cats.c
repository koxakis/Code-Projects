#include<stdio.h>
#include<stdlib.h>

int main(int argc, char const *argv[]) {

	int t, c, k, w, i=0;
	char** res;

	scanf( "%d", &t);
	//Check to see if tries are within the given range
	if( t > 100 ){
		return 0;
	}

	res = ( char**)malloc( sizeof(char**) * t);

	do {
		scanf("%d %d %d", &c, &k, &w);
		//Check to see if variables are within the given range
		if ( ( c > 100 || c < 1) || ( k > 100 || k < 1) || ( w > 100 || w < 1)) {
			return 0 ;
		}

		if ( k >= ( c * w )){
			res[i] = "Yes";
		} else{
			res[i] = "No";
		}
		i++;
	} while(i < t);

	i = 0;
	do {
		printf("%s\n", res[i]);
		i++;
	} while(i < t);

	free(res);

	return 0;
}
