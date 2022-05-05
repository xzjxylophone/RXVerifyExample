//
//  RXHookBlockManager.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/7/6.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

// http://clang.llvm.org/docs/Block-ABI-Apple.html
// http://clang.llvm.org/docs/UsersManual.html#gcc-extensions-not-implemented-yet
typedef struct RX_block_impl {
    void *isa;  // 8字节
    int Flags; // 4字节
    int Reserved; // 4字节
    void *FuncPtr; // 8字节
    
    struct RX_block_descriptor {
        unsigned long int reserved;         // NULL
        unsigned long int size;         // sizeof(struct Block_literal_1)
        // optional helper functions
        void (*copy_helper)(void *dst, void *src);     // IFF (1<<25)
        void (*dispose_helper)(void *src);             // IFF (1<<25)
        // required ABI.2010.3.16
        const char *signature;                         // IFF (1<<30)
        
    } *block_descriptor;
}RX_block_impl;


typedef struct RX_main_block_desc {
    size_t reserved; // 8字节
    size_t Block_size; // 8字节
}RX_main_block_desc;



typedef struct RX_main_block_impl {
    struct RX_block_impl impl;
    struct RX_main_block_desc* Desc;
}RX_main_block_impl;

@interface RXHookBlockItem : NSObject

@property (nonatomic, assign) void *block_impl_address;
@property (nonatomic, assign) void *originFuncPtr;
@property (nonatomic, copy) NSString *objCTypes;
@property (nonatomic, copy) NSString *signature;

- (id)initWithRX_block_impl:(RX_block_impl *)impl;



@end


@interface RXHookBlockManager : NSObject

+ (void)addBlockImpl:(RX_block_impl *)impl;
+ (void)addHookBlockItem:(RXHookBlockItem *)item;

+ (RXHookBlockItem *)hookBlockItemFromBlockImpl:(RX_block_impl *)impl;
@end
