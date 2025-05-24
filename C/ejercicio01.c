/* --P4 Ejercicio 1a-- */

#include <stdio.h>
#include <assert.h>

void hola_hasta(int n)
{
    int i = 0;
    while (i < n)
    {
        printf("Hola\n");
        i++;
    }
}

int main()
{
    int x;

    printf("Ingrese la cantidad de Hola's: ");
    scanf("%d", &x);

    assert(x > 0);

    hola_hasta(x);

    return 0;
}

/*
Ingrese la cantidad de Hola's: 5
Hola
Hola
Hola
Hola
Hola
*/