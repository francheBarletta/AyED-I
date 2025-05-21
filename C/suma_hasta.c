/* --P4 Ejercicio 3-- */

#include <stdio.h>
#include <assert.h>

int suma_hasta(int n) {
    int i = 1;
    int suma = 0;

    while(i <= n) { //Esto hace que siempre y cuando i sea menor a n siga el bucle
        suma += i; //Acumula
        i++;
    }
return suma;
}

int main() {

    int n;
    printf("Ingrese un Numero positivo: ");
    scanf("%d", &n);

    assert(n > 0); //siempre despues de ingresar el valor scanf
    printf("El resultado de la suma es: ", suma_hasta(n)); //suma_hasta(n) porque

    return 0;
}

/*
Ingrese un Numero positivo: 5
El resultado de la suma es: 15
*/