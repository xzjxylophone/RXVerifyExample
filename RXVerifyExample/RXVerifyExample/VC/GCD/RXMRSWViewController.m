//
//  RXMRSWViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/7.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMRSWViewController.h"
#import "RXMRSWPerson.h"

// multiply read signal write
@interface RXMRSWViewController ()

@end

@implementation RXMRSWViewController
// 多读单写
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self testPerson];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)testPerson {
    RXMRSWPerson *person = [RXMRSWPerson new];
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_queue_t serialQueue = dispatch_queue_create("com.serail.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    
    person.name = @"init";
    dispatch_async(mainQueue, ^{
        NSLog(@"person name in mainQueue:%@", person.name);
    });
    dispatch_async(globalQueue, ^{
        NSLog(@"person name in globalQueue:%@", person.name);
        person.name = @"globalQueue";
    });
    dispatch_async(serialQueue, ^{
        person.name = @"serialQueue";
        NSLog(@"person name in serialQueue:%@", person.name);
    });
    dispatch_async(concurrentQueue, ^{
        person.name = @"concurrentQueue";
    });
    
    NSLog(@"person name:%@", person.name);
    
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
