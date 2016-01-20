//
//  GameTeamCell.m
//  CikersApp
//
//  Created by fxm on 16/1/15.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "GameTeamCell.h"
@implementation GameTeamCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        
        _bnt_signUp = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bnt_signUp setBackgroundImage:[UIImage imageNamed:@"bnt_baoming"] forState:UIControlStateNormal];
        _bnt_signUp.frame = CGRectMake(20, 0, 90, 56);
        [_bnt_signUp addTarget:self action:@selector(bnt_click:) forControlEvents:UIControlEventTouchUpInside];
        self.accessoryView = _bnt_signUp;
        
    }
    
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.bounds =CGRectMake(10,15,50,50);
    self.imageView.frame =CGRectMake(10,15,50,50);
    self.imageView.contentMode =UIViewContentModeScaleAspectFit;
    
    CGRect tmpFrame = self.textLabel.frame;
    tmpFrame.origin.x = 80;
    self.textLabel.frame = tmpFrame;
    
    
    
    CGRect accessFrame = self.accessoryView.frame;
    accessFrame.origin.x += 20;
    self.accessoryView.frame = accessFrame;

    
//    self.imageView.backgroundColor = [UIColor orangeColor];
    self.accessoryView.backgroundColor = [UIColor grayColor];
}
-(void)updateUI:(NSInteger)tag
{
    [_bnt_signUp setTag:tag];
    
    
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
