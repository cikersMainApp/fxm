//
//  TeamMainVC.h
//  CikersApp
//
//  Created by fxm on 15/12/20.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "ICSDrawerController.h"
#import "TeamMainCell.h"
#import "DicTeaminfo.h"
#import "TeamModel.h"
@interface TeamMainVC : UITableViewController<TeamModeDelegate,ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property (nonatomic,weak) ICSDrawerController *drawer;

@property(nonatomic,strong)IBOutlet TeamMainCell *cell_1;
@property(nonatomic,strong)IBOutlet TeamMainCell *cell_2;
@property(nonatomic,strong)DicTeaminfo *data_obj_info;
@property(nonatomic,strong)NSNumber* num_teamid;
@property(nonatomic,strong)TeamModel *opration;
-(void)initData;

@end
