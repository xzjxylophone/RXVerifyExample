//
//  RVRunTimeViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/5/25.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVRunTimeViewController.h"
#import "RXRunTimeDemoObject.h"
#import <objc/runtime.h>

@interface RVRunTimeViewController ()
@property (nonatomic, strong) RXRunTimeDemoObject *rxRunTimeDemoObject;
@end

@implementation RVRunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.rxRunTimeDemoObject = [[RXRunTimeDemoObject alloc] init];
    
//    [self.rxRunTimeDemoObject testPrint];
    [self.rxRunTimeDemoObject testPrint2];
    
//    Class cls;
    
//    SEL sel = NSSelectorFromString(@"testNoMethod");
//    [self.rxRunTimeDemoObject performSelector:sel withObject:nil afterDelay:0];
//    
//    SEL sel2 = NSSelectorFromString(@"tttt");
//    [self.rxRunTimeDemoObject performSelector:sel2 withObject:nil afterDelay:1];
    
    
    
//    [self.rxRunTimeDemoObject printBaseAction];
    
    
//    NSString *str1 = @"abc123";
//    NSError *error = nil;
//    
//    [NSString aspect_hookSelector:@selector(stringWithUTF8String:) withOptions:AspectPositionBefore usingBlock:^(void){
//        NSLog(@"2222222");
//    } error:&error];
//    
//    NSString *str2 = [NSString stringWithUTF8String:"aaaaaaaaaa"];
//    
//    NSLog(@"str1:%@ str2:%@ error:%@", str1, str2, error);
    
    
}




- (void)didReceiveMemoryWarning {
    
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//load方法会在类第一次加载的时候被调用
//调用的时间比较靠前，适合在这个方法里做方法交换
+ (void)load
{
    
//    [RVRunTimeViewController aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info, BOOL animation) {
//        NSLog(@"viewDidAppear before:%@", info.instance);
//    } error:NULL];
//
//    [RVRunTimeViewController aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, BOOL animation) {
//        NSLog(@"viewDidAppear after:%@", info.instance);
//    } error:NULL];
    
    

    
    // 输出的结果顺序是:
    // swizzle begin
    // viewWillAppear
    // swizzle end
    
    //方法交换应该被保证，在程序中只会执行一次
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//        //获得viewController的生命周期方法的selector
//        SEL systemSel = @selector(viewWillAppear:);
//        //自己实现的将要被交换的方法的selector
//        SEL swizzSel = @selector(swiz_viewWillAppear:);
//        //两个方法的Method
//        Method systemMethod = class_getInstanceMethod([self class], systemSel);
//        Method swizzMethod = class_getInstanceMethod([self class], swizzSel);
//        
//        //首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
//        BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
//        if (isAdd) {
//            //如果成功，说明类中不存在这个方法的实现
//            //将被交换方法的实现替换到这个并不存在的实现
//            class_replaceMethod(self, swizzSel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
//        }else{
//            //否则，交换两个方法的实现
//            method_exchangeImplementations(systemMethod, swizzMethod);
//        }
//        
//    });
}


- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
}

- (void)swiz_viewWillAppear:(BOOL)animated
{
    //这时候调用自己，看起来像是死循环
    //但是其实自己的实现已经被替换了
    NSLog(@"swizzle begin");
    [self swiz_viewWillAppear:animated];
    NSLog(@"swizzle end");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
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
