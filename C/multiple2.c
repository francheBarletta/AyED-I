#include <stdio.h>
#include <assert.h>

int main () {
    int x, y, z;
    int X, Y, Z;
    printf("Ingrese los valores deseados para x, y, z: ");
    scanf("%d %d %d", &x, &y, &z);

    X = x;
    Y = y;
    Z = z;    

    int temp_x = x;
    int temp_y = y;
    int temp_z = z;

    x = temp_y;
    y = temp_y + temp_x + temp_z;
    z = temp_y + temp_x;

    assert(x == Y && y == Y + X + Z && z == Y + X);

    printf("Los nuevos valores son: \n");
    printf("x = %d\n", x);
    printf("y = %d\n", y);
    printf("z = %d\n", z);

    return 0;

}

/*
Ingrese los valores deseados para x, y, z: 1 2 3
Los nuevos valores son: 
x = 2
y = 6
z = 3
*/