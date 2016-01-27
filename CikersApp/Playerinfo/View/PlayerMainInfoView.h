//
//  PlayerMainInfoView.h
//  CikersApp
//
//  Created by fxm on 16/1/26.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicPlayerinfo.h"
@interface PlayerMainInfoView : UITableViewCell

@property(nonatomic,strong)IBOutlet UIImageView *img_icon;
@property(nonatomic,strong)IBOutlet UILabel *lb_name;
@property(nonatomic,strong)IBOutlet UILabel *lb_address;
@property(nonatomic,strong)IBOutlet UILabel *lb_info;
@property(nonatomic,strong)IBOutlet UILabel *lb_points;


@property(nonatomic,strong)IBOutlet UIView *viewbg_tags;
@property(nonatomic,strong)IBOutlet UILabel *lb_tagsTip;



-(void)updateInfo:(DicPlayerinfo*)dic;
-(void)updateTag:(NSArray*)dic;
@end
