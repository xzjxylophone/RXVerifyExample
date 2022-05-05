//
//  RXCompressWhitSpaceViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/6/25.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXCompressWhitSpaceViewController.h"

@interface RXCompressWhitSpaceViewController ()

@end

@implementation RXCompressWhitSpaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test
{
    NSString *string = @" Additional     setup    after   loading the  view.  ";
    NSString *tmpString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSArray *tmpComponents = [tmpString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSArray *components = [tmpComponents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self <> ''"]];
    NSString *resultString = [components componentsJoinedByString:@" "];
    NSLog(@"resultString:%@", resultString);
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
