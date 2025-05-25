/* --Examen Tema D -- */

#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

#define N 5

void llena_con_char(char a[], int tam)
{
    int i = 0;
    char letra;

    while (i < tam)
    {
        printf("Ingrese las letras deseadas: ", i + 1);
        scanf(" %c", &letra);
        a[i] = letra;
        i++;
    }
}

bool hay_mas_de_2_consonantes(char a[], int tam)
{
    int i = 0;
    int contar = 0;

    while (i < tam)
    {
        if (a[i] != 'a' && a[i] != 'e' && a[i] != 'i' && a[i] != 'o' && a[i] != 'u')
        {
            contar++;
            if (a[i] >= 3)
            {
                return true;
            }
        }
        i++;
    }
    return false;
}

int main()
{

    // ===== Parte 1: Examen Tema D =====

    int x, y, z;
    int X, Y, Z;

    printf("Ingrese los valores de x, y, z:");
    scanf("%d %d %d", &x, &y, &z);

    X = x;
    Y = y;
    Z = z;

    x = Y;
    y = X + Y - Z;
    z = X * (1 + Y * Y);

    assert(x == Y && y == X + Y - Z && z == X * (1 + Y * Y));

    printf("Los valores resultado son: \n");
    printf("x: %d\n", x);
    printf("y: %d\n", y);
    printf("z: %d\n", z);

    // ===== Parte 2: Examen Tema C =====

    char a[N];
    llena_con_char(a, N);

    bool hay = hay_mas_de_2_consonantes(a, N);

    if (hay)
    {
        printf("Hay mas de 2 consonantes.\n");
    }
    else
    {
        printf("NO hay mas de 2 consonantes.\n");
    }

    return 0;
}

/*
Ingrese los valores de x, y, z:1 2 3
Los valores resultado son:
x: 2
y: 0
z: 5
Ingrese las letras deseadas: a
Ingrese las letras deseadas: e
Ingrese las letras deseadas: t
Ingrese las letras deseadas: t
Ingrese las letras deseadas: t
Hay mas de 2 consonantes.
*/