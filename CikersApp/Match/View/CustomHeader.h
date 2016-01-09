//
//  CustomHeader.h
//  ARSegmentPager
//
//  Created by August on 15/5/20.
//  Copyright (c) 2015年 August. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARSegmentPageControllerHeaderProtocol.h"
#import "DicMatchinfo.h"

@interface CustomHeader : UIView<ARSegmentPageControllerHeaderProtocol>
@property (nonatomic, strong) NSLayoutConstraint *imageTopConstraint;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *img_left;
@property (nonatomic, strong) UIImageView *img_right;


@property(nonatomic,weak)IBOutlet UILabel*lb_namebygame; // 赛事名称
@property(nonatomic,weak)IBOutlet UILabel*lb_timebymatch; //比赛开始时间
@property(nonatomic,weak)IBOutlet UILabel*lb_namebymatch;// 比赛名称
@property(nonatomic,weak)IBOutlet UILabel *lb_score;
@property(nonatomic,weak)IBOutlet UIImageView *img_icon_left; //左边球队的队徽
@property(nonatomic,weak)IBOutlet UIImageView *img_icon_right; //右边球队的队徽
@property(nonatomic,weak)IBOutlet UILabel *lb_leftName; // 左边的球队名称
@property(nonatomic,weak)IBOutlet UILabel *lb_rightName; //右边的球队名称
@property(nonatomic,weak)IBOutlet UILabel *lb_follow_left; //左边的支持数
@property(nonatomic,weak)IBOutlet UILabel *lb_follow_right; //右边的支持数
@property(nonatomic,weak)IBOutlet UIButton *bt_left; // 右边的支持按钮
@property(nonatomic,weak)IBOutlet UIButton *bt_right; // 左边的支持按钮
@property(nonatomic,weak)IBOutlet UIView *view_vs; // 蓝色的条
@property(nonatomic,strong)UIView *view_vs_red; //红色的条

@property(nonatomic,weak)IBOutlet UIView *view_bg;//60%透明度的灰色图


@property(nonatomic,assign)BOOL isFinish; //比赛结束

@property (nonatomic, copy) void (^clickBackBlock)(NSString *teamid);
@property (nonatomic, copy) void (^clickedBlock)(NSString *teamid);

@property(nonatomic,strong)DicMatchinfo *data_dic;

@property(nonatomic)NSInteger choice_num; // 0 无  1 左  2 右


-(void)hideUI;
-(void)showUI;




-(IBAction)bnt_left:(id)sender;
-(IBAction)bnt_right:(id)sender;
-(IBAction)bnt_back:(id)sender;


-(void)receiveData;
-(void)updateUI:(id)sender;


@end
