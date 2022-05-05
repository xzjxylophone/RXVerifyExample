//
//  RXRuntimeUtil.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/19.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXRuntimeUtil.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation RXRuntimeUtil

+ (void)printPropertyList:(id)value {
    [self printMethodListWithClass:[value class]];
}

+ (void)printMethodList:(id)value {
    [self printMethodListWithClass:[value class]];
}

+ (void)printIvarList:(id)value {
    [self printIvarListWithClass:[value class]];
}

+ (void)printProtocolList:(id)value {
    [self printProtocolListWithClass:[value class]];
}



+ (void)printPropertyListWithClass:(Class)cls
{
    NSMutableArray *array = [NSMutableArray new];
    [array addObject:@""];
    [array addObject:@"property list:"];
    [array addObject:@"propertyName | propertyAttributes"];
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char *propertyName = property_getName(property);
        const char *propertAttributs = property_getAttributes(property);
        NSString *tmp = [NSString stringWithFormat:@"%s | %s", propertyName, propertAttributs];
        [array addObject:tmp];
    }
    NSLog(@"%@", [array componentsJoinedByString:@"\n"]);
}
+ (void)printMethodListWithClass:(Class)cls
{
    NSMutableArray *array = [NSMutableArray new];
    [array addObject:@""];
    [array addObject:@"method list:"];
    [array addObject:@"methodName address"];
    unsigned int count;
    Method *methodList = class_copyMethodList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSString *methodName = NSStringFromSelector(method_getName(method));
        IMP methodIMP = method_getImplementation(method);
        NSString *str = [NSString stringWithFormat:@"%@ %p", methodName, methodIMP];
        [array addObject:str];
    }
    NSLog(@"%@", [array componentsJoinedByString:@"\n"]);
}
+ (void)printIvarListWithClass:(Class)cls
{
    NSMutableArray *array = [NSMutableArray new];
    [array addObject:@""];
    [array addObject:@"ivar list:"];
    [array addObject:@"ivarName | typeEncoding"];
    unsigned int count;
    Ivar *ivarList = class_copyIvarList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        const char *ivarTypeEncoding = ivar_getTypeEncoding(ivar);
        NSString *tmp = [NSString stringWithFormat:@"%s | %s", ivarName, ivarTypeEncoding];
        [array addObject:tmp];
    }
    NSLog(@"%@", [array componentsJoinedByString:@"\n"]);
}
+ (void)printProtocolListWithClass:(Class)cls
{
    NSMutableArray *array = [NSMutableArray new];
    [array addObject:@""];
    [array addObject:@"protocol list:"];
    [array addObject:@"protocolName"];
    unsigned int count;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        NSString *tmp = [NSString stringWithFormat:@"%s", protocolName];
        [array addObject:tmp];
    }
    NSLog(@"%@", [array componentsJoinedByString:@"\n"]);
}

+ (void)exchangeMethodRoughly:(Class)cls originSel:(SEL)originSel newSel:(SEL)newSel
{
    Method originalMethod = class_getInstanceMethod(cls, originSel);
    Method swizzledMethod = class_getInstanceMethod(cls, newSel);
    
    [self printMethodInfo:originalMethod];
    method_exchangeImplementations(originalMethod, swizzledMethod);
    
}
+ (void)exchangeMethodSafely:(Class)cls originSel:(SEL)originSel newSel:(SEL)newSel
{
    Method originalMethod = class_getInstanceMethod(cls, originSel);
    Method swizzledMethod = class_getInstanceMethod(cls, newSel);
    
    [self printMethodInfo:originalMethod];
    
    BOOL didAddMethod = class_addMethod(cls, originSel, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(cls, newSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)printMethodInfo:(Method)method
{
    SEL sel = method_getName(method);
    IMP imp = method_getImplementation(method);
    const char *typeEncoding = method_getTypeEncoding(method);
    unsigned int numberOfArguments = method_getNumberOfArguments(method);
    char *copyReturnType = method_copyReturnType(method);
    
    for (unsigned int index = 0; index < numberOfArguments; index++) {
        char *copyArgumentType = method_copyArgumentType(method, index);
        char argumentType[512] = {};
        method_getArgumentType(method, index, argumentType, 512);
    }
    
    char returnType[512] = {};
    method_getReturnType(method, returnType, 512);
    
}

@end
