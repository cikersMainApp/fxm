//
//  DicPlayerinfo.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DicPlayerinfo : NSObject

@property(nonatomic,strong)NSString *name; //姓名
@property(nonatomic,strong)NSString *clubnumber; //球衣号码
@property(nonatomic,strong)NSString *icon;//头像
@property(nonatomic,strong)NSString *portrait;//头像

@property(nonatomic,strong)NSString *position;//位置
@property(nonatomic,strong)NSNumber *id;//id
@property(nonatomic,strong)NSNumber *pub;//

@property(nonatomic,strong)NSString *atype;//球员类型  全能型、铁塔型等等
@property(nonatomic,strong)NSString *athletetype;//球员类型  全能型、铁塔型等等
@property(nonatomic,strong)NSString *endorsement;//能力值描述 是个json

@property(nonatomic,strong)NSMutableArray *hottags;//标签  是个数组
@property(nonatomic,strong,setter=setLiteteams:)NSMutableArray *liteteams;//所属球队  需要转化

@property(nonatomic,strong)NSString *tags;

@property(nonatomic,strong)NSNumber *votecount;//得到的票数
@property(nonatomic,strong)NSNumber *followercount;
@property(nonatomic,strong)NSNumber *viewcount;  //暂定，需要询问的  关注本人的数量
@property(nonatomic,strong)NSNumber *postcount;
@property(nonatomic,strong)NSNumber *favorcount;//点赞票数 是别人给他点赞还是他给别人点赞
@property(nonatomic,strong)NSNumber *followed;//bool 类型的值

@property(nonatomic,strong)NSString *extras;//扩展信息

@property(nonatomic,strong)NSNumber *eventtotal;
@property(nonatomic,strong)NSString *belteam; //所属球队

@property(nonatomic,strong)NSNumber *birthday;//生日
@property(nonatomic,strong)NSString *formBirthday;

@property(nonatomic,strong)NSNumber *createdOn;//创建时间
@property(nonatomic,strong)NSString *createdBy;
@property(nonatomic,strong)NSString *companyId;
@property(nonatomic,strong)NSString *email;




@property(nonatomic,strong)NSNumber *creditamount;
@property(nonatomic,strong)NSNumber *attended;
@property(nonatomic,strong)NSString *avatar;
@property(nonatomic,strong)NSString *cell;
-(void)checkData;


@end
