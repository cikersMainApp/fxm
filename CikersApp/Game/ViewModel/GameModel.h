//
//  GameModel.h
//  CikersApp
//
//  Created by fxm on 16/1/8.
//  Copyright © 2016年 cikers. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Api.h"
#import "DicGameinfo.h"
@protocol GameModelDelegate <NSObject>

@optional

-(void)dataInfo_scuess:(DicGameinfo*)info;
-(void)data_scuess:(id)dic;
-(void)dataWiki_scuess:(id)dic;
-(void)dataWikiinfo_scuess:(id)dic;
-(void)dataListTeam_scuess:(NSMutableArray*)data;
-(void)dataPlayer_scuess:(id)dic;
-(void)dataRank_scuess:(id)dic;
-(void)dataTagsList_scuess:(id)dic;



@end

@interface GameModel : BaseApi<BaseApiDelegate>


@property(nonatomic,strong)id<GameModelDelegate>delegate;
@property(nonatomic,strong)Api *api;
@property(nonatomic,strong)NSString *http_tag;
@property (nonatomic,strong)NSMutableArray * dataSource;


-(void)sendInfoBygameid:(NSNumber*)gameid;
-(void)parseInfo:(NSDictionary*)dic;


//获取标签云

-(void)sendTagsByGameId:(NSNumber*)gameid;
-(void)parseTags:(NSDictionary*)dic;

//获取比赛列表
-(void)getListByGameId:(NSNumber*)gameid;
-(void)parseList:(NSDictionary*)dic;

//获取比赛球队
-(void)sendListTeamByGameId:(NSNumber*)gameid;
-(void)parseListTeam:(NSDictionary*)dic;

-(void)sendWikiBygameid:(NSNumber*)gameid offset:(NSInteger)offset;
-(void)parseWiki:(NSDictionary*)dic;

-(void)sendWikiInfoBywikiid:(NSNumber*)wiki;
-(void)parseWikiinfo:(NSDictionary*)dic;
@end
