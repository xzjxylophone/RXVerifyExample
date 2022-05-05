//
//  RVUtilityViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/6/19.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVUtilityViewController.h"

@interface RVUtilityViewController () <UITextViewDelegate>

@end

@implementation RVUtilityViewController

#pragma mark - View Life Cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initializeUIAndData];
    [self initializeAction];
}


#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    
    self.view.backgroundColor = [UIColor redColor];
}
- (void)initializeAction
{
//    [self test_LongPressGestureRecognize];
    [self test_textView];
}


#pragma mark - TextView
- (void)test_textView
{
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    textView.delegate = self;
    [self.view addSubview:textView];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"textViewDidChange:%@", textView.text);
}

#pragma mark - UILongPressGestureRecognizer
- (void)test_LongPressGestureRecognize
{
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longPressGR.minimumPressDuration = 1.0;
    [self.view addGestureRecognizer:longPressGR];
}
- (void)longPressAction:(id)sender
{
    UILongPressGestureRecognizer *lpgr = sender;
    switch (lpgr.state) {
        case UIGestureRecognizerStateBegan:
        {
            NSLog(@"UIGestureRecognizerStateBegan");
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            NSLog(@"UIGestureRecognizerStateChanged");
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            NSLog(@"UIGestureRecognizerStateEnded Or UIGestureRecognizerStateCancelled");
        }
            break;
        default:
            break;
    }
}


#pragma mark - UIKeyboard
- (void)test_UIKeyboardShowOrHide
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(uiKeyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(uiKeyboardDidShowNotification:) name:UIKeyboardDidShowNotification object:nil];
    
    
    [nc addObserver:self selector:@selector(uiKeyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    
    [nc addObserver:self selector:@selector(uiKeyboardDidHideNotification:) name:UIKeyboardDidHideNotification object:nil];
}
#pragma mark - Notification
- (void)uiKeyboardWillShowNotification:(id)sender
{
    NSNotification *notification = sender;
    NSDictionary *userInfo = notification.userInfo;
    CGSize size = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    NSLog(@"size:%@", NSStringFromCGSize(size));
}
- (void)uiKeyboardDidShowNotification:(id)sender
{
    
}
- (void)uiKeyboardWillHideNotification:(id)sender
{
    
}
- (void)uiKeyboardDidHideNotification:(id)sender
{
    
}


/*
 
 
 
 
 #pragma mark - View Life Cycle
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view from its nib.
 
 [self initializeUIAndData];
 [self initializeAction];
 }
 
 
 
 - (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }
 - (void)viewWillAppear:(BOOL)animated
 {
 [super viewWillAppear:animated];
 [self rx_setLeftBBI];
 }
 
 
 
 #pragma mark - initialize UI And Data
 - (void)initializeUIAndData
 {
 self.hidesBottomBarWhenPushed = YES;
 self.view.backgroundColor = k_UI_Color_Background;
 [self rx_tapAnywhereToDismissKeyboard];
 self.title = @"";
 
 
 MJRefreshHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
 self.tableView.mj_header = header;
 
 
 
 
 self.rxTVProObject = [[RXTVProtocolObject alloc] init];
 self.rxTVProObject.delegate = self;
 self.tableView.backgroundColor = [UIColor clearColor];
 self.tableView.tableHeaderView = [UIView new];
 self.tableView.tableFooterView = [UIView new];
 self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
 self.tableView.dataSource = self.rxTVProObject;
 self.tableView.delegate = self.rxTVProObject;
 
 
 }
 - (void)initializeAction
 {
 [self refresh];
 }
 
 #pragma mark - Private
 - (void)loadCellData
 {
 
 }
 - (void)refresh
 {
 
 }
 
 
 
 
 #pragma mark - RXTVProtocolObjectDelegate
 - (UITableViewCell *)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 id data = [tvObject itemWithIndexPath:indexPath];
 //    NSString *identify = [DFStationListCell identifier];
 //    DFStationListCell *cell = (DFStationListCell *)[tableView dequeueReusableCellWithIdentifier:identify];
 //    if (cell == nil) {
 //        cell = [DFStationListCell cell];
 //    }
 //    [cell setData:data];
 return nil;
 }
 
 
 // delegate
 - (CGFloat)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 //    return [DFStationListCell cellHeight];
 return 0;
 }
 - (void)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 id data = [tvObject itemWithIndexPath:indexPath];
 
 }

 
 
 
 */

/*
 
 <RXTVProtocolObjectDelegate>
 
 @property (nonatomic, weak) IBOutlet UITableView *tableView;
 @property (nonatomic, strong) RXTVProtocolObject *rxTVProObject;
 
 
 */








@end
