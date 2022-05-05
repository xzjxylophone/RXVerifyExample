//
//  RXMacroViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/7/5.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMacroViewController.h"
// 此类主要是对 https://blog.csdn.net/hopedark/article/details/20699723 文章的学习
@interface RXMacroViewController ()

@end

@implementation RXMacroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self test_MIN1];
    
    [self test_MIN2];
    
    [self test_MIN3];
    
    [self test_MIN4];
}


#define RXMACRO_MIN1(A, B) A < B ? A : B
- (void)test_MIN1
{
    int a = RXMACRO_MIN1(1, 2);
//    int a = 1 < 2 ? 1 : 2;
    printf("test_MIN1:min1:%d\n", a);
    
    int b = 2 * RXMACRO_MIN1(3, 4);
    // int b = 2 * 3 < 4 ? 3 : 4;
    printf("test_MIN1:min1:%d\n", b);
}

#define RXMACRO_MIN2(A, B) (A < B ? A : B)
- (void)test_MIN2
{
    int b = 2 * RXMACRO_MIN2(3, 4);
    // int b = 2 * (3 < 4 ? 3 : 4);
    printf("test_MIN2:min2:%d\n", b);
}


#define RXMACRO_MIN3(A,B) ((A) < (B) ? (A) : (B))
- (void)test_MIN3
{
    int a = RXMACRO_MIN2(3, 4 < 5 ? 4 : 5);
    // => int a = (3 < 4 < 5 ? 4 : 5 ? 3 : 4 < 5 ? 4 : 5);  //希望你还记得运算符优先级
    // => int a = ((3 < (4 < 5 ? 4 : 5) ? 3 : 4) < 5 ? 4 : 5);  //为了您不太纠结，我给这个式子加上了括号
    // => int a = ((3 < 4 ? 3 : 4) < 5 ? 4 : 5)
    // => int a = (3 < 5 ? 4 : 5)
    // => int a = 4
    printf("test_MIN3:min2:%d\n", a);
    
    int b = RXMACRO_MIN2(3, RXMACRO_MIN2(4, 5));
    printf("test_MIN3:min2:%d\n", b);
    
    
    int c = RXMACRO_MIN3(3, RXMACRO_MIN2(4, 5));
    printf("test_MIN3:min3:%d\n", c);
    
    
    int d = RXMACRO_MIN3(3, 4 < 5 ? 4 : 5);
    printf("test_MIN3:min3:%d\n", d);
    
}

#define RXMACRO_MIN4(A,B) ({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a < __b ? __a : __b; })

// ({})

#define RXMACRO_MIN4_2(A,B) \
    ({ \
        __typeof__(A) __a = (A); \
        __typeof__(B) __b = (B); \
        __a < __b ? __a : __b; \
    })
- (void)test_MIN4
{
//    int __a = 1;
//    int __b = 2;
//    RXMACRO_MIN4_2(__a, __b);
    
    
    float a = 1;
    float b = RXMACRO_MIN3(a++, 0.9f);
    // => float b = ((a++) < (0.9f) ? (a++) : (0.9f))
    printf("test_MIN4:min3:a:%.2f,b:%.2f\n", a, b);
    
    
    float c = 1.0f;
    float d = RXMACRO_MIN3(c++, 1.5f);
    // => int d = ((c++) < (1.5f) ? (c++) : (1.5f))
    printf("test_MIN4:min3:c:%.2f,d:%.2f\n", c, d);
    
    int e = ({
        int f = 10;
        int g = 20;
        f + g;
    });
    printf("test_MIN4:e:%d\n", e);
    
    float h = 1.0f;
    float i = RXMACRO_MIN4(h++, 1.5f);
    printf("test_MIN4:min4:h:%.2f,i:%.2f\n", h, i);
    {
        float __a = 1.0f;
        float __b = RXMACRO_MIN4(__a, 1.5f);
        printf("test_MIN4:min4:__a:%.2f,__b:%.2f\n", __a, __b);
    }
}
#define __NSX_PASTE__(A,B) A##B


//__a1110;
//__b1110;
#if !defined(MIN)
#define __NSMIN_IMPL__(A,B,L) \
        ({ __typeof__(A) __NSX_PASTE__(__a,L) = (A); \
            __typeof__(B) __NSX_PASTE__(__b,L) = (B); \
            (__NSX_PASTE__(__a,L) < __NSX_PASTE__(__b,L)) ? __NSX_PASTE__(__a,L) : __NSX_PASTE__(__b,L); \
        })
#define MIN(A,B) __NSMIN_IMPL__(A,B,__COUNTER__)
#endif

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
