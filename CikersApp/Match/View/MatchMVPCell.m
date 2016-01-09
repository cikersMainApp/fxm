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
    
    _img_photo1.layer.cornerRadius =_img_photo1.frame.size.height/2;
    
    _img_photo2.layer.masksToBounds =YES;
    
    _img_photo2.layer.cornerRadius =_img_photo2.frame.size.height/2;
    
    [self initUI];
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

}
-(IBAction)bnt_action2:(id)sender
{

}

-(void)updateUI:(DicPlayerinfo *)playera playerb:(DicPlayerinfo *)playerb
{

    self.view_bg1.hidden = YES;
    self.view_bg2.hidden = YES;
    
    if (playera)
    {
        NSString *url = [NSString stringWithFormat:@"http://www.cikers.com%@",playera.icon];
        [self.img_photo1 sd_setImageWithURL:[NSURL URLWithString:url]];

        self.lb_name1.text = playera.name;
        self.view_bg1.hidden = NO;

    }
    
    if (playerb) {
        
        NSString *url = [NSString stringWithFormat:@"http://www.cikers.com%@",playerb.icon];
        [self.img_photo2 sd_setImageWithURL:[NSURL URLWithString:url]];
        
        self.lb_name2.text = playerb.name;
        self.view_bg2.hidden = NO;


    }
    
}

@end
