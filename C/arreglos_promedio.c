/* --P4 Ejercicio 5(extra)-- */

#include <stdio.h>
#define N 5

void pedir_arreglo(int n_max, int a[]) {
    int i = 0;
    while (i < n_max)
    {
        printf("Ingrese %d valores del arreglo: ", i + 1);
        scanf("%d", &a[i]);
        i++;
    }
    
}

void imprimir_arreglo(int n_max, int a[]) {
    int i = 0;
    printf("Los valores ingresados fueron: \n");

    while (i < n_max)
    {
        printf("%d", a[i]);
        i++;

    }
    printf("\n");    
}

void promedio_arreglo(int n_max, int a[]) {
    int i = 0;
    int suma = 0;

    while (i < n_max)
    {
        suma += a[i];
        i++;
    }
    
    float promedio = (float)suma / n_max;
    printf("El promedio del arreglo es:  %.2f\n", promedio);

}

int main() {
    int a[N];

    pedir_arreglo(N, a);
    imprimir_arreglo(N, a);
    promedio_arreglo(N, a);

    return 0;
}

/*
Ingrese 1 valores del arreglo: 1
Ingrese 2 valores del arreglo: 2
Ingrese 3 valores del arreglo: 3
Ingrese 4 valores del arreglo: 4
Ingrese 5 valores del arreglo: 5
Los valores ingresados fueron: 
12345
El promedio del arreglo es:  3.00
*/