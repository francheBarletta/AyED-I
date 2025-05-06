/* --Ejercicio 4b-- */

#include <stdio.h>

int main() {

    int x, y, z, m;

    printf("Ingresa el valor de x: ");
    scanf("%d", &x);
    printf("Ingresa el valor de y: ");
    scanf("%d", &y);

    if(x < y) {
        m = x;
    } else {
        m = y;
    }

    printf("El valor de M es: %d\n", m);

    return 0;

}

/*
Ingresa el valor de x: 2               
Ingresa el valor de y: 1
El valor de M es: 1
*/