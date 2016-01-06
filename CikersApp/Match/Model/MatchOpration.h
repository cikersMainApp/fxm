//
//  MatchOpration.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Api.h"

@protocol MatchOprationDelegate <NSObject>

@optional

-(void)data_scuess:(id)dic;
-(void)dataTag_scuess:(id)dic;
-(void)dataWiki_scuess:(id)dic;
@end


@interface MatchOpration : BaseApi<BaseApiDelegate>

@property(nonatomic,strong)id<MatchOprationDelegate>delegate;
@property(nonatomic,strong)Api *net_sendApi;
@property(nonatomic,strong)NSString *http_tag;


//得到比赛基本信息
-(void)getDataForAllinfoBymatchid:(NSString *)matchid;
-(void)parseDataForAllinfo:(NSDictionary*)dic;

//得到竞猜结果
-(void)getDataForPredictionBymatchid:(NSString*)matchid;
-(void)parseDataForPrediction:(NSDictionary*)dic;

//发送竞猜
-(void)sendForPredictionBymatchid:(NSString*)matchid code:(NSString*)type;
-(void)parseDataForSendPrediction:(NSDictionary *)dic;

//发送支持
-(void)sendFovarBymatchid:(NSString*)matchid teamid:(NSString *)teamid;
-(void)parseFovar:(NSDictionary*)dic;

//获取球员信息
-(void)getPlayersInfoByteamid:(NSString*)teamid matchid:(NSString*)matchid;
-(void)parsePlayerInfo:(NSDictionary *)dic;

//获取wiki
-(void)getWikiBymatchid:(NSString*)matchid  offset:(NSString*)offset;
-(void)parseWiki:(NSDictionary*)dic;

//mvp投票
-(void)sendMvpVoteBymatchid:(NSString*)matchid playerid:(NSString*)playerid;
-(void)parseMvpVote:(NSDictionary*)dic;


@end
