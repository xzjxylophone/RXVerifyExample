//
//  RXARCBridgeCastObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/21.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCBridgeCastObject.h"
#import "RXMRCUtil.h"
@implementation RXARCBridgeCastObject
- (void)test
{
//    [self _test_over_release];
    
//    [self _test_bridge_T_from_NonRetainablePointerType_to_RetainablePointerType];
    
//    [self _test_bridge_T_from_RetainablePointerType_to_NonRetainablePointerType];
    
//    [self _test_bridge_retained_from_RetainablePointerType_to_NonRetainablePointerType];
    
//    [self _test_bridge_transfer_from_NonRetainablePointerType_to_RetainablePointerType];
}


- (void)_test_over_release
{
    
    CFStringRef stringRef2 = CFStringCreateWithCString(CFAllocatorGetDefault(), "123", kCFStringEncodingUTF8);
    CFRelease(stringRef2);
    // 这种字符串可以过度释放,不会崩溃
    CFRelease(stringRef2);
    
    
    CFStringRef stringRef = CFStringCreateWithCString(CFAllocatorGetDefault(), "123-%d-abc", kCFStringEncodingUTF8);
    CFRelease(stringRef);
    // 这种字符串不可以过度释放,否则会崩溃
    CFRelease(stringRef);
}

- (void)_test_bridge_T_from_NonRetainablePointerType_to_RetainablePointerType
{
    CFStringRef stringRef = CFStringCreateWithCString(CFAllocatorGetDefault(), "123-%d-abc", kCFStringEncodingUTF8);
    NSString *string = (__bridge NSString *)stringRef;
    NSLog(@"before string release:%@, count1:%zd", string, [RXMRCUtil objectRetainCount:string]);
    CFRelease(stringRef); // 第一个CFRelease
    NSLog(@"after string release:%@, count2:%zd", string, [RXMRCUtil objectRetainCount:string]);
    
    // 在这里不会崩溃,相当于过渡释放了
    CFRelease(stringRef); // 第二个CFRelease
    // 这里([RXMRCUtil objectRetainCount:string])会崩溃,此时string是野指针了
    NSLog(@"after string release twice:%@, count3:%zd", string, [RXMRCUtil objectRetainCount:string]);
} // 如果注释count3,在这里会崩溃, 在这种转换下因为ARC最后会添加  [string release]

- (void)_test_bridge_T_from_RetainablePointerType_to_NonRetainablePointerType
{
    NSString *string = [[NSString alloc] initWithFormat:@"123-%zd-abc", 456];
    NSLog(@"after string init:%@, count1:%zd", string, [RXMRCUtil objectRetainCount:string]);
    CFStringRef stringRef = (__bridge CFStringRef)string;
    NSLog(@"before string release:%@, count2:%zd", string, [RXMRCUtil objectRetainCount:string]);
    // 这里不会崩溃
    CFRelease(stringRef);
    // 这里([RXMRCUtil objectRetainCount:string])会崩溃,此时string是野指针了
//    NSLog(@"after string release:%@, count3:%zd", string, [RXMRCUtil objectRetainCount:string]);
} // 这里会崩溃, arc 加了 [string release],因为这个string是alloc init的

// __bridge_retained YYLabel的子线程释放对象
- (void)_test_bridge_retained_from_RetainablePointerType_to_NonRetainablePointerType
{
    NSString *string = [[NSString alloc] initWithFormat:@"123-%zd-abc", 456];
    NSLog(@"before string release:%@, count1:%zd", string, [RXMRCUtil objectRetainCount:string]);
    // 这一行是不是让string脱离ARC的控制,是让stringRef强引用!
    CFStringRef stringRef = (__bridge_retained CFStringRef)string;
    NSLog(@"before string release:%@, count2:%zd", string, [RXMRCUtil objectRetainCount:string]);
    // 这里不会崩溃
    CFRelease(stringRef);
    NSLog(@"after string release:%@, count3:%zd", string, [RXMRCUtil objectRetainCount:string]);
} // 这里也不会崩溃

- (void)_test_bridge_transfer_from_NonRetainablePointerType_to_RetainablePointerType
{
    CFStringRef stringRef = CFStringCreateWithCString(CFAllocatorGetDefault(), "123-%d-abc", kCFStringEncodingUTF8);
    // 把stringRef加入到ARC的控制中
    NSString *string = (__bridge_transfer NSString *)stringRef;
    NSLog(@"before string release:%@, count1:%zd", string, [RXMRCUtil objectRetainCount:string]);
    CFRelease(stringRef);
    // 这里崩溃了([RXMRCUtil objectRetainCount:string]),string已经被提前释放了
    NSLog(@"after string release:%@, count2:%zd", string, [RXMRCUtil objectRetainCount:string]);
} // 如果count3被注释,这里崩溃了,因为加了[string release],因为__bridge_transfer缘故

@end
