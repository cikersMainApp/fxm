//
//  GamelistTableVC.h
//  CikersApp
//
//  Created by fxm on 16/1/8.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamelistTableVC : UITableViewController


@property(nonatomic,strong)NSMutableArray *array_data;

@property(nonatomic,assign)NSNumber *num_gameid;

@property(nonatomic,strong)NSMutableArray *array_pre_data;
@property(nonatomic,strong)NSMutableArray *array_next_data;


@end
