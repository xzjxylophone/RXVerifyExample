//
//  RXAspectsTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/2.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAspectsTestObject.h"
#import <Aspects/Aspects.h>
#import <objc/runtime.h>


typedef struct RX_objc_class {
    Class _Nonnull isa;
    Class _Nullable super_class                             ;
    const char * _Nonnull name                               ;
    long version                                             ;
    long info                                                ;
    long instance_size                                       ;
    struct objc_ivar_list * _Nullable ivars                  ;
    struct objc_method_list * _Nullable * _Nullable methodLists                    ;
    struct objc_cache * _Nonnull cache                       ;
    struct objc_protocol_list * _Nullable protocols          ;

    
}RX_objc_class;


@implementation RXAspectsTestObject



+ (void)test
{
//    add_test(self, @"class function");
    RXAspectsTestObject *obj = [RXAspectsTestObject new];
    add_test2(obj, self);
}
- (void)test
{
//    [self aspect_hookSelector:@selector(aaaaaaaa) withOptions:AspectPositionBefore usingBlock:^(void) {
//        NSLog(@"1111");
//    } error:nil];
//    add_test(self, @"instance function");
//    add_test(self.class, @"instance function");
}

- (void)objFunc
{
    
}

//static void add_test(id self, NSString *desc)
//{
//    NSLog(@"%@: %@, %p", desc, self, self);
//    BOOL flag1 = [self respondsToSelector:@selector(objFunc)];
//    BOOL flag2 = [self instancesRespondToSelector:@selector(objFunc)];
//    BOOL flag3 = NO;
//    BOOL flag4 = NO;
////    BOOL flag3 = [((NSObject *)self).class respondsToSelector:@selector(objFunc)];
////    BOOL flag4 = [((NSObject *)self).class instancesRespondToSelector:@selector(objFunc)];
//    NSLog(@"flag1:%zd, flag2:%zd, flag3:%zd, flag4:%zd", flag1, flag2, flag3, flag4);
//}

static void add_test2(id instanceObject, id classObject)
{
    Class instanceObjectISA = object_getClass(instanceObject);
    NSLog(@"instanceObject: %@, %p, instanceObjectISA:%p", instanceObject, instanceObject, instanceObjectISA);
    Class classObjectISA = object_getClass(classObject);
    NSLog(@"classObject: %@, %p, classObjectISA:%p", classObject, classObject, classObjectISA);
    
    NSObject *metaClassObject = (NSObject *)classObjectISA;
    NSLog(@"metaClassObject: %@", metaClassObject);
    
    void *void_instanceObjectISA = (__bridge void *)instanceObjectISA;
    RX_objc_class *rx_instanceObjectISA = (RX_objc_class *)void_instanceObjectISA;
    printf("%s", rx_instanceObjectISA->name);
}

@end


