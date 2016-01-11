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
#import "DicPlayerinfo.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
@implementation MatchOpration

-(instancetype)init
{
    self = [super initWithDelegate:self needCommonProcess:NO];
    
    if (self) {
        
        self.dic_team_total = [[NSMutableDictionary alloc] init];
        
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
    
    if([request.apiName isEqual:@"A"]) [self parsePlayerInfo:dic httpTag:@"A"];
    
    if([request.apiName isEqual:@"B"]) [self parsePlayerInfo:dic httpTag:@"B"];

    if ([request.apiName isEqual:NET_WIKI]) {
        [self parseWiki:dic];
    }
    
    if ([request.apiName isEqual:NET_MATCH_MVP_VOTE])
    {
        [self parseMvpVote:dic];
    }
    
    if ([request.apiName isEqual:NET_MATCH_VOTE_SEND]) [self parseFovar:dic];
    
    if([request.apiName isEqual:@"mvpvote"]) [self parsePlayerMvp:dic];
    
    

}

-(void)finishedWithScuessData:(NSDictionary *)dic
{

}


-(void)getDataForAllinfoBymatchid:(NSNumber *)matchid
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
    
//    matchinfo.score = ([matchinfo.score isEqual:[NSNull null]])?@"VS":matchinfo.score;

    matchinfo.score = [NSString stringWithFormat:@"%@-%@",matchinfo.scorea,matchinfo.scoreb];
    
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
-(void)getDataForPredictionBymatchid:(NSNumber*)matchid
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
    [self.delegate data_prediction:dic];
}


#pragma mark -
#pragma mark Favor

-(void)sendFovarBymatchid:(NSNumber *)matchid teamid:(NSString *)teamid
{

    
    NSString *apiUrl=[NSString stringWithFormat:@"%@match/teamvote/%@/%@",HOST,matchid,teamid];
    
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:nil httpTag:NET_MATCH_VOTE_SEND];

}

-(void)parseFovar:(NSDictionary *)dic
{

    NSNumber *e = [dic objectForKey:@"e"];
    
    if ([e intValue] == -1)
    {
        [APSProgress showToast:((UIViewController*)self.delegate).view withMessage:[dic objectForKey:@"msg"]];
    }
    else
    {
        [self.delegate dataFavor_scuess:dic];
    }
}


-(void)sendMvpVoteBymatchid:(NSNumber *)matchid playerid:(NSString *)playerid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@match/mvpvote/%@/%@",HOST,matchid,playerid];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:nil httpTag:NET_MATCH_MVP_VOTE];
}

-(void)parseMvpVote:(NSDictionary *)dic
{

}


#pragma mark -
#pragma mark players

-(void)getPlayersInfoByteamid:(NSNumber*)teamid matchid:(NSNumber*)matchid httpTag:(NSString *)tag tags:(NSString*)tags mvp:(NSString*)mvp
{

    [APSProgress showIndicatorView];
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@player/listbyteam",HOST];
    
    NSDictionary *params=@{@"tid":teamid,
                           @"withtags":tags,
                           @"withmvp":mvp,
                           @"mid":matchid};
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params httpTag:tag];

    
}

-(void)parsePlayerInfo:(NSDictionary *)dic httpTag:(NSString*)tag
{

    [APSProgress hidenIndicatorView];
    
    NSArray *data = [dic objectForKey:@"data"];
    
    NSMutableArray *array_temp = [[NSMutableArray alloc] init];
    
    for (NSDictionary * elem_dic in data)
    {
        DicPlayerinfo *player = [RMMapper objectWithClass:[DicPlayerinfo class] fromDictionary:elem_dic];
        [array_temp addObject:player];
    }
    
    [self.dic_team_total removeObjectForKey:tag];
    [self.dic_team_total setValue:array_temp forKey:tag];
    
    [self.delegate dataTag_scuess:self.dic_team_total];
    
}


-(void)sendPlayerMvpBymatchid:(NSNumber*)matchid playerid:(NSNumber*)playerid
{
    [APSProgress showIndicatorView];
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@match/mvpvote",HOST];
    
    NSDictionary *params=@{@"tid":playerid,
                           @"mid":matchid};
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params httpTag:@"mvpvote"];

}
-(void)parsePlayerMvp:(NSDictionary*)dic
{

    [APSProgress hidenIndicatorView];

    [self.delegate dataMvp_scuess:dic];
}


#pragma mark -
#pragma mark wiki

-(void)getWikiBymatchid:(NSNumber *)matchid offset:(NSNumber*)offset
{
    [APSProgress showIndicatorView];
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@?limit=%@&offset=%@",HOST,@"wiki/listbymatch/",matchid,@"10",offset];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL httpTag:NET_WIKI];
    
}

-(void)parseWiki:(NSDictionary *)dic
{
    [APSProgress hidenIndicatorView];
    
    [self.delegate dataWiki_scuess:dic];
}


@end
