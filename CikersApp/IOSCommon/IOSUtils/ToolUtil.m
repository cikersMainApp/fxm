//
//  ToolUtil.m
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "ToolUtil.h"

@implementation ToolUtil

/*
 从java返回来的时间有两种格式 10 13
 */
+(NSString*)tool_utcToNsstring:(NSNumber*)time
{
    NSString *str_time = [NSString stringWithFormat:@"%@",time];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[str_time doubleValue] / 1000];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd hh:mm"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

+(NSNumber*)tool_returnCurTime
{
    
    NSDate *date = [NSDate date];
    NSTimeInterval timeStamp= [date timeIntervalSince1970];
    return [NSNumber numberWithDouble:timeStamp];
}
/*
 YES 代表checktime 在未来
 NO  代表checktime 在过去
 */
+(BOOL)tool_checktimeIsTomorrow:(NSNumber *)checktime
{

//    NSNumber *curTime = [ToolUtil tool_returnCurTime];
    
    BOOL bool_result = NO;
    
    bool_result = (14429934> [checktime doubleValue]/1000)?NO:YES;
    
    return bool_result;
}
/**
 * @brief 判断当前时间是否在fromHour和toHour之间。如，fromHour=8，toHour=23时，即为判断当前时间是否在8:00-23:00之间
 */
+(BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour
{
    NSDate *date8 = [ToolUtil getCustomDateWithHour:8];
    NSDate *date23 = [ToolUtil getCustomDateWithHour:23];
    
    NSDate *currentDate = [NSDate date];
    
    if ([currentDate compare:date8]==NSOrderedDescending && [currentDate compare:date23]==NSOrderedAscending)
    {
        return YES;
    }
    return NO;
}
/**
 * @brief 生成当天的某个点（返回的是伦敦时间，可直接与当前时间[NSDate date]比较）
 * @param hour 如hour为“8”，就是上午8:00（本地时间）
 */
+ (NSDate *)getCustomDateWithHour:(NSInteger)hour
{
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}
@end
