//
//  RXPropertyKeywordObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXPropertyKeywordObject.h"
#import "RXMRCUtil.h"
@interface RXPropertyKeywordObject()
@property (nonatomic) dispatch_queue_t queue;
@property (nonatomic, strong) dispatch_queue_t queue2;
@property (nonatomic, assign) dispatch_queue_t queue3;
@end
@implementation RXPropertyKeywordObject
- (void)test {
    dispatch_queue_t queue = dispatch_queue_create("aaaa", DISPATCH_QUEUE_SERIAL);
    NSLog(@"queue count:%zd", [RXMRCUtil objectRetainCount:queue]);
    
    self.queue = queue;
    NSLog(@"queue count1:%zd", [RXMRCUtil objectRetainCount:self.queue]);
    
//    dispatch_queue_t queue2 = dispatch_queue_create("aaaa2", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"queue count:%zd", [RXMRCUtil objectRetainCount:queue2]);
//    self.queue2 = queue2;
//    NSLog(@"queue count2:%zd", [RXMRCUtil objectRetainCount:self.queue2]);
//
//
//    dispatch_queue_t queue3 = dispatch_queue_create("aaaa3", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"queue count:%zd", [RXMRCUtil objectRetainCount:queue3]);
//    self.queue3 = queue3;
//    NSLog(@"queue count3:%zd", [RXMRCUtil objectRetainCount:self.queue3]);

}
@end
