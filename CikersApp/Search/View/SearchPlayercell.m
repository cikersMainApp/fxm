//
//  SearchPlayercell.m
//  CikersApp
//
//  Created by fxm on 16/1/21.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "SearchPlayercell.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "DicPlayerinfo.h"
@implementation SearchPlayercell

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
        

//        UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(5, 130 - 3, ScreenWidth-10, 1)];
//        separatorView.backgroundColor = [UIColor lightGrayColor];
//        [self.contentView addSubview:separatorView];

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

    DicPlayerinfo *info = (DicPlayerinfo*)dic;
    
    NSString *str = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,info.icon];
    
    NSURL *url = [NSURL URLWithString:str];
    
    [self.imageView sd_setImageWithURL:url placeholderImage:PLACEHOLDER_IMG];
    
    self.textLabel.text = info.name;
    
    self.detailTextLabel.text = [NSString stringWithFormat:@"空间热度:%@",info.viewcount];
    
    _lb_info.text = [NSString stringWithFormat:@"所属球队:%@",info.belteam];
    
}

@end
