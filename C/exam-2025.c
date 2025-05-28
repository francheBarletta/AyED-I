#include <stdio.h>
#include <assert.h>

#define N 5

int diferencia_sumas(int tam, int a[]);

typedef struct
{
    int vida;
    int ataque;
    int defensa;
} Personaje;

Personaje crear_personaje(int vida, int ataque, int defensa);

int diferencia_sumas(int tam, int a[])
{
    int i = 0;
    int suma_par = 0;
    int suma_impar = 0;
    while (i < tam)
    {
        if (a[i] % 2 == 0)
        {
            suma_par = suma_par + a[i];
        }
        else
        {
            suma_impar = suma_impar + a[i];
        }
        i = i + 1;
    }
    return suma_par - suma_impar;
}

Personaje crear_personaje(int vida, int ataque, int defensa)
{
    assert(vida > 0);
    assert(ataque > 0);
    assert(defensa > 0);
    Personaje p;
    p.vida = vida;
    p.ataque = ataque;
    p.defensa = defensa;
    return p;
}

int main()
{
    int a[N];
    int i = 0;
    printf("Ingrese %d valores:\n", N);
    while (i < N)
    {
        printf("Valor %d: ", i + 1);
        scanf("%d", &a[i]);
        i = i + 1;
    }

    int resultado = diferencia_sumas(N, a);
    printf("Resultado: %d\n", resultado);

    int vida, ataque, defensa;
    printf("Ingrese vida: ");
    scanf("%d", &vida);
    printf("Ingrese ataque: ");
    scanf("%d", &ataque);
    printf("Ingrese defensa: ");
    scanf("%d", &defensa);

    Personaje p = crear_personaje(vida, ataque, defensa);

    printf("Personaje creado - Vida: %d, Ataque: %d, Defensa: %d\n", p.vida, p.ataque, p.defensa);

    int valor;
    printf("Ingrese un valor de vida para comparar: ");
    scanf("%d", &valor);

    if (p.vida > valor)
    {
        printf("El personaje tiene más vida que %d\n", valor);
    }
    else
    {
        printf("El personaje no tiene más vida que %d\n", valor);
    }

    return 0;
}

/*
Ingrese 5 valores:
Valor 1: 1
Valor 2: 2
Valor 3: 3
Valor 4: 4
Valor 5: 5
Resultado: -3
Ingrese vida: 2
Ingrese ataque: 3
Ingrese defensa: 1
Personaje creado - Vida: 2, Ataque: 3, Defensa: 1
Ingrese un valor de vida para comparar: 1
El personaje tiene más vida que 1
*/