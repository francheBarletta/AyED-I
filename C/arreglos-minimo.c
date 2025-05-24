/* --P4 Ejercicio 9-- */

#include <stdio.h>
#include <limits.h>

#define N 5

int minimo_pares(int tam, int a[])
{
    int i = 0;
    int minimo = INT_MAX;

    while (i < tam)
    {
        if (a[i] % 2 == 0 && a[i] < minimo)
        {
            minimo = a[i];
        }
        i++;
    }
    return minimo;
}

int minimo_impares(int tam, int a[])
{
    int i = 0;
    int minimo = INT_MAX;

    while (i < tam)
    {
        if (a[i] % 2 != 0 && a[i] < minimo)
        {
            minimo = a[i];
        }
        i++;
    }
    return minimo;
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

    int min_par = minimo_pares(N, a);
    int min_impar = minimo_impares(N, a);

    if (min_par == INT_MAX)
    {
        printf("No hay elementos pares en el arreglo.\n");
    }
    else
    {
        printf("El minimo par es %d\n: ", min_par);
    }

    if (min_impar == INT_MAX)
    {
        printf("No hay elementos impares en el arreglo.\n");
    }
    else
    {
        printf("El minimo impar es %d\n: ", min_impar);
    }

    return 0;
}

/*
Elemento 0: 1
Elemento 1: 2
Elemento 2: 3
Elemento 3: 4
Elemento 4: 5
El minimo par es 2
El minimo impar es 1
*/