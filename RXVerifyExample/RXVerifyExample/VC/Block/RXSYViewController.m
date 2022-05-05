//
//  RXSYViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/6/15.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXSYViewController.h"

#import <objc/runtime.h>
#import "fishhook.h"

#import "RXHookBlockManager.h"


//
//@interface Tmp2Object : NSObject
//- (void)testTmp2;
//@end
//
//@implementation Tmp2Object
//- (void)testTmp2
//{
//
//}
//@end
static NSMutableDictionary *mutDic = nil;

static void __private_test(int a, int b, int c)
{
    
}

static void __private_test2222(void *cself, ...)
{
    __private_test(1, 1, 1);
    NSLog(@"111111");
    
//    va_list args;
//    va_start(args, cself);
//    void *value = nil;
//
//
//
//    while (YES) {
////        @try {
////            NSString *test = va_arg(args, NSString *);
////            NSLog(@"value:%@", @"abc");
////
////        } @catch(...) {
//            int a = va_arg(args, int);
//            NSLog(@"value:%@", @"abc");
////        }
//
//    }
//
////    [NSMethodSignature signatureWithObjCTypes:<#(nonnull const char *)#>]
//
//    ((void (*)(void *, ...))(originFun))(cself, args);
//
//    va_end(args);

}


static void __private_HookBlockToPrintHelloWorld(RX_block_impl *cSelf, int a, int b, int c, int d, int e, int f)
{
    NSLog(@"hello world");
}

static void __private_HookBlockToPrintArguments(RX_block_impl *cSelf, /*void *_0, void *_1, void *_2, void *_3, void *_4, void *_5, void *_6, void *_7, void *_8, void *_9, void *_10, void *_11, void *_12, void *_13,*/ ...)
{
    
//    int b = (int)_0;
    
    va_list args;
    va_start(args, cSelf);
    
    
//    void * dddd = va_arg(args, void *);

    RX_block_impl *block_impl = cSelf;
    NSMethodSignature *methodSignature = [NSMethodSignature signatureWithObjCTypes:(char *)block_impl->block_descriptor->copy_helper];


    NSInteger argCount = [methodSignature numberOfArguments];
    // 第一个参数是 block指针,所以从第二个开始循环

    //    i:1, value:i
    //    i:2, value:@"NSString"
    //    i:3, value:@"NSDictionary"
    //    i:4, value:@"NSArray"
    //    i:5, value:f
    //    i:6, value:d
    //    i:7, value:B
    //    i:8, value:^i

    for (int i = 1; i < argCount; i++) {
        const char *value = [methodSignature getArgumentTypeAtIndex:i];

        if (strcmp(value, "i") == 0) {
            int param = va_arg(args, int);
            printf("第%d个参数:%d\n", i, param);
        } else if (strcmp(value, "@\"NSString\"") == 0) {
            NSString *param = va_arg(args, NSString *);
            printf("第%d个参数:%s\n", i, [param UTF8String]);
        } else if (strcmp(value, "@\"NSDictionary\"") == 0) {
            NSDictionary *param = va_arg(args, NSDictionary *);
            NSString *str = [NSString stringWithFormat:@"%@", param];
            printf("第%d个参数:%s\n", i, [str UTF8String]);
        } else if (strcmp(value, "@\"NSArray\"") == 0) {
            NSArray *param = va_arg(args, NSArray *);
            NSString *str = [NSString stringWithFormat:@"%@", param];
            printf("第%d个参数:%s\n", i, [str UTF8String]);
        } else if (strcmp(value, "f") == 0) {
            // 使用float会有警告
            double param = va_arg(args, double);
            printf("第%d个参数:%.2f\n", i, param);
        } else if (strcmp(value, "d") == 0) {
            double param = va_arg(args, double);
            printf("第%d个参数:%.4f\n", i, param);
        } else if (strcmp(value, "B") == 0) {
            // 使用BOOL/bool会有警告
            int param = va_arg(args, int);
            printf("第%d个参数:%s\n", i, param == 1 ? "YES" : "NO");
        } else if (strcmp(value, "^i") == 0) {
            int *param = va_arg(args, int*);
            printf("第%d个参数:%p\n", i, param);
        } else {
            printf("第%d个参数:未处理的参数类型", i);
        }
//        printf("i:%d, value:%s\n", i, value);
    }
    
    
    RXHookBlockItem *item = [RXHookBlockManager hookBlockItemFromBlockImpl:block_impl];
    ((void (*)(void *, ...))(item.originFuncPtr))(cSelf, args);
    
    va_end(args);
    
}


