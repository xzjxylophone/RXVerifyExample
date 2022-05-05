//
//  RXRACViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/7/2.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXRACViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <Foundation/Foundation.h>
//#import <ReactiveCocoa/ReactiveCocoa.h>

//http://www.cocoachina.com/industry/20140621/8905.html

@interface RXRACViewController ()

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) RACSignal *textFieldSignal;

@end

@implementation RXRACViewController

//""
//'', ""
//@""

#define Add(A, B) A + B


#define TestSharp1(x)     (# x)
#define TestSharp2(x)     (@# x)
#define TestSharp3(x)     (@#x)
#define TestSharp4(x)     # x



#define TestDoubleSharp1(a, b)     a ## b


- (void)viewDidLoad {
    
    int a = Add(3, 5);
    NSLog(@"%zd", a);
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, 200, 40)];
    
    [self.view addSubview:self.textField];
    self.view.backgroundColor = [UIColor whiteColor];
    

    
    self.textFieldSignal = [[self.textField rac_textSignal] map:^id _Nullable(NSString * _Nullable value) {
        return @(value.length > 3);
    }];
    
    
    
    [self test_singleSharp];
    
    [self test_doubleSharp];
    
    [self test_commaInC];
    
    [self test_strchr];
    
    [self test_metamacro_concat];
    
    [self test_metamacro_head];
    
    [self test_metamacro_at];
    
    [self test_metamacro_argcount];
    
    [self test_metamacro_dec];
    [self test_metamacro_dec2];
    
    [self test_metamacro_inc];
    
    [self test_metamacro_expand_];
    
    [self test_metamacro_consume_];
    
    [self test_metamacro_if_eq0_N];
    
    [self test_metamacro_if_eqN];
    
    [self test_metamacro_if_eq];
    
    [self test_doubleAnd];
    
    [self test_keypath2];
    
    [self test_keypath1];
    
    [self test_keypath];
    
    [self test_RAC];
    
    [self test_RACObserve];
    
    [self test_rac_weakify_And_rac_strongify_];
    [self test_redefineVar];
    
    [self test_rac_keywordify];
    
    [self test_metamacro_foreach_cxtN];
    [self test_metamacro_foreach_cxt];
    
    [self test_weakify];
    
    [self test_metamacro_foreach_iter];
    
    [self test_NSLog];
    
}


#define RACTest_SingleSharp1(A)  # A
#define RACTest_SingleSharp2(A)  #A
#define RACTest_SingleSharp3(A)  (# A)
#define RACTest_SingleSharp4(A)  (#A)
#define RACTest_SingleSharp5(A)  @#A
#define RACTest_SingleSharp6(A)  @# A
#define RACTest_SingleSharp7(A)  @(# A)
#define RACTest_SingleSharp8(A)  (@# A)
- (void)test_singleSharp
{
    NSString *k1 = @RACTest_SingleSharp1(abc);
    NSLog(@"k1:111%@111", k1);
    
    NSString *k2 = @RACTest_SingleSharp2(abc);
    NSLog(@"k2:111%@111", k2);
    
    NSString *k3 = @RACTest_SingleSharp3(abc);
    NSLog(@"k3:111%@111", k3);
    
    NSString *k4 = @RACTest_SingleSharp4(abc);
    NSLog(@"k4:111%@111", k4);
    
    NSString *k5 = RACTest_SingleSharp5(abc);
    NSLog(@"k5:111%@111", k5);
    
    NSString *k6 = RACTest_SingleSharp6(abc);
    NSLog(@"k6:111%@111", k6);
    
    NSString *k7 = RACTest_SingleSharp7(abc);
    NSLog(@"k7:111%@111", k7);
    
    NSString *k8 = RACTest_SingleSharp8(abc);
    NSLog(@"k8:111%@111", k8);
    
    
    NSString *k9 = RACTest_SingleSharp8(@"abc");
    NSLog(@"k9:111%@111", k9);
    
    NSString *k10 = RACTest_SingleSharp8("abc");
    NSLog(@"k10:111%@111", k10);
    
    NSString *k11 = [NSString stringWithUTF8String:RACTest_SingleSharp1(abc)];
    NSLog(@"k11:111%@111", k11);
    
}
#define RACTest_Add(A, B) (A + B)
#define RACTest_DoubleSharp1(A, B)   A ## B
#define RACTest_DoubleSharp2(A, B)   A##B
#define RACTest_DoubleSharp3(A, B)   (A ## B)
#define RACTest_DoubleSharp4(A, B)   (A##B)
- (void)test_doubleSharp
{
    
//    NSString *ab = @"111"
    
    NSString *RACTest_DoubleSharp1(a, b) = @"aaaa";
    
    
    
    NSString *RACTest_DoubleSharp1(test, String1) = @"abc";
    NSLog(@"testString1:%@", testString1);
    
    NSString *RACTest_DoubleSharp2(test, String2) = @"abc";
    NSLog(@"testString2:%@", testString2);
    
    NSString *RACTest_DoubleSharp3(test, String3) = @"abc";
    NSLog(@"testString3:%@", testString3);
    
    NSString *RACTest_DoubleSharp4(test, String4) = @"abc";
    NSLog(@"testString4:%@", testString4);
    
    NSString *(testString5) = @"abc";
    NSLog(@"testString5:%@", testString5);
    
    int c1 = RACTest_DoubleSharp1(RACTest_, Add)(1, 2);
    NSLog(@"c1:%zd", c1);
    
    int c2 = RACTest_DoubleSharp2(RACTest_, Add)(1, 2);
    NSLog(@"c2:%zd", c2);
    
//    // 有错误
//    int c3 = RACTest_DoubleSharp3(RACTest_, Add)(1, 2);
//    NSLog(@"c3:%zd", c3);
//
//    // 有错误
//    int c4 = RACTest_DoubleSharp4(RACTest_, Add)(1, 2);
//    NSLog(@"c4:%zd", c4);
//
//    // 有错误
//    int c5 = (RACTest_Add)(1, 2);
//    NSLog(@"c5:%zd", c5);
    
}

