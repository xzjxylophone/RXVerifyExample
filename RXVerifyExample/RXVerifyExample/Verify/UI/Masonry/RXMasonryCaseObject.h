//
//  RXMasonryCaseObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/24.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXMasonryCaseObject : NSObject

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, copy) NSString *subTitle;

@property (nonatomic, readonly) NSString *caseViewControllerClassString;

@end

NS_ASSUME_NONNULL_END
