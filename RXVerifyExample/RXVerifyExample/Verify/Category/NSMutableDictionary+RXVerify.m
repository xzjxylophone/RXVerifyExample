//
//  NSMutableDictionary+RXVerify.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2023/2/3.
//  Copyright © 2023 Rush.D.Xzj. All rights reserved.
//

#import "NSMutableDictionary+RXVerify.h"
#import "RXRuntimeUtil.h"

@implementation NSMutableDictionary (RXVerify)
+ (void)load {
    [RXRuntimeUtil exchangeMethodSafely:[NSMutableDictionary class] originSel:@selector(setObject:forKey:) newSel:@selector(swizzle_setObject:forKey:)];
    
    [RXRuntimeUtil exchangeMethodSafely:[NSMutableDictionary class] originSel:@selector(setValue:forKey:) newSel:@selector(swizzle_setValue:forKey:)];
}
- (void)swizzle_setObject:(id)object forKey:(NSString *)key {
    [self swizzle_setObject:object forKey:key];
}
- (void)swizzle_setValue:(id)object forKey:(NSString *)key {
    [self swizzle_setValue:object forKey:key];
    
}
//- (void)swizzle_setO {
//    NSLog(@"swizzle_view 3");
//    UIView *tmp = [self swizzle_view];
//    return tmp;
//}
@end
