//
//  NSObject+RXVerifyExample.m
//  RXVerifyExample
//
//  Created by ceshi on 16/5/25.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "NSObject+RXVerifyExample.h"
#import <objc/runtime.h>

@implementation NSObject (RXVerifyExample)





//
//+ (void)load
//{
//    NSError *error = nil;
//    [NSObject aspect_hookSelector:@selector(resolveInstanceMethod:) withOptions:AspectPositionAfter usingBlock:^BOOL(id<AspectInfo> info, SEL sel) {
//        
//        
//        NSLog(@"resolveInstanceMethod:%@", info.instance);
//        return YES;
//    } error:&error];
//    
//    NSLog(@"error:%@", error);
//}



//
//+ (BOOL)resolveClassMethod:(SEL)sel
//{
//    NSLog(@"class:%@ sel-->%@", NSStringFromClass([self class]), NSStringFromSelector(sel));
//    
//    return YES;
//}
//
//
//
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    NSLog(@"instance:%@ sel-->%@", NSStringFromClass([self class]), NSStringFromSelector(sel));
//    
//    //    objc_msgSend();
//    
//    return YES;
//}





@end
