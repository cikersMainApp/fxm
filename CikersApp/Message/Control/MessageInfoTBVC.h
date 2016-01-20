//
//  MessageInfoTBVC.h
//  CikersApp
//
//  Created by fxm on 16/1/2.
//  Copyright © 2016年 cikers. All rights reserved.
//

typedef enum : NSUInteger {
    CELL_1,
    CELL_2,
    CELL_3,
    CELL_4,
} CELLITEM;

#import <UIKit/UIKit.h>
#import "DicMessage.h"
@interface MessageInfoTBVC : UITableViewController

@property(nonatomic,assign)NSInteger num_model; //模式
@property(nonatomic,strong)NSMutableArray *array_infos;
@property(nonatomic,assign)NSInteger num_selectCellTag;

@end
