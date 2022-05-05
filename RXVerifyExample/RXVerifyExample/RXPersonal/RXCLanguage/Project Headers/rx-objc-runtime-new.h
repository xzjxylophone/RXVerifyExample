//
//  rx-objc-runtime-new.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/5.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#ifndef rx_objc_runtime_new_h
#define rx_objc_runtime_new_h

struct rx_bucket_t {
private:
    int _a;
    int _b;
public:
    inline int a() const { return _a; }
    inline int b() const { return _b; }
    inline void setA(int newA) { _a = newA; }
    inline void setB(int newB) { _b = newB; }
    void set(int newA, int newB);
};

#endif /* rx_objc_runtime_new_h */
