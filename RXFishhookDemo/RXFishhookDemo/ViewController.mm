//
//  ViewController.m
//  RXFishhookDemo
//
//  Created by xuzhijun on 2019/8/16.
//  Copyright © 2019 xuzhijun. All rights reserved.
//

#import "ViewController.h"
#include "mach-o/fat.h"
#include "mach-o/loader.h"



#define KK_KK            ((cpu_type_t) -1)


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    int a = (int) 1;
//    int b = CPU_TYPE_ANY;
//    int b2 = (int) -2;
//    int c = CPU_TYPE_VAX;
//
//    NSInteger aa = -1;
//
//    NSLog(@"a:%zd, b:%zd, b2:%zd, c:%zd", a, b, b2, c);
//    NSLog(@"a:%zd, b:%d, b2:%d, c:%zd", a, b, b2, c);
//    NSLog(@"aa:%zd", aa);
//
//    int d = 0;
    
    short int x;
    char x0,x1;
    x = 0x1122;
    x0 = ((char*)&x)[0]; //低地址单元
    x1 = ((char*)&x)[1]; //高地址单元
    NSLog(@"0x%x", x0);
    NSLog(@"0x%x", x1);
    NSLog(@"111");
    
    
//    return 0;
}


@end
