//
//  RXARCAutoreleasingObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/13.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCAutoreleasingObject.h"
#import "RXExternUtil.h"
#import "RXMRCUtil.h"
@implementation RXARCAutoreleasingObject
- (void)test
{
//    [self _test___strong];
    
//    [self _test_return_value];
    
    [self _test_return_value2];
}
- (void)_test___strong
{
    @autoreleasepool {
        id __autoreleasing obj = [NSMutableArray array];
        NSLog(@"obj: %p", obj);
        _objc_autoreleasePoolPrint();
    }
    NSLog(@"after");
    _objc_autoreleasePoolPrint();
}


- (id)_tmp_return_value
{
    id obj = [[NSObject alloc] init];
    NSLog(@"obj1: %p, retain count:%zd", obj, _objc_rootRetainCount(obj));
    NSLog(@"obj1: %p, retain count:%zd", obj, [RXMRCUtil objectRetainCount:obj]);
    return obj;
}

- (void)_test_return_value
{
    id obj = [self _tmp_return_value];
    _objc_autoreleasePoolPrint();
    NSLog(@"obj2: %p, retain count:%zd", obj, _objc_rootRetainCount(obj));
    NSLog(@"obj2: %p, retain count:%zd", obj, [RXMRCUtil objectRetainCount:obj]);
    _objc_autoreleasePoolPrint();
    
    [RXMRCUtil objectRelease:obj];
//    [RXMRCUtil objectRelease:obj];
}

- (id)_tmp_return_value2
{
    id obj = [NSMutableArray array];
    [obj addObject:@"111222"];
    NSLog(@"obj1: %p, retain count:%zd %@", obj, _objc_rootRetainCount(obj), obj);
    NSLog(@"obj1: %p, retain count:%zd", obj, [RXMRCUtil objectRetainCount:obj]);
    id obj2 = [NSArray array];
    id obj3 = [NSArray arrayWithObjects:@"111", nil];
//
    _objc_autoreleasePoolPrint();
    
    return obj;
}

- (void)_test_return_value2
{
    id obj = [self _tmp_return_value2];
    _objc_autoreleasePoolPrint();
    NSLog(@"obj1: %p, retain count:%zd", obj, _objc_rootRetainCount(obj));
    NSLog(@"obj1: %p, retain count:%zd", obj, [RXMRCUtil objectRetainCount:obj]);
    _objc_autoreleasePoolPrint();
    
    
//    [RXMRCUtil objectRelease:obj];
//    [RXMRCUtil objectRelease:obj];
}
@end
