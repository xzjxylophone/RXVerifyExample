//
//  RXMasonryCaseObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/24.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCaseObject.h"

@implementation RXMasonryCaseObject
- (NSString *)title {
    return [NSString stringWithFormat:@"Case %zd", (long)(self.index + 1)];
}
- (NSString *)caseViewControllerClassString {
    return [NSString stringWithFormat:@"RXMasonryCase%zdViewController", (long)(self.index + 1)];
}
@end
