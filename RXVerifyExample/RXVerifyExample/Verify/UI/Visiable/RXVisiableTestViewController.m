//
//  RXVisiableTestViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXVisiableTestViewController.h"

@interface RXVisiableTestViewController ()

@property (nonatomic, copy) NSString *name;

@end

@implementation RXVisiableTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 会多发~~~
    [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNotificationAction) name:@"testNotificationAction" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNotificationAction) name:@"testNotificationAction" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNotificationAction) name:@"testNotificationAction" object:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.name = @"abc123";
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"testNotificationAction" object:nil];
    });
    
}
- (void)dealloc {
    [self removeObserver:self forKeyPath:@"name"];
    [self removeObserver:self forKeyPath:@"name"];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"keyPath:%@ object:%@ change:%@", keyPath, object, change);
}

- (void)testNotificationAction {
    NSLog(@"testNotificationAction");
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
