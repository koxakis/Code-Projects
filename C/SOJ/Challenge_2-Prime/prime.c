#include<stdio.h>
#include<stdlib.h>

int main(int argc, char const *argv[]) {

	int tries, j=0, i=0;
	int** bounds;
	int* primes;

	primes = (int*)malloc(sizeof(int));

	scanf(" %d", &tries);
	if( tries > 10){
		printf("No more than 10\n" );
		return 0;
	}

	bounds = malloc(sizeof(int*)*tries);
	if( bounds == NULL){
		fprintf(stderr, "Error in memory allocation\n");
	}

	while(tries--){
		bounds[i] = malloc(sizeof(int)*2);
		if( bounds[i] == NULL){
			fprintf(stderr, "Error in memory allocation\n");
		}
		while( j < 1){
			scanf("%d %d", &bounds[i][j], &bounds[i][j+1]);
			if( bounds[i][j] > bounds[i][j+1]) {
				return 0;
			}
			j++;
		}
		j=0;
		i++;
	}

	tries = i;
	i=0;
	while( i < tries ) {
		while( bounds[i][j] < bounds[i][j+1] ){
			for( int k=2; k<=bounds[i][j]/2; ++k){
				if( bounds[i][j]%k != 0){
					primes =( int*)realloc( sizeof(int*) )
				}
			}
		}
	}

	free(primes);
	free(bounds);
	return 0;
}
