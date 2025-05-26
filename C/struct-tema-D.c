#include <stdio.h>
#include <assert.h>

#define N 7

typedef struct
{
    int cuantas_a;
    int cuantas_x;
    int cuantas_z;
} s_total;

void llena_con_char(char a[], int tam)
{
    int i = 0;
    while (i < tam)
    {
        scanf(" %c", &a[i]);
        i++;
    }
}

s_total totales(char a[], int tam)
{
    int i = 0;
    s_total res = {0, 0, 0};
    while (i < tam)
    {
        if (a[i] == 'a')
        {
            res.cuantas_a++;
        }
        if (a[i] == 'x')
        {
            res.cuantas_x++;
        }
        if (a[i] == 'z')
        {
            res.cuantas_z++;
        }
        i++;
    }
    return res;
}

int main()
{
    assert(N > 0);
    char letras[N];
    llena_con_char(letras, N);
    s_total r = totales(letras, N);
    printf("a: %d\n", r.cuantas_a);
    printf("x: %d\n", r.cuantas_x);
    printf("z: %d\n", r.cuantas_z);
    return 0;
}

/*
"Ejemplo de ejecución:
a x z b a x z
a: 2
x: 2
z: 2"

"Ejemplo de ejecución:
l m n o p q r
a: 0
x: 0
z: 0"
*/
