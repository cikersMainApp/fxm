//
//  WikiNewsCell.h
//  CikersApp
//
//  Created by fxm on 16/1/5.
//  Copyright © 2016年 cikers. All rights reserved.
//
// 这个cell主要用于展示推荐页面的帖子
//
// 推荐页面的帖子组成有两部分 标题+图片 不显示发帖人
//

#import <UIKit/UIKit.h>

@class WIkiModel;

@interface WikiNewsCell : UITableViewCell

@property(nonatomic,strong)WIkiModel *model;

@end
