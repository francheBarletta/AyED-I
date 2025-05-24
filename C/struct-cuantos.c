/* --P4 Ejercicio 13-- */

#include <stdio.h>

#define N 5

struct comp_t
{
    int menores;
    int iguales;
    int mayores;
};

struct comp_t cuantos(int tam, int a[], int elem)
{
    struct comp_t resultado = {0, 0, 0};
    int i = 0;

    while (i < tam)
    {
        if (a[i] < elem)
        {
            resultado.menores++;
        }
        else if (a[i] == elem)
        {
            resultado.iguales++;
        }
        else
        {
            resultado.mayores++;
        }
        i++;
    }
    return resultado;
}

int main()
{
    int a[N];
    int i = 0;
    int numero;

    while (i < N)
    {
        printf("Elemento %d: ", i);
        scanf("%d", &a[i]);
        i++;
    }

    printf("Ingrese numero entero: ");
    scanf("%d", numero);

    struct comp_t resultado = cuantos(N, a, numero);
    printf("Menores que %d: %d\n", numero, resultado.menores);
    printf("Iguales a %d: %d\n", numero, resultado.iguales);
    printf("Mayores que %d: %d\n", numero, resultado.mayores);

    return 0;
}
