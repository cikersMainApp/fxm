//
//  MatchMVPResultCell.m
//  CikersApp
//
//  Created by fxm on 16/1/10.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MatchMVPResultCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@implementation MatchMVPResultCell

- (void)awakeFromNib {
    // Initialization code


    self.lb_rank = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 30, 30)];
    self.lb_rank.font = [UIFont systemFontOfSize:20];
    self.lb_rank.textColor = [UIColor blackColor];
    [self addSubview:self.lb_rank];
    
    
    self.img_photo = [[UIImageView alloc] initWithFrame:CGRectMake(60, 10, 50, 50)];
    [self addSubview:self.img_photo];

    
    self.lb_name = [[UILabel alloc] initWithFrame:CGRectMake(150, 30, 180, 80)];
    [self addSubview:self.lb_name];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateUI:(DicPlayerinfo *)player
{

    NSString *url = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,player.icon];
    [self.img_photo sd_setImageWithURL:[NSURL URLWithString:url]];
    
    self.lb_name.text = player.name;

    
    
}

@end
