//
//  RXMasonryObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/10.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryObject.h"
#import <Masonry/Masonry.h>
@implementation RXMasonryObject
- (void)kk
{
    UIView *view1 = [UIView new];
    UIView *view2 = [UIView new];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *maker) {
        maker.left.equalTo(view2).with.offset(10);
    }];
    
}

- (int)b
{
    return 5;
}
- (void)setB
{
    // Do Nothing
}
@end
