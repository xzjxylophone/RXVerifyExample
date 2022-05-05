#include <stdio.h>

int main()
{
	int a = 100;
    void (^block2)(void) = ^{
        printf("%d\n", a);
    };
    block2();
    return 0;
}

