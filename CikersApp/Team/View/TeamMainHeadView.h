//
//  TeamMainHeadView.h
//  CikersApp
//
//  Created by fxm on 16/1/20.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicTeaminfo.h"
@interface TeamMainHeadView : UIView

@property(nonatomic,strong)IBOutlet UILabel *lb_name;
@property(nonatomic,strong)IBOutlet UILabel *lb_address;
@property(nonatomic,strong)IBOutlet UILabel *lb_info;
@property(nonatomic,strong)IBOutlet UIImageView *img_icon;
@property(nonatomic,strong)IBOutlet UIButton *bt_join;


-(IBAction)bnt_join:(id)sender;

-(void)updateUI:(DicTeaminfo*)dic;

@end
