//
//  RVAutoReleaseViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/8.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RVAutoReleaseViewController.h"

@interface RVAutoReleaseViewController ()

@property (nonatomic, strong) NSObject *strongObject;
@property (nonatomic, weak) NSObject *weakObject;

@end

@implementation RVAutoReleaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test1];
    [self test2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test1 {
    NSObject *obj1 = [NSObject new];
    self.strongObject = obj1;
    NSObject *obj2 = [NSObject new];
    self.weakObject = obj2;
}
- (void)test2 {
    NSLog(@"strong: %@", self.strongObject);
    NSLog(@"weak %@", self.weakObject);
    @autoreleasepool {
        for (int i = 0; i < 50000; i++) {
            NSObject *obj3 = [NSObject new];
            if (i == 10000) {
                NSLog(@"obj3: %@", obj3);
            }
        }
    }
    NSLog(@"strong: %@", self.strongObject);
    NSLog(@"weak %@", self.weakObject);
}

- (void)test3 {
    NSObject *obj1 = [NSObject new];
    self.strongObject = obj1;
    NSObject *obj2 = [NSObject new];
    self.weakObject = obj2;
    
    NSLog(@"strong: %@", self.strongObject);
    NSLog(@"weak %@", self.weakObject);

    @autoreleasepool {
        for (int i = 0; i < 50000; i++) {
            NSObject *obj3 = [NSObject new];
            if (i == 10000) {
                NSLog(@"obj3: %@", obj3);
            }
        }
    }

    NSLog(@"strong: %@", self.strongObject);
    NSLog(@"weak %@", self.weakObject);
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
