//
//  RVStrongWeakSelfViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/5/10.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVStrongWeakSelfViewController.h"


@interface RXTestObject : NSObject

@property (nonatomic, copy) void (^completion)(void);
@property (nonatomic, assign) NSInteger index;
- (void)start1;
- (void)start2;
- (void)start3;
@end

@implementation RXTestObject

- (void)start1
{
    self.index = 1;
    __strong __typeof(self) strongSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [strongSelf safeBlock_complete];
    });
}

- (void)start2
{
    self.index = 2;
    __weak __typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [weakSelf safeBlock_complete];
    });
}

- (void)start3
{
    self.index = 3;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self safeBlock_complete];
    });
}


- (void)safeBlock_complete
{
    if (self.completion != nil) {
        self.completion();
        self.completion = nil;
    }
}

- (void)dealloc
{
    switch (self.index) {
        case 1:
        {
            NSLog(@"strong self dealloc");
        }
            break;
        case 2:
        {
            NSLog(@"weak self dealloc");
        }
            break;
        case 3:
        {
            NSLog(@"self dealloc");
        }
            break;
        default:
            break;
    }
}

@end


@interface RVStrongWeakSelfViewController ()
@property (nonatomic, strong) RXTestObject *testObject;
@end

@implementation RVStrongWeakSelfViewController




- (void)testStrongWeakSelf1
{
    RXTestObject *object = [[RXTestObject alloc] init];
    object.completion = ^(void) {
        NSLog(@"strong self completion");
    };
    [object start1];
}



- (void)testStrongWeakSelf2
{
    RXTestObject *object = [[RXTestObject alloc] init];
    object.completion = ^(void) {
        NSLog(@"weak self completion");
    };
    [object start2];
    self.testObject = object;
}




- (void)testStrongWeakSelf3
{
    RXTestObject *object = [[RXTestObject alloc] init];
    object.completion = ^(void) {
        NSLog(@"self completion");
    };
    [object start3];
}




#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self performSelector:@selector(testStrongWeakSelf1) withObject:nil afterDelay:1];
//    [self performSelector:@selector(testStrongWeakSelf2) withObject:nil afterDelay:1];
//    [self performSelector:@selector(testStrongWeakSelf3) withObject:nil afterDelay:1];
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