- (void)test_commaInC
{
    int a = 0, b = 0;
    // 有warning
    a = 1, b = 2;
    // 有warning c=2
    int c = (a, b);
    // 没有warning d=2
    int d = ((void)a, b);
    NSLog(@"c:%zd, d:%zd", c, d);
}

- (void)test_strchr
{
    const char *source = "self.view";
    
    char *strchrResult1 = strchr(source, '.');
    NSLog(@"strchrResult1:%s", strchrResult1);
    
    char *strchrResult2 = strchr(source, '.') + 1;
    NSLog(@"strchrResult2:%s", strchrResult2);
    
    char *strchrResult3 = strchr(source, 'z');
    NSLog(@"strchrResult3:%s", strchrResult3);
}

- (void)test_metamacro_concat
{
    // #
    NSString *metamacro_concat(test, StringA) = @"abc";
    NSLog(@"%@", testStringA);
    int c = metamacro_concat(RACTest_, Add)(1, 2);
    NSLog(@"c:%zd", c);
}

- (void)test_metamacro_head
{
    int head1 = metamacro_head(1111, 2222, 3333);
    NSLog(@"head1:%zd", head1);
    
    NSString *head2 = metamacro_head(@"abc", @"kkk", 123);
    NSLog(@"head2:%@", head2);
    
    NSString *metamacro_concat(head, metamacro_head(3Test, abc, @"abc", 11111)) = @"abc";
    NSLog(@"head3Test:%@", head3Test);
}


- (void)test_metamacro_at
{
    int index1 = metamacro_at(1, 1, 2);
    NSLog(@"index1:%zd", index1);
    
    int index2 = metamacro_at(1, 1, 2, 3, 4, 5, 6, 7);
    NSLog(@"index2:%zd", index2);
    
    int index3 = metamacro_at(5, 0, 5, 11, 23, 34, 55);
    NSLog(@"index3:%zd", index3);
    
    int index4 = metamacro_at(20, 111, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21);
    NSLog(@"index4:%zd", index4);
    
    int index5 = metamacro_at0(0, 1);
    NSLog(@"index5:%zd", index5);
    
    int index6 = metamacro_at2(11, 22, 33);
    NSLog(@"index6:%zd", index6);
}

