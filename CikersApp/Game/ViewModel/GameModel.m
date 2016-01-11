//
//  GameModel.m
//  CikersApp
//
//  Created by fxm on 16/1/8.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "GameModel.h"

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


-(void)getListByGameId:(NSNumber *)gameid
{
 
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@match/listbygame/%@",HOST,gameid];
    
    self.http_tag = @"";
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil httpTag:self.http_tag];

    
}

#pragma mark -
#pragma mark Net

-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:nil];

    [self.delegate data_scuess:dic];
    
    
}

@end
