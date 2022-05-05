//
//  RXInitializeTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/27.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXInitializeTestObject.h"

#import "RXInitializeCustomObject.h"
#import "RXInitializeEmptyObject.h"
#import "RXInitializeCustom2Object.h"
#import "RXInitializeSuperCustomObject.h"
@interface RXInitializeTestObject()

@property (nonatomic, strong) RXInitializeEmptyObject *rxInitializeEmptyObject;
@property (nonatomic, strong) RXInitializeCustomObject *rxInitializeCustomObject;
@property (nonatomic, strong) RXInitializeCustom2Object *rxInitializeCustom2Object;
@property (nonatomic, strong) RXInitializeSuperCustomObject *rxInitializeSuperCustomObject;
@end
@implementation RXInitializeTestObject

- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)test_doNoting {
}
- (void)test_empty {
    self.rxInitializeEmptyObject = [RXInitializeEmptyObject new];
    [self.rxInitializeEmptyObject print];
}
- (void)test_custom {
    self.rxInitializeCustomObject = [RXInitializeCustomObject new];
    [self.rxInitializeCustomObject print];
}

- (void)test_empty_custom {
    self.rxInitializeEmptyObject = [RXInitializeEmptyObject new];
    [self.rxInitializeEmptyObject print];
    
    self.rxInitializeCustomObject = [RXInitializeCustomObject new];
    [self.rxInitializeCustomObject print];
}
- (void)test_custom_empty {
    self.rxInitializeCustomObject = [RXInitializeCustomObject new];
    [self.rxInitializeCustomObject print];
    
    self.rxInitializeEmptyObject = [RXInitializeEmptyObject new];
    [self.rxInitializeEmptyObject print];
}


- (void)test_custom_custom2
{
    self.rxInitializeCustomObject = [RXInitializeCustomObject new];
    [self.rxInitializeCustomObject print];
    
    self.rxInitializeCustom2Object = [RXInitializeCustom2Object new];
    [self.rxInitializeCustom2Object print];
}

- (void)test_superCustom
{
    
    self.rxInitializeSuperCustomObject = [RXInitializeSuperCustomObject new];
    [self.rxInitializeSuperCustomObject print];
}

@end
