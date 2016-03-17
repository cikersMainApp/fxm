//
//  MyTeamList.h
//  CikersApp
//
//  Created by fxm on 16/2/29.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserinfoModel.h"
#import "DicUserinfo.h"
@interface MyTeamList : UITableViewController<UserinfoModelDelegate>

@property(nonatomic,strong)UserinfoModel *operation;
@property(nonatomic,strong)NSMutableArray *data_obj;
@property(nonatomic,strong)DicUserinfo *data_userinfo;

@property(nonatomic,assign)NSInteger num_selectTag;


@end

