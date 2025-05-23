#include <stdio.h>

#define TAM 10

// Función que calcula la cantidad de elementos iguales al comienzo
int prim_iguales(int tam, int a[]) {
    int i = 1;

    // Comparar todos los elementos con el primero
    while (i < tam && a[i] == a[0]) {
        i++;
    }

    return i;
}

int main() {
    int arreglo[TAM];
    int i;

    // Pedimos al usuario los elementos
    printf("Ingrese %d números enteros:\n", TAM);
    for (i = 0; i < TAM; i++) {
        scanf("%d", &arreglo[i]);
    }

    // Llamamos a la función y mostramos el resultado
    int resultado = prim_iguales(TAM, arreglo);
    printf("Cantidad de elementos iguales al principio: %d\n", resultado);

    return 0;
}
