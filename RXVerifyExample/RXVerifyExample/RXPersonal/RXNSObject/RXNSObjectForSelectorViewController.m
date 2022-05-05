//
//  RXNSObjectForSelectorViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/24.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXNSObjectForSelectorViewController.h"
#import "RXNSObjectForSelectorAObject.h"
#import <objc/objc.h>
@interface RXNSObjectForSelectorViewController ()

@end

@implementation RXNSObjectForSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    SEL sel1 = NSSelectorFromString(@"abc");
//    SEL sel2 = NSSelectorFromString(@"testInstanceMethod");
//    SEL sel3 = NSSelectorFromString(@"testClassMethod");
//    
//    RXNSObjectForSelectorAObject *object = [RXNSObjectForSelectorAObject new];
    
//    IMP k1 = [object methodForSelector:sel1];
//    IMP k2 = [object methodForSelector:sel2];
//    IMP k3 = [object methodForSelector:sel3];
    
    

    
//    Class c1 = [object class];
//    Class c2 = [RXNSObjectForSelectorAObject class];
    // 编译报错
    //    Class c3 = RXNSObjectForSelectorAObject;
    
//    IMP k14 = [c1 methodForSelector:sel1];
//    IMP k15 = [c1 methodForSelector:sel2];
//    IMP k16 = [c1 methodForSelector:sel3];
//    
//    IMP k4 = [c2 methodForSelector:sel1];
//    IMP k5 = [c2 methodForSelector:sel2];
//    IMP k6 = [c2 methodForSelector:sel3];
//    
//    IMP k7 = [RXNSObjectForSelectorAObject methodForSelector:sel1];
//    IMP k8 = [RXNSObjectForSelectorAObject methodForSelector:sel2];
//    IMP k9 = [RXNSObjectForSelectorAObject methodForSelector:sel3];
    
    // 报错
//    IMP k11 = [object instanceMethodForSelector:NSSelectorFromString(@"abc")];
//    IMP k12 = [object instanceMethodForSelector:sel2];
//    IMP k13 = [object instanceMethodForSelector:sel3];
    
//    IMP k11 = [RXNSObjectForSelectorAObject instanceMethodForSelector:sel1];
//    IMP k12 = [RXNSObjectForSelectorAObject instanceMethodForSelector:sel2];
//    IMP k13 = [RXNSObjectForSelectorAObject instanceMethodForSelector:sel3];
    
    
    
    NSLog(@"k1");
    
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
