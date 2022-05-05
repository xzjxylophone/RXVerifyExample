//
//  RXTestMulThreadMutableDataManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2020/2/21.
//  Copyright © 2020 Rush.D.Xzj. All rights reserved.
//

#import "RXTestMulThreadMutableDataManager.h"

static NSInteger a = 0;

@interface RXTestMulThreadMutableDataManager()

@property (nonatomic, strong) dispatch_queue_t concurrentQueue;

@property (nonatomic, strong) NSMutableData *mutableData;


@property (nonatomic, copy) NSMutableArray *array;

@end

@implementation RXTestMulThreadMutableDataManager

- (void)test {
    
//    self.array = [NSMutableArray new];
//    [self.array addObject:@"abc"];
//    [self.array addObject:@"abc"];
//    
//    NSLog(@"self.array:%@", self.array);
    
    self.mutableData = [NSMutableData new];
    static NSInteger a = 100;
    a++;
    NSLog(@"a:%zd", a);
    NSData *dd = [self randomData];
    for (NSInteger i = 0; i < 70; i++) {
        dispatch_async(self.concurrentQueue, ^{
            NSLog(@"mdd-:%zd", i);
//            if (i == 15) {
//                self.mutableData = nil;
//            } else {
            
            const char *str1 = "abcde";
            const char *str2 = "hijkl";
            const char *str3 = "opqrs";
            const char *str4 = "uvwxy";
            const char *str5 = "12345";
            NSInteger index = i % 5;
            const char *input = NULL;
            if (index == 0) {
                input = str1;
            } else if (index == 1) {
                input = str2;
            } else if (index == 2) {
                input = str3;
            } else if (index == 3) {
                input = str4;
            } else if (index == 4) {
                input = str5;
            }
            NSData *data = [NSData dataWithBytes:input length:5];
                [self.mutableData appendData:data];
//            }
        });
    }
    
}
- (NSData *)randomData {
    a++;
    const char *str1 = "abcde";
    const char *str2 = "hijkl";
    const char *str3 = "opqrs";
    const char *str4 = "uvwxy";
    const char *str5 = "12345";
    NSInteger random = arc4random() % 5;
    const char *input = NULL;
    if (random == 0) {
        input = str1;
    } else if (random == 1) {
        input = str2;
    } else if (random == 2) {
        input = str3;
    } else if (random == 3) {
        input = str4;
    } else if (random == 4) {
        input = str5;
    }
    NSData *data = [NSData dataWithBytes:input length:5];
    return data;
}



#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
        self.concurrentQueue = dispatch_queue_create("aaa", DISPATCH_QUEUE_CONCURRENT);
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
