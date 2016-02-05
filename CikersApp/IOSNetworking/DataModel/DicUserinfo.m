//
//  DicUserinfo.m
//  CikersApp
//
//  Created by fxm on 15/12/30.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "DicUserinfo.h"
#import "RMMapper.h"
#import "DicTeaminfo.h"
@implementation DicUserinfo

-(void)setLiteteams:(NSArray *)liteteams
{

    _liteteams = liteteams;
    
    if (![_liteteams isEqual:[NSNull null]]) {
        
        self.teams = [[NSMutableArray alloc] init];
        
        for (NSDictionary *elem_dic in _liteteams) {
            
            DicTeaminfo *info = [RMMapper objectWithClass:[DicTeaminfo class] fromDictionary:elem_dic];
            [self.teams addObject:info];
        }
    }
    
}


-(void)setSocial:(NSDictionary *)social
{

    _social = social;
    
    if (![_social isEqual:[NSNull null]]) {
        
        self.favorcount = [_social objectForKey:@"favorcount"];
        self.followcount = [_social objectForKey:@"followcount"];
        self.followercount = [_social objectForKey:@"followercount"];
        self.postcount = [_social objectForKey:@"postcount"];
        self.viewcount = [_social objectForKey:@"viewcount"];
        
    }
    
}

@end
