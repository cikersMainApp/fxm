//
//  GameTeamVC.h
//  CikersApp
//
//  Created by fxm on 16/1/13.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"
#import "DicGameinfo.h"
@interface GameTeamVC : UITableViewController<GameModelDelegate>

@property(nonatomic,strong)GameModel *opration;

@property(nonatomic,strong)NSMutableArray *array_total;

@property(nonatomic,strong)NSNumber *num_gameid;

@property(nonatomic,strong)DicGameinfo *data_obj_info;


-(void)bar_action:(id)sender;

@end
