/* --Examen Tema B -- */

#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

#define N 5

void llena_con_notas(int a[], int tam)
{
    int i = 0;
    while (i < tam)
    {
        printf("Elemento %d: ", i);
        scanf("%d", &a[i]);
        i++;
    }
}

bool hay_mas_de_3_aprobados(int a[], int tam)
{
    int i = 0;
    int contar = 0;

    while (i < tam)
    {
        if (a[i] >= 6 && a[i] <= 10)
        {
            contar++;
            if (contar >= 3)
            {
                return true;
            }
            i++;
        }
        return false;
    }
}

int main()
{
    // ===== Parte 1: Examen Tema B =====

    int i, j, k;
    int I, J, K;

    printf("Ingrese los valores de i, j, k: ");
    scanf("%d %d %d", &i, &j, &k);

    I = i;
    J = j;
    K = k;

    i = I * J;
    j = J * K;
    k = K * I;

    assert(i == I * J && j == J * K && k == K * I);

    printf("Los valores actualizados son: \n");
    printf("i: %d\n", i);
    printf("j: %d\n", j);
    printf("k: %d\n", k);

    // ===== Parte 2: Examen Tema B =====

    int a[N];

    llena_con_notas(a, N);

    bool hay = hay_mas_de_3_aprobados(a, N);

    if(hay) {
        printf("NO hay mas de 3 aprobados: %d\n");
    } else {
        printf("Hay mas de 3 aprobados: %d\n");
    }

    return 0;
}

/*
Ingrese los valores de i, j, k: 1 2 3
Los valores actualizados son:
i: 2
j: 6
k: 3

Elemento 0: 1        
Elemento 1: 2
Elemento 2: 6
Elemento 3: 7
Elemento 4: 8
hay mas de 3 aprobados: 5
*/