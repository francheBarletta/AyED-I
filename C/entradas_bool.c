#include <stdio.h>
#include <stdbool.h>

bool pedir_booleano(char name) {
    bool valor;
    printf("Ingrese un booleano para %c (0 para falso, 1 para verdadero): ", name);
    scanf("%d", &valor);

    return valor != 0; //Cualquier número distinto de 0 se toma como "True" ;)
}

void imprimir_booleano(char name, bool x) {
    printf("El valor de %c es: %s\n", name, x ? "verdadero" : "falso");
}

int main () {
    bool a = pedir_booleano('a');
    imprimir_booleano('a', a);

    return 0;
}

/*
Ingrese un booleano para a (0 para falso, 1 para verdadero): 1
El valor de a es: verdadero
*/