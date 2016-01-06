//
//  WikiAllCell.h
//  CikersApp
//
//  Created by fxm on 16/1/5.
//  Copyright © 2016年 cikers. All rights reserved.
//
// 这个cell主要用于展示圈子页面的帖子
//
// 帖子组成比较复杂，类型较多
//
// 类型共有文字帖、图文贴、视频贴、活动贴、战报贴、预测贴（将要被废弃）
//
// 根据复用的原则现在
//
//
//
//
//

#import <UIKit/UIKit.h>
@class WIkiModel;
@interface WikiAllCell : UITableViewCell

@property(nonatomic,strong)WIkiModel *model;

-(void)setup;

@end
