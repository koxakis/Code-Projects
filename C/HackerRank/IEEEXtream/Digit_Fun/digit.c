#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main( int argc, char* argv[]) {

    /* Enter your code here. Read input from STDIN. Print output to STDOUT */

	int i=0, size=0, Asize, Asize_prev=0, Acount=1;
	char *input=NULL;
	char **a_zero_table;

	a_zero_table =(char**) malloc(sizeof(char*));
	if (a_zero_table == NULL) {
		printf("Error in memory\n");
		return 0;
	}
	a_zero_table[i] = (char*)malloc(sizeof(char));
	if (a_zero_table[i] == NULL) {
		printf("Error in memory\n");
		return 0;
	}

	input = (char*)malloc(sizeof(char));
	if (input == NULL) {
		printf("Error in memory\n");
		return 0;
	}
	while (strcmp(a_zero_table[i], "END")!=0){
		scanf("%s", input);
		a_zero_table =(char**) realloc(a_zero_table,sizeof(char*)*(i+2));
		a_zero_table[i+1] =(char*) malloc(sizeof(char)*strlen(input));
		strcpy(a_zero_table[i+1], input);
		if (a_zero_table[i+1] == NULL) {
			printf("Error in memory\n");
			return 0;
		}
		i++;
	}

    size = i;
	for ( i=0; i<=size-1; i++){
		if (a_zero_table[i+1] == NULL) {
            break;
        }
		strcpy(a_zero_table[i], a_zero_table[i+1]);
	}

	for ( i=0; i<size-1; i++) {
        if (a_zero_table[i] == NULL) {
            break;
        }
		Asize = strlen(a_zero_table[i]);

		if ( Asize == atoi(a_zero_table[i]) ) {
			printf(" %d\n", Acount);
			Acount = 1;
			Asize_prev = 0;
			continue;
		} else {
			while( Asize_prev != Asize) {
				Acount++;
				Asize_prev = Asize;
				Asize = floor(log10(abs(Asize))) + 1;
			}

		}

		printf(" %d\n", Acount);
		Acount = 1;
		Asize_prev = 0;
	}

	free(input);
	for (i = 0; i < size; i++) {
		free(a_zero_table[i]);
	}
    return 0;
}
