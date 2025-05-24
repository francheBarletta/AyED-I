/* --P4 Ejercicio 1b-- */

#include <stdio.h>
#include <assert.h>

int main()
{
    int x, y, z;
    printf("Ingrese los valores de x, y, z: ");
    scanf("%d %d %d", &x, &y, &z);

    int temp_x = x;
    int temp_y = y;

    assert(temp_x == x && temp_y == y);

    z = x;
    x = y;
    y = z;

    printf("Despues del intercambio: \n");
    printf("x = %d\n", x);
    printf("y = %d\n", y);
    printf("z = %d\n", z);

    return 0;
}
/*
Ingrese los valores de x, y, z: 1 2 3
Despues del intercambio:
x = 2
y = 1
z = 1
*/