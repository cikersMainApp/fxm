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
    [self setTitleColor:SUBJECT_COLOR forState:UIControlStateNormal];
    [self setBackgroundImage:[HLImageUtil createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
}


@end
