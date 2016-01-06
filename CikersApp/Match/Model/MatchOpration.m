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
    self = [super initWithDelegate:self needCommonProcess:NO];
    
    if (self) {
        
        
        
    }
    
    return self;
}

-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{

    [APSProgress hidenIndicatorView];

    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:nil];
    
    if ([request.apiName isEqual:NET_MATCH_INFO]) {

        [self parseDataForAllinfo:dic];
   
    }
    
    if ([request.apiName isEqual:NET_PREDICT_SEND])
    {
        [self parseDataForSendPrediction:dic];
    }

    if ([request.apiName isEqual:NET_PREDICT_RESULT])
    {
        [self parseDataForPrediction:dic];
    }
    
    if ([request.apiName isEqual:NET_TEAM_PLAYER]) {
        
        [self parsePlayerInfo:dic];
    }
    

    if ([request.apiName isEqual:NET_WIKI]) {
        [self parseWiki:dic];
    }
    
    if ([request.apiName isEqual:NET_MATCH_MVP_VOTE])
    {
        [self parseMvpVote:dic];
    }
    
    if ([request.apiName isEqual:NET_MATCH_VOTE_SEND]) [self parseFovar:dic];
    

}

-(void)finishedWithScuessData:(NSDictionary *)dic
{

}


-(void)getDataForAllinfoBymatchid:(NSString *)matchid
{

    [APSProgress showIndicatorView];
    
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@match/%@",HOST,matchid];
    
    self.http_tag = NET_MATCH_INFO;
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil httpTag:self.http_tag];
    
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
    
    //转换时间
    
    matchinfo.formatScheduletime = [ToolUtil tool_utcToNsstring:matchinfo.scheduletime];
    
    //判断比分是否为nil
    
    matchinfo.score = ([matchinfo.score isEqual:[NSNull null]])?@"VS":matchinfo.score;
    
    NSLog(@"----%@",matchinfo.score);
    
    //判断比赛是否结束
    
    matchinfo.isWaiting = ([matchinfo.result isEqual:[NSNull null]])?[NSNumber numberWithInt:1]:[NSNumber numberWithInt:0];
    
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def rm_setCustomObject:matchinfo forKey:[NSString stringWithFormat:@"match%@",matchinfo.matchid]];
    
    [self.delegate data_scuess:matchinfo];
    
}

#pragma mark -
#pragma mark Prediction

//得到竞猜结果
-(void)getDataForPredictionBymatchid:(NSString*)matchid
{
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@predict/bymatch/%@",HOST,matchid];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil httpTag:NET_PREDICT_RESULT];
}
-(void)parseDataForPrediction:(NSDictionary*)dic
{
    [self.delegate data_scuess:dic];
}
//发送竞猜
-(void)sendForPredictionBymatchid:(NSString*)matchid code:(NSString*)type
{
    [APSProgress showIndicatorView];
    
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@predict/bet/%@",HOST,matchid];
    
    NSDictionary *params=@{@"code":type,};
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params httpTag:NET_PREDICT_SEND];
    
}
-(void)parseDataForSendPrediction:(NSDictionary *)dic
{

}


#pragma mark -
#pragma mark Favor

-(void)sendFovarBymatchid:(NSString *)matchid teamid:(NSString *)teamid
{

    
    NSString *apiUrl=[NSString stringWithFormat:@"%@match/teamvote/%@/%@",HOST,matchid,teamid];
    
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:nil httpTag:NET_MATCH_VOTE_SEND];

}

-(void)parseFovar:(NSDictionary *)dic
{

}


-(void)sendMvpVoteBymatchid:(NSString *)matchid playerid:(NSString *)playerid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@match/mvpvote/%@/%@",HOST,matchid,playerid];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:nil httpTag:NET_MATCH_MVP_VOTE];
}

-(void)parseMvpVote:(NSDictionary *)dic
{

}


#pragma mark -
#pragma mark players

-(void)getPlayersInfoByteamid:(NSString*)teamid matchid:(NSString*)matchid
{

    [APSProgress showIndicatorView];
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@player/listbyteam",HOST];
    
    NSDictionary *params=@{@"tid":teamid,};
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params httpTag:NET_TEAM_PLAYER];

    
}

-(void)parsePlayerInfo:(NSDictionary *)dic
{

    [APSProgress hidenIndicatorView];
    
//    NSDictionary *data = [dic objectForKey:@"data"];
    
    [self.delegate dataTag_scuess:dic];
}


#pragma mark -
#pragma mark wiki

-(void)getWikiBymatchid:(NSString *)matchid offset:(NSString*)offset
{
    [APSProgress showIndicatorView];
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@?limit=%@&offset=%@",HOST,@"wiki/listbyteam/",matchid,@"10",offset];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL httpTag:NET_WIKI];
    

}

-(void)parseWiki:(NSDictionary *)dic
{
    [APSProgress hidenIndicatorView];
    
    [self.delegate dataWiki_scuess:dic];
}


@end