//struct __block_impl {
//    void *isa;
//    int Flags;
//    int Reserved;
//    void *FuncPtr;
//};

//struct __main_block_impl_0 {
//    struct __block_impl impl;
//    struct __main_block_desc_0* Desc;
//    __Block_byref_a_0 *a; // by ref
//    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, __Block_byref_a_0 *_a, int flags=0) : a(_a->__forwarding) {
//        impl.isa = &_NSConcreteStackBlock;
//        impl.Flags = flags;
//        impl.FuncPtr = fp;
//        Desc = desc;
//    }
//};




void test_tmp(id block)
{
    int t = sizeof(size_t);
    NSLog(@"t:%zd", (long)t);
    
    
    
    int a0 = sizeof(struct RX_main_block_desc);
    int a1 = sizeof(struct RX_block_impl);
    int a2 = sizeof(struct RX_main_block_desc*);
    
    NSLog(@"a0:%zd, a1:%zd, a2:%zd", (long)a0, (long)a1, (long)a2);
    
    RX_main_block_impl *main_block_impl = (__bridge RX_main_block_impl *)block;
    // 这里千万不能用 RX_block_impl impl = main_block_impl->impl;
    // 要不然获取的内存地址不正确
    RX_block_impl *impl = &(main_block_impl->impl);
    
    //RXVerifyExample`__52-[RXSYViewController testHookBlockToPrintHelloWorld]_block_invoke:
    
    
    // 0x000000010074062c
    // RXVerifyExample`__private_HookBlockToPrintHelloWorld:
    // RXVerifyExample`-[RVMsgForwardProxy test]:

    void *exchang = (void *)__private_test2222;
    
    impl->FuncPtr = exchang;
    
//    char *value = (char *)exchang;
//    printf("kkk2:%s\n", value);
    
//    NSString *str = [NSString stringWithUTF8String:value];
//    NSLog(@"str:%@", str);
    
}


// 以下题目都针对于任意 void (^)() 形式的block
// 1. 实现函数,将block的实现修改为 NSLog(@"Hello world")
// 也就是说在调完这个函数后调用block()时,并不调用原始实现,而是输出"Hello world"
void HookBlockToPrintHelloWorld(id block) {
    RX_main_block_impl *main_block_impl = (__bridge RX_main_block_impl *)block;
    // 这里千万不能用 RX_block_impl impl = main_block_impl->impl;
    // 要不然获取的内存地址不正确
    RX_block_impl *impl = &(main_block_impl->impl);
    void *exchang = (void *)__private_HookBlockToPrintHelloWorld;
//    printf("Hook block %p\n", block);
//    printf("Hook main_block_impl %p\n", main_block_impl);
//    printf("Hook impl %p\n", impl);
//    printf("Hook FuncPtr before %p\n", impl->FuncPtr);
//    printf("kkk:%s\n", (char *)impl->FuncPtr);
//
//    printf("kkk2:%s\n", (char *)exchang);

    
    
    impl->FuncPtr = exchang;
//    printf("Hook FuncPtr after %p\n", impl->FuncPtr);
}

