//
//  RXMVVMListViewModel.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/26.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMVVMListViewModel.h"

@interface RXMVVMListViewModel ()
@property (nonatomic, strong) NSArray *itemArray;
@end

@implementation RXMVVMListViewModel

- (NSInteger)count
{
    return self.itemArray.count;
}
- (RXMVVMViewModel *)viewModelAtIndex:(NSInteger)index
{
    return self.itemArray[index];
}




@end
