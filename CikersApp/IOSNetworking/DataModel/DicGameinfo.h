//
//  DicGameinfo.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DicGameinfo : NSObject

@property(nonatomic,strong)NSNumber *endtime;
@property(nonatomic,strong)NSNumber *modifiedOn;
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSNumber *id;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *province; //省份
@property(nonatomic,strong)NSString *sportscat;
@property(nonatomic,strong)NSString *tags; // 地区
@property(nonatomic,strong)NSString *year;
@property(nonatomic,strong)NSNumber *starttime;
@property(nonatomic,strong)NSNumber *status;
@property(nonatomic,strong)NSString *gameStatus;
@property(nonatomic,strong)NSString *gameStatusMsg;
@property(nonatomic,strong)NSNumber *teamcount; //球队数量
@property(nonatomic,strong)NSString *teamlist;//球队列表 为json格式

@property(nonatomic,strong)NSNumber *enrolled;//为bool类型

@property(nonatomic,strong)NSString *groups; //球队分组，为json格式
@property(nonatomic,strong)NSString *matchgroup;//球队分组，为json格式

@property(nonatomic,strong)NSString *keyword;//关键字
@property(nonatomic,strong)NSNumber *followed;//是否关注 为bool类型

@property(nonatomic,strong)NSString *announce;// 公告
@property(nonatomic,strong)NSNumber *favorcount;//关注数量
@property(nonatomic,strong)NSNumber *followcount;
@property(nonatomic,strong)NSNumber *postcount;
@property(nonatomic,strong)NSNumber *viewcount;


@property(nonatomic,strong)NSString *logo;//暂无确定的一个东西
@property(nonatomic,strong)NSString *portrait;//这个是头像


@property(nonatomic,strong)NSMutableArray *array_matchs;


//
//@property(nonatomic,strong)NSString
//@property(nonatomic,strong)NSString
//@property(nonatomic,strong)NSString
//@property(nonatomic,strong)NSString
//@property(nonatomic,strong)NSString

@end
