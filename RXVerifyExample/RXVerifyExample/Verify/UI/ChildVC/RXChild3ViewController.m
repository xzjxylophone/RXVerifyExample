//
//  RXChild3ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/8/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXChild3ViewController.h"
#import "RXRuntimeUtil.h"
@interface RXChild3View : UIView

@end
@implementation RXChild3View

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(300, 300, 40, 40);
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

@end


@interface RXChild3ViewController ()

@end

@implementation RXChild3ViewController
+ (void)load {
    [RXRuntimeUtil exchangeMethodSafely:[RXChild3ViewController class] originSel:@selector(view) newSel:@selector(swizzle_view)];
}
- (UIView *)swizzle_view {
    NSLog(@"swizzle_view 3");
    UIView *tmp = [self swizzle_view];
    return tmp;
}
- (void)loadView {
    
    self.view = [RXChild3View new];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
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
