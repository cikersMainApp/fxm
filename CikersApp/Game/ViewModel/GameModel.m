//
//  GameModel.m
//  CikersApp
//
//  Created by fxm on 16/1/8.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "GameModel.h"
#import "WIkiModel.h"
#import "RMMapper.h"
#import "DicGameinfo.h"
#import "DicTeaminfo.h"
#import "DicTags.h"
@implementation GameModel


-(instancetype)init
{

    if (self = [super initWithDelegate:self needCommonProcess:NO])
    {

    }
    
    return self;
}


#pragma mark -
#pragma mark 
-(void)sendInfoBygameid:(NSNumber*)gameid
{
    [APSProgress showIndicatorView];
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@",HOST,@"game/",gameid];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:NULL httpTag:@"info"];

}
-(void)parseInfo:(NSDictionary*)dic
{

    [APSProgress hidenIndicatorView];
    
    NSDictionary *data = [dic objectForKey:@"data"];
    
    DicGameinfo *info = [RMMapper objectWithClass:[DicGameinfo class] fromDictionary:data];
    
    [self.delegate dataInfo_scuess:info];
}

-(void)sendTagsByGameId:(NSNumber*)gameid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@tag/hot/team/%@",HOST,gameid];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil httpTag:@"gametags"];
}

-(void)parseTags:(NSDictionary*)dic
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    NSDictionary *data = [dic objectForKey:@"data"];

    for (NSDictionary *elem_dic in data) {
        
        DicTags *info = [RMMapper objectWithClass:[DicTags class] fromDictionary:elem_dic];

        [array addObject:info];
    }
    
    [self.delegate dataTagsList_scuess:array];
    
}

-(void)getListByGameId:(NSNumber *)gameid
{
 
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@match/listbygame/%@",HOST,gameid];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil httpTag:@"gamelist"];

    
}

-(void)parseList:(NSDictionary *)dic
{

    [self.delegate data_scuess:dic];
    
}
-(void)sendListTeamByGameId:(NSNumber*)gameid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@team/listbygame?gid=%@",HOST,gameid];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil httpTag:@"teamlist"];
}

-(void)parseListTeam:(NSDictionary*)dic
{
    NSArray *data = [dic objectForKey:@"data"];
    
    NSMutableArray *array_data = [[NSMutableArray alloc] init];
    
    for (NSDictionary *elem_dic in data) {
        
        DicTeaminfo *info = [RMMapper objectWithClass:[DicTeaminfo class] fromDictionary:elem_dic];
        [array_data addObject:info];
    }
    
    [self.delegate dataListTeam_scuess:array_data];
}

-(void)sendWikiBygameid:(NSNumber*)gameid offset:(NSInteger)offset
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@?limit=20&offset=%@",HOST,@"wiki/listbygame/",gameid,[NSNumber numberWithInteger:offset]];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL httpTag:@"wiki"];

}
-(void)parseWiki:(NSDictionary*)dic
{
    
    
    NSArray *array = [dic objectForKey:@"data"];
    
    NSMutableArray *temp_data = [[NSMutableArray alloc] init];
    
    for (NSDictionary *elem_dic in array) {
        
        WIkiModel *model = [RMMapper objectWithClass:[WIkiModel class] fromDictionary:elem_dic];
        
        [model parseExtra];
        
        [temp_data addObject:model];
        
    }
        
    [self.delegate dataWiki_scuess:temp_data];
}

-(void)sendWikiInfoBywikiid:(NSNumber*)wiki
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@",HOST,@"wiki/",wiki];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL httpTag:@"wikiinfo"];

}
-(void)parseWikiinfo:(NSDictionary*)dic
{
    [self.delegate dataWikiinfo_scuess:dic];
}

#pragma mark -
#pragma mark Net

-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{

    NSDictionary *dic = request.userInfo;
    
    if([request.apiName isEqual:@"info"]) [self parseInfo:dic];
    if([request.apiName isEqual:@"gamelist"]) [self parseList:dic];
    if([request.apiName isEqual:@"wiki"]) [self parseWiki:dic];
    if([request.apiName isEqual:@"wikiinfo"]) [self parseWikiinfo:dic];
    if([request.apiName isEqual:@"teamlist"]) [self parseListTeam:dic];
    if([request.apiName isEqual:@"gametags"]) [self parseTags:dic];
}

@end
