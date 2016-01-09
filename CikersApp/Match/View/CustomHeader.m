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
    
    self.choice_num = 0;
    
    self.view_vs_red = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    self.view_vs_red.backgroundColor = [UIColor redColor];
    
    [self.view_vs addSubview:self.view_vs_red];
    
    [self _baseConfigs];
    
    
    
}
-(IBAction)bnt_back:(id)sender
{
    if(self.clickBackBlock)
        self.clickBackBlock([NSString stringWithFormat:@"%@",self.data_dic.teamb.id]);

}

-(void)bnt_callbanck:(id)sender
{
    if(self.clickBackBlock)
        self.clickBackBlock([NSString stringWithFormat:@"%@",self.data_dic.teamb.id]);
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
    if(self.isFinish) return;
    
    if([self.data_dic.votedteam boolValue]) return;
    
    if(self.clickedBlock)
        self.clickedBlock([NSString stringWithFormat:@"%@",self.data_dic.teama.id]);
    
    self.choice_num = 1;
    
}

-(IBAction)bnt_right:(id)sender
{
    if(self.isFinish) return;
    
    if([self.data_dic.votedteam boolValue]) return;

    if(self.clickedBlock)
        self.clickedBlock([NSString stringWithFormat:@"%@",self.data_dic.teamb.id]);
    
    
    self.choice_num = 2;
}


-(void)receiveData
{

    self.data_dic.votedteam = [NSNumber numberWithInt:1];
    
    switch (self.choice_num) {
        case 1:
        {
            self.data_dic.favora = [NSNumber numberWithInt:[self.data_dic.favora intValue] + 1];
        }
            break;
        case 2:
        {
            self.data_dic.favorb = [NSNumber numberWithInt:[self.data_dic.favorb intValue] + 1];

        }
            break;
        default:
            break;
    }
    
    
    self.choice_num = 0;
    
    [self updateUI:self.data_dic];
}


-(void)updateUI:(id)sender
{
    
    self.data_dic = (DicMatchinfo*)sender;
    
    //增加mini显示
    self.img_left = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth*0.25, 20, 40, 40)];
    [self.img_left sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.cikers.com%@",self.data_dic.teama.icon]]];
    [self addSubview:self.img_left];
    
    
    
    //增加mini显示
    self.img_right = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth*0.75-40, 20, 40, 40)];
    [self.img_right sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.cikers.com%@",self.data_dic.teamb.icon]]];
    [self addSubview:self.img_right];
    
    self.img_right.hidden = YES;
    self.img_left.hidden = YES;
    
    
    
    self.lb_namebygame.text = self.data_dic.gameinfo.name;
    self.lb_rightName.text = self.data_dic.teamb.name;
    self.lb_leftName.text = self.data_dic.teama.name;
    self.lb_follow_left.text =[NSString stringWithFormat:@"%@",self.data_dic.favora];
    self.lb_follow_right.text = [NSString stringWithFormat:@"%@",self.data_dic.favorb];
    self.lb_score.text = self.data_dic.score;
    self.lb_timebymatch.text = self.data_dic.formatScheduletime;

    
    [self.img_icon_left sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.cikers.com%@",self.data_dic.teama.icon]]];
    
    [self.img_icon_right sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.cikers.com%@",self.data_dic.teamb.icon]]];
    
    
    //两个按钮状态
    /* 规则信息
    finished 为true  则两个按钮显示不能点击
    votedteam 点击过的按钮效果
    */
    
    if ([self.data_dic.finished boolValue])
    {
        [self.bt_left setEnabled:NO];
        [self.bt_right setEnabled:NO];
        
        self.isFinish = YES;
    }
    if ([self.data_dic.votedteam boolValue])
    {
        [self.bt_left setEnabled:NO];
        [self.bt_right setEnabled:NO];

    }
    
    
    
    //计算支持条显示
    
    float vsWitch = self.view_vs.frame.size.width;
    float vsPer = [self.data_dic.favorb floatValue]/([self.data_dic.favora floatValue]+[self.data_dic.favorb floatValue]);
    
    if (!isnan(vsPer)) {
//        self.view_vs_red.frame =CGRectMake(vsWitch - vsWitch*vsPer, 0, vsWitch*vsPer, self.view_vs.frame.size.height);
    }
    
    

}


@end
