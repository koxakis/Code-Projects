#include<stdio.h>
#include<stdlib.h>

int main(int argc, char const *argv[]) {

	int tries, j=0, i=0;
	int** bounds;
	int* primes;

	primes = (int*)malloc(sizeof(int));
	if( primes == NULL){
		fprintf(stderr, "Error in memory allocation\n");
	}

	scanf(" %d", &tries);
	if( tries > 10){
		printf("No more than 10\n" );
		return 0;
	}

	bounds = malloc(sizeof(int*)*tries);
	if( bounds == NULL){
		fprintf(stderr, "Error in memory allocation\n");
	}

	while( i < tries){
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

	i=1;
	int flag, z=0;
	//Outer while takes care of testing each entry test area
	while( i-1 < tries ) {

		//Middle while takes care of testing the numbers in the test area
		while( bounds[i-1][j] < bounds[i-1][j+1] ){
			flag = 0;

			if( bounds[i-1][j] == 1){
				bounds[i-1][j]++;
				continue;
			}

			if( bounds[i-1][j] > 1 || bounds[i-1][j] <= 3){
				primes =( int*)realloc( primes, sizeof(int) * i+1);
				primes[z] = bounds[i-1][j];
				bounds[i-1][j]++;
				z++;
				continue;
			}
			//Inside For takes care of testing if an indevidual number is prime
			for( int k=2; k<=(bounds[i-1][j]/2); ++k){
				/*If the For ends and there is no such result to satisfy the If statment
					the number is not a prime */

				if( bounds[i][j]%k == 0){
					flag = 1;
					break;
				}
			}

			if( flag == 0) {
				primes = realloc( primes, sizeof(int) * i+1);
				if( primes == NULL){
					fprintf(stderr, "Error in memory allocation\n");
				}
				primes[z] = bounds[i-1][j];
				printf("%d ||", primes[z]);
				z++;
			}
			bounds[i-1][j]++;
			printf("%d %d\n", bounds[i-1][j] , bounds[i-1][j+1]);
		}
		z = 0;
		i++;
	}

	i=0;
	while (i < tries) {
		printf("%d ", primes[i]);
		i++;
	}

	free(primes);
	free(bounds);
	return 0;
}
