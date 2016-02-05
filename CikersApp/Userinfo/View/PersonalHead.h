//
//  PersonalHead.h
//  CikersApp
//
//  Created by fxm on 16/1/29.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicUserinfo.h"
@interface PersonalHead : UITableViewCell

@property(nonatomic,strong)IBOutlet UIImageView *img_icon;
@property(nonatomic,strong)IBOutlet UILabel *lb_name;
@property(nonatomic,strong)IBOutlet UILabel *lb_address;
@property(nonatomic,strong)IBOutlet UILabel *lb_jifen;
@property(nonatomic,strong)IBOutlet UILabel *lb_info;

-(void)updateUI:(DicUserinfo*)info;

@end
