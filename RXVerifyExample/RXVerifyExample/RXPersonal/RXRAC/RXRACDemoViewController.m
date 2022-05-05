//
//  RXRACDemoViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/7/16.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXRACDemoViewController.h"
#import "RWDummySignInService.h"
#import <ReactiveObjC/ReactiveObjC.h>

// https://blog.csdn.net/wsh604/article/details/78512643

@interface RXRACDemoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UILabel *signInFailureText;

//@property (nonatomic) BOOL passwordIsValid;
//@property (nonatomic) BOOL usernameIsValid;
@property (strong, nonatomic) RWDummySignInService *signInService;

@end

@implementation RXRACDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //    [self updateUIState];
    
//    self.signInService = [RWDummySignInService new];
//    
//    // handle text changes for both text fields
//    //    [self.usernameTextField addTarget:self action:@selector(usernameTextFieldChanged) forControlEvents:UIControlEventEditingChanged];
//    //    [self.passwordTextField addTarget:self action:@selector(passwordTextFieldChanged) forControlEvents:UIControlEventEditingChanged];
//    
//    // initially hide the failure message
//    self.signInFailureText.hidden = YES;
//    
//    //    [self.usernameTextField.rac_textSignal subscribeNext:^(id x){
//    //        NSLog(@"%@", x);
//    //    }];
//    
//    //    [[self.usernameTextField.rac_textSignal filter:^BOOL(id value) {
//    //        NSString *text = value;
//    //        return  text.length > 3;
//    //    } ] subscribeNext:^(id x) {
//    //        NSLog(@"x=%@", x);
//    //    }];
//    
//    //    [[[self.usernameTextField.rac_textSignal
//    //       map:^id(NSString*text){
//    //           return @(text.length);
//    //       }]
//    //      filter:^BOOL(NSNumber*length){
//    //          return[length integerValue] > 3;
//    //      }]
//    //     subscribeNext:^(id x){
//    //         NSLog(@"%@", x);
//    //     }];
//    
//    RACSignal *validUsernameSignal = [self.usernameTextField.rac_textSignal map:^id(NSString *text) {
//        return @([self isValidUsername:text]);
//    }];
//    
//    RACSignal *validPasswordSignal = [self.passwordTextField.rac_textSignal map:^id(NSString *text){
//        return @([self isValidPassword:text]);
//    }];
//    
//    
//    // 用法不是很好
//    //    [[validPasswordSignal map:^id(NSNumber *passwordValid) {
//    //        return [passwordValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
//    //    }]
//    //    subscribeNext:^(UIColor *color) {
//    //        self.passwordTextField.backgroundColor = color;
//    //    }];
//    //
//    //    // 用法不是很好
//    //    [[validUsernameSignal map:^id(NSNumber *usernameValid) {
//    //        return [usernameValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
//    //    }] subscribeNext:^(UIColor *color) {
//    //        self.usernameTextField.backgroundColor = color;
//    //    }];
//    
//    // RAC宏允许直接把信号的输出应用到对象的属性上。RAC宏有两个参数，第一个是需要设置属性值的对象，第二个是属性名。
//    // 每次信号产生一个next事件，传递过来的值都会应用到该属性上。
//    RAC(self.passwordTextField, backgroundColor) = [validPasswordSignal
//                                                    map:^id(NSNumber *passwordValid) {
//                                                        return [passwordValid boolValue]? [UIColor clearColor] : [UIColor yellowColor];
//                                                    }];
//    RAC(self.usernameTextField, backgroundColor) = [validUsernameSignal
//                                                    map:^id(NSNumber *usernameValid) {
//                                                        return [usernameValid boolValue]? [UIColor clearColor] : [UIColor yellowColor];
//                                                    }];
//    
//    
//    
//    RACSignal *signalUpActiveSignal = [RACSignal combineLatest:@[validUsernameSignal, validPasswordSignal]
//                                                        reduce:^id(NSNumber *userserValid, NSNumber *passwrdValid){
//                                                            return @([userserValid boolValue ] && [passwrdValid boolValue ]);
//                                                        }];
//    
//    //    [[RACSubscriptingAssignmentTrampoline alloc] initWithTarget:(self.usernameTextField) nilValue:(nil)][@keypath(self.usernameTextField, backgroundColor)] = nil;
//    
//    NSArray *array = @[@"abc", @"cd", @"aa"];
//    NSSet *set = [NSSet setWithArray:array];
//    NSDictionary *dic = @{@"key1": @"value1",
//                          @"key2": @"value2"};
//    
//    for (id value in set) {
//        NSLog(@"value:%@", value);
//    }
//    
//    for (id value in dic) {
//        NSLog(@"value:%@", value);
//    }
//    
//    
//    // 点击事件
//    [signalUpActiveSignal subscribeNext:^(NSNumber *sinnupActive) {
//        self.signInButton.enabled = [sinnupActive boolValue];
//    }];
//    
//    //    [[[[self.signInButton rac_signalForControlEvents:UIControlEventTouchUpInside]
//    //      doNext:^(id x){
//    //          self.signInButton.enabled =NO;
//    //          self.signInFailureText.hidden =YES;
//    //      }]
//    //     flattenMap:^id(id value) {
//    //         return [self signInSignal];
//    //     }]
//    //     subscribeNext:^(NSNumber *signedIn) {
//    ////        NSLog(@"clicke.x=%@", x );
//    //
//    //         BOOL success = [signedIn boolValue];
//    //         self.signInFailureText.hidden = success;
//    //         if (success) {
//    //             [self performSegueWithIdentifier:@"signInSuccess" sender:self];
//    //         }
//    //
//    //    } ];
//    
//    
//    // 第二种方法
//    [[self.signInButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        
//        
//        self.signInButton.enabled = NO;
//        self.signInFailureText.hidden = YES;
//        
//        
//        
//        [[self signInSignal] subscribeNext:^(id x) {
//            BOOL isSuccess = [x boolValue];
//            self.signInFailureText.hidden = isSuccess;
//            self.signInButton.enabled = YES;
//            if (isSuccess)
//                [self performSegueWithIdentifier:@"signInSuccess" sender:self];
//        }];
//        
//        
//    }];
    
    
    
    RACSignal *testSignal = self.usernameTextField.rac_textSignal;
    [testSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    
}

