//
//  TeamMainCell.h
//  CikersApp
//
//  Created by fxm on 16/1/22.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicTeaminfo.h"
@interface TeamMainCell : UITableViewCell

@property(nonatomic,strong)IBOutlet UILabel *lb_name;
@property(nonatomic,strong)IBOutlet UILabel *lb_address;
@property(nonatomic,strong)IBOutlet UILabel *lb_info;
@property(nonatomic,strong)IBOutlet UILabel *lb_note;
@property(nonatomic,strong)IBOutlet UIImageView *img_icon;
@property(nonatomic,strong)IBOutlet UIButton *bt_singup;


@property(nonatomic,strong)IBOutlet UILabel *lb_tagsTip;
@property(nonatomic,strong)IBOutlet UIView *viewbg_tags;



-(void)updateInfo:(DicTeaminfo*)dic;
-(void)updateTag:(NSArray*)dic;

@end
