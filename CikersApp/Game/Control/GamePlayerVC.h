//
//  GamePlayerVC.h
//  CikersApp
//
//  Created by fxm on 16/1/13.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"
#import "DicGameinfo.h"
#import "DicPlayerinfo.h"
@interface GamePlayerVC : UITableViewController<GameModelDelegate>

@property(nonatomic,strong)UIView *view_header;
@property(nonatomic,strong)GameModel *opration;
@property(nonatomic,strong)DicGameinfo *data_obj_info;

@property(nonatomic,strong)UILabel *lb_1;//姓名
@property(nonatomic,strong)UILabel *lb_2;//球队  红牌
@property(nonatomic,strong)UILabel *lb_3;//进球  黄牌
@property(nonatomic,strong)UISegmentedControl *seg;
@property(nonatomic,assign)NSInteger num_curIndex;


-(UIView*)creat_headerView;
-(void)seg_click:(UISegmentedControl*)segitem;

@end
