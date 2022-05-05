//
//  RXRunLoopExeObject.h
//  RXVerifyExample
//
//  Created by ceshi on 16/5/25.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface RXRunLoopExeObject : NSObject



@property (nonatomic, weak) id target;
@property (nonatomic, weak) id object;
@property (nonatomic, assign) SEL action;
@property (nonatomic, copy) NSString *mode;






@end
