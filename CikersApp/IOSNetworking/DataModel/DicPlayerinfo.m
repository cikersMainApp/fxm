//
//  DicPlayerinfo.m
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "DicPlayerinfo.h"
#import "DicTeaminfo.h"
#import "RMMapper.h"
@implementation DicPlayerinfo

-(void)checkData
{


    
}
-(void)setPortrait:(NSString *)portrait
{

    _portrait = portrait;
    _icon = (_icon == nil || _icon.length == 0)?portrait:_icon;

}

-(void)setIcon:(NSString *)icon
{
    _icon = icon;
}

-(void)setLiteteams:(NSMutableArray *)liteteams
{
    _liteteams = liteteams;
 
    if([_liteteams isEqual:@""])
        return;
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *info in _liteteams)
    {
        DicTeaminfo *team = [RMMapper objectWithClass:[DicTeaminfo class] fromDictionary:info];
        [array addObject:team];
    }

    _liteteams = array;
}




@end
