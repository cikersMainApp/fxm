//
//  MessageModel.m
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MessageModel.h"
#import "DicMessage.h"
#import "RMMapper.h"
@implementation MessageModel


-(id)initWithDelegate:(id<BaseApiDelegate>)newDelegate needCommonProcess:(BOOL)need
{
    if (self = [super initWithDelegate:self needCommonProcess:need]) {
        
        
    }    
    return self;
}

-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{
    if([request.apiName isEqual:@"social"]) [self parseSocialData:request.userInfo];
    if([request.apiName isEqual:@"event"]) [self parseEventData:request.userInfo];
    if([request.apiName isEqual:@"match"]) [self parseMatchData:request.userInfo];
    if([request.apiName isEqual:@"system"]) [self parseSystemData:request.userInfo];

}

-(void)sendBytype:(NSInteger)type offset:(NSString*)offset
{

    switch (type) {
        case 0:
        {
            [self sendSocialByoffset:offset];
        }
            break;
        case 1:
        {
            [self sendEventByoffset:offset];
        }
            break;
        case 2:
        {
            [self sendMatchByoffset:offset];
        }
            break;
        case 3:
        {
            [self sendSystemByoffset:offset];
        }
            break;
            
        default:
            break;
    }
    
}


-(void)sendSocialByoffset:(NSString *)offset
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@message/list/social?offset=%@&limit=20",HOST,offset];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:NULL httpTag:@"social"];
    
}
-(void)parseSocialData:(NSDictionary*)data
{

    NSArray *array = [data objectForKey:@"data"];
    
    NSMutableArray *mutable_array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *elem_dic in array) {
        DicMessage *msg = [RMMapper objectWithClass:[DicMessage class] fromDictionary:elem_dic];
        [mutable_array addObject:msg];
    }
    
    [self.delegate data_scuess:mutable_array];
}

-(void)sendEventByoffset:(NSString*)offset
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@message/list/event?offset=%@&limit=20",HOST,offset];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:NULL httpTag:@"event"];
}
-(void)parseEventData:(NSDictionary*)data
{
    NSArray *array = [data objectForKey:@"data"];
    
    NSMutableArray *mutable_array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *elem_dic in array) {
        DicMessage *msg = [RMMapper objectWithClass:[DicMessage class] fromDictionary:elem_dic];
        [mutable_array addObject:msg];
    }
    
    [self.delegate data_scuess:mutable_array];
}

-(void)sendMatchByoffset:(NSString*)offset
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@message/list/match?offset=%@&limit=20",HOST,offset];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:NULL httpTag:@"match"];
}
-(void)parseMatchData:(NSDictionary*)data
{
    NSArray *array = [data objectForKey:@"data"];
    
    NSMutableArray *mutable_array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *elem_dic in array) {
        DicMessage *msg = [RMMapper objectWithClass:[DicMessage class] fromDictionary:elem_dic];
        [mutable_array addObject:msg];
    }
    
    [self.delegate data_scuess:mutable_array];
}

-(void)sendSystemByoffset:(NSString*)offset
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@message/list/system?offset=%@&limit=20",HOST,offset];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:NULL httpTag:@"system"];
}

-(void)parseSystemData:(NSDictionary*)data
{
    NSArray *array = [data objectForKey:@"data"];
    
    NSMutableArray *mutable_array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *elem_dic in array) {
        DicMessage *msg = [RMMapper objectWithClass:[DicMessage class] fromDictionary:elem_dic];
        [mutable_array addObject:msg];
    }
    
    [self.delegate data_scuess:mutable_array];
}

@end
