//
//  TeamModel.m
//  CikersApp
//
//  Created by fxm on 16/1/22.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "TeamModel.h"
#import "DicTeaminfo.h"
#import "RMMapper.h"
#import "DicTags.h"
#import "DicPlayerinfo.h"
@implementation TeamModel

-(id)initWithDelegate:(id<BaseApiDelegate>)newDelegate needCommonProcess:(BOOL)need
{

    if (self = [super initWithDelegate:self needCommonProcess:need]) {
        
    }
    
    return self;
}

-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{
    NSDictionary *dic = request.userInfo;

    if([request.apiName isEqual:@"teaminfo"]) [self parseInfo:dic];
    if([request.apiName isEqual:@"teamtags"]) [self parseTags:dic];
    if([request.apiName isEqual:@"teamplayer"]) [self parsePlayer:dic];
}



#pragma mark -
#pragma mark 

-(void)sendInfo:(NSNumber *)teamid
{

    NSString *str = [NSString stringWithFormat:@"%@%@/%@",HOST,@"team",teamid];
    
    [self sendRequestWithUrl:str Method:@"GET" AndParams:nil httpTag:@"teaminfo"];
    
}
-(void)parseInfo:(NSDictionary*)dic
{

    NSDictionary *data = [dic objectForKey:@"data"];
    
    DicTeaminfo *info = [RMMapper objectWithClass:[DicTeaminfo class] fromDictionary:data];


    [self.delegate dataInfo_scuess:info];
}

-(void)sendTags:(NSNumber*)teamid
{
    NSString *str = [NSString stringWithFormat:@"%@%@%@",HOST,@"tag/hot/team/",teamid];
    
    [self sendRequestWithUrl:str Method:@"GET" AndParams:nil httpTag:@"teamtags"];

}
-(void)parseTags:(NSDictionary*)dic
{

    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    NSArray *data = [dic objectForKey:@"data"];
    
    for (NSDictionary *elem_dic in data) {
        
        DicTags *info = [RMMapper objectWithClass:[DicTags class] fromDictionary:elem_dic];
        
        [array addObject:info];
    }
    
    [self.delegate dataTags_scuess:array];
}

-(void)sendPlayer:(NSNumber*)teamid
{
    NSString *str = [NSString stringWithFormat:@"%@%@%@&withtags=0&withmvp=0",HOST,@"player/listbyteam?tid=",teamid];
    
    [self sendRequestWithUrl:str Method:@"GET" AndParams:nil httpTag:@"teamplayer"];
}
-(void)parsePlayer:(NSDictionary*)dic
{

    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSDictionary *data = [dic objectForKey:@"data"];
    
    for (NSDictionary *elem_dic in data)
    {
        DicPlayerinfo *info = [RMMapper objectWithClass:[DicPlayerinfo class] fromDictionary:elem_dic];
        [array addObject:info];
    }
    
    [self.delegate dataPlayer_scuess:array];
    
}

@end
