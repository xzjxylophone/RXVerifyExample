#include <stdio.h>

int main()
{
	int a = 1;
	int b = 2;
	// clang -rewrite-objc macro0.c
	int c = MIN(a, b);
	printf("c:%d\n", c);
    return 0;
}

