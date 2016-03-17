//
//  MyTeamCell.m
//  CikersApp
//
//  Created by fxm on 16/3/12.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MyTeamCell.h"

@implementation MyTeamCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        _bnt_action = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bnt_action setTitle:@"退出" forState:UIControlStateNormal];
        [_bnt_action setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _bnt_action.frame = CGRectMake(20, 0, 90, 56);
        [_bnt_action addTarget:self action:@selector(bnt_click:) forControlEvents:UIControlEventTouchUpInside];
        self.accessoryView = _bnt_action;
        
    }
    
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.bounds =CGRectMake(10,15,50,50);
    self.imageView.frame =CGRectMake(10,15,50,50);
    self.imageView.contentMode =UIViewContentModeScaleAspectFit;
    
    [self.imageView.image circleImage];

    
    CGRect tmpFrame = self.textLabel.frame;
    tmpFrame.origin.x = 80;
    self.textLabel.frame = tmpFrame;
    
    
    
    CGRect accessFrame = self.accessoryView.frame;
    accessFrame.origin.x += 20;
    self.accessoryView.frame = accessFrame;
    
    
}
-(void)updateUI:(NSInteger)tag
{
    [_bnt_action setTag:tag];
    
    
}
-(void)bnt_click:(UIButton *)sender
{
    
    if(self.clickBlock)
        self.clickBlock(sender.tag);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
