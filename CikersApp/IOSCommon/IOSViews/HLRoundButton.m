//
//  HLRoundButton.m
//  LeRong
//
//  Created by Local on 15/11/7.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLRoundButton.h"

@implementation HLRoundButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.borderWidth = 1/self.contentScaleFactor;
    self.layer.cornerRadius = 3.f;
    self.layer.borderColor = SUBJECT_COLOR.CGColor;
    self.layer.masksToBounds = YES;
//    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self setBackgroundImage:[HLImageUtil createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    self.frame = CGRectMake(0, 0, 80, 40);
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    [self.layer setBorderWidth:1.0];   //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 255, 255, 255, 1 });
    [self.layer setBorderColor:colorref];//边框颜色
    

}


@end
