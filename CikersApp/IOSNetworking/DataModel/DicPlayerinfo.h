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

@property(nonatomic,strong)NSString *position;//位置
@property(nonatomic,strong)NSNumber *id;//id
@property(nonatomic,strong)NSNumber *pub;//
@property(nonatomic,strong)NSString *atype;

@property(nonatomic,strong)NSArray *hottags;//标签

@property(nonatomic,strong)NSNumber *votecount;

-(void)checkData;


@end
