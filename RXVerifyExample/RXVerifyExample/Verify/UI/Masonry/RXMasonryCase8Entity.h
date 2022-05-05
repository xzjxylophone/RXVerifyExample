//
//  RXMasonryCase8Entity.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXMasonryCase8Entity : NSObject

@property (copy, nonatomic) NSString *content;
@property (assign, nonatomic) BOOL expanded; // 是否已经展开
// Cache
@property (assign, nonatomic) CGFloat cellHeight;
@end

NS_ASSUME_NONNULL_END
