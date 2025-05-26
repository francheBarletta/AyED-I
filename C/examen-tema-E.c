#include <stdio.h>
#include <assert.h>

#define N 5

int prod_menores(int tam, int a[], int n)
{
    assert(n >= 0);

    int contar = 0;
    int prod = 1;
    int i = 0;
    while (i < tam)
    {
        if (a[i] <= n)
        {
            prod *= a[i];
            contar++;
        }
        i++;
    }
    return prod;
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
    int n;
    printf("Ingrese el valor de n: ");
    scanf("%d", &n);

    printf("El producto de los elementos es: %d\n", prod_menores(N, a, n));

    return 0;
}

/*
Elemento 0: 1
Elemento 1: 2
Elemento 2: 3
Elemento 3: 4
Elemento 4: 5
Ingrese el valor de n: 3
El producto de los elementos es: 6
*/