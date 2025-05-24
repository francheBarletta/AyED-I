/* --P4 Ejercicio 1b-- */

#include <stdio.h>
#include <assert.h>

int main()
{
    int x, y, m;

    printf("Ingrese dos enteros: ");
    scanf("%d %d", &x, &y);

    assert(1);

    if (x <= y)
    {
        m = x;
    }
    else
    {
        m = x;
    }

    assert((m == x || m == y) & m <= x && m <= y);

    printf("El minimo es: %d\n", m);

    return 0;
}

/*
Ingrese dos enteros: 2 3
El minimo es: 2
*/