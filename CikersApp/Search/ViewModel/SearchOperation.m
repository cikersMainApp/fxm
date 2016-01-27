//
//  SearchOperation.m
//  CikersApp
//
//  Created by fxm on 15/12/22.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "SearchOperation.h"
#import "DicGameinfo.h"
#import "DicTeaminfo.h"
#import "DicPlayerinfo.h"
#import "RMMapper.h"
@implementation SearchOperation

-(id)initWithDelegate:(id<BaseApiDelegate>)newDelegate needCommonProcess:(BOOL)need
{

    if (self =[super initWithDelegate:self needCommonProcess:need]) {
        
    }
    
    return self;
}


-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{
    
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:&error];
    
    if([request.apiName isEqual:@"hotpacks"]) [self parseRecommed:dic];
    if([request.apiName isEqual:@"player"]) [self parsePlayer:dic];
    if([request.apiName isEqual:@"team"]) [self parseTeam:dic];
    if([request.apiName isEqual:@"tounament"]) [self parseTounament:dic];

//NSOperationQueue
}


//
#pragma mark -
#pragma mark net


-(void)sendRecommedResult
{

    NSString *str = [NSString stringWithFormat:@"%@%@",HOST,@"portal/hotpacks"];
    
    [self sendRequestWithUrl:str Method:@"GET" AndParams:nil httpTag:@"hotpacks"];
    
}

-(void)parseRecommed:(NSDictionary *)dic
{

    NSMutableArray *dic_mutable = [[NSMutableArray alloc] init];
    
    NSDictionary *data = [dic objectForKey:@"data"];
    
    NSArray *games = [data objectForKey:@"games"];
    
    NSMutableArray *array_exchange = [[NSMutableArray alloc] init];
    
    for (NSDictionary *elem_dic in games) {
        
        
        DicGameinfo *info = [RMMapper objectWithClass:[DicGameinfo class] fromDictionary:elem_dic];
        [array_exchange addObject:info];
        
    }
    
    [dic_mutable addObject:array_exchange];


    NSMutableArray *array_exchange1 = [[NSMutableArray alloc] init];

    NSArray *teams = [data objectForKey:@"teams"];
    for (NSDictionary *elem_dic in teams) {
        
        DicTeaminfo *info = [RMMapper objectWithClass:[DicTeaminfo class] fromDictionary:elem_dic];
        [array_exchange1 addObject:info];
    }
    
    [dic_mutable addObject:array_exchange1];

    
    NSMutableArray *array_exchange2 = [[NSMutableArray alloc] init];

    NSArray *players = [data objectForKey:@"players"];
    
    for (NSDictionary *elem_dic in players) {
        
        DicPlayerinfo *info = [RMMapper objectWithClass:[DicPlayerinfo class] fromDictionary:elem_dic];
        [array_exchange2 addObject:info];
    }
    [dic_mutable addObject:array_exchange2];

    [self.delegate dataRecommed_scuess:dic_mutable];
    
}


-(void)searchPlayerByOffset:(NSInteger)offset keyword:(NSString*)keyword
{
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@player/list",HOST];
    
    NSDictionary *params=@{@"offset":[NSNumber numberWithInteger:offset],
                           @"keyword":keyword,
                           @"limit":@"20",
                           };
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:params httpTag:@"player"];
}
-(void)parsePlayer:(NSDictionary*)dic
{
    NSMutableArray *dic_mutable = [[NSMutableArray alloc] init];
    
    NSArray *data = [dic objectForKey:@"data"];
    
    if ([data count] == 0)
    {
        [APSProgress showToast:nil withMessage:@"暂无新数据"];
        return;
    }
    
    
    for (NSDictionary *elem_dic in data) {
        
        DicPlayerinfo *info = [RMMapper objectWithClass:[DicPlayerinfo class] fromDictionary:elem_dic];
        
        [dic_mutable addObject:info];
    }
    

    [self.delegate dataPlayer_scuess:dic_mutable];
}

-(void)searchTeamByOffset:(NSInteger)offset keyword:(NSString*)keyword sportscat:(NSInteger)type province:(NSString*)province
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@team/list",HOST];
    
    NSDictionary *params=@{@"offset":[NSNumber numberWithInteger:offset],
                           @"keyword":keyword,
                           @"limit":@"20",
                           @"province":province,
                           @"sportscat":[NSNumber numberWithInteger:type],
                           };
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:params httpTag:@"team"];
}
-(void)parseTeam:(NSDictionary*)dic
{
    NSMutableArray *dic_mutable = [[NSMutableArray alloc] init];
    
    NSArray *data = [dic objectForKey:@"data"];
    
    if ([data count] == 0)
    {
        [APSProgress showToast:nil withMessage:@"暂无新数据"];
        return;
    }
    
    for (NSDictionary *elem_dic in data) {
        
        DicTeaminfo *info = [RMMapper objectWithClass:[DicTeaminfo class] fromDictionary:elem_dic];
        
        [dic_mutable addObject:info];
    }
    
    [self.delegate dataTeam_scuess:dic_mutable];
}

-(void)searchTounamentByOffset:(NSInteger)offset keyword:(NSString*)keyword province:(NSString*)province
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@game/list",HOST];
    
    NSDictionary *params=@{@"offset":[NSNumber numberWithInteger:offset],
                           @"keyword":keyword,
                           @"limit":@"20",
                           @"province":province,
                           };
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:params httpTag:@"tounament"];
}
-(void)parseTounament:(NSDictionary*)dic
{
    NSMutableArray *dic_mutable = [[NSMutableArray alloc] init];
    
    NSArray *data = [dic objectForKey:@"data"];
    
    if ([data count] == 0)
    {
        [APSProgress showToast:nil withMessage:@"暂无新数据"];
        return;
    }
    
    for (NSDictionary *elem_dic in data) {
        
        DicGameinfo *info = [RMMapper objectWithClass:[DicGameinfo class] fromDictionary:elem_dic];
        
        [dic_mutable addObject:info];
    }
    
    [self.delegate dataTounament_scuess:dic_mutable];
}


@end
