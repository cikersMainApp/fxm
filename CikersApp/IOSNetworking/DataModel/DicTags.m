//
//  DicTags.m
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "DicTags.h"
#import "DicPlayerinfo.h"
#import "RMMapper.h"
@implementation DicTags


-(void)setLatesttaggers:(NSArray *)latesttaggers
{

    if (_array_players == nil) {
        
        _array_players = [[NSMutableArray alloc] init];
        
    }
    
    for (NSDictionary *dic in latesttaggers) {
        
        DicPlayerinfo *info = [RMMapper objectWithClass:[DicPlayerinfo class] fromDictionary:dic];
        
        [_array_players addObject:info];
        
    }
    
}

@end
