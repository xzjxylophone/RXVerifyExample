#include <stdio.h>

int main()
{
	int a = 100;
    void (^block5)(int) = ^(int paramA) {
        printf("%d\n", paramA);
    };
    block5(a);


    void (^block51)() = ^() {
        printf("block51");
    };
    block51();

    return 0;
}

