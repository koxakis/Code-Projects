#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

void find(int scenarios, int *coats, int **paints, int brush1, ) {
	/* code */
}

int main() {

    int scenarios, *coats;
	int **paints;
	int brush1, brush2, *changes, changes_temp = 0;
	int i, j;

	scanf(" %d", &scenarios);
	paints = (int**)malloc(sizeof(int*)*scenarios);
	changes = malloc(sizeof(int*)*scenarios);
	coats = malloc(sizeof(int*)*scenarios);
	for ( i = 0; i < scenarios; i++) {
		scanf(" %d", &coats[i]);
		paints[i] = realloc(paints[i],sizeof(int)*coats[i]);
		for ( j=0; j < coats[i]; j++) {
			scanf(" %d", &paints[i][j]);
		}
	}

	for ( i = 0; i < scenarios; i++) {
		brush1 = -1;
		brush2 = -1;
		for ( j = 0; j < coats[i]; j++) {
			brush1 = paints[i][j];
			while ( brush1 == paints[i][j+1]) {
				j++;
			}
			if ( brush1 != paints[i][j]){
				changes_temp++;
				brush1 = paints[i][j];
			}else if ( brush2 != paints[i][j]){
				changes_temp++;
				brush2 = paints[i][j];
			}

		}
		changes[i] =changes_temp;
		changes_temp = 0;
	}

	for ( i = 0; i < scenarios; i++) {
		printf("%d\n", changes[i]);
	}

    return 0;
}
