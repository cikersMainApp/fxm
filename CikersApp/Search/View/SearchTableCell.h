//
//  SearchTableCell.h
//  CikersApp
//
//  Created by fxm on 15/12/21.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchVC;



@interface SearchTableCell : UITableViewCell


@property(nonatomic,strong)NSNumber * eventId; // 所选id



//赛事
@property(nonatomic,weak)IBOutlet UIView *view_game;
@property(nonatomic,weak)IBOutlet UIImageView *img_gameIcon;
@property(nonatomic,weak)IBOutlet UILabel *lb_gameName;
@property(nonatomic,weak)IBOutlet UILabel *lb_gameInfo;//参赛对数
@property(nonatomic,weak)IBOutlet UILabel *lb_gameStaue;//赛事状态

//球员

@property(nonatomic,weak)IBOutlet UIView *view_player;
@property(nonatomic,weak)IBOutlet UIImageView *img_playerIcon;
@property(nonatomic,weak)IBOutlet UILabel *lb_playerName;
@property(nonatomic,weak)IBOutlet UILabel *lb_playerInfo;//参赛对数


//无搜索项目

@property(nonatomic,strong)SearchVC *vc_search;






-(void)initUI;
-(void)updataContent:(NSDictionary*)dic type:(NSInteger)type;
-(IBAction)bnt_click:(id)sender;


-(void)updateForgame:(NSDictionary*)dic;
-(void)updateForplayer:(NSDictionary*)dic;
-(void)updateForteam:(NSDictionary*)dic;

@end
