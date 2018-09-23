#include<stdio.h>

//Compile with nvcc -arch sm_20 -lineinfo -Xcompiler -Wall -O4 -g sample_base.cu -o hello
//Check cuda call for errors, Call after each cuda call
#define cudaCheckError() {                                                                   \
	cudaError_t e=cudaGetLastError();                                                        \
	if(e!=cudaSuccess) {                                                                     \
		printf("Cuda failure %s:%d: '%s'\n",__FILE__,__LINE__,cudaGetErrorString(e));        \
		exit(EXIT_FAILURE);                                                                  \
	}                                                                                        \
}


//This is the kernel that runs on the GPU
__global__ void hello_from_GPU()
{
	//printf("Hello world from the device! block=%d, thread=%d\n", blockIdx.x, threadIdx.x);
}

//This is the main function
int main(int argc, char **argv)
{
	double **hostMatrix, *hostGpuOutput;
	double *deviceMatrix, *deviceMatrixTransposed;


	int dim_x = 1, dim_y = 1;
#ifdef DEBUG
	int max_withd = 3;
#endif

	if ( argc != 3)
	{
		printf("Insuffisend arguments exiting\n");
		exit(EXIT_FAILURE);
	}
	else
	{
		dim_x = atoi(argv[1]);
		dim_y = atoi(argv[2]);
	}
	hostMatrix = (double**)malloc(sizeof(double*)*dim_x);
	if ( hostMatrix == NULL){
		fprintf(stderr, "Error in Host Matrix allocation\n");
		exit(EXIT_FAILURE);
	}
	for ( int i = 0; i < dim_y; i++){
		hostMatrix[i] = (double*)malloc( sizeof(double) * dim_y);
		if (hostMatrix[i] == NULL){
			fprintf(stderr, "Error in Host Matrix allocation\n" );
			exit(EXIT_FAILURE);
		}
		for ( int j = 0; j < dim_y; j++) {
			hostMatrix[i][j] = j + (i * dim_x);
		}
	}

	deviceMatrix = NULL;
	cudaMalloc((void**)&deviceMatrix, sizeof(double)*dim_x*dim_y);


	deviceMatrixTransposed = NULL;
	cudaMalloc((void**)&deviceMatrixTransposed, sizeof(double)*dim_x*dim_y);




	//Kernel invocation with <<< # of blocks , # of threads per block>>>(args...)
	hello_from_GPU<<<10,10>>>();
	cudaCheckError();
	cudaDeviceSynchronize();

	//Reset the GPU
	cudaDeviceReset();

	return 0;
}

// Yey
