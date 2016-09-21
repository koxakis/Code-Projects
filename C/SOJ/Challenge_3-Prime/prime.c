#include<stdio.h>
#include<stdlib.h>

int main(int argc, char const *argv[]) {

	int tries, j=0, i=0;
	int** bounds;

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
			printf("%d %d\n", bounds[i][j], bounds[i][j+1] );
			j++;
		}
		j=0;
		i++;
	}

	while (i--) {

	}

	return 0;
}
