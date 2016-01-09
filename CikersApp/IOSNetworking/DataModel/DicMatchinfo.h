//
//  DicMatchinfo.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>


@class DicTeaminfo;
@class DicGameinfo;

@interface DicMatchinfo : NSObject


@property(nonatomic,strong)NSString *companyId;
@property(nonatomic,strong)NSNumber *favora; //主队支持数量
@property(nonatomic,strong)NSNumber *favorb; //客队支持数量
@property(nonatomic,strong)NSString *fieldName;//场地
@property(nonatomic,strong)NSString *groupName;//该场比赛所在的分组
@property(nonatomic,strong)NSNumber *matchid; //比赛ID

@property(nonatomic,strong)NSNumber *scheduletime;//比赛预定开始时间
@property(nonatomic,strong)NSString *score;//比分结果
@property(nonatomic,strong)NSNumber *scorea;//主队得分
@property(nonatomic,strong)NSNumber *scoreb;//客队的份
@property(nonatomic,strong)NSNumber *starttime;//比赛正式开始时间
@property(nonatomic,strong)NSNumber *endtime;

@property(nonatomic,strong)NSString *result;//比赛是否结束标志



@property(nonatomic,strong)DicTeaminfo *teama;//主队数据集合
@property(nonatomic,strong)DicTeaminfo *teamb;
@property(nonatomic,strong)DicGameinfo *gameinfo; //赛事信息

@property(nonatomic,strong)NSNumber *teamAid;
@property(nonatomic,strong)NSNumber *teamBid;

@property(nonatomic,strong)NSString *formatScheduletime; // 格式化后的时间


@property(nonatomic)NSNumber *isWaiting;// 比赛还未开始 判断字段为result是否为空


@property(nonatomic,strong)NSNumber *tournamentid;
//@property(nonatomic,strong)NSString *description; //描述




@property(nonatomic,strong)NSNumber *goals; //总进球数
@property(nonatomic,strong)NSNumber *finished;//比赛是否结束
@property(nonatomic,strong)NSNumber *mvpsettle;//MVP评比是否结束
@property(nonatomic,strong)NSNumber *votedteam;//是否进行过球队支持
@property(nonatomic,strong)NSNumber *votedmvp; //是否进行过MVP投票




@property(nonatomic,strong)NSString *time_scheduletime;
@property(nonatomic,strong)NSString *time_starttime;
@property(nonatomic,strong)NSString *time_endtime;



-(void)dic_exchangData;
@end
