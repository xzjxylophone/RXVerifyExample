//
//  RXBlockQSortBRObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/11.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockQSortBRObject.h"

typedef struct RXBlockQSortRParam {
    int a;
    int b;
}RXBlockQSortRParam;

static int _s_compar (void *tmp, const void *l, const void *r) {
    RXBlockQSortRParam *param = (RXBlockQSortRParam *)tmp;
    param->a = 10;
    param->b = 100;
    char *left = *(char **)l;
    char *right = *(char **)r;
    return strncmp(left, right, 1);
}

@implementation RXBlockQSortBRObject

- (void)test_qsort_r
{
    char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
    RXBlockQSortRParam param = {0, 0};
    [self _print_char_array:myCharacters len:3];
    NSLog(@"qsort_r before a:%zd, b:%zd", (long)param.a, (long)param.b);
    
    qsort_r(myCharacters, 3, sizeof(char *), &param, _s_compar);
    
    [self _print_char_array:myCharacters len:3];
    NSLog(@"qsort_r after a:%zd, b:%zd", (long)param.a, (long)param.b);
}

- (void)test_qsort_b
{
    char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
    NSLog(@"qsort_b before");
    [self _print_char_array:myCharacters len:3];
    qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {
        char *left = *(char **)l;
        char *right = *(char **)r;
        return strncmp(left, right, 1);
    });
    NSLog(@"qsort_b after");
    [self _print_char_array:myCharacters len:3];
}

- (void)_print_char_array:(char **)charArray len:(int)len
{
    for (int i = 0; i < len; i++) {
        char *tmp = charArray[i];
        NSLog(@"%s", tmp);
    }
}

@end
