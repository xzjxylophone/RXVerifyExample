//
//  RXJSONViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2023/12/21.
//  Copyright © 2023 Rush.D.Xzj. All rights reserved.
//

#import "RXJSONViewController.h"

@interface RXJSONViewController ()

@end

@implementation RXJSONViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self test_json];
}



- (void)test_json {
    id v2Value = [@"v2" dataUsingEncoding:NSUTF8StringEncoding];
    
    
    NSArray *checkClassArray = @[
        [NSData class], [NSURL class],
        [NSSet class], [NSMutableDictionary class]];
    
    v2Value = [NSURL URLWithString:@"http://www.baidu.com"];
    v2Value = [NSSet setWithArray:@[@(1)]];
    v2Value = [NSMutableDictionary dictionaryWithDictionary:@{
        @"kkkkk": @"kkk11",
        @"kkkkk2": @"kkk22"
    }];
    NSError *error;
    id object = @{
        @"k1": @"v1",
        @"k2": v2Value
    };
    
    BOOL isValidJSONObject = [NSJSONSerialization isValidJSONObject:object];
    
    if (!isValidJSONObject) {
        error = [NSError errorWithDomain:NSCocoaErrorDomain code:-100 userInfo:@{@"msg" : @"input object is null or can not trans to JSON"}];
    }
    
    NSData *data = nil;
    @try {
        data = [NSJSONSerialization dataWithJSONObject:object options:0 error:&error];
    } @catch (NSException *exception) {
        NSLog(@"111");
        // NSException Invalid type in JSON write (NSURL)
        // NSException Invalid type in JSON write (__NSCFSet)
        // NSException Invalid type in JSON write (__NSDictionaryM)
    } @finally {
        
    }
}





































@end
