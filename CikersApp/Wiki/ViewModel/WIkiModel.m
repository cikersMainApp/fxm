//
//  WIkiModel.m
//  CikersApp
//
//  Created by fxm on 16/1/5.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WIkiModel.h"
#import "DicWikiInfo.h"
#import "RMMapper.h"
#import "DicPlayerinfo.h"
#import "DicWikiComments.h"
#import "DicWikiFavor.h"
@implementation WIkiModel

-(id)initWithDelegate:(id<BaseApiDelegate>)newDelegate needCommonProcess:(BOOL)need
{

    if (self = [super initWithDelegate:self needCommonProcess:need]) {
        
    }
    
    return self;
}


-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{

    if([request.apiName isEqual:@"recommand"]) [self parseListrecommand:request.userInfo];
    if([request.apiName isEqual:@"circle"]) [self parseListCikcle:request.userInfo];
    if([request.apiName isEqual:@"zhuanqu"]) [self parseZhuanqu:request.userInfo];
    if([request.apiName isEqual:@"info"]) [self parseWikiInfo:request.userInfo];
    if([request.apiName isEqual:@"hotfavor"]) [self parseHotFavor:request.userInfo];
    
}


-(void)sendHotFavor:(NSNumber *)uid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@comments/hot?cgroup=blog&coid=%@",HOST,uid];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:NULL httpTag:@"hotfavor"];
}

-(void)parseHotFavor:(NSDictionary *)dic
{

}


-(void)sendWikiInfo:(NSNumber*)uid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@wiki/%@",HOST,uid];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:NULL httpTag:@"info"];

}
-(void)parseWikiInfo:(NSDictionary*)dic
{

    NSMutableArray *array_all = [NSMutableArray array];
    
    NSMutableArray *array_favor = [NSMutableArray array];
    
    NSMutableArray *array_comments = [NSMutableArray array];
    
    NSDictionary *data = [dic objectForKey:@"data"];
    
    NSArray *favorers = [data objectForKey:@"favorers"];
    
    NSArray *hotcomments = [data objectForKey:@"hotcomments"];
    
    
    for (NSDictionary *elem_dic in favorers) {
        
        DicWikiFavor *favor = [RMMapper objectWithClass:[DicWikiFavor class] fromDictionary:elem_dic];
        [array_favor addObject:favor];
    }
    
    for (NSDictionary *elem_dic in hotcomments) {
        
        DicWikiComments *comment = [RMMapper objectWithClass:[DicWikiComments class] fromDictionary:elem_dic];
        [array_comments addObject:comment];
    }
    
    
    [array_all addObject:array_favor];
    [array_all addObject:array_comments];
    
    [self.delegate data_info:array_all];
    
    
}

-(void)sendListrecommandByoffset:(NSInteger)offset
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@wiki/listrecommand?limit=30&offset=%ld",HOST,offset];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL httpTag:@"recommand"];
}
-(void)parseListrecommand:(NSDictionary*)dic
{
    NSArray *array = [dic objectForKey:@"data"];
    
    NSMutableArray *elem_array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *elem_dic in array) {
        
        DicWikiInfo *model = [RMMapper objectWithClass:[DicWikiInfo class] fromDictionary:elem_dic];
        
        [model parseExtra];
        
        [elem_array addObject:model];
        
    }
    
    [self.delegate data_scuess:elem_array];

}

-(void)sendListCikcleByoffset:(NSInteger)offset
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@wiki/listcircle?limit=100&offset=%ld",HOST,offset];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:NULL httpTag:@"circle"];
}
-(void)parseListCikcle:(NSDictionary*)dic
{
    NSArray *array = [dic objectForKey:@"data"];
    
    NSMutableArray *elem_array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *elem_dic in array) {
        
        DicWikiInfo *model = [RMMapper objectWithClass:[DicWikiInfo class] fromDictionary:elem_dic];
        
        [model parseExtra];
        
        if (!model.isNull) {
            [elem_array addObject:model];

        }
        
        
    }
    
    [self.delegate data_scuess:elem_array];

}



-(void)sendZhuanqu
{

    
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@",HOST,@"portal/pubaccts"];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:NULL httpTag:@"zhuanqu"];
}

-(void)parseZhuanqu:(NSDictionary *)dic
{
    
    NSArray *array = [dic objectForKey:@"data"];
    
    NSMutableArray *elem_array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *elem_dic in array) {
        
        DicPlayerinfo *model = [RMMapper objectWithClass:[DicPlayerinfo class] fromDictionary:elem_dic];
        [elem_array addObject:model];

    }
    
    [self.delegate data_scuess:elem_array];
}


@end
