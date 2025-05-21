/* --P4 Ejercicio 2-- */

#include <stdio.h>
#include <assert.h>

int main () {
    int x, y;
    int X, Y;

    printf("Ingrese los valores de x, y: ");
    scanf("%d %d", &x, &y);

    X = x;
    Y = y;
    
    int temp = x;
    x = x + 1;
    y = temp + y;

    assert(x == X + 1 && y == Y + X);

    printf("Los nuevos valores son: \n");
    printf("x = %d\n", x);
    printf("y = %d\n", y);

    return 0;
}

/*
Ingrese los valores de x, y: 1 2
Los nuevos valores son: 
x = 2
y = 3
*/