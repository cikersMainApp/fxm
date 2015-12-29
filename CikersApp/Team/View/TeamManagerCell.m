//
//  TeamManagerCell.m
//  CikersApp
//
//  Created by fxm on 15/12/22.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "TeamManagerCell.h"
@implementation TeamManagerCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)initUI:(NSInteger)index
{

    self.img_icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, self.frame.size.height-10, self.frame.size.height-10)];
    [self.img_icon setImage:[UIImage imageNamed:@"button1_03"]];
    [self addSubview:self.img_icon];
    
    
    self.lb_name = [[UILabel alloc] initWithFrame:CGRectMake(30+self.frame.size.height-10, 0, 100, 50)];
    [self addSubview:self.lb_name];
    
    
    self.bt_manager = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 115, (self.frame.size.height - 60)/2, 50, self.frame.size.height-10)];
    [self.bt_manager addTarget:self action:@selector(bnt_click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.bt_manager];
    [self.bt_manager setTag:index];
    
}

-(void)updataUI:(NSInteger)index
{

    [self.lb_name setText:[NSString stringWithFormat:@"%d",(int)index]];
    
    self.bt_manager.backgroundColor = [UIColor orangeColor];
    [self.bt_manager setTag:index];
    
    
    
}

-(void)bnt_click:(id)sender
{

    UIButton *bt_temp = (UIButton *)sender;
    
    NSLog(@"---- index:%d",(int)bt_temp.tag);
    
}


@end
