/* --Ejercicio 5b-- */

#include <stdio.h>

int main () {
    int x, y, i;

    printf("Ingrese el valor de x: ");
    scanf("%d", &x);
    printf("Ingrese el valor de y: ");
    scanf("%d", &y);
    printf("Ingrese el valor de i: ");
    scanf("%d", &i);

    while(x >= y) {
        x = x - y;
        i = i + 1;
    }

    printf("Valor final de x: %d\n", x);
    printf("Valor final de i: %d\n", i);

    return 0;
}

/*
Ingrese el valor de x: 13
Ingrese el valor de y: 3
Ingrese el valor de i: 0
Valor final de x: 1
Valor final de i: 4
*/