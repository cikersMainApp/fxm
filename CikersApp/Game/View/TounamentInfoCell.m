//
//  TounamentInfoCell.m
//  CikersApp
//
//  Created by fxm on 16/1/15.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "TounamentInfoCell.h"

@implementation TounamentInfoCell

- (void)awakeFromNib {
    // Initialization code
    
    _lb_rightDatil= [[UILabel alloc] initWithFrame:CGRectMake(0,0,300,0)];
    //设置自动行数与字符换行，为0标示无限制
    [_lb_rightDatil setNumberOfLines:0];
    _lb_rightDatil.lineBreakMode = NSLineBreakByWordWrapping;//换行方式

//    [self addSubview:_lb_rightDatil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect tmpFrame = self.textLabel.frame;
    tmpFrame.origin.x = 10;
    tmpFrame.origin.y = 0;
    tmpFrame.size.width = 80;
    tmpFrame.size.height = self.contentView.frame.size.height;
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.frame = tmpFrame;
    self.textLabel.textColor = [UIColor blackColor];
    self.textLabel.font = [UIFont systemFontOfSize:14];
//    [self.textLabel setBackgroundColor:[UIColor orangeColor]];
    
    tmpFrame = self.detailTextLabel.frame;
    tmpFrame.origin.x = 90;
    tmpFrame.origin.y = 0;
    tmpFrame.size.width = self.contentView.frame.size.width - 100;
    tmpFrame.size.height = self.contentView.frame.size.height;
    self.detailTextLabel.textAlignment = NSTextAlignmentCenter;
    self.detailTextLabel.numberOfLines=2;
    self.detailTextLabel.frame = tmpFrame;
    self.detailTextLabel.font = [UIFont systemFontOfSize:14];
//    self.detailTextLabel.backgroundColor = [UIColor yellowColor];

    
    
    NSLog(@"cell width :%f   height :%f",self.contentView.frame.size.width,self.contentView.frame.size.height);
    
    
    NSLog(@"font width :%f  height :%f",self.textLabel.frame.size.width,self.textLabel.frame.size.height);
    NSLog(@"font width :%f  height :%f",self.detailTextLabel.frame.size.width,self.detailTextLabel.frame.size.height);
    
}

//赋值 and 自动换行,计算出cell的高度
-(void)setSubjectLabelText:(NSString*)text
{
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    _lb_rightDatil.text = text;
    //设置label的最大行数
    _lb_rightDatil.numberOfLines = 0;
    
    _lb_rightDatil.lineBreakMode = NSLineBreakByWordWrapping;
    
    CGSize size = [_lb_rightDatil sizeThatFits:CGSizeMake(_lb_rightDatil.frame.size.width, 1000)];
    CGRect sFrame=_lb_rightDatil.frame;
    sFrame.size=size;
    _lb_rightDatil.frame=sFrame;
    
    //计算出自适应的高度
    frame.size.height = size.height+60;
    
    self.frame = frame;
}
@end
