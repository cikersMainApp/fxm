//
//  MatchWikiCell.h
//  CikersApp
//
//  Created by fxm on 16/1/3.
//  Copyright © 2016年 cikers. All rights reserved.
//

@protocol MatchWikiCellDelegate <NSObject>

@optional

-(void)bnt_lookImg:(NSMutableArray*)imgs;

@end


#import <UIKit/UIKit.h>
#import "WikiAllCell.h"
@interface MatchWikiCell : WikiAllCell


@property(nonatomic,strong)id<MatchWikiCellDelegate> delegate;
@property(nonatomic,strong)UIImageView *img_photo;
@property(nonatomic,strong)UILabel *lb_name;
@property(nonatomic,strong)UILabel *lb_time;
@property(nonatomic,strong)UILabel *lb_content;
@property(nonatomic)NSUInteger _index;
@property(nonatomic,strong)NSMutableArray *array_imgs;


-(void)initUI;

-(void)update:(NSDictionary *)dic type:(NSUInteger)type index:(NSUInteger)index;

-(void)updateTypeImg:(UIView*)view;
//-(void)updateTypeImg:(UIView *)view

-(void)bnt_action:(UIButton*)sender;


// 计算9宫格
// 在固定宽高内，最多容纳的图片数量

@end
