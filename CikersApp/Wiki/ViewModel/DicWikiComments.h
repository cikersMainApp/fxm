//
//  DicWikiComments.h
//  CikersApp
//
//  Created by fxm on 16/3/14.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DicWikiComments : NSObject

@property(nonatomic,strong)NSString*author;
@property(nonatomic,strong)NSString *authorportrait; //作者头像
@property(nonatomic,strong)NSString *cgroup; //类型
@property(nonatomic,strong)NSString *cdate; //创建时间
@property(nonatomic,strong)NSNumber *id;
@property(nonatomic,strong)NSNumber *coid; //id
@property(nonatomic,strong)NSNumber *eid;
@property(nonatomic,strong)NSNumber *ctype; // 类型
@property(nonatomic,strong)NSNumber *status;
@property(nonatomic,strong)NSString *uuid; //帖子网页版地址
@property(nonatomic,strong)NSNumber *favorcount; //点赞数量

@property(nonatomic,strong)NSArray *marks;

@property(nonatomic,strong)NSDictionary *content; //评论内容

@property(nonatomic,strong)NSDictionary *extra;
@property(nonatomic,strong)NSString *wikicontent;//发表的内容


//@property(nonatomic,strong)

@end
