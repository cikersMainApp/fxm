//
//  DicMatchinfo.m
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "DicMatchinfo.h"

@implementation DicMatchinfo

-(void)dic_exchangData
{

    if ([self.endtime isEqual:[NSNull null]]) {
        self.endtime = [NSNumber numberWithInt:1];
    }
    if ([self.starttime isEqual:[NSNull null]]) {
        self.starttime = [NSNumber numberWithInt:1];
    }
    
    
    
    
    self.time_endtime = [ToolUtil tool_utcToNsstring:self.endtime];
    self.time_scheduletime = [ToolUtil tool_utcToNsstring:self.scheduletime];
    self.time_starttime = [ToolUtil tool_utcToNsstring:self.starttime];
}

@end
