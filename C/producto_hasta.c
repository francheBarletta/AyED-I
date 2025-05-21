/* --P4 Ejercicio 3(extra)-- */

#include <stdio.h>
#include <assert.h>

int producto_hasta(int n) {
    int i = 1;
    int producto = 1;

    while(i <= n) {
        producto = producto * i;
        i++;
    }
return producto;
}

int main() {
    int n;
    printf("Ingrese un numero positivo: ");
    scanf("%d", &n);

    assert(n > 0);
    printf("El resultado del producto es: %d\n", producto_hasta(n));

    return 0;
}

/*
Ingrese un numero positivo: 5
El resultado del producto es: 120
*/