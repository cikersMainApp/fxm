//
//  TeamPlayerVC.h
//  CikersApp
//
//  Created by fxm on 16/1/22.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamModel.h"
@interface TeamPlayerVC : UITableViewController<TeamModeDelegate>

@property(nonatomic,strong)NSMutableArray *array_total;
@property(nonatomic,strong)TeamModel *opration;
@property(nonatomic,weak)NSNumber *num_teamid;
@end
