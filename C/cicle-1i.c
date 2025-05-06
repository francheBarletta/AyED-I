/* --Ejercicio 5a-- */

#include <stdio.h>

int main () {

    int i;

    printf("Ingrese el valor de i: ");
    scanf("%d", &i);

    while (i != 0) {
        printf("Estado actual de i: %d\n", i);
        i = 0;
    }

    printf("Estado final de i: %d\n", i);

    return 0;
}

/*
Ingrese el valor de i: 20
Estado actual de i: 20
Estado final de i: 0
*/