void HookBlockToPrintHelloWorld2(id block) {
    
    RX_main_block_impl *main_block_impl = (__bridge RX_main_block_impl *)block;
    // 这里千万不能用 RX_block_impl impl = main_block_impl->impl;
    // 要不然获取的内存地址不正确
    RX_block_impl *impl = &(main_block_impl->impl);
    
    
    printf("kkk:%s", (char *)impl->FuncPtr);
//    printf("Hook block %p\n", block);
//    printf("Hook main_block_impl %p\n", main_block_impl);
//    printf("Hook impl %p\n", impl);
//    printf("Hook FuncPtr before %p\n", impl->FuncPtr);
    rebind_symbols((struct rebinding[2]){{impl->block_descriptor->signature, __private_HookBlockToPrintHelloWorld, &(impl->FuncPtr)}}, 1);

}


// 2. 实现下面的函数, 将block的实现修改成打印所有入参,并调用原始实现
// void (^block)(int a, NSString *b) = ^(int a, NSString *b) {
//    NSLog(@"block invoke");
// }
// HookBlockToPrintArguments(block);
// block(123, @"aaa");
// 输出 "123, aaa" 和  block invoke

// 第二题的可能思路
// https://www.jianshu.com/p/18ca0f43b3cf
void HookBlockToPrintArguments(id block) {
//    NSLog(@"%@", block);
    RX_main_block_impl *main_block_impl = (__bridge RX_main_block_impl *)block;
    RX_block_impl *impl = &(main_block_impl->impl);
    
    [RXHookBlockManager addBlockImpl:impl];
    
    void *exchang = (void *)__private_HookBlockToPrintArguments;
    impl->FuncPtr = exchang;
    
//    NSString *key = [NSString stringWithFormat:@"%p", block];
//    id value = (__bridge id)impl->FuncPtr;
//    [mutDic setObject:CFBridgingRelease(impl->FuncPtr) forKey:key];
    
//    rebind_symbols((struct rebinding[2]){{"func", __private_HookBlockToPrintArguments, &(impl->FuncPtr)}}, 1);
}

// 3. 实现下面的函数,使的调用这个函数之后,后面创建的任意block都能自动实现第二题的功能

void HookEveryBlockToPrintArguments(void) {
    
}




@interface RXSYViewController ()

@end

@implementation RXSYViewController



//struct __block_impl {
//    void *isa;
//    int Flags;
//    int Reserved;
//    void *FuncPtr;
//};

//struct __main_block_impl_0 {
//    struct __block_impl impl;
//    struct __main_block_desc_0* Desc;
//    __Block_byref_a_0 *a; // by ref
//    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, __Block_byref_a_0 *_a, int flags=0) : a(_a->__forwarding) {
//        impl.isa = &_NSConcreteStackBlock;
//        impl.Flags = flags;
//        impl.FuncPtr = fp;
//        Desc = desc;
//    }
//};

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mutDic = [NSMutableDictionary new];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    [self testHookBlockToPrintHelloWorld];
    
    [self testHookBlockToPrintArguments];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testHookBlockToPrintHelloWorld {
    
    
//    __private_test2222(nil, 0, 0);
//
//    void (^block1)(int a, NSString *b) = ^(int a, NSString *b) {
//        NSLog(@"block1 invoke");
//    };
//    HookBlockToPrintHelloWorld(block1);
//    block1(123, @"aaa");
    
    
    void (^block2)(void) = ^() {
        NSLog(@"block2 invoke");
    };
    HookBlockToPrintHelloWorld2(block2);
    block2();
    
    
    
//    block1(10, @"abc");
}
- (void)testHookBlockToPrintArguments
{
//    __private_HookBlockToPrintArguments(nil, 100);
    
    
    
    void (^block1)(int a, NSString *b, NSDictionary *c, NSArray *d, float e, double f, BOOL g, int *h) = ^(int a, NSString *b, NSDictionary *c, NSArray *d, float e, double f, BOOL g, int *h) {
        NSLog(@"block1 invoke");
    };
    HookBlockToPrintArguments(block1);
    int h;
    block1(2, @"aaa", @{@"key1":@"value1"}, @[@(1)], 1.1f, 2.0123123f, YES, &h);
    
    
    void (^block2)(int a) = ^(int a) {
        NSLog(@"block2 invoke");
    };
    HookBlockToPrintArguments(block2);
    block2(100);
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
