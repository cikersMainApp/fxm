//
//  PlayerModel.m
//  CikersApp
//
//  Created by fxm on 16/1/26.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "PlayerModel.h"
#import "RMMapper.h"
#import "DicTags.h"
#import "DicPlayerinfo.h"
@implementation PlayerModel

-(id)initWithDelegate:(id<BaseApiDelegate>)newDelegate needCommonProcess:(BOOL)need
{

    if (self = [super initWithDelegate:self needCommonProcess:need]) {
        

    }
    return self;
}

-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{

    if([request.apiName isEqual:@"playertags"]) [self parseTags:request.userInfo];
    if([request.apiName isEqual:@"playerinfo"]) [self parseInfo:request.userInfo];
    
    
}


-(void)sendInfoByid:(NSNumber*)playerid
{
    NSString *str = [NSString stringWithFormat:@"%@%@/%@",HOST,@"player",playerid];
    
    [self sendRequestWithUrl:str Method:@"GET" AndParams:nil httpTag:@"playerinfo"];
}
-(void)parseInfo:(NSDictionary*)dic
{
    NSDictionary *data = [dic objectForKey:@"data"];

    DicPlayerinfo *info = [RMMapper objectWithClass:[DicPlayerinfo class] fromDictionary:data];
    
    [self.delegate datainfo_scuess:info];
}


-(void)sendTagsByid:(NSNumber*)playerid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@tag/hot/player/%@",HOST,playerid];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil httpTag:@"playertags"];

}
-(void)parseTags:(NSDictionary*)dic
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    NSDictionary *data = [dic objectForKey:@"data"];
    
    for (NSDictionary *elem_dic in data) {
        
        DicTags *info = [RMMapper objectWithClass:[DicTags class] fromDictionary:elem_dic];
        
        [array addObject:info];
    }
    
    [self.delegate dataTags_scuess:array];

    
    
    
}


@end
