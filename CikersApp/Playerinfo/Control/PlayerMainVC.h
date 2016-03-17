//
//  PlayerMainVC.h
//  CikersApp
//
//  Created by fxm on 16/1/20.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
#import "PlayerModel.h"
#import "DicPlayerinfo.h"
#import "PlayerMainInfoView.h"
@interface PlayerMainVC : UITableViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting,PlayerModelDelegate>

@property(nonatomic,weak)ICSDrawerController *drawer;
@property(nonatomic,strong)PlayerModel *opration;
@property(nonatomic,strong)DicPlayerinfo *data_obj_info;
@property(nonatomic,strong)NSNumber *num_id;

@property(nonatomic,strong)IBOutlet PlayerMainInfoView *cell_contentview_1;
@property(nonatomic,strong)IBOutlet PlayerMainInfoView *cell_contentview_2;


-(void)initData;

-(IBAction)bnt_moreTag:(id)sender;


@end
