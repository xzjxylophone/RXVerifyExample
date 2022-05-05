//
//  RXBlockC99VariableLengthArrayObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockC99VariableLengthArrayObject.h"
typedef struct RXBlockCommonStruct {
    int a;
    int b;
}RXBlockCommonStruct;

typedef struct RXBlockC99VariableLengthArrayStruct {
    int a;
    int b;
    int c[10];
    int *d;
}RXBlockC99VariableLengthArrayStruct;

@implementation RXBlockC99VariableLengthArrayObject
- (void)_test_c99_variable_length_array
{
//    int n = 10;
//    // Error: __block attribute not allowed on declaration with a varialby modified type
//    __block int a[n];
    
//    char * gc_string = "1111";
//    char * string_walker = gc_string + 0;
//    char * wannabe_walk = gc_string;
}
- (void)_test_oc_variable_lenth_array
{
    __block NSMutableArray *ary = [NSMutableArray new];
    void (^block1)(void) = ^{
        ary = [NSMutableArray arrayWithCapacity:5];
        [ary addObject:@(1)];
        [ary addObject:@(2)];
        [ary addObject:@(3)];
        NSLog(@"%@", ary);
    };
    NSLog(@"111");
    block1();
}
- (void)_test_struct
{
//    __block RXBlockCommonStruct struct1 = {0};
//    
//    __block RXBlockC99VariableLengthArrayStruct struct2 = {0};
}
@end
