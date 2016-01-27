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
    
}


-(void)sendListrecommand
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@wiki/listrecommand?limit=30",HOST];
    
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

-(void)sendListCikcle
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@wiki/listcircle?limit=30",HOST];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL httpTag:@"circle"];
}
-(void)parseListCikcle:(NSDictionary*)dic
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



@end
