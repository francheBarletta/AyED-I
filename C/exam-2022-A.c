#include <stdio.h>
#define N 5

int suma_divisibles(int a[], int tam, int d);

int suma_divisibles(int a[], int tam, int d)
{

    int i;
    i = 0;
    int suma;
    suma = 0;
    while (i < tam)
    {
        if (a[i] % d == 0)
        {
            suma += a[i];
        }
        i++;
    }

    return suma;
}

int main(void)
{
    int arreglo[N];

    int i = 0;

    while (i < N)
    {
        printf("Ingrese un valor para el indice %d:\n", i);
        scanf("%d", &arreglo[i]);
        i++;
    }

    int d;
    printf("\nIngrese un nro entero:\n");
    scanf("%d", &d);

    int res = suma_divisibles(arreglo, N, d);

    printf("\nEl resultado de la suma de los elementos del arreglo divisibles por %d es: %d", d, res);
}