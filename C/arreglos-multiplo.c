/* --P4 Ejercicio 7-- */

#include <stdio.h>
#include <stdbool.h>
#define N 5

bool todos_pares(int tam, int a[])
{
    int i = 0;
    while (i < tam)
    {
        if (a[i] % 2 == 0)
        {
            return true;
        }
        i++;
    }
    return false;
}

bool existe_multiplo(int m, int tam, int a[])
{
    int i = 0;
    while (i < tam)
    {
        if (a[i] % m == 0)
        {
            return true;
        }
        i++;
    }
    return false;
}

int main()
{
    int a[N];

    int i = 0;
    printf("Ingrese los %d elementos del arreglo:\n", N);
    while (i < N)
    {
        printf("Elemento %d:", i + 1);
        scanf("%d", &a[i]);
        i++;
    }

    if (todos_pares(N, a))
    {
        printf("Todos los elementos del arreglo son pares: Verdadero.\n");
    }
    else
    {
        printf("Hay al menos un elemento impar: False.\n");
    }

    int m;

    printf("Ingrese el valor de m, el mismodebe ser multiplo de algun elemento del arreglo: ");
    scanf("%d", &m);

    if (existe_multiplo(m, N, a))
    {
        printf("Hay al menos un elemento multiplo de m: True\n");
    }
    else
    {
        printf("NO hay elementos multiplos de m: False\n");
    }

    return 0;
}

/*
Ingrese los 5 elementos del arreglo:
Elemento 1:1
Elemento 2:2
Elemento 3:3
Elemento 4:4
Elemento 5:5
Hay al menos un elemento impar: False.
Ingrese el valor de m, el mismodebe ser multiplo de algun elemento del arreglo: 2
Hay al menos un elemento multiplo de m: True

Ingrese los 5 elementos del arreglo:
Elemento 1:2
Elemento 2:4
Elemento 3:6
Elemento 4:8
Elemento 5:2
Todos los elementos del arreglo son pares: Verdadero.
Ingrese el valor de m, el mismodebe ser multiplo de algun elemento del arreglo: 13
NO hay elementos multiplos de m: False
*/