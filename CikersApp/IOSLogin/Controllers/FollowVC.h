//
//  FollowVC.h
//  CikersApp
//
//  Created by fxm on 15/12/20.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"
#import "WIkiModel.h"
#import "DicUserinfo.h"
@interface FollowVC : HLBaseViewController<WikiModelDelegate>

@property(nonatomic,strong)IBOutlet UIView *view_bntbg;
@property(nonatomic,strong)IBOutlet UITableView *table_view;
@property(nonatomic,strong)NSMutableArray *data_obj_left;
@property(nonatomic,strong)NSMutableArray *data_obj_right;
@property(nonatomic,assign)NSInteger num_tableviewcount;
@property(nonatomic,strong)DicUserinfo *data_userinfo;


-(IBAction)bnt_follow;

-(IBAction)bnt_switch:(UIButton*)sender;



@end
