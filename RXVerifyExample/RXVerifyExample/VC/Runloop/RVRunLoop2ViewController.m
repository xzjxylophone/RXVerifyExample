//
//  RVRunLoop2ViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/5/25.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVRunLoop2ViewController.h"
#import "RXRunLoop.h"

@interface RVRunLoop2ViewController ()
@property (nonatomic, strong) RXRunLoop *rxRunLoop;

@property (nonatomic, strong) NSArray *functionItems;

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@end

@implementation RVRunLoop2ViewController
#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.rxRunLoop = [[RXRunLoop alloc] init];
    
    
    self.functionItems = @[@"Base", @"SendToMode_abc123"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self.rxRunLoop stop];
    [self.rxRunLoop stop];
    NSLog(@"RVRunLoop2ViewController dealloc");
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.functionItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"abc123";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = self.functionItems[indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *tmp = self.functionItems[indexPath.row];
    [self actionWithName:tmp];
}


#pragma mark - Action
- (void)actionWithName:(NSString *)name
{
    if ([name isEqualToString:@"Base"]) {
        
        NSLog(@"%@", self.rxRunLoop);
        
    } else if ([name isEqualToString:@"SendToMode_abc123"]) {
        
        RXRunLoopExeObject *object = [[RXRunLoopExeObject alloc] init];
        
        object.target = self;
        object.action = @selector(sendToMode_abc123Action:);
        object.object = nil;
        object.mode = @"abc123";
        object.mode = NSDefaultRunLoopMode;
        
//        [self.rxRunLoop executeWithRXRunLoopExeObject:object];
        
        [self performSelector:@selector(sendToMode_abc123Action:) onThread:self.rxRunLoop.thread withObject:nil waitUntilDone:YES];
        
        NSLog(@"%@", self.rxRunLoop);
        
        
        
    }
}

#pragma mark - Private
- (void)sendToMode_abc123Action:(id)sender
{
    
    NSLog(@"current run loop:%@", [self.rxRunLoop currentRunLoopInfo]);
    NSLog(@"sendToMode_abc123Action");
    
    
    
    
}















@end



