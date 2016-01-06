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
@property(nonatomic,strong)NSString *matchid; //比赛ID

@property(nonatomic,strong)NSNumber *scheduletime;//比赛预定开始时间
@property(nonatomic,strong)NSString *score;//比分结果
@property(nonatomic,strong)NSString *scorea;//主队得分
@property(nonatomic,strong)NSString *scoreb;//客队的份
@property(nonatomic,strong)NSString *starttime;//比赛正式开始时间
@property(nonatomic,strong)NSString *endtime;

@property(nonatomic,strong)NSString *result;//比赛是否结束标志



@property(nonatomic,strong)DicTeaminfo *teama;//主队数据集合
@property(nonatomic,strong)DicTeaminfo *teamb;
@property(nonatomic,strong)DicGameinfo *gameinfo; //赛事信息

@property(nonatomic,strong)NSString *formatScheduletime; // 格式化后的时间


@property(nonatomic)NSNumber *isWaiting;// 比赛还未开始 判断字段为result是否为空

@end
