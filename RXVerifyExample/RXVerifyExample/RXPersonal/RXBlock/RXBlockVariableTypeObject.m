//
//  RXBlockVariableTypeObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockVariableTypeObject.h"
extern NSInteger CounterGlobal;
static NSInteger CounterStatic = 0;

@implementation RXBlockVariableTypeObject
- (void)test
{
    NSInteger localCounter = 42;
    __block char localCharacter = 'l';
    
    void (^aBlock)(void) = ^(void) {
        NSLog(@"before block: CounterGlobal:%zd, CounterStatic:%zd, localCounter:%zd, localCharacter:%c", CounterGlobal, CounterStatic, localCounter, localCharacter);
        ++CounterGlobal;
        ++CounterStatic;
        CounterGlobal = localCounter; // localCounter fixed at block creation
        localCharacter = 'a'; // sets localCharacter in enclosing scope
        NSLog(@"after block: CounterGlobal:%zd, CounterStatic:%zd, localCounter:%zd, localCharacter:%c", CounterGlobal, CounterStatic, localCounter, localCharacter);
    };
    
    NSLog(@"before outside block: CounterGlobal:%zd, CounterStatic:%zd, localCounter:%zd, localCharacter:%c", CounterGlobal, CounterStatic, localCounter, localCharacter);
    ++localCounter; // unseen by the block
    localCharacter = 'b';
    NSLog(@"after outside block: CounterGlobal:%zd, CounterStatic:%zd, localCounter:%zd, localCharacter:%c", CounterGlobal, CounterStatic, localCounter, localCharacter);
    
    aBlock(); // execute the block
}
@end
