#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

char pedir_char() {
    char c;
    printf("Ingrese una letra: ");
    scanf("%c", &c);

    return c;
}

char es_vocal(char letra) {
    return letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u' ||
           letra == 'A' || letra == 'E' || letra == 'I' || letra == 'O' || letra == 'U';
}

int main() {
    char letra = pedir_char();

    assert((letra >= 'A' && letra <= 'Z') || (letra >= 'a' && letra <= 'z'));

    if(es_vocal(letra)) {
        printf("La letra %c es vocal\n", letra);
    } else {
        printf("La letra %c NO es vocal\n", letra);
    }
    return 0;
}

/*
Ingrese una letra: a
La letra a es vocal
Ingrese una letra: d    
La letra d NO es vocal 
*/