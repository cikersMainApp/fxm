//
//  ToolUtil.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolUtil : NSObject

+(NSString*)tool_utcToNsstring:(NSNumber*)time;
+(BOOL)tool_checktimeIsTomorrow:(NSNumber *)checktime;
+(NSNumber*)tool_returnCurTime;
+(BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour;
+ (NSDate *)getCustomDateWithHour:(NSInteger)hour;

@end