- (void)test_metamacro_argcount
{
    
//#define metamacro_argcount(...) \
//metamacro_at(20, __VA_ARGS__, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)

    
    
    int count1 = metamacro_argcount(@"1", @"2");
    NSLog(@"count1:%zd", count1);
    
//#define metamacro_at(N, ...) \
//metamacro_concat(metamacro_at, N)(__VA_ARGS__)
    
    
    int count2 = metamacro_at(20, @"1", @"2", 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1);
    NSLog(@"count2:%zd", count2);
    
    int count3 = metamacro_at20(@"1", @"2", 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1);
    NSLog(@"count3:%zd", count3);
    
    int count4 = metamacro_head(2, 1);
    NSLog(@"count4:%zd", count4);
    
    int count5 = metamacro_head_(2, 1, 0);
    NSLog(@"count5:%zd", count5);
    
    int count6 = metamacro_argcount(@"1");
    NSLog(@"count6:%zd", count6);
    
    // 当没有参数的时候,返回是错误的,返回的是1
    int count7 = metamacro_argcount();
    NSLog(@"count7:%zd", count7);
    
//    // 出现错误
//    int count8 = metamacro_at(20, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1);
//    NSLog(@"count8:%zd", count8);
//    // 出现错误
//    int count9 = metamacro_at20(20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1);
//    NSLog(@"count3:%zd", count9);
//    // 出现错误
//    int count10 = metamacro_head();
//    NSLog(@"count10:%zd", count10);
//    // 正确
//    int count11 = metamacro_head_(0);
//    NSLog(@"count11:%zd", count11);
}



- (void)test_metamacro_dec
{
//    for (int i = 0; i <= 20; i++) {
//        // 这一行会有编译错误
//        int dec = metamacro_dec(i);
//        NSLog(@"i:%zd, dec:%zd", i, dec);
//    }
    int dec1 = metamacro_dec(0);
    NSLog(@"dec1:%zd", dec1);
    
    int dec2 = metamacro_dec(1);
    NSLog(@"dec2:%zd", dec2);
    
    int dec3 = metamacro_dec(5);
    NSLog(@"dec3:%zd", dec3);
    
    int dec4 = metamacro_dec(20);
    NSLog(@"dec4:%zd", dec4);
    
//    // error: metamacro_at21 不存在, 因为这个最大的就是metamacro_at20
//    int dec5 = metamacro_dec(21);
//    NSLog(@"dec5:%zd", dec5);
}


- (void)test_metamacro_dec2
{
    NSInteger dec1 = metamacro_dec(0);
    NSLog(@"dec1:%zd", dec1);
    
    NSInteger dec2 = metamacro_dec(1);
    NSLog(@"dec2:%zd", dec2);
    
    NSInteger dec3 = metamacro_dec(5);
    NSLog(@"dec3:%zd", dec3);
    
    NSInteger dec4 = metamacro_dec(20);
    NSLog(@"dec4:%zd", dec4);
}

- (void)test_metamacro_inc
{
    int inc1 = metamacro_inc(0);
    NSLog(@"inc1:%zd", inc1);
    
    int inc2 = metamacro_inc(1);
    NSLog(@"inc2:%zd", inc2);
    
    int inc3 = metamacro_inc(5);
    NSLog(@"inc3:%zd", inc3);
    
    int inc4 = metamacro_inc(20);
    NSLog(@"inc4:%zd", inc4);
}

- (void)test_metamacro_expand_
{
    NSString *expand1 = metamacro_expand_(@"abc");
    NSLog(@"expand1:%@", expand1);
    
    NSInteger expand2 = metamacro_expand_(123);
    NSLog(@"expand2:%zd", expand2);
}

- (void)test_metamacro_consume_
{
    NSString *consume1 = metamacro_consume_(@"abc")@"def";
//    NSString *consume1 = @"def";
    NSLog(@"consume1:%@", consume1);
    
    NSInteger consume2 = metamacro_consume_(123)456;
    NSLog(@"consume2:%zd", consume2);
}
- (void)test_metamacro_if_eq0_N
{
//    NSString *equal0_N_1 = metamacro_if_eq0_0(@"YES")(@"NO");
    
    
    NSString *equal0_N_1 = @"YES"metamacro_consume_(@"NO");
    NSLog(@"equal0_N_1:%@", equal0_N_1);
    
    NSString *equal0_N_2 = metamacro_if_eq0_1(@"YES")(@"NO");
    NSLog(@"equal0_N_2:%@", equal0_N_2);
    
    NSString *equal0_N_3 = metamacro_concat(metamacro_if_eq0_, 4)(@"YES")(@"NO");
    NSLog(@"equal0_N_3:%@", equal0_N_3);
    
    NSString *equal0_N_4 = metamacro_concat(metamacro_if_eq0_, 0)(@"YES")(@"NO");
    NSLog(@"equal0_N_4:%@", equal0_N_4);
}

