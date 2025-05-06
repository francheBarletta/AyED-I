/* --Ejercicio 5a-- */

#include <stdio.h>

int main() {
    int x = 7, y = 3, z = 5;
    
    int result1 = x + y + 1;
    int resutl2 = z * z + y * 45 - 15 * x;
    int result3 = y - 2 == (x * 3 + 1) % 5;
    int result4 = y / 2 * x;
    int result5 = y < x * z;

    printf("result1: %d\n", result1);
    printf("result2: %d\n", resutl2);
    printf("result3: %d\n", result3);
    printf("result4: %d\n", result4);
    printf("result5: %d\n", result5);

    return 0;
}

/*
gcc -Wall -Wextra -std=c99 -o assigments assigments.c   
./assigments                                                                                      ──(Sat,May03)─┘
result1: 11
result2: 55
result3: 0
result4: 7
result5: 1  
*/