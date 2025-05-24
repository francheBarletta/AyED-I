/* --P4 Ejercicio 9(extra)-- */

#include <stdio.h>
#include <limits.h>

#define N 5

int maximo_pares(int tam, int a[])
{
    int i = 0;
    int maximo = INT_MIN;

    while (i < tam)
    {
        if (a[i] % 2 == 0 && a[i] > maximo)
        {
            maximo = a[i];
        }
        i++;
    }
    return maximo;
}

int maximo_impares(int tam, int a[])
{
    int i = 0;
    int maximo = INT_MIN;

    while (i < tam)
    {
        if (a[i] % 2 != 0 && a[i] > maximo)
        {
            maximo = a[i];
        }
        i++;
    }
    return maximo;
}

int main()
{
    int a[N];
    int i = 0;

    while (i < N)
    {
        printf("Elemento %d: ", i);
        scanf("%d", &a[i]);
        i++;
    }

    int max_par = maximo_pares(N, a);
    int max_impar = maximo_impares(N, a);

    if (max_par == INT_MIN)
    {
        printf("No hay elementos pares en el arreglo.\n");
    }
    else
    {
        printf("El maximo par es: %d\n", max_par);
    }
    if (max_impar == INT_MIN)
    {
        printf("No hay elementos impares en el arreglo.\n");
    }
    else
    {
        printf("El maximo impar es: %d\n", max_impar);
    }

    return 0;
}

/*
Elemento 0: 1
Elemento 1: 2
Elemento 2: 3
Elemento 3: 4
Elemento 4: 5
El maximo par es: 4
El maximo impar es: 5
*/