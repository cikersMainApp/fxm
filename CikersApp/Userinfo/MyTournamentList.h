//
//  MyTournamentList.h
//  CikersApp
//
//  Created by fxm on 16/2/29.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserinfoModel.h"
#import "DicUserinfo.h"
#import "DicTeaminfo.h"
#import "DicMatchinfo.h"

@interface MyTournamentList : UITableViewController<UserinfoModelDelegate>

@property(nonatomic,strong)UserinfoModel *operation;
@property(nonatomic,strong)NSMutableArray *data_obj;
@property(nonatomic,strong)DicUserinfo *data_userinfo;
@property(nonatomic, strong)NSMutableArray *selectedArrayStatus;//是否被点击

@end


@interface MyTournamentListCell : UITableViewCell

@property(nonatomic,strong)UIImageView *icon_left;
@property(nonatomic,strong)UIImageView *icon_right;
@property(nonatomic,strong)UILabel *lb_left;
@property(nonatomic,strong)UILabel *lb_right;

@property(nonatomic,strong)UILabel *lb_score;
@property(nonatomic,strong)UILabel *lb_time;

@property(nonatomic,strong)void (^clickBlock)(NSInteger tag);



-(void)updateUI:(DicMatchinfo*)tag;
-(void)bnt_click:(UIButton*)sender;

@end
