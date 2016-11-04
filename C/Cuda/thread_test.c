#include <stdio.h>
#include <stdlib.h>

//////////////////////////////////////////////////////////////////////////////////////
//Host Code
//////////////////////////////////////////////////////////////////////////////////////
void convolutionHostRow(double **input, double **output, int dim_x, int dim_y) {

	for (int x= 0; x < dim_x; x++) {
		for (int y=0 ; y < dim_y; y++) {

			output[x][y] = -input[x][y];
		}
	}
}
void convolutionHostColumn(double **input, double **output, int dim_x, int dim_y) {

	for (int x= 0; x < dim_x; x++) {
		for (int y=0 ; y < dim_y; y++) {

			output[x][y] = input[y][x];
		}
	}
}

int main(int argc, char const *argv[]) {

	double
	**h_matrix ,
	**h_buffer ,
	**h_OutputCPU;

	int dim_x = 1, dim_y = 1, max_withd = 3;

	if ( argc != 3) {
		printf("Insuffisend arguments exiting\n");
	} else {
		dim_x = atoi(argv[1]);
		dim_y = atoi(argv[2]);
	}

	h_matrix = (double**)malloc(sizeof(double*)*dim_y);
	if ( h_matrix == NULL){
		fprintf(stderr, "Error in Host Matrix allocation\n");
		exit(EXIT_FAILURE);
	}
	for ( int i = 0; i < dim_x; i++){
		h_matrix[i] = (double*)realloc(h_matrix[i], sizeof(double) * dim_y);
		if (h_matrix[i] == NULL){
			fprintf(stderr, "Error in Host Matrix allocation\n" );
			exit(EXIT_FAILURE);
		}
		for ( int j = 0; j < dim_y; j++) {
			h_matrix[i][j] = j + (i * dim_x);
		}
	}

	h_buffer = (double**)malloc(sizeof(double*)*dim_y);
	if ( h_buffer == NULL) {
		fprintf(stderr, "Error in Host Matrix allocation\n" );
		exit(EXIT_FAILURE);
	}
	for ( int i = 0; i < dim_x; i++){
		h_buffer[i] = (double*)realloc(h_buffer[i], sizeof(double) * dim_y);
		if ( h_buffer[i] == NULL) {
			fprintf(stderr, "Error in Host Matrix allocation\n" );
			exit(EXIT_FAILURE);
		}
	}

	h_OutputCPU = (double**)malloc(sizeof(double*)*dim_y);
	if ( h_buffer == NULL) {
		fprintf(stderr, "Error in Host Matrix allocation\n" );
		exit(EXIT_FAILURE);
	}
	for ( int i = 0; i < dim_x; i++){
		h_OutputCPU[i] = (double*)realloc(h_OutputCPU[i], sizeof(double) * dim_y);
		if ( h_OutputCPU[i] == NULL) {
			fprintf(stderr, "Error in Host Matrix allocation\n" );
			exit(EXIT_FAILURE);
		}
	}

	convolutionHostRow(h_matrix, h_buffer, dim_x, dim_y);
	convolutionHostColumn(h_buffer, h_OutputCPU, dim_x, dim_y);

	for ( int i = 0; i < dim_x; i++){
		for (int j = 0; j < dim_y; j++) {
			printf(" %*g", max_withd, h_OutputCPU[i][j]);
		}
		printf("\n");
	}



	return 0;
}
