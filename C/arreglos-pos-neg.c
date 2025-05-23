/* --P4 Ejercicio 7(extra)-- */

#include <stdio.h>
#include <stdbool.h>
#define N 5

bool todos_positivos(int tam, int a[]) {
    int i = 0;
    while(i < tam) {
        if (a[i] < 0 ) {
             return false;
        }
        i++;
    }
    return true;
}

bool existe_negativo(int tam, int a[]){
    int i = 0;
    while(i < tam) {
        if (a[i] < 0) {
            return true;
        }
        i++;
    }
    return false;
}

int main() {
    int a[N];
    int i = 0;
    while(i < N){
        printf("Elemento %d: ", i + 1);
        scanf("%d", &a[i]);
        i++;
    }

    if (todos_positivos(N, a)) {
        printf("Todos los elementos son positivos.\n");
    } else {
        printf("Hay almenos un elemento negativo.\n");
    }

    if (existe_negativo(N, a)) {
        printf("Existe al menos un negativo.\n");
    } else {
        printf("No hay elementos negativos.\n");
    }

return 0;

}

/*
Elemento 1: 1
Elemento 2: 2
Elemento 3: 3
Elemento 4: 4
Elemento 5: 5
Todos los elementos son positivos.
No hay elementos negativos.

Elemento 1: -1
Elemento 2: 2
Elemento 3: -3
Elemento 4: 4
Elemento 5: -5
Hay almenos un elemento negativo.
Existe al menos un negativo.
*/