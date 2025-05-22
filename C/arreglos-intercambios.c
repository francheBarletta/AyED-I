/* --P4 Ejercicio 7-- */

#include <stdio.h>
#define N 5
#include <assert.h>

void intercambiar(int tam, int a[], int i, int j) {
    assert(i >= 0 && j >= 0);
    if (i < tam && j < tam){
        int temp = a[i];
        a[i] = a[j];
        a[j] = temp;
    }
}

int main() {
    int a[N];

    int i = 0;
    while (i < N){
        printf("Elemento %d: ", i);
        scanf("%d", &a[i]);
        i++;
    }

    int pos1, pos2;

    printf("Ingrese la primera posicion (entre 0 y %d)", N - 1);
    scanf("%d", &pos1);
    printf("Ingrese la segunda posicion (entre 0 y %d)", N - 1);
    scanf("%d", &pos2);

    if (pos1 < 0 || pos1 >= N || pos2 < 0 || pos2 >= N) {
        printf("Error: las posiciones deben estar entre 0 y %d.\n", N - 1);
        return 1;
    }


    intercambiar(N, a, pos1, pos2);

    printf("Arreglo luego del intercambio:\n");

    i = 0;
    while (i < N){
        printf("%d", a[i]);
        i++;
    }
    printf("\n");
    
return 0;
}

/*
Elemento 0: 2
Elemento 1: 3
Elemento 2: 4
Elemento 3: 5
Elemento 4: 6
Ingrese la primera posicion (entre 0 y 4)0
Ingrese la segunda posicion (entre 0 y 4)4
Arreglo luego del intercambio:
63452
*/