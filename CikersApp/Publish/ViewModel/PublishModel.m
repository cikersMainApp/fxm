//
//  PublishModel.m
//  CikersApp
//
//  Created by fxm on 16/1/12.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "PublishModel.h"
#import "DicSearchinfo.h"
#import "RMMapper.h"
@implementation PublishModel

-(id)initWithDelegate:(id<BaseApiDelegate>)newDelegate needCommonProcess:(BOOL)need
{

    if (self = [super initWithDelegate:self needCommonProcess:need]) {
        
    }
    
    return self;
}


-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{

    NSDictionary * resultDic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:&error];

    
    if([request.apiName isEqual:@"search"]) [self parseBySearch:resultDic];
    
    if([request.apiName isEqual:@"wikipersonal"]) [self parseWikiPersonal:resultDic];

    
}

-(void)finishedWithScuessData:(NSDictionary *)dic
{

}

-(void)sendBySearch:(NSString *)keyword Searchtype:(NSString *)type
{

    NSString *apiUrl=[NSString stringWithFormat:@"%@search/quick",HOST];
    
    NSDictionary *params=@{@"group":type,
                           @"keyword":keyword,
                           };
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:params httpTag:@"search"];
    
}

-(void)parseBySearch:(NSDictionary *)dic
{
    
    NSMutableArray *array_mutab = [[NSMutableArray alloc] init];
    
    NSArray *json_data = [dic objectForKey:@"data"];
    
    for (NSDictionary *dic_elem in json_data)
    {
        
        DicSearchinfo *search = [RMMapper objectWithClass:[DicSearchinfo class] fromDictionary:dic_elem];

        [array_mutab addObject:search];
    }
    
    [self.delegate data_search:array_mutab];
    
}

-(void)sendWikiByPersonal:(NSString *)content images:(NSString *)images marks:(NSString *)marks reftype:(NSString *)reftype redid:(NSNumber *)refid
{

    
//    NSString *apiUrl=[NSString stringWithFormat:@"%@wiki/post/0",HOST];
    
    NSDictionary *params=@{@"wikitype":@"message",
                           @"content":content,
                           @"images":images,
                           @"marks":marks,
                           @"reftype":reftype,
                           @"refid":refid,
                           };
    
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    NSString *apiUrl=[NSString stringWithFormat:@"%@wiki/post/0",HOST];

    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params httpTag:@"wikipersonal"];

}

-(void)parseWikiPersonal:(NSDictionary *)dic
{

}


@end
