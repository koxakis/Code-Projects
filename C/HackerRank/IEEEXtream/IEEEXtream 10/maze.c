#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

//#define DEBUG

void find_path() {
	/* code */
}

int main() {

    char **maze ;
	int inputX=0, inputY=0, sizeN;
	int i, j;

	scanf(" %d", &sizeN);

	maze = (char**)malloc(sizeof(char*)*sizeN);
	for (i = 0; i < sizeN; i++) {
		maze[i] = realloc(maze[i], sizeof(char)*sizeN);
		for (j = 0; j < sizeN; j++){
			maze[i][j] = 'X';
		}
	}

	while (inputX != -1) {
		scanf("%d %d", &inputX, &inputY);
		maze[inputX-1][inputY-1] = 'O';
#ifdef DEBUG
		for (i = 0; i < sizeN; i++) {
			for (j = 0; j < sizeN; j++){
				printf(" %c", maze[i][j]);
			}
			printf("\n");
		}
#endif

	}



    return 0;
}
