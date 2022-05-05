//
//  RXARCAttributeNSObjectObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/29.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCAttributeNSObjectObject.h"
#import "RXMRCUtil.h"
@interface RXARCAttributeNSObjectObject()
// 需要自己的内存管理
//@property (nonatomic, assign) CFStringRef stringRef;
// COMPILE ERROR:Property with 'retain (or strong)' attribute must be of object type
//@property (nonatomic, strong) CFStringRef stringRef;
@property (nonatomic, strong) __attribute__((NSObject)) CFStringRef stringRef;
@end
@implementation RXARCAttributeNSObjectObject

- (void)test
{
    // 字符串一定要这种奇怪的"123-%d-abc",不能用简单的"123", "abc",要不然引用计数不准确
    CFStringRef stringRef = CFStringCreateWithCString(CFAllocatorGetDefault(), "123-%d-abc", kCFStringEncodingUTF8);
    NSString *string = (__bridge NSString *)stringRef;
    NSLog(@"after create and bridge cast count1:%zd", [RXMRCUtil objectRetainCount:string]);
    self.stringRef = stringRef;
    NSLog(@"after self.stringRef count2:%zd", [RXMRCUtil objectRetainCount:string]);
    self.stringRef = nil;
    NSLog(@"after self.stringRef = nil count3:%zd", [RXMRCUtil objectRetainCount:string]);
    CFRelease(stringRef);
    NSLog(@"after CFRelease count4:%zd", [RXMRCUtil objectRetainCount:string]);
}
@end
