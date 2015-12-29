//
//  MatchOpration.m
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "MatchOpration.h"
#import "RMMapper.h"
#import "DicMatchinfo.h"
#import "DicTeaminfo.h"
#import "DicGameinfo.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
@implementation MatchOpration

-(instancetype)init
{
    self = [super init];
    
    if (self) {
        
        self.net_sendApi = [[Api alloc] initWithDelegate:self needCommonProcess:nil];
        
        
    }
    
    return self;
}

-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{

//    [APSProgress hidenIndicatorView];
}

-(void)finishedWithScuessData:(NSDictionary *)dic
{

    
    [self parseDataForAllinfo:dic];
    
    
    [APSProgress hidenIndicatorView];

}


-(void)getDataForAllinfoBymatchid:(NSString *)matchid
{

    [APSProgress showIndicatorView];
    
    [self.net_sendApi match_infoByid:@"298"];
    
}

-(void)parseDataForAllinfo:(NSDictionary *)dic
{

    NSDictionary *data = [dic objectForKey:@"data"];
    
    DicMatchinfo *matchinfo = [RMMapper objectWithClass:[DicMatchinfo class] fromDictionary:data];
    
    matchinfo.matchid = [data objectForKey:@"id"];
    
    
    NSDictionary *teama = [data objectForKey:@"teama"];
    
    DicTeaminfo *dicteama = [RMMapper objectWithClass:[DicTeaminfo class] fromDictionary:teama];
    
    NSDictionary *teamb = [data objectForKey:@"teamb"];
    
    DicTeaminfo *dicteamb = [RMMapper objectWithClass:[DicTeaminfo class] fromDictionary:teamb];
    
    NSDictionary *game = [data objectForKey:@"game"];
    
    DicGameinfo *dicgame = [RMMapper objectWithClass:[DicGameinfo class] fromDictionary:game];
    
    matchinfo.teama  = dicteama;
    
    matchinfo.teamb = dicteamb;
    
    matchinfo.gameinfo = dicgame;
    
    matchinfo.formatScheduletime = [ToolUtil tool_utcToNsstring:matchinfo.scheduletime];
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def rm_setCustomObject:matchinfo forKey:[NSString stringWithFormat:@"match%@",matchinfo.matchid]];
    
    [self.delegate data_scuess:matchinfo];
    
}


@end
