//
//  DataSingleton.h
//  CikersApp
//
//  Created by fxm on 15/12/23.
//  Copyright © 2015年 cikers. All rights reserved.
//

typedef enum : NSUInteger {
    VIEW_SEARCH_GAME = 0, //搜索页面
    VIEW_SEARCH_TEAM,
    VIEW_SEARCH_PLAYER,
    VIEW_SEARCH_NONE, //无搜索项
} curViewType;


#import <Foundation/Foundation.h>
#import "HLBaseViewController.h"
@interface DataSingleton : NSObject

+(DataSingleton*)Instance;

@property(nonatomic) curViewType viewType;


@property(nonatomic,strong)HLBaseViewController *curVC; // 当前的视图控制器


@property(nonatomic,strong)NSString * id_search_game;//在搜索页面点击的赛事ID
@property(nonatomic,strong)NSString * id_search_team;
@property(nonatomic,strong)NSString * id_search_player;


@property(nonatomic,strong)NSString * id_cur_match; //当前所在的比赛
@property(nonatomic,strong)NSString * id_cur_game; //当前所在的赛事



@end
