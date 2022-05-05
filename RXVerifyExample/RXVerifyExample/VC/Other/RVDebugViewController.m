//
//  RVDebugViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/5/3.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVDebugViewController.h"

@interface RVDebugViewController ()

@end

@implementation RVDebugViewController

#pragma mark - Test
- (void)testCondition
{
    NSInteger i = arc4random() % 4;
    
    NSLog(@"%zd", i);
}

- (void)testCondition2
{
    
    NSArray *array = @[@"我们", @"一起", @"来", @"玩", @"abc123"];
    NSInteger i = arc4random() % array.count;
    NSString *str = array[i];
    NSLog(@"%zd, %@", i, str);
    NSLog(@"%zd, %@", i, str);
}


- (void)testWatchPoint
{
    
    
//    id objects[] = {@"1", @"2", @"3"};
//    NSArray *array = [[NSArray alloc] initWithObjects:objects count:3];
    
    NSInteger max = 0;
    NSInteger i = 0;
    for (i = 0; i < 5; i++) {
        NSLog(@"123max:%zd", max);
        max += i;
    }
    NSLog(@"max:%zd", max);
}

#pragma mark - Action
- (IBAction)conditionButtonTouchUpInside:(id)sender
{
    [self testWatchPoint];
}

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
