//
//  FollowTableCell.m
//  CikersApp
//
//  Created by fxm on 15/12/24.
//  Copyright © 2015年 cikers. All rights reserved.
//
#define testimgurl @"http://static.cikers.com/repos/thumbnail/s130/repos/1/uploads/2015/11/06/72681.png"

#import "FollowTableCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation FollowTableCell


-(void)awakeFromNib
{
    
}


-(IBAction)bnt_follow:(id)sender
{

    UIButton *bt = (UIButton*)sender;
    [bt setTitle:@"已关注" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
}

-(void)cell_update:(DicPlayerinfo*)dic1 right:(DicPlayerinfo*)dic2 userinfo:(DicUserinfo *)info
{
    
    [self.img_icon sd_setImageWithURL:SDIMAGEURL(dic1.icon)];
    [self.lb_name setText:dic1.name];
    [self.lb_number_follow setText:[NSString stringWithFormat:@"%@",dic1.viewcount]];
    [self.lb_number_wiki setText:[NSString stringWithFormat:@"%@",dic1.votecount]];
    
    
    [self.img_icon_right sd_setImageWithURL:SDIMAGEURL(dic2.icon)];
    [self.lb_name_right setText:dic2.name];
    [self.lb_number_follow_right setText:[NSString stringWithFormat:@"%@",dic2.viewcount]];
    [self.lb_number_wiki_right setText:[NSString stringWithFormat:@"%@",dic2.votecount]];
    
    
    
    
}

-(void)initUI
{

    // left
    
    
    UIView *view_left = [[UIView alloc] init];
    
    
    
    
    // right
    
}

@end
