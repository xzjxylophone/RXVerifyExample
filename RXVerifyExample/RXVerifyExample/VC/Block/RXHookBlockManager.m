//
//  RXHookBlockManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/7/6.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXHookBlockManager.h"



@implementation RXHookBlockItem

- (id)initWithRX_block_impl:(RX_block_impl *)impl
{
    if (self = [super init]) {
        self.block_impl_address = impl;
        self.originFuncPtr = impl->FuncPtr;
        self.signature = [NSString stringWithUTF8String:impl->block_descriptor->signature];
        self.objCTypes = [NSString stringWithUTF8String:(char *)impl->block_descriptor->copy_helper];
    }
    return self;
}



@end

@interface RXHookBlockManager()
@property (nonatomic, strong) NSMutableDictionary *hookBlockDic;
@end

@implementation RXHookBlockManager


+ (void)addBlockImpl:(RX_block_impl *)impl
{
    RXHookBlockItem *item = [[RXHookBlockItem alloc] initWithRX_block_impl:impl];
    [self addHookBlockItem:item];
}

+ (void)addHookBlockItem:(RXHookBlockItem *)item
{
    NSString *key = [self keyFromAddress:item.block_impl_address];
    [RXHookBlockManager sharedInstance].hookBlockDic[key] = item;
}

+ (RXHookBlockItem *)hookBlockItemFromBlockImpl:(RX_block_impl *)impl
{
    NSString *key = [self keyFromAddress:impl];
    return [RXHookBlockManager sharedInstance].hookBlockDic[key];
}


+ (NSString *)keyFromAddress:(void *)address
{
    return [NSString stringWithFormat:@"%p", address];
}
- (id)init
{
    if (self = [super init]) {
        self.hookBlockDic = [NSMutableDictionary dictionary];
    }
    return self;
}

+ (RXHookBlockManager *)sharedInstance {
    static RXHookBlockManager *instance;
    if (instance == NULL) {
        static dispatch_once_t predicate;
        dispatch_once(&predicate, ^{
            instance = [[RXHookBlockManager alloc] init];
        });
    }
    return instance;
}

@end
