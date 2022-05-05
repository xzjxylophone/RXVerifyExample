//
//  RXKSSizeofTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/23.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXKSSizeofTestObject.h"
typedef void (*KSReportWriteCallback_A)(const NSObject* writer);


typedef struct
{
    const char* key;
    const char* value;
    const char* value1;
    const char* value2;
    const char* value3;
    const char* value4;
    int b;
    int c;
} ReportField_A;

typedef struct
{
    KSReportWriteCallback_A userCrashCallback;
    int reportFieldsCount;
    ReportField_A* reportFields[0]; // 这是一个二级指针
} CrashHandlerData_A;


@interface RXKSSizeofTestObject()

@property(nonatomic,readonly,assign) CrashHandlerData_A* crashHandlerData;
@property(nonatomic,readwrite,retain) NSMutableData* crashHandlerDataBacking;
@end
@implementation RXKSSizeofTestObject

- (CrashHandlerData_A *)crashHandlerData
{
    return (CrashHandlerData_A *)self.crashHandlerDataBacking.mutableBytes;
}
- (void)test {
    NSUInteger crashHandlerData_Size = sizeof(*self.crashHandlerData);
    NSUInteger crashHandlerData_reportFields_Size = sizeof(*self.crashHandlerData->reportFields);
    self.crashHandlerDataBacking = [NSMutableData dataWithLength:crashHandlerData_Size + crashHandlerData_reportFields_Size * 500];
    
    CrashHandlerData_A *tmp = self.crashHandlerData;
    
    
    
}
@end
