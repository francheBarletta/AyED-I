#include <stdio.h>
#include <stdbool.h>

int main() {
    int edad;
    float nota;
    bool beca;

    printf("Ingrese su edad: ");
    scanf("%d", &edad);

    printf("Ingrese su nota final (0 a 10): ");
    scanf("%f", &nota);

    printf("¿Tiene beca? (1 = sí, 0 = no): ");
    scanf("%d", &beca);

    printf("\nResultado:\n");

    if (edad < 18) {
        if (nota >= 8.5 && beca) {
            printf("Estudiante menor de edad con excelente rendimiento y beca.\n");
        } else if (nota >= 8.5) {
            printf("Estudiante menor de edad con excelente rendimiento, sin beca.\n");
        } else if (nota >= 6) {
            printf("Estudiante menor de edad con rendimiento aceptable.\n");
        } else {
            printf("Estudiante menor de edad con rendimiento bajo.\n");
        }
    } else if (edad <= 25) {
        if (nota >= 9 && beca) {
            printf("Estudiante joven destacado con beca.\n");
        } else if (nota < 4) {
            printf("Estudiante joven en situación crítica.\n");
        } else {
            printf("Estudiante joven promedio.\n");
        }
    } else {
        if (!beca && nota < 5) {
            printf("Estudiante adulto sin beca y bajo rendimiento.\n");
        } else {
            printf("Estudiante adulto.\n");
        }
    }

    return 0;
}
