//
//  GameItemBt.m
//  CikersApp
//
//  Created by fxm on 16/1/13.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "GameItemBt.h"

@implementation GameItemBt

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)resetMiddle
{

    
    //    在UIButton中有三个对EdgeInsets的设置：ContentEdgeInsets、titleEdgeInsets、imageEdgeInsets
    self.imageEdgeInsets = UIEdgeInsetsMake(5,13,21,self.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
    
    self.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
    self.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
    self.titleEdgeInsets = UIEdgeInsetsMake(71, -self.titleLabel.bounds.size.width-50, 0, 0);//设置title在button上的位置（上top，左left，下bottom，右right）
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    //    [button setContentEdgeInsets:UIEdgeInsetsMake(70, 0, 0, 0)];//
    
    
       self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//设置button的内容横向居中。。设置content是title和image一起变化
    
}

@end
