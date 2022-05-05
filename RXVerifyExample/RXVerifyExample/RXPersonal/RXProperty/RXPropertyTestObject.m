//
//  RXPropertyTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXPropertyTestObject.h"
#import "RXPropertyKeywordObject.h"
#import "RXPropertyKeywordObject+AssociatedObject.h"

@interface RXPropertyTestObject()

@property (nonatomic, strong) RXPropertyKeywordObject *propertyKeywordObject;

@end

@implementation RXPropertyTestObject

- (void)test {
    self.propertyKeywordObject = [RXPropertyKeywordObject new];
    self.propertyKeywordObject.doubleValue = 13.5555;
    self.propertyKeywordObject.intValue = 5555555;
    
    NSLog(@"%d", self.propertyKeywordObject.intValue);
    NSLog(@"%.10f", self.propertyKeywordObject.doubleValue);
}
@end
