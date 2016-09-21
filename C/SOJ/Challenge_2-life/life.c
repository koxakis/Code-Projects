#include "stdio.h"
#include "stdlib.h"


int main(int argc, char const *argv[]) {

	int* nums;
	int i=1;

	nums = (int*)malloc(sizeof(int));
	do {

		nums = (int*)realloc( nums, sizeof(int) * i+1);
		scanf("%d\n", &nums[i-1] );

		i++;
	} while(nums[i-2] != 42);
	
	printf("\n");
	i=0;
	do {
		printf("%d\n", nums[i]);
		i++;
	} while(nums[i] != 42);

	free(nums);
	return 0;
}
