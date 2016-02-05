//
//  DicWikiInfo.h
//  CikersApp
//
//  Created by fxm on 16/1/26.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DicWikiInfo : NSObject
@property(nonatomic,strong)NSNumber *commentcount;//评论次数
@property(nonatomic,strong)NSNumber *readCount; // 阅读次数
@property(nonatomic,strong)NSNumber *createdOn;
@property(nonatomic,strong)NSString *time_createdon;
@property(nonatomic,strong)NSNumber *favorcount;//点赞次数
@property(nonatomic,strong)NSNumber *sharecount;//帖子被分享过的次数
@property(nonatomic,strong)NSNumber *viewcount;//浏览次数
@property(nonatomic,strong)NSNumber *id;


@property(nonatomic,strong)NSDictionary *extra;
@property(nonatomic,strong)NSDictionary *source;
@property(nonatomic,strong)NSString *contenttype; //帖子类型 三种
@property(nonatomic,strong)NSString *wikitype;    //帖子种类 五种
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *authorname;    //作者
@property(nonatomic,strong)NSString *content;       //正文
@property(nonatomic,strong)NSString *shortTitle;    //短标题
@property(nonatomic,strong)NSString *title;         //长标题
@property(nonatomic,strong)NSString *video;         //视频类型帖子时的视频播放地址

@property(nonatomic,strong)NSMutableArray *imgextra; //图像集合
@property(nonatomic,strong)NSArray *marks; //@人名单




@property(nonatomic,strong)NSString *time; //转化后的时间


//event

@property(nonatomic,strong)NSDictionary *team;
@property(nonatomic,strong)NSString *cnname;
@property(nonatomic,strong)NSNumber *eventOn;
@property(nonatomic,strong)NSString *time_eventOn;


//match

@property(nonatomic,strong)NSDictionary *match;
@property(nonatomic,strong)NSNumber *matchId;
@property(nonatomic,strong)NSString *teamAname;
@property(nonatomic,strong)NSString *teamAicon;
@property(nonatomic,strong)NSNumber *teamAid;
@property(nonatomic,strong)NSString *teamBname;
@property(nonatomic,strong)NSString *teamBicon;
@property(nonatomic,strong)NSNumber *teamBid;
@property(nonatomic,strong)NSNumber *scorea;
@property(nonatomic,strong)NSNumber *scoreb;
@property(nonatomic,strong)NSString *tname;//联赛名称
@property(nonatomic,strong)NSNumber *tid;//联赛id
@property(nonatomic,strong)NSNumber *favora;
@property(nonatomic,strong)NSNumber *favorb;


/**
 *  大图样式
 */
@property (nonatomic,copy)NSNumber *imgType;


@property(nonatomic,assign)BOOL isNull;



//--------------------


-(void)parseExtra;


@end
