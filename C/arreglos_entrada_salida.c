/* --P4 Ejercicio 5-- */

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
    printf("Los valores ingresadors fueron: \n");

    while (i < n_max)
    {
        printf("%d", a[i]);
        i++;
    }
    printf("\n");
}

int main(void) {
    int a[N];

    pedir_arreglo(N, a);
    imprimir_arreglo(N, a);

    return 0;
}

/*
Ingrese 1 valores del arreglo: 3
Ingrese 2 valores del arreglo: 4
Ingrese 3 valores del arreglo: 2 
Ingrese 4 valores del arreglo: 7
Ingrese 5 valores del arreglo: 5
Los valores ingresadors fueron: 
34275
*/