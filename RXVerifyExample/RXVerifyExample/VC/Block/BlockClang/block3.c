#include <stdio.h>

int main()
{
	__block int a = 100;
    void (^block3)(void) = ^{
        printf("%d\n", a);
        a = 1023;
    };
    block3();
    return 0;
}

