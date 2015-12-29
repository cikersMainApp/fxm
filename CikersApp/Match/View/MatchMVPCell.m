//
//  MatchMVPCell.m
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "MatchMVPCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

#define testurl @"http://static.cikers.com/repos/thumbnail/s70/repos/1/uploads/2015/03/08/5975.jpg"

@implementation MatchMVPCell

- (void)awakeFromNib {
    // Initialization code
    
    [self initUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initUI
{
    [self.img_photo1 sd_setImageWithURL:[NSURL URLWithString:testurl]];
    [self.img_photo2 sd_setImageWithURL:[NSURL URLWithString:testurl]];

}

-(IBAction)bnt_action1:(id)sender
{

}
-(IBAction)bnt_action2:(id)sender
{

}

@end
