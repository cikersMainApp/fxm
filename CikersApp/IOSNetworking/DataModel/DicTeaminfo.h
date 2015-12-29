//
//  DicTeaminfo.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DicTeaminfo : NSObject

@property(nonatomic,strong)NSNumber *eventcount; //
@property(nonatomic,strong)NSNumber *playercount;
@property(nonatomic,strong)NSNumber *viewcount;

@property(nonatomic,strong)NSString *createdOn;//创建时间
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *province;//球队地址

@end
