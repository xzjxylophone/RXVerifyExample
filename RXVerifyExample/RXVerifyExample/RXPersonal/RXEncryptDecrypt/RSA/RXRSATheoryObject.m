//
//  RXRSATheoryObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXRSATheoryObject.h"

// http://www.ruanyifeng.com/blog/2013/06/rsa_algorithm_part_one.html
// http://www.ruanyifeng.com/blog/2013/07/rsa_algorithm_part_two.html
@implementation RXRSATheoryObject


// 数论中的欧拉函数证明过程非常复杂，其中之一的结论是：
// 对n求欧拉函数，n = p * q, 且p和q都是质数
- (int)Euler_functionWithN:(int)n p:(int)p q:(int)q {
    return (p - 1) * (q - 1);
}
- (int)calculate_random_valueWithEulerFunctionResult:(int)eulerFunctionResult {
    NSMutableArray *ary = [NSMutableArray new];
    BOOL find17 = NO;
    // 加一个i < 100 控制一下列出所有的数据了
    for (int i = 2; i < eulerFunctionResult && i < 100; i++) {
        if (eulerFunctionResult % i != 0) {
            [ary addObject:@(i)];
            if (!find17 && i == 17) {
                find17 = YES;
            }
        }
    }
    NSLog(@"find17:%@", find17 ? @"YES" : @"NO");
    NSLog(@"ary:%@", [ary componentsJoinedByString:@","]);
    return 17;
}
// 计算模反元素
- (int)calculate_Mofan_elementWith_eulerFunctionResult:(int)eulerFunctionResult andE:(int)e {
    int x = 0; int y = 0;
    // 模反元素计算公式： (e * x) + eulerFunctionResult * y = 1;
    // 要保证x是正数，那么y就必须是负数，所以从y负一开始
    NSMutableArray *ary = [NSMutableArray new];
    int d = 0;
    int yMax = -200;
    for (y = -1; y > yMax; y--) {
        int tmp = 1 - y * eulerFunctionResult;
        if (tmp % e == 0) {
            x = tmp / e;
            [ary addObject:@(x)];
            if (x == 2753) {
                d = 2753;
            }
        }
    }
    NSLog(@"possibility mofan:%@", ary);
    return d;
}

// 计算加密
// c = pow(m, e) % n
// 参数： m: 明文，e：公钥的e，n：公钥的n
// 返回值 c： 密文
// 数据太大，pow(m, e)会溢出，所以采取如下的算法
- (int)calculate_encryptWithM:(int)m n:(int)n e:(int)e {
    int c = m;
    for (int i = 1; i < e; i ++) {
        c = c * m;
        if (c > n) {
            c = c % n;
        }
    }
    return c;
}
// 计算解密
// decrypt = pow(c, d) % n
// 参数： c: 密文，e：私钥的d，n：私钥的n(跟公钥的n是一样的)
// 返回值 m： 明文
- (int)calculate_decryptWithC:(int)c n:(int)n d:(int)d {
    int m = c;
    for (int i = 1; i < d; i ++) {
        m = m * c;
        if (m > n) {
            m = m % n;
        }
    }
    return m;
}

- (void)test_encrypt_decrypt_exampleWithM:(int)m n:(int)n publicE:(int)e privateD:(int)d {
    // 密文
    int c = [self calculate_encryptWithM:m n:n e:e];
    NSLog(@"m:%d, c:%d", m, c);
    // 解密后的密文
    int newM = [self calculate_decryptWithC:c n:n d:d];
    NSLog(@"m:%d, newM:%d", m, newM);
}
- (void)test {
    // 第一步，随机选择两个不相等的质数p和q
    int p = 61;
    int q = 53;
    // 第二步，计算p和q的乘积得到n
    int n = p * q;
    // 第三步，计算n的欧拉函数得到eulerFunctionResult
    int eulerFunctionResult = [self Euler_functionWithN:n p:p q:q];
    // 第四步，随机选择一个整数e，1 < e < eulerFunctionResult， 且e与eulerFunctionResult互质
    int e = [self calculate_random_valueWithEulerFunctionResult:eulerFunctionResult];
    // 第五步，计算e与eulerFunctionResult的模反元素d
    int d = [self calculate_Mofan_elementWith_eulerFunctionResult:eulerFunctionResult andE:e];
    
    NSLog(@"p:%d, q:%d, n:%d, eulerFunctionResult:%d, e:%d, d:%d", p, q, n, eulerFunctionResult, e, d);
    NSString *publicKey = [NSString stringWithFormat:@"%d-%d", n, e];
    NSString *privateKey = [NSString stringWithFormat:@"%d-%d", n, d];
    NSLog(@"publicKey:%@, privateKey:%@", publicKey, privateKey);
    
    // 明文 m
    int m = 65;
    
    [self test_encrypt_decrypt_exampleWithM:m n:n publicE:e privateD:d];
}
@end
