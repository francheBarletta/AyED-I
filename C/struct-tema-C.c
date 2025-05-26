#include <stdio.h>
#include <assert.h>

#define N 6

typedef struct
{
    int cuantas_bajas;
    int cuantas_medias;
    int cuantas_altas;
} s_temperaturas;

void llenar_con_temperaturas(float a[], int tam)
{
    printf("Ingrese %d temperaturas (una por línea):\n", tam);
    for (int i = 0; i < tam; i++)
    {
        printf("Temperatura %d: ", i + 1);
        scanf("%f", &a[i]);
    }
}

s_temperaturas totales(float a[], int tam)
{
    int i = 0;
    s_temperaturas res = {0, 0, 0};
    while (i < tam)
    {
        if (a[i] < 15.0)
        {
            res.cuantas_bajas++;
        }
        else if (a[i] <= 30.0)
        {
            res.cuantas_medias++;
        }
        else
        {
            res.cuantas_altas++;
        }
        i++;
    }
    return res;
}

int main()
{
    assert(N > 0);
    float temperaturas[N];
    llenar_con_temperaturas(temperaturas, N);
    s_temperaturas r = totales(temperaturas, N);
    printf("Bajas: %d\n", r.cuantas_bajas);
    printf("Medias: %d\n", r.cuantas_medias);
    printf("Altas: %d\n", r.cuantas_altas);
    return 0;
}

/*
"Ejemplo de ejecución:
10.0 20.0 30.0 35.0 50.0 12.0
Bajas: 2
Medias: 2
Altas: 2"

"Ejemplo de ejecución:
15.0 18.0 29.0 30.0 31.0 44.0
Bajas: 0
Medias: 4
Altas: 2"
*/
