#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[]) {

	double
	**h_matrix ,
	**h_OutputCPU;

	int dim_x, dim_y;

	printf("Intert a x and y dims");
	scanf("%d %d", &dim_x, &dim_y);

	h_matrix = (double**)malloc(sizeof(double*)*dim_y);
	if ( h_matrix == NULL){
		fprintf(stderr, "Error in Host Matrix allocation\n");
		exit(EXIT_FAILURE);
	}
	for ( int i = 0; i < dim_x; i++){
		h_matrix[i] = (double*)realloc(h_matrix[i], sizeof(double) * dim_y);
		if (h_matrix[i] == NULL){
			fprintf(stderr, "Error in Host Matrix allocation\n" );
		}
	}

	for (int j = 0; j < dim_y; j++) {
		for ( int i = 0; i < dim_x; i++){
			printf(" %g", h_matrix[i][j]);
		}
		printf("\n");
	}



	return 0;
}
