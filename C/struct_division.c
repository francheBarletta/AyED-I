/* --P4 Ejercicio 11-- */

#include <stdio.h>
#include <assert.h>

struct div_t
{
    int cociente;
    int resto;
};

struct div_t division(int x, int y)
{
    struct div_t resultado;
    resultado.cociente = x / y;
    resultado.resto = x % y;
    return resultado;
}

int main()
{
    int a, b;

    printf("Ingrese el dividendo (mayor a cero): ");
    scanf("%d", &a);
    printf("Ingrese el divisor (mayor a cero): ");
    scanf("%d", &b);

    assert(a >= 0 && b > 0);

    struct div_t res = division(a, b);
    printf("Cociente: %d\n", res.cociente);
    printf("Resto: %d\n", res.resto);

    return 0;
}

/*
Ingrese el dividendo (mayor a cero): 4
Ingrese el divisor (mayor a cero): 2
Cociente: 2
Resto: 0
*/