- (void)test_metamacro_if_eqN
{
    NSString *equalN_1 = metamacro_if_eq1(1)(@"YES")(@"NO");
    NSLog(@"equalN_1:%@", equalN_1);
    
    NSString *equalN_2 = metamacro_if_eq4(4)(@"YES")(@"NO");
    NSLog(@"equalN_2:%@", equalN_2);
    
    NSString *equalN_3 = metamacro_if_eq11(14)(@"YES")(@"NO");
    NSLog(@"equalN_3:%@", equalN_3);
    
    NSString *equalN_4 = metamacro_if_eq14(15)(@"YES")(@"NO");
    NSLog(@"equalN_4:%@", equalN_4);
    
//    // 14 大于 13, 按照逻辑,所以会报错!
//    NSString *equalN_5 = metamacro_if_eq14(13)(@"YES")(@"NO");
//    NSLog(@"equalN_5:%@", equalN_5);
}

- (void)test_metamacro_if_eq
{
    NSString *eq1 = metamacro_if_eq(1, 1)(@"YES")(@"NO");
    NSLog(@"eq1:%@", eq1);
    
    NSString *eq2 = metamacro_if_eq(1, 2)(@"YES")(@"NO");
    NSLog(@"eq2:%@", eq2);
}

// NO && ((void)OBJ.PATH, NO)

- (void)test_doubleAnd
{
    // self.view这里会有warning Code will newver be excuted
    NSInteger doubleAnd1 = NO &&((void)self.view, NO);
    NSLog(@"doubleAnd1:%zd", doubleAnd1);
    
    // self.view这里会有warning Code will newver be excuted
    NSString *doubleAnd2 = ((void)(NO &&((void)self.view, NO)), @"testValue");
    NSLog(@"doubleAnd2:%@", doubleAnd2);
    
}

- (void)test_keypath2
{
    
    NSString *keypath2_1 = @keypath2(self, view);
//    RACTest_Add(self, view)
    NSLog(@"keypath2_1:%@", keypath2_1);
    
    NSString *keypath2_2 = @keypath2(self.navigationController, navigationBar);
    NSLog(@"keypath2_2:%@", keypath2_2);
    
    NSString *keypath2_3 = [NSString stringWithUTF8String:keypath2(self.navigationController, navigationBar)];
    NSLog(@"keypath2_3:%@", keypath2_3);
}

- (void)test_keypath1
{
    NSString *keypath1_1 = @keypath1(self.view);
    NSLog(@"keypath1_1:%@", keypath1_1);
    
    NSString *keypath1_2 = @keypath1(self.navigationController.navigationBar);
    NSLog(@"keypath1_2:%@", keypath1_2);
    
    NSString *keypath1_3 = [NSString stringWithUTF8String:keypath1(self.navigationController.navigationBar)];
    NSLog(@"keypath1_3:%@", keypath1_3);
}

- (void)test_keypath
{
    NSString *keypath_1 = @keypath(self, view);
    NSLog(@"keypath_1:%@", keypath_1);
    
    NSString *keypath_2 = @keypath(self.navigationController, navigationBar);
    NSLog(@"keypath_2:%@", keypath_2);
    
    NSString *keypath_3 = @keypath(self.view);
    NSLog(@"keypath_3:%@", keypath_3);
    
    NSString *keypath_4 = @keypath(self.navigationController.navigationBar);
    NSLog(@"keypath_4:%@", keypath_4);
}

// https://developer.apple.com/documentation/foundation/nsmutabledictionary/1574187-setobject

