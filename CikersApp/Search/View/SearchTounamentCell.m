//
//  SearchTounamentCell.m
//  CikersApp
//
//  Created by fxm on 16/1/21.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "SearchTounamentCell.h"
#import "DicGameinfo.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation SearchTounamentCell

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
    
}

-(void)updateUI:(id)dic
{
    
    DicGameinfo *info = (DicGameinfo*)dic;
    
    NSString *str = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,info.icon];
    
    NSURL *url = [NSURL URLWithString:str];
    
    [self.imageView sd_setImageWithURL:url placeholderImage:PLACEHOLDER_IMG];
    
    self.textLabel.text = info.name;

    self.detailTextLabel.text = [NSString stringWithFormat:@"参赛队伍:%@ %@",info.teamcount,info.province];
    
    _lb_info.text = [NSString stringWithFormat:@"%@",[ToolUtil tool_utcToNsstring:info.starttime]];
    
}

@end
