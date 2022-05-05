//
//  RXOPMQViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/9/24.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXOPMQViewController.h"
#import <AFNetworking+RXHeader.h>
@interface RXOPMQViewController ()

@end

@implementation RXOPMQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loginWithStudent_card:@"" password:@"" completion:^(RXBaseResponse *response) {
        NSLog(@"11");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Static
- (id)loginWithStudent_card:(NSString *)student_card password:(NSString *)password completion:(void (^)(RXBaseResponse *response))completion
{
    
//    http://182.92.75.104:8002/api/paper/all?paper_id=44
    
    NSString *baseUrl = @"http://182.92.75.104:8002";
    
    NSString *url = @"api/paper/all";
    NSDictionary *parameters = @{@"paper_id":@(44)
                                 };
    id http = [RXSimpleHttpManager getActionWithBaseUrl:baseUrl url:url parameters:parameters completion:completion];
    return http;
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
