/* --Ejercicio 2-- */

#include <stdio.h>
#include <stdbool.h>

int main() {
    int x, y, z;
    int temp_b, temp_w;
    bool b, w;

    printf("Ingrese los valores de x, y, z (enteros) y b, w (booleanos) (0 para false, 1 para true):\n");

    printf("x: ");
    scanf("%d", &x);
    printf("y: ");
    scanf("%d", &y);
    printf("z: ");
    scanf("%d", &z);
    printf("b (0 o 1): ");
    scanf("%d", &temp_b);
    printf("w (0 o 1): ");
    scanf("%d", &temp_w);

    b = temp_b;
    w = temp_w;

    printf("\nResultados:\n");
    printf("x %% 4 == 0: %s\n", (x % 4 == 0) ? "true" : "false");
    printf("x + y == 0 && y - x == (-1) * z: %s\n", (x + y == 0 && y - x == (-1) * z) ? "true" : "false");
    printf("not b && w: %s\n", (!b && w) ? "true" : "false");

    return 0;
}

/*  
Ingrese los valores de x, y, z (enteros) y b, w (booleanos) (0 para false, 1 para true):
x: 1
y: 2
z: 3
b (0 o 1): 0
w (0 o 1): 1

Resultados:
x % 4 == 0: false
x + y == 0 && y - x == (-1) * z: false
not b && w: true
*/