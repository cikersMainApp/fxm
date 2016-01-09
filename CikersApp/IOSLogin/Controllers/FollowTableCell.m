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

    [self.img_icon sd_setImageWithURL:[NSURL URLWithString:testimgurl]];
    [self.img_icon_right sd_setImageWithURL:[NSURL URLWithString:testimgurl]];
    
}


-(IBAction)bnt_follow:(id)sender
{

    UIButton *bt = (UIButton*)sender;
    [bt setTitle:@"已关注" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
}

-(void)cell_update
{

}

-(void)initUI
{

    // left
    
    
    
    // right
    
}

@end
