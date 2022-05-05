//
//  RXParentLockObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/9.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXParentLockObject : NSObject

@property (nonatomic, strong) NSMutableArray *elementArray;

- (void)push:(id)element;

@end
