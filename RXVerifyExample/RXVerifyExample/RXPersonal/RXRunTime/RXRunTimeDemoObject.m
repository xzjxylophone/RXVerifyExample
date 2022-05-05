//
//  RXRunTimeDemoObject.m
//  RXVerifyExample
//
//  Created by ceshi on 16/5/25.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RXRunTimeDemoObject.h"

#import <objc/runtime.h>
#import <objc/message.h>
#import "RXRunTimeDemo1Object.h"


@interface RXRunTimeDemoObject () <UIAlertViewDelegate, UITextFieldDelegate> {
    NSString *m_msg;
    NSInteger m_index;
    id m_delegate;
    UIButton *m_button;
}

@end


@implementation RXRunTimeDemoObject



+ (void)testClassMethod
{
    NSLog(@"testClassMethod");
}


+ (void)testClassPrint
{
    
}
- (void)testPrint
{
    
    Class cls = [RXRunTimeDemoObject class];
    
    unsigned int count;
    
    
    
    NSLog(@"property");
    objc_property_t *propertyList = class_copyPropertyList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        
        objc_property_t property = propertyList[i];
        const char *propertyName = property_getName(property);
        NSLog(@"property-->%@", [NSString stringWithUTF8String:propertyName]);
        
        const char *propertAttributs = property_getAttributes(property);
        NSLog(@"propertAttributs-->%@", [NSString stringWithUTF8String:propertAttributs]);
    }
    
    NSLog(@"method");
    Method *methodList = class_copyMethodList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"method-->%@", NSStringFromSelector(method_getName(method)));
    }
    
    
    
    
    
    NSLog(@"ivar");
    Ivar *ivarList = class_copyIvarList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        NSLog(@"ivar-->%@", [NSString stringWithUTF8String:ivarName]);
        
    }
    
    NSLog(@"protocol");
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        NSLog(@"protocol-->%@", [NSString stringWithUTF8String:protocolName]);
        
    }
    
    
    
}

- (void)testPrint2
{
    
    Class cls = objc_getMetaClass("RXRunTimeDemoObject");
    
    unsigned int count;
    

    
    NSLog(@"property");
    objc_property_t *propertyList = class_copyPropertyList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        
        objc_property_t property = propertyList[i];
        const char *propertyName = property_getName(property);
        NSLog(@"property-->%@", [NSString stringWithUTF8String:propertyName]);
        
        const char *propertAttributs = property_getAttributes(property);
        NSLog(@"propertAttributs-->%@", [NSString stringWithUTF8String:propertAttributs]);
    }
    
    NSLog(@"method");
    Method *methodList = class_copyMethodList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"method-->%@", NSStringFromSelector(method_getName(method)));
    }
    
    
    

    
    NSLog(@"ivar");
    Ivar *ivarList = class_copyIvarList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        NSLog(@"ivar-->%@", [NSString stringWithUTF8String:ivarName]);
        
    }
    
    NSLog(@"protocol");
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        NSLog(@"protocol-->%@", [NSString stringWithUTF8String:protocolName]);

    }
    
    
    
}


//void dynamicMethod(id self, SEL _cmd)
//{
//    
//    NSLog(@"SEL:%@ did not exist", NSStringFromSelector(_cmd));
//}
//
//
//+ (BOOL)resolveClassMethod:(SEL)sel
//{
//    NSLog(@"class sel-->%@", NSStringFromSelector(sel));
//    
//    return NO;
//}
//
//
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    if ([NSStringFromSelector(aSelector) isEqualToString:@"testNoMethod"]) {
//        NSLog(@"forwardingTargetForSelector");
//        
//        return [RXRunTimeDemo1Object new];
//    }
//    return nil;
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    NSLog(@"instance sel-->%@", NSStringFromSelector(sel));
//    
////    objc_msgSend();
//    
//    if (sel == @selector(tttt)) {
//        class_addMethod([self class], sel, (IMP)dynamicMethod, "v@:");
//        return YES;
//    }
//    
//
//    
//    return YES;
//}
//
//
//

- (id)init
{
//    NSProxy
    if (self = [super init]) {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    return self;
}


//- (Class)class
//{
//    return [RXRunTimeDemoBaseObject class];
//}




@end
