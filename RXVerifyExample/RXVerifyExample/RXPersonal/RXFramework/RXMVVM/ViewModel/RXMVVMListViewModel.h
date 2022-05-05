//
//  RXMVVMListViewModel.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/26.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXMVVMViewModel.h"
@interface RXMVVMListViewModel : NSObject
@property (nonatomic, readonly) NSInteger count;
- (RXMVVMViewModel *)viewModelAtIndex:(NSInteger)index;
@end
