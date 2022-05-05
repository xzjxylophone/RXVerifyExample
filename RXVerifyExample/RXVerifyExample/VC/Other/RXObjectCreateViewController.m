//
//  RXObjectCreateViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/4.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXObjectCreateViewController.h"

@interface RXObjectCreateViewController ()

@end

@implementation RXObjectCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 
 13.重用大开销对象
 
 一些objects的初始化很慢，比如NSDateFormatter和NSCalendar。然而，你又不可避免地需要使用它们，比如从JSON或者XML中解析数据。
 
 想要避免使用这个对象的瓶颈你就需要重用他们，可以通过添加属性到你的class里或者创建静态变量来实现。
 
 注意如果你要选择第二种方法，对象会在你的app运行时一直存在于内存中，和单例(singleton)很相似。
 
 下面的代码说明了使用一个属性来延迟加载一个date formatter. 第一次调用时它会创建一个新的实例，以后的调用则将返回已经创建的实例：
 
 // in your .h or inside a class extension
 
 @property (nonatomic, strong) NSDateFormatter *formatter;
 
 // inside the implementation (.m)
 
 // When you need, just use self.formatter
 
 - (NSDateFormatter *)formatter {
 
 if(! _formatter) {
 
 _formatter = [[NSDateFormatter alloc] init];
 
 _formatter.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";// twitter date format
 
 }
 
 return_formatter;
 
 }
 还需要注意的是，其实设置一个NSDateFormatter的速度差不多是和创建新的一样慢的！所以如果你的app需要经常进行日期格式处理的话，你会从这个方法中得到不小的性能提升。
 
 
 **/

- (void)test {
    NSTimeInterval begin, end, time;
    
    NSInteger count = 100000;

    printf("\n===========================\n");

    begin = CACurrentMediaTime();
    @autoreleasepool {
        for (NSInteger i = 0; i < count; i++) {
//            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        }
    }
    end = CACurrentMediaTime();
    time = end -begin;
    
    printf("%-20s:%15.10f\n", "NSDateFormatter", time);
    
    
    begin = CACurrentMediaTime();
    @autoreleasepool {
        for (NSInteger i = 0; i < count; i++) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        }
    }
    end = CACurrentMediaTime();
    time = end -begin;
    
    printf("%-20s:%15.10f\n", "NSDateFormatter set", time);
    
    
    begin = CACurrentMediaTime();
    @autoreleasepool {
        for (NSInteger i = 0; i < count; i++) {
            NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        }
    }
    end = CACurrentMediaTime();
    time = end -begin;
    
    printf("%-20s:%15.10f\n", "NSCalendar", time);

    begin = CACurrentMediaTime();
    @autoreleasepool {
        for (NSInteger i = 0; i < count; i++) {
            NSObject *object = [[NSObject alloc] init];
        }
    }
    end = CACurrentMediaTime();
    time = end -begin;
    
    printf("%-20s:%15.10f\n", "NSObject", time);
    
    
    
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
