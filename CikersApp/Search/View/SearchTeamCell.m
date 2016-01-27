//
//  SearchTeamCell.m
//  CikersApp
//
//  Created by fxm on 16/1/21.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "SearchTeamCell.h"
#import "DicTeaminfo.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation SearchTeamCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _lb_info = [[UILabel alloc] initWithFrame:CGRectMake(80, 55, ScreenWidth - 85, 15)];
        _lb_info.textColor = self.detailTextLabel.textColor;
        _lb_info.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_lb_info];
        
        
    }
    
    return self;
}

-(void)layoutSubviews
{
    self.imageView.bounds =CGRectMake(10,15,50,50);
    self.imageView.frame =CGRectMake(10,15,50,50);
    self.imageView.contentMode =UIViewContentModeScaleAspectFit;
    
    CGRect tmpFrame = self.textLabel.frame;
    tmpFrame.origin.x = 80;
    tmpFrame.origin.y = 10;
    tmpFrame.size.width = 200;
    tmpFrame.size.height = 20;
    self.textLabel.frame = tmpFrame;
    
    
    tmpFrame = self.detailTextLabel.frame;
    tmpFrame.origin.x = 80;
    tmpFrame.origin.y = 35;
    tmpFrame.size.width = 200;
    tmpFrame.size.height = 15;
    self.detailTextLabel.frame = tmpFrame;
    
    [self.detailTextLabel.font fontWithSize:10];
    
    
    
}

-(void)updateUI:(id)dic
{
    
    DicTeaminfo *info = (DicTeaminfo*)dic;
    
    NSString *str = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,info.icon];
    
    NSURL *url = [NSURL URLWithString:str];
    
    [self.imageView sd_setImageWithURL:url placeholderImage:PLACEHOLDER_IMG];
    
    self.textLabel.text = info.name;
        
    self.detailTextLabel.text = [NSString stringWithFormat:@"球员人数:%@",info.playercount];
    
    _lb_info.text = [NSString stringWithFormat:@"球队热度:%@",info.viewcount];
    
}

@end
