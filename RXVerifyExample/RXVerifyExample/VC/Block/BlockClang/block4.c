#include <stdio.h>

int main()
{
	int a = 100;
    void (^block4)(int) = ^(int paramA) {
        printf("%d\n", paramA);
    };
    block4(a);
    return 0;
}

