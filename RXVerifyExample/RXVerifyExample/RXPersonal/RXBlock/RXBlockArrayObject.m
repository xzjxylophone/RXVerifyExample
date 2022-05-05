//
//  RXBlockArrayObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/11.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockArrayObject.h"

@implementation RXBlockArrayObject
- (void)test
{
    NSArray *stringsArray = @[ @"string 1",
                               @"String 21",
                               @"string 12",
                               @"String 11",
                               @"String 02" ];
    
    static NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch | NSNumericSearch |
    NSWidthInsensitiveSearch | NSForcedOrderingSearch;
    NSLocale *currentLocale = [NSLocale currentLocale];
    
    NSComparator finderSortBlock = ^(id string1, id string2) {
        
        NSRange string1Range = NSMakeRange(0, [string1 length]);
        return [string1 compare:string2 options:comparisonOptions range:string1Range locale:currentLocale];
    };
    
    NSArray *finderSortArray = [stringsArray sortedArrayUsingComparator:finderSortBlock];
    NSLog(@"finderSortArray: %@", finderSortArray);
    

}
@end