- (RACSignal *) signInSignal {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id subscriber ) {
        [self.signInService signInWithUsername:self.usernameTextField.text
                                     password :self.passwordTextField.text
                                     complete :^(BOOL success ){
                                         [subscriber sendNext:@(success )];
                                         [subscriber sendCompleted ];
                                         
                                     }];
        return nil;
    }];
    return signal;
}

- (BOOL)isValidUsername:(NSString *)username {
    return username.length > 3;
}

- (BOOL)isValidPassword:(NSString *)password {
    
    __weak typeof(self) weakSelf = self;
    
    void (^testBlock)(void) = ^void(void) {
        __strong __typeof(self) self = weakSelf;
        self.passwordTextField.text = @"111";
    };
    
    return password.length > 3;
}


/*
 - (IBAction)signInButtonTouched:(id)sender {
 // disable all UI controls
 //  self.signInButton.enabled = NO;
 self.signInFailureText.hidden = YES;
 
 // sign in
 [self.signInService signInWithUsername:self.usernameTextField.text
 password:self.passwordTextField.text
 complete:^(BOOL success) {
 self.signInButton.enabled = YES;
 self.signInFailureText.hidden = success;
 if (success) {
 [self performSegueWithIdentifier:@"signInSuccess" sender:self];
 }
 }];
 }
 */


// updates the enabled state and style of the text fields based on whether the current username
// and password combo is valid
/*
 - (void)updateUIState {
 self.usernameTextField.backgroundColor = self.usernameIsValid ? [UIColor clearColor] : [UIColor yellowColor];
 self.passwordTextField.backgroundColor = self.passwordIsValid ? [UIColor clearColor] : [UIColor yellowColor];
 self.signInButton.enabled = self.usernameIsValid && self.passwordIsValid;
 }
 
 - (void)usernameTextFieldChanged {
 self.usernameIsValid = [self isValidUsername:self.usernameTextField.text];
 [self updateUIState];
 }
 
 - (void)passwordTextFieldChanged {
 self.passwordIsValid = [self isValidPassword:self.passwordTextField.text];
 [self updateUIState];
 }
 */

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
