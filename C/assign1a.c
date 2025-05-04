#include <stdio.h>

int main () {
    int x;

    printf("Ingrese el valor de x (estado σ₀): ");
    scanf("%d", &x);

    x = 5;

    printf("Estado σ₁: x = %d\n", x);

    return 0;
}