- (void)test_RAC
{
    RACSignal *signal = [self.textFieldSignal map:^id _Nullable(id  _Nullable value) {
        return [value boolValue] ? [UIColor redColor] : [UIColor greenColor];
    }];
    
    // 编译错误
//    RAC(self.textField) = signal;
    
    // 代码1
    RAC(self.textField, backgroundColor, [UIColor blueColor]) = signal;
    
//    // 代码2
//    RAC(self.textField, backgroundColor) = signal;
//
//    // 代码3
//    RAC_(self.textField, backgroundColor, [UIColor blueColor]) = signal;
    
    // 代码4
//    [[RACSubscriptingAssignmentTrampoline alloc] initWithTarget:(self.textField) nilValue:[UIColor blueColor]][@"backgroundColor"] = signal;
    
    // 代码5
//    RACSubscriptingAssignmentTrampoline *tmp = [[RACSubscriptingAssignmentTrampoline alloc] initWithTarget:(self.textField) nilValue:[UIColor blueColor]];
//    tmp[@"backgroundColor"] = signal;
    
    // 代码6
//    RACSubscriptingAssignmentTrampoline *tmp = [[RACSubscriptingAssignmentTrampoline alloc] initWithTarget:(self.textField) nilValue:[UIColor blueColor]];
//    [tmp setObject:signal forKeyedSubscript:@"backgroundColor"];
    
    // 代码7:crash
//    RACSubscriptingAssignmentTrampoline *tmp1 = [[RACSubscriptingAssignmentTrampoline alloc] initWithTarget:(self.textField) nilValue:[UIColor blueColor]];
//    [tmp1 setValue:signal forKey:@"backgroundColor"];
//
    // 代码8:crash
//    RACSubscriptingAssignmentTrampoline *tmp2 = [[RACSubscriptingAssignmentTrampoline alloc] initWithTarget:(self.textField) nilValue:[UIColor blueColor]];
//    [tmp2 setValue:signal forKeyPath:@"backgroundColor"];
    
    // 代码9 验证defaultValue的
//    RACSignal *signal2 = [self.textFieldSignal map:^id _Nullable(id  _Nullable value) {
//        return [value boolValue] ? [UIColor redColor] : nil;
//    }];
//    RACSubscriptingAssignmentTrampoline *tmp = [[RACSubscriptingAssignmentTrampoline alloc] initWithTarget:(self.textField) nilValue:[UIColor blueColor]];
//    tmp[@"backgroundColor"] = signal2;
}



- (void)test_RACObserve
{
    // 代码1
    [RACObserve(self.view, backgroundColor) subscribeNext:^(id  _Nullable x) {
        NSLog(@"RACObserve:%@", x);
    }];
    
    // 代码2
//    [[self.view rac_valuesForKeyPath:@"backgroundColor" observer:self] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"rac_valuesForKeyPath:%@", x);
//    }];
}



- (void)test_rac_weakify_And_rac_strongify_
{
    // 这个放在block外面
    rac_weakify_(0, __weak, self) // 展开后: __weak __typeof__(self) self_weak_ = (self);
    self_weak_.view.backgroundColor = [UIColor grayColor];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 如果这一行代码如果放到block外面会出现重复定义self这个error
        rac_strongify_(100, self) // 展开后: __strong __typeof__(self) self = self_weak_;
        // 这个self 相当于重新定义成了 __strong, 不是原来定义的那个self了
        self.view.backgroundColor = [UIColor orangeColor];
    });
    
    // rac_weakify_ 有两种使用方法,1:__weak 2:__unsafe_unretained
//    rac_weakify_(0, __unsafe_unretained, self)
}
- (void)test_redefineVar
{
    int a = 0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        int a = 4;
        NSLog(@"a in block:%zd", a);
    });
    NSLog(@"a not in block:%zd", a);
}


#define RACTest_rac_keywordify try {} @catch (...) {}
- (void)test_rac_keywordify
{
    @rac_keywordify
    NSLog(@"do something after rac_keywordify");
    
    @autoreleasepool{}
    NSLog(@"do something after autoreleasepool");
    
    @RACTest_rac_keywordify
    NSLog(@"do something after RACTest_rac_keywordify");
    
    @try {}
    @catch(...) {}
    NSLog(@"do something after try/catch");
}

