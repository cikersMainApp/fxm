//
//  WikiTableCell.m
//  CikersApp
//
//  Created by fxm on 15/12/23.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "WikiTableCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation WikiTableCell

-(void)layoutSubviews
{


    
}

- (void)awakeFromNib {
    // Initialization code
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)initUI
{
    
    self.img_icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 60, self.frame.size.height-3)];
    
    [self.img_icon setImage:[UIImage imageNamed:@"button1_03.png"]];
    
    [self addSubview:self.img_icon];
    
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1, ScreenWidth, 1)];
    [line setBackgroundColor:[UIColor blackColor]];
    [self addSubview:line];
    
    
    self.lb_name = [[UILabel alloc] initWithFrame:CGRectMake(50+self.frame.size.height-10, 0, 300, 50)];
    [self addSubview:self.lb_name];
    
    
    self.bt_manager = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 115, (self.frame.size.height - 60)/2, 50, self.frame.size.height-10)];
    [self.bt_manager addTarget:self action:@selector(bnt_click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.bt_manager];
    
    
    NSLog(@"width :%f height :%f",self.frame.size.width,self.frame.size.height);
    
}

-(void)updataContent:(NSDictionary*)dic
{
    
    
    NSDictionary *extra = [dic objectForKey:@"extra"];
    
    NSString * name = [extra objectForKey:@"shortTitle"];
    NSString * url = [dic objectForKey:@"icon"];
    NSString * oid = [dic objectForKey:@"id"];
    
    
    
    [self.lb_name setText:name];
    
    [self.img_icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.cikers.com%@",url]]];
    
    [self.bt_manager setTag:[oid integerValue]];
    
    
}

-(void)bnt_click:(id)sender
{
    
    UIButton *bt = (UIButton*)sender;
    
    NSLog(@"id:%d",(int)bt.tag);
    
}

@end
