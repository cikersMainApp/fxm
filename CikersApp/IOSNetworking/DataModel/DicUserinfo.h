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
@end
