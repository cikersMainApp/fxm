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
    
    _img_photo1.layer.masksToBounds =YES;
    
    _img_photo1.layer.cornerRadius =15;
    
    _img_photo2.layer.masksToBounds =YES;
    
    _img_photo2.layer.cornerRadius =15;
    
    [self initUI];
    
    self.view_bg.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initUI
{

}

-(IBAction)bnt_action1:(id)sender
{

    [self.delegate cell_click:[NSNumber numberWithInteger:self.lb_name1.tag]];
    
}
-(IBAction)bnt_action2:(id)sender
{
    [self.delegate cell_click:[NSNumber numberWithInteger:self.lb_name2.tag]];

}

-(void)updateUI:(DicPlayerinfo *)playera playerb:(DicPlayerinfo *)playerb
{

    self.view_bg1.hidden = YES;
    self.view_bg2.hidden = YES;
    
    if (playera)
    {
        NSString *url = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,playera.icon];
        [self.img_photo1 sd_setImageWithURL:[NSURL URLWithString:url]];

        self.lb_name1.text = playera.name;
        self.view_bg1.hidden = NO;
        self.lb_favorNum1.text = [NSString stringWithFormat:@"%@票",playera.votecount];

        self.lb_name1.tag = [playera.id intValue];
    }
    
    if (playerb) {
        
        NSString *url = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,playerb.icon];
        [self.img_photo2 sd_setImageWithURL:[NSURL URLWithString:url]];
        
        self.lb_name2.text = playerb.name;
        self.view_bg2.hidden = NO;
        self.lb_favorNum2.text = [NSString stringWithFormat:@"%@票",playerb.votecount];

        self.lb_name2.tag = [playerb.id intValue];

    }
    
}
-(void)updateUI:(DicPlayerinfo *)player
{
    
    self.view_bg.hidden = NO;
    
    NSString *url = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,player.icon];
    [self.img_photo sd_setImageWithURL:[NSURL URLWithString:url]];
    
    self.lb_name.text = player.name;
    
    
    
}

@end
