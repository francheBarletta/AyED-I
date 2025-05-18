#include <stdio.h>

int pedir_entero(char name) {
    int valor;
    printf("Ingrese un entero'%c': ", name);
    scanf("%d", &valor);
    return valor;
}

void imprimir_entero(char name, int x) {
    printf("El valor almacenado en la variable '%c' es: %d\n", name, x);    
}

int main () {
    int n;

    n = pedir_entero('n');

    imprimir_entero('n', n);

    return 0;
}

/*  
Ingrese un entero'n': 1
El valor almacenado en la variable 'n' es: 1
*/
