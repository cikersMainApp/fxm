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
    NSString *timeStamp2 = [NSString stringWithFormat:@"%@",time];
    
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:[timeStamp2 doubleValue] / 1000];
//    NSLog(@"时间戳转日期 %@  = %@", timeStamp2, date2);

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd hh:mm"];
    NSString *dateString = [dateFormatter stringFromDate:date2];
//    NSLog(@"dateString:%@",dateString);
    
    return dateString;
}

+(NSNumber*)tool_curUnitTime
{
    
    NSDate *date = [NSDate date];
//    NSLog(@"当前日期为:%@",date);
    NSTimeInterval timeStamp= [date timeIntervalSince1970];
//    NSLog(@"日期转换为时间戳 %@ = %f", date, timeStamp);
    
    return [NSNumber numberWithDouble:timeStamp];
}

@end
