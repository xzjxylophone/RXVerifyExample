//
//  main.m
//  RXFishhookDemo
//
//  Created by xuzhijun on 2019/8/16.
//  Copyright © 2019 xuzhijun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        const char *filename = argv[0];
        printf("%s\n", filename);
        
        int i = 0;
        int arr[3] = {0};
        for(; i<=3; i++){
            arr[i] = 0;
            printf("hello world\n");
        }
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
