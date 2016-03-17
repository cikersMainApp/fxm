//
//  FollowTableCell.h
//  CikersApp
//
//  Created by fxm on 15/12/24.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicPlayerinfo.h"
#import "DicUserinfo.h"
@interface FollowTableCell : UITableViewCell

@property(nonatomic,weak)IBOutlet UILabel *lb_name;
@property(nonatomic,weak)IBOutlet UILabel *lb_number_follow;
@property(nonatomic,weak)IBOutlet UILabel *lb_number_wiki;
@property(nonatomic,weak)IBOutlet UIImageView *img_icon;
@property(nonatomic,weak)IBOutlet UIButton *bt_follow;

//right

@property(nonatomic,weak)IBOutlet UILabel *lb_name_right;
@property(nonatomic,weak)IBOutlet UILabel *lb_number_follow_right;
@property(nonatomic,weak)IBOutlet UILabel *lb_number_wiki_right;
@property(nonatomic,weak)IBOutlet UIImageView *img_icon_right;
@property(nonatomic,weak)IBOutlet UIButton *bt_follow_right;
-(void)initUI;
-(IBAction)bnt_follow:(id)sender;

-(void)cell_update:(DicPlayerinfo*)dic1 right:(DicPlayerinfo*)dic2 userinfo:(DicUserinfo*)info;

@end
