/* --Ejercicio 5a-- */

#include <stdio.h>

int main()
{
    int i = 4;

    while (i != 0)
    {
        printf("Valor actual de i: %d\n", i);
        i = i - 1;
    }

    printf("Valor final de i: %d\n", i);

    return 0;
}

/*
Valor actual de i: 4
Valor actual de i: 3
Valor actual de i: 2
Valor actual de i: 1
Valor final de i: 0
*/