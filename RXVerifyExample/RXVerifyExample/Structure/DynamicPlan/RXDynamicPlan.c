//
//  RXDynamicPlan.c
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/4.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#include "RXDynamicPlan.h"
#include <stdbool.h> // bool 关键字
#include <stdlib.h> // malloc



//
//
void shoppingSnacks(int *prices, int n, int w) {
    int row = n;
    int column = 3 * w + 1;
    bool **p;
    p = (bool **)malloc(sizeof(bool) * row * column);
    
    printf("%d", n);
}
//
