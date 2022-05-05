//
//  RXChild2ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/8/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXChild2ViewController.h"
@interface RXChild2View : UIView

@end
@implementation RXChild2View

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(200, 200, 40, 40);
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

@end


@interface RXChild2ViewController ()

@end

@implementation RXChild2ViewController
- (void)loadView {
    
    self.view = [RXChild2View new];
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
