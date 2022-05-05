//
//  RXOCKeywordMethodNameViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/7/17.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXOCKeywordMethodNameViewController.h"


@interface RXOCKeywordMethodNameObject : NSObject

@end

@implementation RXOCKeywordMethodNameObject

+ (id)return
{
    return [NSString stringWithFormat:@"class method name: %@", NSStringFromSelector(_cmd)];
}
- (id)return
{
    return [NSString stringWithFormat:@"instance method name: %@", NSStringFromSelector(_cmd)];
}

+ (id)void
{
    return [NSString stringWithFormat:@"class method name: %@", NSStringFromSelector(_cmd)];
}
- (id)void
{
    return [NSString stringWithFormat:@"instance method name: %@", NSStringFromSelector(_cmd)];
}
+ (id)id
{
    return [NSString stringWithFormat:@"class method name: %@", NSStringFromSelector(_cmd)];
}
- (id)id
{
    return [NSString stringWithFormat:@"instance method name: %@", NSStringFromSelector(_cmd)];
}

+ (id)weak
{
    return [NSString stringWithFormat:@"class method name: %@", NSStringFromSelector(_cmd)];
}
- (id)weak
{
    return [NSString stringWithFormat:@"instance method name: %@", NSStringFromSelector(_cmd)];
}

+ (id)strong
{
    return [NSString stringWithFormat:@"class method name: %@", NSStringFromSelector(_cmd)];
}
- (id)strong
{
    return [NSString stringWithFormat:@"instance method name: %@", NSStringFromSelector(_cmd)];
}


+ (id)readonly
{
    return [NSString stringWithFormat:@"class method name: %@", NSStringFromSelector(_cmd)];
}
- (id)readonly
{
    return [NSString stringWithFormat:@"instance method name: %@", NSStringFromSelector(_cmd)];
}

+ (id)self
{
    return [NSString stringWithFormat:@"class method name: %@", NSStringFromSelector(_cmd)];
}
- (id)self
{
    // 有一个warning, 目前还不知道怎么解决
    return [NSString stringWithFormat:@"instance method name: %@", NSStringFromSelector(_cmd)];
}

+ (id)super
{
    return [NSString stringWithFormat:@"class method name: %@", NSStringFromSelector(_cmd)];
}
- (id)super
{
    return [NSString stringWithFormat:@"instance method name: %@", NSStringFromSelector(_cmd)];
}
@end



@interface RXOCKeywordMethodNameViewController ()

@end

@implementation RXOCKeywordMethodNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    RXOCKeywordMethodNameObject *object = [RXOCKeywordMethodNameObject new];
    
    NSLog(@"%@", [object return]);
    NSLog(@"%@", [object void]);
    NSLog(@"%@", [object id]);
    NSLog(@"%@", [object weak]);
    NSLog(@"%@", [object strong]);
    NSLog(@"%@", [object self]);
    NSLog(@"%@", [object super]);
    
    
    NSLog(@"%@", [RXOCKeywordMethodNameObject return]);
    NSLog(@"%@", [RXOCKeywordMethodNameObject void]);
    NSLog(@"%@", [RXOCKeywordMethodNameObject id]);
    NSLog(@"%@", [RXOCKeywordMethodNameObject weak]);
    NSLog(@"%@", [RXOCKeywordMethodNameObject strong]);
    NSLog(@"%@", [RXOCKeywordMethodNameObject self]);
    NSLog(@"%@", [RXOCKeywordMethodNameObject super]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
