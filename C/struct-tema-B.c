#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

#define N 5

typedef struct
{
    int cuantos_aprobados;
    int cuantos_promocionados;
    bool hay_promocionados;
} s_resultado;

void llena_con_notas(int a[], int tam)
{
    int i = 0;
    printf("Ingrese %d notas (una por línea):\n", tam);
    while (i < tam)
    {
        printf("Nota %d: ", i + 1);
        scanf("%d", &a[i]);
        i++;
    }
}

s_resultado resultados(int a[], int tam)
{
    int i = 0;
    s_resultado res = {0, 0, false};
    while (i < tam)
    {
        if (a[i] >= 6 && a[i] <= 10)
        {
            res.cuantos_aprobados++;
        }
        if (a[i] >= 8 && a[i] <= 10)
        {
            res.cuantos_promocionados++;
            res.hay_promocionados = true;
        }
        i++;
    }
    return res;
}

int main()
{
    assert(N > 0);
    int notas[N];
    llena_con_notas(notas, N);
    s_resultado r = resultados(notas, N);
    printf("Aprobados: %d\n", r.cuantos_aprobados);
    printf("Promocionados: %d\n", r.cuantos_promocionados);
    printf("¿Hay promocionados? %s\n", r.hay_promocionados ? "true" : "false");
    return 0;
}

/*
"Ejemplo de ejecución:
3 8 10 7 6
Aprobados: 4
Promocionados: 2
¿Hay promocionados? true"

"Ejemplo de ejecución:
1 2 3 4 5
Aprobados: 0
Promocionados: 0
¿Hay promocionados? false"
*/
