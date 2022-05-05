
//  RXRuntimeFishHookUtil.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXRuntimeFishHookUtil.h"
#import "fishhook.h"

static id (*origin_objc_autorelease)(id);
static void (*origin_objc_autoreleasePoolPop)(void *);
static void *(*origin_objc_autoreleasePoolPush)(void);
static id (*origin_objc_autoreleaseReturnValue)(id);
static void (*origin_objc_copyWeak)(id *, id *);
static void (*origin_objc_destroyWeak)(id *);
static id (*origin_objc_initWeak)(id *, id);
static id (*origin_objc_loadWeak)(id *);
static id (*origin_objc_loadWeakRetained)(id *);
static void (*origin_objc_moveWeak)(id *, id *);
static void (*origin_objc_release)(id);
static id (*origin_objc_retain)(id);
static id (*origin_objc_retainAutorelease)(id);
static id (*origin_objc_retainAutoreleaseReturnValue)(id);
static id (*origin_objc_retainAutoreleasedReturnValue)(id);
static id (*origin_objc_retainBlock)(id);
static void (*origin_objc_storeStrong)(id *, id);
static id (*origin_objc_storeWeak)(id *, id);

id my_objc_autorelease(id value) {
    printf("my_objc_autorelease\n");
    return origin_objc_autorelease(value);
}
void my_objc_autoreleasePoolPop(void *pool) {
    printf("my_objc_autoreleasePoolPop\n");
    origin_objc_autoreleasePoolPop(pool);
}
void *my_objc_autoreleasePoolPush(void) {
    printf("my_objc_autoreleasePoolPush\n");
    return origin_objc_autoreleasePoolPush();
}
id my_objc_autoreleaseReturnValue(id value) {
    printf("my_objc_autoreleaseReturnValue\n");
    return origin_objc_autoreleaseReturnValue(value);
}
void my_objc_copyWeak(id *dest, id *src) {
    printf("my_objc_copyWeak\n");
    origin_objc_copyWeak(dest, src);
}
void my_objc_destroyWeak(id *object) {
    printf("my_objc_destroyWeak\n");
    origin_objc_destroyWeak(object);
}
id my_objc_initWeak(id *object, id value) {
    printf("my_objc_initWeak\n");
    return origin_objc_initWeak(object, value);
}
id my_objc_loadWeak(id *object) {
    printf("my_objc_loadWeak\n");
    return origin_objc_loadWeak(object);
}
id my_objc_loadWeakRetained(id *object) {
    printf("my_objc_loadWeakRetained\n");
    return origin_objc_loadWeakRetained(object);
}
void my_objc_moveWeak(id *dest, id *src) {
    printf("my_objc_moveWeak\n");
    origin_objc_moveWeak(dest, src);
}
void my_objc_release(id value) {
    printf("my_objc_release\n");
    origin_objc_release(value);
}
id my_objc_retain(id value) {
    printf("my_objc_retain\n");
    return origin_objc_retain(value);
}
id my_objc_retainAutorelease(id value) {
    printf("my_objc_retainAutorelease\n");
    return origin_objc_retainAutorelease(value);
}
id my_objc_retainAutoreleaseReturnValue(id value) {
    printf("my_objc_retainAutoreleaseReturnValue\n");
    return origin_objc_retainAutoreleaseReturnValue(value);
}
id my_objc_retainAutoreleasedReturnValue(id value) {
    printf("my_objc_retainAutoreleasedReturnValue\n");
    return origin_objc_retainAutoreleasedReturnValue(value);
}
id my_objc_retainBlock(id value) {
    printf("my_objc_retainBlock\n");
    return origin_objc_retainBlock(value);
}
void my_objc_storeStrong(id *object, id value) {
    printf("my_objc_storeStrong\n");
    origin_objc_storeStrong(object, value);
}
id my_objc_storeWeak(id *object, id value) {
    printf("my_objc_storeWeak\n");
    return origin_objc_storeWeak(object, value);
}

