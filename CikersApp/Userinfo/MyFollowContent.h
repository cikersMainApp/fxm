//
//  MyFollowContent.h
//  CikersApp
//
//  Created by fxm on 16/3/1.
//  Copyright © 2016年 cikers. All rights reserved.
//


typedef enum : NSUInteger {
    FOLLOW_PLAYER,
    FOLLOW_TEAM,
    FOLLOW_TOURNAME,
    FOLLOW_USER,
} TYPE_FOLLOW;

#import <UIKit/UIKit.h>

@interface MyFollowContent : UITableView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign)TYPE_FOLLOW type_follow;

@end
