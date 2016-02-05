//
//  DicUserinfo.h
//  CikersApp
//
//  Created by fxm on 15/12/30.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DicUserinfo : NSObject

@property(nonatomic,strong)NSString *name;//姓名
@property(nonatomic,strong)NSString *portrait;//头像
@property(nonatomic,strong)NSString *email;
@property(nonatomic,strong)NSNumber *entityId;
@property(nonatomic,strong)NSString *username;//登录用户名

@property(nonatomic,strong)NSString *creditamount;
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSArray *liteteams; //所属球队
@property(nonatomic,strong)NSMutableArray *teams;


@property(nonatomic,strong)NSDictionary *social;

@property(nonatomic,strong)NSString *tags;

@property(nonatomic,strong)NSNumber *favorcount; //点赞次数
@property(nonatomic,strong)NSNumber *followcount;//
@property(nonatomic,strong)NSNumber *followercount;
@property(nonatomic,strong)NSNumber *postcount;
@property(nonatomic,strong)NSNumber *viewcount;

@end
