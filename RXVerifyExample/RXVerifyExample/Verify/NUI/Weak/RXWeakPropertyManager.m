//
//  RXWeakPropertyManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2020/7/26.
//  Copyright © 2020 Rush.D.Xzj. All rights reserved.
//

#import "RXWeakPropertyManager.h"

@interface RXWeak1Object : NSObject
//UIDevice
@property (nonatomic, unsafe_unretained) NSObject *weakObject;

@end
@implementation RXWeak1Object


@end

@interface RXWeakPropertyManager()

@property (nonatomic, strong) RXWeak1Object *weak1Object;
//@property (nonatomic, strong) NSObject *tmpObject;

@end

@implementation RXWeakPropertyManager
- (void)test1:(NSObject *)obj {
    NSLog(@"obj:%@", obj);
    
//    UIPasteboard *pb;
}

- (void)testWeakObject {
    self.weak1Object = [RXWeak1Object new];
//    self.tmpObject = [NSObject new];
//    self.weak1Object.weakObject = [NSObject new];
    
    
//    dispatch_async(dispatch_get_main_queue(), ^{
////        NSObject *tmpWeakObject = self.weak1Object.weakObject;
////        [self test1:tmpWeakObject];
//        NSMutableDictionary *dict  = [NSMutableDictionary new];
//        [dict setObject:nil forKey:@"abc"];
//    });
////    self.tmpObject = nil;
//    [self test1:tmpWeakObject];
}


- (void)test {
    [self testWeakObject];
    
    
}

#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
//        self.concurrentQueue = dispatch_queue_create("aaa", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}
+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end
