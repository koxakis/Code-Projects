#include <stdio.h>
#include <stdlib.h>
#include "gputimer.h"
#include <time.h>

// CUDA runtime
#include <cuda_runtime.h>

// Utilities and system includes
//#include "helper_functions.h"

#define DEBUG

#define cudaCheckErrors() {                                                               \
        cudaError_t error=cudaGetLastError();                                                        \
        if(error!=cudaSuccess) {                                                                     \
            printf("Cuda failure %s:%d: '%s'\n",__FILE__,__LINE__,cudaGetErrorString(error));        \
            exit(EXIT_FAILURE);                                                                      \
        }                                                                                            \
    }


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

//////////////////////////////////////////////////////////////////////////////////////
//Device Code
//////////////////////////////////////////////////////////////////////////////////////
__global__ void
convolutionDeviceRow(double *input, double *output, int dim_x, int dim_y){

	int x = blockIdx.y * blockDim.y + threadIdx.y;
	int y = blockIdx.x * blockDim.x + threadIdx.x;

	int pos_x = x + y*dim_x;

	output[pos_x] = -input[pos_x];

}

__global__ void
convolutionDeviceColumn(double *input, double *output, int dim_x, int dim_y){

	int x = blockIdx.y * blockDim.y + threadIdx.y;
	int y = blockIdx.x * blockDim.x + threadIdx.x;

	output[x + y*blockDim.x] = input[y + x*blockDim.y];
}

int main(int argc, char const *argv[]) {

	double
	**h_matrix ,
	**h_buffer ,
	**h_OutputCPU ,
	*h_OutputGPU ,
	*h_trans_matrix;

	double
	*d_matrix ,
	*d_buffer ,
	*d_output;

	double overal_GPU_time = 0, overal_CPU_time = 0, overal_data_transfer_time = 0;
	clock_t start, stop;
	GpuTimer timer;

	int dim_x = 1, dim_y = 1;
#ifdef DEBUG
	int max_withd = 3;
#endif

	if ( argc != 3) {
		printf("Insuffisend arguments exiting\n");
		exit(EXIT_FAILURE);
	} else {
		dim_x = atoi(argv[1]);
		dim_y = atoi(argv[2]);
	}

	printf("Initializing host matricies...\n");
	h_matrix = (double**)malloc(sizeof(double*)*dim_x);
	if ( h_matrix == NULL){
		fprintf(stderr, "Error in Host Matrix allocation\n");
		exit(EXIT_FAILURE);
	}
	for ( int i = 0; i < dim_y; i++){
		h_matrix[i] = (double*)malloc( sizeof(double) * dim_y);
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

	h_OutputGPU = (double*)malloc(sizeof(double)*dim_y*dim_x);
	if ( h_buffer == NULL) {
		fprintf(stderr, "Error in Host Matrix allocation\n" );
		exit(EXIT_FAILURE);
	}

	h_trans_matrix = (double*)malloc(sizeof(double)*dim_x*dim_y);
	if (h_trans_matrix == NULL) {
		fprintf(stderr, "Error in Host Matrix allocation\n" );
		exit(EXIT_FAILURE);
	}

	printf("Initializing device matricies...\n");
	d_matrix = NULL;
	cudaMalloc((void**)&d_matrix, sizeof(double)*dim_x*dim_y);

	for ( int i =0 ; i < dim_x; i++) {
		for ( int j = 0; j < dim_y; j++) {
			h_trans_matrix[j + (i * dim_x)] = h_matrix[i][j];
		}
	}

	d_buffer = NULL;
	cudaMalloc((void**)&d_buffer, sizeof(double)*dim_x*dim_y);

	d_output = NULL;
	cudaMalloc((void**)&d_output, sizeof(double)*dim_x*dim_y);

	printf("Transfering data to cuda Device...\n");

	timer.Start();
	cudaMemcpy( d_matrix, h_trans_matrix, dim_x*dim_y*sizeof(double) , cudaMemcpyHostToDevice);
	timer.Stop();
	overal_data_transfer_time += timer.Elapsed();
	cudaCheckErrors();

	printf("Running CPU code...\n");

	start = clock();
	convolutionHostRow(h_matrix, h_buffer, dim_x, dim_y);
	convolutionHostColumn(h_buffer, h_OutputCPU, dim_x, dim_y);
	stop = clock();

	//kernel prep
	printf("Running GPU code...\n");

	int threadsPerBlock;
	int blocksPerGrid;
	if ( dim_x > 32 || dim_y > 32) {
		threadsPerBlock = 32;
		blocksPerGrid = dim_x/32;
	} else {
		threadsPerBlock = dim_x;
		blocksPerGrid = 1;
	}
	dim3 threads(threadsPerBlock, threadsPerBlock);
	dim3 grid(blocksPerGrid, blocksPerGrid);

	printf("CUDA kernel launch %d blocks of %d threads\n", grid.x*grid.y, threads.x*threads.y);

	timer.Start();
	convolutionDeviceRow<<<grid, threads>>>( d_matrix, d_buffer, dim_x, dim_y);
	timer.Stop();
	overal_GPU_time += timer.Elapsed();
	cudaDeviceSynchronize();
	cudaCheckErrors();

	printf("CUDA kernel launch %d blocks of %d threads\n", grid.x*grid.y, threads.x*threads.y);

	timer.Start();
	convolutionDeviceColumn<<<grid, threads>>>( d_buffer, d_output, dim_x, dim_y);
	timer.Stop();
	overal_GPU_time += timer.Elapsed();

	cudaDeviceSynchronize();
	cudaCheckErrors();

	timer.Start();
	cudaMemcpy( h_OutputGPU, d_output, sizeof(double)*dim_x*dim_y, cudaMemcpyDeviceToHost);
	timer.Stop();
	overal_data_transfer_time += timer.Elapsed();

	cudaCheckErrors();

	printf("\nTime elapsed on GPU( computation) = %g ms\n", overal_GPU_time);
	printf("Time elapsed on GPU( memory transfers) = %g ms\n", overal_data_transfer_time);
	printf("\nTime elapsed on GPU( overal) = %g ms\n", overal_GPU_time + overal_data_transfer_time);



	overal_CPU_time = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC ;
	printf ("\nTime elapsed on CPU = %g ms\n", overal_CPU_time);
#ifdef DEBUG

	printf("\nInput Matrix\n********************************************************************\n" );
	for ( int i = 0; i < dim_x; i++){
		for (int j = 0; j < dim_y; j++) {
			printf(" %*g", max_withd, h_matrix[i][j]);

		}
		printf("\n");
	}

	printf("\nCPU Matrix\n********************************************************************\n" );
	for ( int i = 0; i < dim_x; i++){
		for (int j = 0; j < dim_y; j++) {
			printf(" %*g", max_withd, h_OutputCPU[i][j]);
		}
		printf("\n");
	}

	printf("\nGPU Matrix\n********************************************************************\n" );
	for ( int i = 0; i < dim_x; i++){
		for (int j = 0; j < dim_y; j++) {
			printf(" %*g", max_withd, h_OutputGPU[j + (i * dim_x)]);
		}
		printf("\n");
	}
#endif


	for ( int i = 0; i < dim_x; i++) {
			free(h_OutputCPU[i]);
			free(h_buffer[i]);
			free(h_matrix[i]);
	}
	free(h_trans_matrix);
	free(h_OutputGPU);

	cudaFree(d_output);
	cudaCheckErrors();

	cudaFree(d_matrix);
	cudaCheckErrors();

	cudaFree(d_buffer);
	cudaCheckErrors();


	cudaDeviceReset();
	cudaCheckErrors();


	return 0;
}
