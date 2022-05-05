//
//  RXAppStorePopViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/10/22.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXAppStorePopViewController.h"

typedef struct {
    BOOL responseScrollViewDidScroll:1;
    BOOL responseScrollViewWillBeginDragging:1;
    BOOL responseScrollViewWillEndDragging:1;
    BOOL responseScrollViewDidEndDragging:1;
    BOOL responseScrollViewWillBeginDecelerating:1;
    BOOL responseScrollViewDidEndDecelerating:1;
    BOOL responseScrollViewDidEndScrollingAnimation:1;
    BOOL responseReloadFreeTrafficDataDone:1;
} KSFeedComponentScrollFlags;

@interface RXAppStorePopViewController ()

@property (nonatomic) KSFeedComponentScrollFlags flags;

@end

@implementation RXAppStorePopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *top = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    self.view.backgroundColor = [UIColor greenColor];
    top.backgroundColor = [UIColor blueColor];
    [self.view addSubview:top];
    KSFeedComponentScrollFlags flag = self.flags;
    flag.responseReloadFreeTrafficDataDone = YES;
    self.flags = flag;
//    _flags.responseScrollViewDidScroll = YES;
    
    
    [self.view rx_addGestureRecognizerWithTarget:self action:@selector(viewAction2)];
}
- (void)viewAction2 {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"5555");
    }];
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
