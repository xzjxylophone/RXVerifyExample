//
//  RXDateManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/11/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXDateManager.h"

@implementation RXDateManager

- (void)test {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"]; // 年-月
    NSString *dateStr = @"2019-08-01";
    NSDate *date = [formatter dateFromString:dateStr];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit: NSCalendarUnitMonth forDate:date];
    
    [formatter setDateFormat:@"yyyy-MM"];
    NSString *str1 = [formatter stringFromDate:date];
    [formatter setDateFormat:@"yyyy年MM"];
    NSString *str2 = [formatter stringFromDate:date];
    NSMutableString *mutString = [NSMutableString new];

    [mutString appendString:@"\n"];
    for (NSInteger i = 1; i <= range.length; i++) {
        NSString *sr1 = [NSString stringWithFormat:@"%@-%02ld", str1, (long)i];
        NSString *week = [self weekDayStr:sr1];
        NSString *sr2 = [NSString stringWithFormat:@"%@月%02ld日", str2, (long)i];
        [mutString appendFormat:@"## %@ %@\n", sr2, week];
        [mutString appendString:@">\n"];
        [mutString appendString:@">\n"];
        [mutString appendString:@">\n"];
        [mutString appendString:@"\n"];
    }
    [mutString appendString:@"\n"];
    [mutString appendString:@"\n"];
    NSLog(@"%@", mutString);
}

- (NSString *)weekDayStr:(NSString *)format {
    NSString *weekDayStr = nil;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    if (format.length >= 10) {
        NSString *nowString = [format substringToIndex:10];
        NSArray *array = [nowString componentsSeparatedByString:@"-"];
        if (array.count == 0) {
            array = [nowString componentsSeparatedByString:@"/"];
        }
        
        if (array.count >= 3) {
            NSInteger year = [[array objectAtIndex:0] integerValue];
            NSInteger month = [[array objectAtIndex:1] integerValue];
            NSInteger day = [[array objectAtIndex:2] integerValue];
            [comps setYear:year];
            [comps setMonth:month];
            [comps setDay:day];
        }
    }
    //日历
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //获取传入date
    NSDate *_date = [gregorian dateFromComponents:comps];
    
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:_date];
    NSInteger week = [weekdayComponents weekday];
    switch(week) {
        case 1:
            weekDayStr =@"星期日";
            break;
        case 2:
            weekDayStr =@"星期一";
            break;
        case 3:
            weekDayStr =@"星期二";
            break;
        case 4:
            weekDayStr =@"星期三";
            break;
        case 5:
            weekDayStr =@"星期四";
            break;
        case 6:
            weekDayStr =@"星期五";
            break;
        case 7:
            weekDayStr =@"星期六";
            break;
        default:
            weekDayStr =@"";
            break;
    }
    return weekDayStr;
}



#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}
+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end
