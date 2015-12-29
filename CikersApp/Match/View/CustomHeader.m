//
//  CustomHeader.m
//  ARSegmentPager
//
//  Created by August on 15/5/20.
//  Copyright (c) 2015年 August. All rights reserved.
//

#import "CustomHeader.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "DicMatchinfo.h"
#import "DicTeaminfo.h"
#import "DicGameinfo.h"
#define testimgurl @"http://static.cikers.com/repos/thumbnail/s130/repos/1/uploads/2015/11/06/72681.png"

@implementation CustomHeader

-(void)awakeFromNib
{

//    [self setFrame:CGRectMake(0, 0, ScreenHeight, 280)];
//    self.backgroundColor = [UIColor clearColor];

    
    NSLog(@"height :%f",self.frame.size.width);
    
    [self _baseConfigs];

}
-(void)_baseConfigs
{
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = [UIImage imageNamed:@"haibao"];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    [self addSubview:self.imageView];
    [self sendSubviewToBack:self.imageView];
    
    
    
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    self.imageTopConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraint:self.imageTopConstraint];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
   
    
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if (view == self) {
        return nil;
    }
    return view;
}


-(void)hideUI
{
    self.lb_namebygame.hidden = YES;
    self.lb_score.hidden = YES;
    self.lb_timebymatch.hidden = YES;
    self.lb_follow_right.hidden = YES;
    self.lb_follow_left.hidden = YES;
    self.bt_left.hidden = YES;
    self.bt_right.hidden = YES;
    self.img_icon_left.hidden = YES;
    self.img_icon_right.hidden= YES;
    self.view_vs.hidden = YES;
    self.lb_leftName.hidden = YES;
    self.lb_rightName.hidden = YES;
    self.view_bg.hidden = YES;
    
    
    self.img_left.hidden = NO;
    self.img_right.hidden= NO;
}

-(void)showUI
{
    self.lb_namebygame.hidden = NO;
    self.lb_score.hidden = NO;
    self.lb_timebymatch.hidden = NO;
    self.lb_follow_right.hidden = NO;
    self.lb_follow_left.hidden = NO;
    self.bt_left.hidden = NO;
    self.bt_right.hidden = NO;
    self.img_icon_left.hidden = NO;
    self.img_icon_right.hidden= NO;
    self.view_vs.hidden = NO;
    self.lb_rightName.hidden = NO;
    self.lb_leftName.hidden = NO;
    self.view_bg.hidden = NO;
    
    self.img_right.hidden = YES;
    self.img_left.hidden = YES;
}
-(IBAction)bnt_left:(id)sender
{
    
}

-(IBAction)bnt_right:(id)sender
{

}


-(void)updateUI:(id)sender
{
    
    DicMatchinfo *dic = (DicMatchinfo*)sender;
    
    //增加mini显示
    self.img_left = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth*0.25, 20, 40, 40)];
    [self.img_left sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.cikers.com%@",dic.teama.icon]]];
    [self addSubview:self.img_left];
    
    
    
    //增加mini显示
    self.img_right = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth*0.75-40, 20, 40, 40)];
    [self.img_right sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.cikers.com%@",dic.teamb.icon]]];
    [self addSubview:self.img_right];
    
    self.img_right.hidden = YES;
    self.img_left.hidden = YES;
    
    
    
    self.lb_namebygame.text = dic.gameinfo.name;
    self.lb_rightName.text = dic.teamb.name;
    self.lb_leftName.text = dic.teama.name;
    self.lb_follow_left.text =[NSString stringWithFormat:@"%@",dic.favora];
    self.lb_follow_right.text = [NSString stringWithFormat:@"%@",dic.favorb];
    self.lb_score.text = dic.score;
    self.lb_timebymatch.text = dic.formatScheduletime;

    
    
    
    [self.img_icon_left sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.cikers.com%@",dic.teama.icon]]];
    
    [self.img_icon_right sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.cikers.com%@",dic.teamb.icon]]];
    
    [self.bt_left setEnabled:NO];
    [self.bt_left setSelected:YES];
    
    //计算支持条显示
    
    float vsWitch = self.view_vs.frame.size.width;
    float vsPer = [dic.favorb floatValue]/([dic.favora floatValue]+[dic.favorb floatValue]);
    
    self.view_vs_red = [[UIView alloc] initWithFrame:CGRectMake(vsWitch - vsWitch*vsPer, 0, vsWitch*vsPer, self.view_vs.frame.size.height)];
    
    self.view_vs_red.backgroundColor = [UIColor redColor];
    
    [self.view_vs addSubview:self.view_vs_red];

}


@end
