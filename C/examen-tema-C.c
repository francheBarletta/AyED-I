/* --Examen Tema C -- */

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

#define N 5

// Función para llenar el arreglo de temperaturas
void llenar_con_temperaturas(float a[], int tam)
{
    int i = 0;
    while (i < tam)
    {
        printf("Ingrese una temperatura %d\n: ", i + 1);
        scanf("%f", &a[i]);
        i++;
    }
}

// Función para verificar si hay al menos 3 temperaturas altas
bool hay_mas_de_2_altas(float a[], int tam)
{
    int i = 0;
    int contar = 0;
    while (i < tam)
    {
        if (a[i] > 30.00 && a[i] < 45.00)
        {
            contar++;
            if (contar >= 3)
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
    // ===== Parte 1: Examen Tema C =====
    int x, y, z;
    int X, Y, Z;

    printf("Ingrese los valores de x, y, z: ");
    scanf("%d %d %d", &x, &y, &z);

    X = x;
    Y = y;
    Z = z;

    assert(Y != 0);

    x = Y + Z;
    y = Z * X;
    z = X / Y;

    assert(x == Y + Z && y == Z * X && z == X / Y);

    printf("Los nuevos valores son:\n");
    printf("x = %d\n", x);
    printf("y = %d\n", y);
    printf("z = %d\n", z);

    // ===== Parte 2: Temperaturas =====
    assert(N > 0);
    float a[N];

    llenar_con_temperaturas(a, N);

    bool hay = hay_mas_de_2_altas(a, N);

    if (hay)
    {
        printf("Hay 3 o mas temperaturas que cumplen: \n");
    }
    else
    {
        printf("Hay 3 o mas temperaturas que no cumplen: \n");
    }

    return 0;
}

/*
Ingrese los valores de x, y, z: 1 2 3
Los nuevos valroes son:
x = 5
y = 3
z = 0
*/

/*
Ingrese una temperatura 1
: 35.00
Ingrese una temperatura 2
: 35.00
Ingrese una temperatura 3
: 35.00
Ingrese una temperatura 4
: 35.00
Ingrese una temperatura 5
: 35.00
Hay 3 o mas temperaturas que cumplen:
*/
