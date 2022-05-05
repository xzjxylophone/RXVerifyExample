//
//  RXChild4ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/8/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXChild4ViewController.h"
#import "RXRuntimeUtil.h"
@interface RXChild4View : UIView

@end
@implementation RXChild4View

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(150, 150, 40, 40);
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

@end


@interface RXChild4ViewController ()

@end

@implementation RXChild4ViewController
+ (void)load {
    [RXRuntimeUtil exchangeMethodSafely:[RXChild4ViewController class] originSel:@selector(view) newSel:@selector(swizzle_view)];
}
- (UIView *)swizzle_view {
    NSLog(@"swizzle_view 4");
    UIView *tmp = [self swizzle_view];
    return tmp;
}
- (void)loadView {
    self.view = [RXChild4View new];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view rx_addGestureRecognizerWithTarget:self action:@selector(viewAction)];
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"child4 willAppear superview:%@", self.view.superview);
    [super viewWillAppear:animated];
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"child4 didAppear superview:%@", self.view.superview);
    [super viewDidAppear:animated];
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"child4 willDisappear superview:%@", self.view.superview);
    [super viewWillDisappear:animated];
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}
- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"child4 didDisappear superview:%@", self.view.superview);
    [super viewDidDisappear:animated];
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)viewAction {
    
//    id nav1 = self.navigationController;
//    id nav2 = self.parentViewController.navigationController;
    [self.navigationController pushViewController:[UIViewController new] animated:YES];
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