@implementation RXRuntimeFishHookUtil

//id objc_autorelease(id value);
//void objc_autoreleasePoolPop(void *pool);
//void *objc_autoreleasePoolPush(void);
//id objc_autoreleaseReturnValue(id value);
//void objc_copyWeak(id *dest, id *src);
//void objc_destroyWeak(id *object);
//id objc_initWeak(id *object, id value);
//id objc_loadWeak(id *object);
//id objc_loadWeakRetained(id *object);
//void objc_moveWeak(id *dest, id *src);
//void objc_release(id value);
//id objc_retain(id value);
//id objc_retainAutorelease(id value);
//id objc_retainAutoreleaseReturnValue(id value);
//id objc_retainAutoreleasedReturnValue(id value);
//id objc_retainBlock(id value);
//void objc_storeStrong(id *object, id value);
//id objc_storeWeak(id *object, id value);


+ (void)hook
{
    struct rebinding binds[1];
    
//    binds[0] = (struct rebinding){"objc_autorelease", my_objc_autorelease, (void*)&origin_objc_autorelease};
//    binds[0] = (struct rebinding){"objc_autoreleasePoolPop", my_objc_autoreleasePoolPop, (void*)&origin_objc_autoreleasePoolPop};
//    binds[0] = (struct rebinding){"objc_autoreleasePoolPush", my_objc_autoreleasePoolPush, (void*)&origin_objc_autoreleasePoolPush};
//    binds[0] = (struct rebinding){"objc_autoreleaseReturnValue", my_objc_autoreleaseReturnValue, (void*)&origin_objc_autoreleaseReturnValue};
//    binds[0] = (struct rebinding){"objc_copyWeak", my_objc_copyWeak, (void*)&origin_objc_copyWeak};
//    binds[0] = (struct rebinding){"objc_destroyWeak", my_objc_destroyWeak, (void*)&origin_objc_destroyWeak};
//    binds[0] = (struct rebinding){"objc_initWeak", my_objc_initWeak, (void*)&origin_objc_initWeak};
//    binds[0] = (struct rebinding){"objc_loadWeak", my_objc_loadWeak, (void*)&origin_objc_loadWeak};
//    binds[0] = (struct rebinding){"objc_loadWeakRetained", my_objc_loadWeakRetained, (void*)&origin_objc_loadWeakRetained};
    binds[0] = (struct rebinding){"objc_moveWeak", my_objc_moveWeak, (void*)&origin_objc_moveWeak};
//    binds[0] = (struct rebinding){"objc_release", my_objc_release, (void*)&origin_objc_release};
//    binds[0] = (struct rebinding){"objc_retain", my_objc_retain, (void*)&origin_objc_retain};
//    binds[0] = (struct rebinding){"objc_retainAutorelease", my_objc_retainAutorelease, (void*)&origin_objc_retainAutorelease};
//    binds[0] = (struct rebinding){"objc_retainAutoreleaseReturnValue", my_objc_retainAutoreleaseReturnValue, (void*)&origin_objc_retainAutoreleaseReturnValue};
//    binds[0] = (struct rebinding){"objc_retainAutoreleasedReturnValue", my_objc_retainAutoreleasedReturnValue, (void*)&origin_objc_retainAutoreleasedReturnValue};
//    binds[0] = (struct rebinding){"objc_retainBlock", my_objc_retainBlock, (void*)&origin_objc_retainBlock};
//    binds[0] = (struct rebinding){"objc_storeStrong", (void *)my_objc_storeStrong, (void*)&origin_objc_storeStrong};
//    binds[0] = (struct rebinding){"objc_storeWeak", my_objc_storeWeak, (void*)&origin_objc_storeWeak};
    
    rebind_symbols(binds, 1);
    
//    NSLog(@"my_objc_retainBlock:)
}
@end
















