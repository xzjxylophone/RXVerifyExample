//
//  RVTDWViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 17/4/5.
//  Copyright © 2017年 Rush.D.Xzj. All rights reserved.
//

#import "RVTDWViewController.h"

@interface RVTDWViewController ()


@property (nonatomic, weak) IBOutlet UITableView *tableView;


@property (nonatomic, strong) RXTVProtocolObject *rxtvProtocolObject;
@end

@implementation RVTDWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.rxtvProtocolObject = [[RXTVProtocolObject alloc] init];
    
    CGFloat width = RX_Window_Width;
    CGFloat height = RX_Window_Height;
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 50)];
    topLabel.backgroundColor = [UIColor redColor];
    topLabel.text = @"这个是顶部的最上面的一个view";
    topLabel.numberOfLines = 0;
    topLabel.textColor = [UIColor blackColor];
    
    
    
    
    
    self.tableView.delegate = self.rxtvProtocolObject;
    self.tableView.dataSource = self.rxtvProtocolObject;
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
