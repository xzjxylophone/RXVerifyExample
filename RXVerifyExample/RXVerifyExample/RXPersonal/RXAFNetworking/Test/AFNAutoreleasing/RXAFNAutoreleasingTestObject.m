//
//  RXAFNAutoreleasingTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/6.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNAutoreleasingTestObject.h"

@implementation RXAFNAutoreleasingTestObject
- (void)test1 {
    id __unsafe_unretained obj1 = nil;
    {
        id obj0 = [NSMutableArray array];
        [obj0 addObject:@"123"];
        obj1 = obj0;
        NSLog(@"obj0=%@", obj0);
    }
    // 野指针崩溃
    NSLog(@"obj1=%@", obj1);
}
- (void)test2 {
    id __unsafe_unretained obj1 = nil;
    {
        id obj0 = [[NSMutableArray alloc] init];
        [obj0 addObject:@"123"];
        obj1 = obj0;
        NSLog(@"obj0=%@", obj0);
    }
    // 野指针崩溃
    NSLog(@"obj1=%@", obj1);
}

- (void)test3 {
    id __unsafe_unretained obj1 = nil;
    {
        id obj0 = [NSMutableArray arrayWithObjects:@"123", nil];
        obj1 = obj0;
        NSLog(@"obj0=%@", obj0);
    }
    // 不会野指针崩溃
    NSLog(@"obj1=%@", obj1);
}

+ (id)object4 {
    return [NSMutableArray array];
}
- (void)test4 {
    id __unsafe_unretained obj1 = nil;
    {
        id obj0 = [[self class] object4];
        [obj0 addObject:@"123"];
        obj1 = obj0;
        NSLog(@"obj0=%@", obj0);
    }
    // 不会野指针崩溃
    NSLog(@"obj1=%@", obj1);
}

+ (id)object5 {
    NSMutableArray *ary = [NSMutableArray array];
    return ary;
}
- (void)test5 {
    id __unsafe_unretained obj1 = nil;
    {
        id obj0 = [[self class] object5];
        [obj0 addObject:@"123"];
        obj1 = obj0;
        NSLog(@"obj0=%@", obj0);
    }
    // 野指针崩溃
    NSLog(@"obj1=%@", obj1);
}
// 以alloc开头的类方法好像又做了什么特殊的处理了
+ (id)allocObject {
    return [NSMutableArray array];
}
- (void)test6 {
    id __unsafe_unretained obj1 = nil;
    {
        id obj0 = [[self class] allocObject];
        [obj0 addObject:@"123"];
        obj1 = obj0;
        NSLog(@"obj0=%@", obj0);
    }
    // 野指针崩溃
    NSLog(@"obj1=%@", obj1);
}
// 跟6类似
+ (id)alloc77777 {
    return [NSMutableArray array];
}
- (void)test7 {
    id __unsafe_unretained obj1 = nil;
    {
        id obj0 = [[self class] alloc77777];
        [obj0 addObject:@"123"];
        obj1 = obj0;
        NSLog(@"obj0=%@", obj0);
    }
    // 野指针崩溃
    NSLog(@"obj1=%@", obj1);
}

- (void)test8 {
    
}
- (void)test9 {
    
}
- (void)test10 {
    
}
- (void)test11 {
    
}

@end
