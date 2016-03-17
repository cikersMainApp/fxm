//
//  DicMessage.m
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "DicMessage.h"

@implementation DicMessage

-(void)setPubdate:(NSNumber *)pubdateex
{
    _pubdate = pubdateex;
 
    _time_pubdate = [ToolUtil tool_utcToNsstring:_pubdate];
}

-(void)setReadStatus:(NSString *)readStatusex
{

    _readStatus = readStatusex;
    
    _bool_readstatus = NO;
    
    if ([_readStatus isEqual:@"1"])
    {
        _bool_readstatus = YES;
    }
    
}

@end
