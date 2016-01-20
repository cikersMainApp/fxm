//
//  TeamMainHeadView.m
//  CikersApp
//
//  Created by fxm on 16/1/20.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "TeamMainHeadView.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation TeamMainHeadView

-(void)awakeFromNib
{

    _bt_join.layer.cornerRadius = 10;
    _bt_join.layer.masksToBounds= YES;
    _bt_join.backgroundColor = [UIColor orangeColor];
    
}

-(IBAction)bnt_join:(id)sender
{

}

-(void)updateUI:(DicTeaminfo *)dic
{

    _lb_name.text = dic.name;
    _lb_address.text=dic.province;
    
    NSString *str = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,dic.icon];
    [_img_icon sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:PLACEHOLDER_IMG];
}
@end
