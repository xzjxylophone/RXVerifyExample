//
//  RXMethodListDemoViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/10/30.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMethodListDemoViewController.h"
#import <objc/runtime.h>
#import "RXMethodListDemoObject.h"

@interface RXMethodListDemoViewController ()

@end

@implementation RXMethodListDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test {
    RXMethodListDemoObject *object = [RXMethodListDemoObject new];
    unsigned int methodCount = 0;
    
    Method *methodList = class_copyMethodList([object class], &methodCount);
    NSMutableArray *mutArray = [NSMutableArray new];
    for (int i = 0; i < methodCount; i++) {
        Method tmp = methodList[i];
        SEL sel = method_getName(tmp);
        const char *name = sel_getName(sel);
//        int argumentNumber = method_getNumberOfArguments(tmp);
//        const char *encoding = method_getTypeEncoding(tmp);
        [mutArray addObject:[NSString stringWithUTF8String:name]];
    }
    free(methodList);
    
    NSLog(@"%@", mutArray);
    
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
