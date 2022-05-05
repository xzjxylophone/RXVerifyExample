//
//  RXBlockTmpObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXBlockTmpObject : NSObject
@property (nonatomic, copy) NSString *name;
+ (id)tmpObjectWithName:(NSString *)name;
@end
