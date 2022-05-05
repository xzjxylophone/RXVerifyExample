//
//  RXCharacterSetTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/30.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXCharacterSetTestObject.h"
#import "RXRuntimeUtil.h"
@implementation RXCharacterSetTestObject
- (void)test
{
    // https://www.jianshu.com/p/f6baf8b55557
    // https://www.jianshu.com/p/5fb58dc73e7b
    NSCharacterSet *characterSet = [NSCharacterSet whitespaceCharacterSet];
    NSLog(@"%@", characterSet);
    
//    NSArray *ary;
    
    [RXRuntimeUtil printIvarList:characterSet];
    
    [RXRuntimeUtil printMethodList:characterSet];
    
    [RXRuntimeUtil printPropertyList:characterSet];
}
@end
