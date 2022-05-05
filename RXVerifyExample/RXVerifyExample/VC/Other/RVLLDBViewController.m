//
//  RVLLDBViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 2017/11/13.
//  Copyright © 2017年 Rush.D.Xzj. All rights reserved.
//

#import "RVLLDBViewController.h"
#import "RXAObject.h"
@interface RVLLDBViewController () {
    NSString *_name;
}

@property (nonatomic, copy) void (^testBlock)(void);

@property (nonatomic, copy) NSString *testName;

@end

@implementation RVLLDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self test1];
    
//    [self test3];
    
    [self test4];
    
//    [self performSelector:NSSelectorFromString(@"abcTest")];
    
//    [self abcTest];
    
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    BOOL result = [super resolveInstanceMethod:sel];
    NSLog(@"%zd", result);
    return result;
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(abcTest)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if (anInvocation.selector == @selector(abcTest)) {
        RXAObject *obj = [RXAObject new];
        [anInvocation invokeWithTarget:obj];
    }
    NSLog(@"forward");
}
- (id)forwardingTargetForSelector:(SEL)aSelector
{
//    id result = [super forwardingTargetForSelector:aSelector];
    return [RXAObject new];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test4 {
    NSArray *ary1 = @[@"11", @"22"];
    NSArray *ary2 = [ary1 copy];
    NSArray *ary3 = [ary1 mutableCopy];
    
    NSLog(@"ary1: %@ %p", [ary1 class], ary1);
    NSLog(@"ary2: %@ %p", [ary2 class], ary2);
    NSLog(@"ary3: %@ %p", [ary3 class], ary3);
    
    
    NSLog(@"ary1: %@ %p", [ary1 class], ary1);

    NSMutableArray *ary4 = (NSMutableArray *)ary3;
    NSLog(@"ary4: %@ %p", [ary4 class], ary4);
    [ary4 addObject:@"33"];
    
    
    
    NSMutableArray *mAry1 = [NSMutableArray arrayWithArray:ary1];
    NSMutableArray *mAry2 = [mAry1 copy];
    NSMutableArray *mAry3 = [mAry1 mutableCopy];
    NSLog(@"mAry1: %@ %p", [mAry1 class], mAry1);
    NSLog(@"mAry2: %@ %p", [mAry2 class], mAry2);
    NSLog(@"mAry3: %@ %p", [mAry3 class], mAry3);
    NSLog(@"mAry3: %@ %p", [mAry3 class], mAry3);
    
//    [mAry2 addObject:@"33"]; // 崩溃
    [mAry3 addObject:@"33"];
    
    NSDictionary *dic = @{@"key1": @"1111",
                          @"key2": @"2222"
                          };
    NSLog(@"dic:%@", dic);
//    [dic setValue:@"11111111" forKey:@"key1"];
    
    
    NSLog(@"dic:%@", dic);
    
    NSMutableDictionary *mutDic = [NSMutableDictionary new];
    [mutDic setValue:@"1111" forKey:@"key1"];
    NSLog(@"mutDic:%@", mutDic);
    [mutDic setValue:nil forKey:@"key1"];
    NSLog(@"mutDic:%@", mutDic);
    
    NSObject *obj = [NSObject new];
    
    
    
    
}


- (void)test3 {
    
    int val = 3;
    void (^blockName)(void) = ^ {
        NSLog(@"block val:%zd", (long)val);
    };
    
    val = val + 1;
    NSLog(@"func val:%zd", (long)val);
    
    NSLog(@"block:%@", blockName);
    
    blockName();
    
    _name = @"32222";
    
    __weak typeof (self) weakSelf = self;
    self.testBlock = ^ {
        NSLog(@"%p", _name);
        _name = @"11111";
        NSLog(@"%p", _name);
        _name = [[NSMutableString alloc] initWithString:@"3333"];
        NSLog(@"%p", _name);
        // self.testName = @"22222";
    };
    
//    CFGetRetainCount(__autoreleasing)
    
    self.testBlock();
    
    NSLog(@"name:%@", _name);
    NSLog(@"%p", _name);
    
}


- (void)test2 {
    
    
    void (^blockName)(void) = ^ {
        _name = @"11111";
    };
    
    
    NSLog(@"block:%@", blockName);
    
    self.testBlock = ^ {
        _name = @"11111";
//        self.testName = @"22222";
    };
    
    self.testBlock();
    
    NSLog(@"name:%@", _name);
    
}
    

- (void)test1 {
    for (NSInteger i = 0; i < 10; i++) {
        NSLog(@"i:%zd", i);
        NSLog(@"ii:%zd", i);
        NSLog(@"iiii:%zd", i);
        NSLog(@"iiiiii:%zd", i);
        NSLog(@"iiiiiiii:%zd", i);
    }
    
    if ([self yesOrNo]) {
        NSLog(@"yes");
    } else {
        NSLog(@"no");
    }
}


- (BOOL)yesOrNo {
    int rand = random() % 10;
    NSLog(@"rand:%zd", rand);
    if (rand > 5) {
        return YES;
    } else {
        return NO;
    }
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
