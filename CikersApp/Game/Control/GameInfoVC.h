//
//  GameInfoVC.h
//  CikersApp
//
//  Created by fxm on 16/1/13.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicGameinfo.h"
@interface GameInfoVC : UITableViewController<UIActionSheetDelegate>

@property(nonatomic,strong)NSMutableArray *array_title;
@property(nonatomic,strong)NSMutableArray *array_info;
@property(nonatomic,strong)DicGameinfo *data_obj_info;


-(void)bnt_map:(id)sender;

@end
