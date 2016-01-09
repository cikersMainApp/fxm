//
//  GameModel.h
//  CikersApp
//
//  Created by fxm on 16/1/8.
//  Copyright © 2016年 cikers. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Api.h"

@protocol GameModelDelegate <NSObject>

@optional

-(void)data_scuess:(id)dic;

@end

@interface GameModel : BaseApi<BaseApiDelegate>


@property(nonatomic,strong)id<GameModelDelegate>delegate;
@property(nonatomic,strong)Api *api;
@property(nonatomic,strong)NSString *http_tag;

-(void)getListByGameId:(NSString*)gameid;

@end
