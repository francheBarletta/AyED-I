/* --P4 Ejercicio 9(extra)-- */

#include <stdio.h>

#define N 5

int contar_pares(int tam, int a[])
{
    int i = 0;
    int contar = 0;

    while (i < tam)
    {
        if (a[i] % 2 == 0)
        {
            contar++;
        }
        i++;
    }
    return contar;
}

int contar_impares(int tam, int a[])
{
    int i = 0;
    int contar = 0;

    while (i < tam)
    {
        if (a[i] % 2 != 0)
        {
            contar++;
        }
        i++;
    }
    return contar;
}


int main() {
    int a[N];
    int i = 0;

    while(i < N) {
        printf("Elemento %d: ", i);
        scanf("%d", &a[i]);
        i++;
    }

    int c_par = contar_pares(N, a);
    int c_impar = contar_impares(N, a);

    printf("La cantidad de pares es %d\n", c_par);
    printf("La cantidad de impares es %d\n", c_impar);

    return 0;
}

/*
Elemento 0: 1
Elemento 1: 2
Elemento 2: 3
Elemento 3: 4
Elemento 4: 5
La cantidad de pares es 2
La cantidad de impares es 3
*/