//
//  RXHeatMapViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2021/12/20.
//  Copyright © 2021 Rush.D.Xzj. All rights reserved.
//

#import "RXHeatMapViewController.h"


#import "RXHeatMapView.h"

@interface RXHeatMapViewController ()
@property (nonatomic, strong) RXHeatMapView *heatMapView;
@end

@implementation RXHeatMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.heatMapView = [[RXHeatMapView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 500)];
    [self.view addSubview:self.heatMapView];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.heatMapView loadData];
    });
}


- (void)viewDidAppear:(BOOL)animated {
    
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
