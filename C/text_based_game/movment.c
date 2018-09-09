#include <stdio.h>
#include "movment.h"

void choose_actions() {

    char action;

    printf ("\nActions:");
    printf ("\nw - Walk \n");
    printf ("l - Look\n");
    printf ("t - Take\n");
    printf ("i - Inventory\n");
    printf ("m - Map \n\n");
   
    printf ("q - Exit\n");

    printf ("What do you do: ");

    scanf(" %c", &action);

    switch(action) {

    case 'w' :
        break;

    case 'l':
        break;

    case 't':
        break;

    case 'i':
        break;

    case 'm':
        break;

    default :
        printf("\nNothing to do\n No such action\n\n");
        break;




    }
}




