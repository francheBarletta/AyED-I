#include <assert.h>
#include <stdio.h>

#define N 4

int sum_even(int tam, int a[], int n)
{
    // verificar con assert
    // que n es mayor o igual a 0
    // y menor o igual que tam
    assert(n >= 0);
    assert(n <= tam);

    // suma de los primeros
    // `n` elementos de `a`
    // que son **pares**
    int i = 0;
    int suma = 0;
    while (i < n)
    {
        if (a[i] % 2 == 0)
        {
            suma += a[i];
        }
        i++;
    }
    return suma;
}

int main()
{
    printf("Ingrese %d números: ", N);
    int a[N];
    int i = 0;
    while (i < N)
    {
        scanf("%d", &a[i]);
        i += 1;
    }

    int n;
    printf("Ingrese el número: ");
    scanf("%d", &n);

    printf("La suma de pares es: %d\n", sum_even(N, a, n));

    return 0;

    /* (i++) */
    // 1. evalúa al valor ACTUAL de i
    // 2. incrementa i en 1
    /* (++i) */
    // 1. incrementa i en 1
    // 2. evalúa al valor ACTUAL de i
    /* a[i] */
    // (a + i)
}