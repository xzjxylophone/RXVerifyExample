//
//  RXSortManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/8/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXSortManager.h"
@interface RXSortObject : NSObject
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, assign) NSInteger index;
@end

@implementation RXSortObject

- (id)initWithTimeInterval:(NSInteger)timeInterval index:(NSInteger)index {
    if (self = [self init]) {
        static NSDate *now = nil;
        if (now == nil) {
            now = [NSDate new];
        }
        self.createDate = [NSDate dateWithTimeInterval:timeInterval sinceDate:now];
        self.index = index;
    }
    return self;
}
- (NSString *)description {
    return [NSString stringWithFormat:@"%zd %@", self.index, self.createDate];
}

@end



@interface RXSortManager()

@end

@implementation RXSortManager

- (void)test {
    NSMutableArray *ary = [NSMutableArray new];
    
    RXSortObject *sort1 = [[RXSortObject alloc] initWithTimeInterval:100 index:1];
    RXSortObject *sort2 = [[RXSortObject alloc] initWithTimeInterval:90 index:2];
    RXSortObject *sort3 = [[RXSortObject alloc] initWithTimeInterval:110 index:3];
    
    [ary addObject:sort1];
    [ary addObject:sort2];
    [ary addObject:sort3];
    
    NSLog(@"ary:%@", ary);
    
    NSArray *sortAry = [ary sortedArrayUsingComparator:^NSComparisonResult(RXSortObject *obj1, RXSortObject *obj2) {
        return [obj1.createDate compare:obj2.createDate];
    }];
    NSLog(@"sortAry:%@", sortAry);
    
    
}

#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}
+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end
