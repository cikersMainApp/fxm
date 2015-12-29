//
//  PredictionCell.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

typedef enum : NSUInteger {
    LABLE_TAG = 0,
    BNT_1,
    BNT_2,
    BNT_3,
} BNT_TAG;


#import <UIKit/UIKit.h>

@interface PredictionCell : UITableViewCell

@property(nonatomic,weak)IBOutlet UILabel *lb_namebyhome;
@property(nonatomic,weak)IBOutlet UILabel *lb_namebyguest;
@property(nonatomic,weak)IBOutlet UILabel *lb_score;

@property(nonatomic,weak)IBOutlet UIButton *bt_1;//胜
@property(nonatomic,weak)IBOutlet UIButton *bt_2;
@property(nonatomic,weak)IBOutlet UIButton *bt_3;


@property(nonatomic,weak)IBOutlet UIView *view_bg; // 进球数背景


//---------methon-------------

-(void)initUI;

-(IBAction)bnt_action:(id)sender;



@end