// 先定义一个类似rac_weakify_ 的宏, #VAR 是转C字符串, @#VAR 是一个OC字符串
#define RACTest_rac_weakify_(INDEX, CONTEXT, VAR)  NSString *metamacro_concat(CONTEXT, metamacro_concat(VAR, INDEX)) = @#VAR;
- (void)test_metamacro_foreach_cxtN
{
    // 测试这个宏
    RACTest_rac_weakify_(10, tmp, Abc)
    NSLog(@"value:%@", tmpAbc10);
    
    // 什么也没有
    metamacro_foreach_cxt0(RACTest_rac_weakify_,, testContext)
    
    NSString *object = @"abc";
    NSLog(@"object:%@", object);
    // 生成了1个变量
    metamacro_foreach_cxt1(RACTest_rac_weakify_,, testContext, object)
    NSLog(@"testContextobject0:%@", testContextobject0);
    
    NSString *objectA = @"abc";
    NSString *objectB = @"abc";
    NSString *objectC = @"abc";
    NSString *objectD = @"abc";
    NSLog(@"objectA:%@, objectB:%@, objectC:%@, objectD:%@", objectA, objectB, objectC, objectD);
    // 生成了4个变量
    metamacro_foreach_cxt4(RACTest_rac_weakify_,, testContext, objectA, objectB, objectC, objectD)
    
    NSLog(@"testContextobjectA0:%@", testContextobjectA0);
    NSLog(@"testContextobjectB1:%@", testContextobjectB1);
    NSLog(@"testContextobjectC2:%@", testContextobjectC2);
    NSLog(@"testContextobjectD3:%@", testContextobjectD3);
}

- (void)test_metamacro_foreach_cxt
{
    // 虽然编译没有问题,但是不能这么使用,因为在metamacro_foreach_cxt使用到了metamacro_argcount,所以在这里这个宏的参数最少是4个,要不然使用会有问题
    // 证明就是在无法编译: @weakify()
    metamacro_foreach_cxt(RACTest_rac_weakify_,,testContext)
//    metamacro_foreach_cxt0(RACTest_rac_weakify_,,testContext)
    
    NSString *objectA = @"abc";
    NSString *objectB = @"abc";
    NSString *objectC = @"abc";
    NSString *objectD = @"abc";
    NSLog(@"objectA:%@, objectB:%@, objectC:%@, objectD:%@", objectA, objectB, objectC, objectD);
    // 生成了4个变量
    metamacro_foreach_cxt(RACTest_rac_weakify_,, testContext, objectA, objectB, objectC, objectD)
    NSLog(@"testContextobjectA0:%@", testContextobjectA0);
    NSLog(@"testContextobjectB1:%@", testContextobjectB1);
    NSLog(@"testContextobjectC2:%@", testContextobjectC2);
    NSLog(@"testContextobjectD3:%@", testContextobjectD3);
}

- (void)test_weakify
{
    // 代码1
//    @weakify(self)
    
    // 代码2
//    @autoreleasepool{}
//    metamacro_foreach_cxt(rac_weakify_,, __weak, self)

    // 代码3
//    @autoreleasepool{}
//    metamacro_concat(metamacro_foreach_cxt, 1)(rac_weakify_,, __weak, self)

    // 代码4
//    @autoreleasepool{}
//    metamacro_foreach_cxt1(rac_weakify_,, __weak, self)
    
    // 代码5
//    @autoreleasepool{}
//    rac_weakify_(0, __weak, self)
    
    // 代码6:无法编译
//    @weakify()
    
    // 代码7:无法编译
//    @weakify(self.view)
    
    
    // 代码8
    NSObject *tmpObject = [NSObject new];
    @weakify(tmpObject, self);
    NSLog(@"tmpObject_weak_:%@", tmpObject_weak_);
    NSLog(@"self_weak_:%@", self_weak_);
}


#define RACTest_Incream(INDEX, ARG) (INDEX + ARG - 1)
- (void)test_metamacro_foreach_iter
{
    NSInteger iter1 = metamacro_foreach_iter(5, RACTest_Incream, 10);
    NSLog(@"iter1:%zd", iter1);
}



- (void)test_strongify
{
    @weakify(self)
    self_weak_.view.backgroundColor = [UIColor grayColor];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 代码1
//        @strongify(self)
        
        // 代码2
//        metamacro_foreach(rac_strongify_,, self)
        
        // 代码3
//        metamacro_foreach_cxt(metamacro_foreach_iter,, rac_strongify_, self)
        
        // 代码4
//        metamacro_foreach_cxt1(metamacro_foreach_iter,, rac_strongify_, self)
        
        // 代码5
//        metamacro_foreach_iter(0, rac_strongify_, self)
        
        // 代码6
        rac_strongify_(0, self)
        
        self.view.backgroundColor = [UIColor orangeColor];
    });
}

//#define NSLog(...)
- (void)test_NSLog
{
    NSLog(@"kkkk");
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
