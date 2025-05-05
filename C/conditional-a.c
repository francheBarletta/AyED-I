/* --Ejercicio 4-- */

#include <stdio.h>

int main () {

    int x, y;

    printf("Ingresa el valor de x: ");
    scanf("%d", &x);
    printf("Ingresa el valor de y: ");
    scanf("%d", &y);

    if(x >= y) {
        printf("X es mayor a Y.\n");
    } else {
        printf("Y es mayor a X.\n");
    }

    return 0;

}

/*
Ingresa el valor de x: 2
Ingresa el valor de y: 1
X es mayor a Y.
*/