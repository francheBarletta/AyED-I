/* --P4 Ejercicio 6-- */

#include <stdio.h>
#define N 5

void pedir_arreglo(int tam, int a[]) {
    int i = 0;

    while (i < tam)
    {
        printf("Ingrese los %d elementos del arreglo: ", i + 1);
        scanf("%d", &a[i]);
        i++;
    }
    
}

int sumatoria(int tam, int a[]) {
    int i = 0;
    int suma = 0;

    while (i < tam)
    {
        suma += a[i];
        i++;
        }
    printf("La suma de los elementos del arreglo es: %d\n", suma);
}

int main() {
    int a[N];

    pedir_arreglo(N, a);
    sumatoria(N, a);

    return 0;
}

/*
Ingrese los 1 elementos del arreglo: 2
Ingrese los 2 elementos del arreglo: 1
Ingrese los 3 elementos del arreglo: 4
Ingrese los 4 elementos del arreglo: 6
Ingrese los 5 elementos del arreglo: 7
La suma de los elementos del arreglo es: 20
*/