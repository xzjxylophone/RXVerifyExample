//
//  RXExternUtil.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/13.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
extern uintptr_t _objc_rootRetainCount(id obj); // 获取对象的引用计数
extern void _objc_autoreleasePoolPrint(void); //打印注册到自动释放池中的对象


