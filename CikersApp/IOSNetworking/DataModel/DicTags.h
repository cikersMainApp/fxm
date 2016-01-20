//
//  DicTags.h
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DicTags : NSObject

@property(nonatomic,strong)NSString *tag; //内容
@property(nonatomic,strong)NSNumber *count; //数量
@property(nonatomic,strong)NSArray *latesttaggers;
@property(nonatomic,strong)NSMutableArray *array_players;


@end
