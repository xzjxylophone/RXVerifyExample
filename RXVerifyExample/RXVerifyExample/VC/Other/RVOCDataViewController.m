//
//  RVOCDataViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/12/22.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVOCDataViewController.h"

@interface RVOCDataViewController ()

@end

@implementation RVOCDataViewController


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self testOCBaseData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Test

- (void)testOCBaseData
{
    
    NSMutableArray *array = [NSMutableArray new];
    NSObject *object = [NSObject new];
    
    [array addObject:object];
    [array addObject:object];
    [array addObject:object];
    
    NSMutableSet *set = [NSMutableSet new];
    [set addObject:object];
    [set addObject:object];
    [set addObject:object];
    [set addObject:object];
    
    NSSet *set2 = [[NSSet alloc] initWithArray:array];
    
    
    NSLog(@"%zd, %zd, %zd", array.count, set.count, set2.count);
    
    
//    NSOrderedSet *orderedSet = nil;
    
//    NSHashTable *hashTable = [NSHashTable hashTableWithOptions:(NSPointerFunctionsOptions)];
//    NSMapTable *mapTabel = [NSMapTable new];
    
    
}












@end
