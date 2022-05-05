//
//  RXClassMetaClassObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/7.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXClassMetaClassObject : NSObject

// 如果这两个不实现,将不会出现在method list中
+ (void)print_is_a_class_method;
- (void)print_is_a_instance_method;



+ (void)print_same_name;
- (void)print_same_name;


@end
