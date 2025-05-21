/* --P4 Ejercicio 1b-- */

#include <stdio.h>
#include <assert.h>

int main() {
    int x;
    printf("Ingrese un numero: ");
    scanf("%d", &x);

    assert(1);

    if (x < 0) {
        x = -x;
        printf("El valor absoluto es: %d\n", x);
    }
    
    if (x > 0) {
        printf("El valor absoluto es: %d\n", x);
    }
    return 0;
}

/*
Ingrese un numero: -4
El valor absoluto es: 4
Ingrese un numero: 6
El valor absoluto es: 6
*/