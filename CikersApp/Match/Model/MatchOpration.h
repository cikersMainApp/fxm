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
-(void)data_prediction:(id)dic;
-(void)dataTag_scuess:(id)dic;
-(void)dataWiki_scuess:(id)dic;
-(void)dataFavor_scuess:(id)dic;
-(void)dataMvp_scuess:(id)dic;

@end


@interface MatchOpration : BaseApi<BaseApiDelegate>

@property(nonatomic,strong)id<MatchOprationDelegate>delegate;
@property(nonatomic,strong)Api *net_sendApi;
@property(nonatomic,strong)NSString *http_tag;

@property(nonatomic,strong)NSMutableDictionary *dic_team_total;

//得到比赛基本信息
-(void)getDataForAllinfoBymatchid:(NSNumber *)matchid;
-(void)parseDataForAllinfo:(NSDictionary*)dic;

//得到竞猜结果
-(void)getDataForPredictionBymatchid:(NSNumber*)matchid;
-(void)parseDataForPrediction:(NSDictionary*)dic;

//发送竞猜
-(void)sendForPredictionBymatchid:(NSNumber*)matchid code:(NSString*)type;
-(void)parseDataForSendPrediction:(NSDictionary *)dic;

//发送支持
-(void)sendFovarBymatchid:(NSNumber*)matchid teamid:(NSString *)teamid;
-(void)parseFovar:(NSDictionary*)dic;

//获取球员信息
-(void)getPlayersInfoByteamid:(NSNumber*)teamid matchid:(NSNumber*)matchid httpTag:(NSString*)tag tags:(NSString*)tags mvp:(NSString*)mvp;
;
-(void)parsePlayerInfo:(NSDictionary *)dic httpTag:(NSString*)tag;


//发送球员MVP投票
-(void)sendPlayerMvpBymatchid:(NSNumber*)matchid playerid:(NSNumber*)playerid;
-(void)parsePlayerMvp:(NSDictionary*)dic;

//获取wiki
-(void)getWikiBymatchid:(NSNumber*)matchid  offset:(NSNumber*)offset;
-(void)parseWiki:(NSDictionary*)dic;

//mvp投票
-(void)sendMvpVoteBymatchid:(NSNumber*)matchid playerid:(NSString*)playerid;
-(void)parseMvpVote:(NSDictionary*)dic;


@end
