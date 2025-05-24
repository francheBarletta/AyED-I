/* --Ejercicio 3-- */

#include <stdio.h>

int main()
{
    int x, y;

    printf("Ingrese los valores de x, y (estado σ₀): ");
    scanf("%d %d", &x, &y);

    x = x + y;

    printf("Estado σ₁: x = %d\n, y = %d\n", x, y);

    y = y + y;

    printf("Estado σ₂: x = %d\n, y = %d\n", x, y);

    return 0;
}

/*
Ingrese los valores de x, y (estado σ₀): 2 5
Estado σ₁: x = 7, y = 5
Estado σ₂: x = 7, y = 10
*/