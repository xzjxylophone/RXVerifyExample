//
//  RXRuntimeUtil.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/19.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXRuntimeUtil : NSObject
+ (void)printPropertyList:(id)value;
+ (void)printMethodList:(id)value;
+ (void)printIvarList:(id)value;
+ (void)printProtocolList:(id)value;

+ (void)printPropertyListWithClass:(Class)cls;
+ (void)printMethodListWithClass:(Class)cls;
+ (void)printIvarListWithClass:(Class)cls;
+ (void)printProtocolListWithClass:(Class)cls;


+ (void)exchangeMethodRoughly:(Class)cls originSel:(SEL)originSel newSel:(SEL)newSel;
+ (void)exchangeMethodSafely:(Class)cls originSel:(SEL)originSel newSel:(SEL)newSel;

@end
